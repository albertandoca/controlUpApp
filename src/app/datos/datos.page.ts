import { Voto } from './../modelos/voto';
import { ImgGeneral } from './../modelos/img-general';
import { Router, ActivatedRoute } from '@angular/router';
import { Persona } from './../modelos/persona';
import { Subscription } from 'rxjs';
import { OfflineService } from './../services/offline.service';
import { Component, OnInit } from '@angular/core';
import { ToastController } from '@ionic/angular';

@Component({
  selector: 'app-datos',
  templateUrl: './datos.page.html',
  styleUrls: ['./datos.page.scss'],
})
export class DatosPage implements OnInit {
  
  fotos = [];
  fetchPersona: Subscription;
  fetchCandidatos: Subscription;
  fetchImagenes: Subscription;
  persona: Persona;
  candidatos: Array<any> = [];
  imagenes: ImgGeneral[] = [];
  tipo: string;
  idMesa: number;
  contador: number = 0;
  votos: Voto[] = [];
  tipoNum: number;
  electores: number;


  constructor(private db1: OfflineService,
              private activatedRoute: ActivatedRoute,
              private router: Router,
              public toastController: ToastController
              ) { }

  ngOnInit() {
    this.tipo = this.activatedRoute.snapshot.params.tipo;
    this.idMesa = parseInt(this.activatedRoute.snapshot.params.idMesa);
    this.electores = parseInt(this.activatedRoute.snapshot.params.electores);

    this.fetchPersona = this.db1.fetchPersona().subscribe(items => {
      this.persona = items[0];
    });
    this.fetchCandidatos = this.db1.fetchCandidatos().subscribe(items => {
      this.candidatos = items;
    });


    this.fetchImagenes = this.db1.fetchImagenes().subscribe(items => {
      this.imagenes = items;
      if(this.imagenes.length > 0) {
        this.fotos = [];     
        this.fotos.push(this.imagenes[0].urlImg1);
        this.fotos.push(this.imagenes[0].urlImg2);
        this.fotos.push(this.imagenes[0].urlImg3);
      }
    });

    this.db1.fetchVotos().subscribe(items => {
      this.votos = items;
    })
    
    
    if (this.tipo === 'presidentes') {
      this.db1.getCandidatos(8871).then(d => { 
        console.log('presidentes', this.candidatos)
      });
      this.db1.getImagenes('imgPresidentes', this.idMesa).then(d => { 
        console.log(this.imagenes
          )});
      this.tipoNum = 1;
    } else if (this.tipo === 'nacionales') {
      this.db1.getCandidatos(8872).then(d => { 
        console.log(this.candidatos)
      });
      this.db1.getImagenes('imgNacionales', this.idMesa).then(d => { 
        console.log(this.imagenes)
      });
      this.tipoNum = 2;
    } else if (this.tipo === 'provinciales') {
      this.db1.getCandidatos(this.persona.idLugar).then(d => { 
        console.log(this.candidatos)
      });
      this.db1.getImagenes('imgProvinciales', this.idMesa).then(d => { 
        console.log(this.imagenes)
      });
      this.tipoNum = 3;
    } else if (this.tipo === 'parlamentos') {
      this.db1.getCandidatos(8873).then(d => { 
        console.log(this.candidatos)
      });
      this.db1.getImagenes('imgParlamentos', this.idMesa).then(d => { 
        console.log(this.imagenes)
      });
      this.tipoNum = 4;
    }

    this.db1.getVoto(this.tipo, this.idMesa).then(d => {
      if(this.votos.length === 0) {
        this.candidatos.forEach(candidato => {
          let vo: number = null;
          this.db1.guardarVoto(this.tipo, candidato.idPartido, this.idMesa, vo, this.persona.idPersona)
        })
      }
    })
    

  }

  async retornar() {
    const toast = await this.toastController.create({
      header: 'SALIR SIN GUARDAR',
      message: 'No se guardaron los datos, está seguro de salir',
      position: 'middle',
      color: 'warning',
      buttons: [
        {
          side: 'end',
          icon: 'star',
          text: 'SÍ',
          handler: () => {
            this.fotos = [];
            this.votos = [];
            this.router.navigate(['/mesas', this.tipoNum]);
          }
        }, {
          text: 'NO',
          icon: 'close-circle-outline',
          role: 'cancel',
          handler: () => {

          }
        }
      ]
    });
    toast.present();
  }

  async guardar() {
    console.log(this.votos);
    let bandera = 0;
    let totalVotos = 0
    for await (let vot of this.votos) {
      console.log(vot.voto)
      if(isNaN(vot.voto)) {
        this.mensajeGeneral('Se debe ingresar los votos de todos los candidatos', 'middle')
        bandera = 1;
        break;
      } else if ((vot.voto % 1) !== 0 || (vot.voto < 0 && vot.voto > this.electores)) {
        this.mensajeGeneral(`Uno o varios de los votos ingresados no están en el rango de 0 a ${this.electores}, por favor verifique.`, 'middle');
        bandera = 2;
        break;
      } else {
        totalVotos += vot.voto;
        console.log(totalVotos);
      }
    }
    if (bandera === 0) {
      totalVotos -= this.votos[0].voto;
      if(totalVotos === this.votos[0].voto) {
        this.guardarVotos();
      } else {
        this.mensajeGuardar();
      }
    }
  }

  siguiente() {
    let voto = this.votos[this.contador].voto;
    if (!isNaN(voto) && (voto % 1) === 0 && (voto >= 0 && voto <= this.electores)) {
      if (this.contador < this.candidatos.length - 1) {
        this.contador++;
      } else {
        this.contador = 0;
      }
      console.log(this.contador)
    } else {
      this.mensajeGeneral(`Los votos ingresados son incorrectos o superiores al número de electores (${this.electores}), por favor verifique.`, 'middle');
    }
  }

  anterior() {
    let voto = this.votos[this.contador].voto;
    if (!isNaN(voto) && (voto % 1) === 0 && (voto >= 0 && voto <= this.electores)) {
      if (this.contador > 0 ) {
        this.contador--;
      } else {
        this.contador = this.candidatos.length - 1;
      }
    } else {
      this.mensajeGeneral('Los votos ingresados son incorrectos o superiores al número de electores, por favor verifique', 'middle');
    }
    console.log(this.contador)
  }

  guardarVotos() {
    this.votos.forEach(voto => {
      this.db1.updateVoto(this.tipo, voto.voto, voto.id, voto.idMesa);
    })
    this.db1.updateSendData(this.tipo, this.idMesa, this.persona.idPersona, 2).then(d => {
      this.fotos = [];
      this.votos = [];
      this.router.navigate(['/mesas', this.tipoNum]);
    })
  }

  async mensajeGeneral(msg, pos, color = 'warning') {
    const toast = await this.toastController.create({
      message: msg,
      position: pos,
      color: color,
      duration: 4000
    });
    toast.present();
  }

  async mensajeGuardar() {
    const toast = await this.toastController.create({
      header: 'ACTA INCONSISTENTE',
      message: 'El total de votos no es igual que el número de votantes. Si los votos ingresados corresponden al acta puede GUARDAR. Para verificar los datos clic en EDITAR',
      position: 'middle',
      color: 'warning',
      buttons: [
        {
          side: 'end',
          icon: 'star',
          text: 'Editar',
          handler: () => {
            this.mensajeGeneral('Utilice las flechas izquierda o derecha para cambiar de candidato', 'middle')
          }
        }, {
          text: 'Guardar',
          icon: 'save',
          role: 'cancel',
          handler: () => {
            this.guardarVotos();
          }
        }
      ]
    });
    toast.present();
  }


}
