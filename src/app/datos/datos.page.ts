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
      console.log('presidentes5555', this.candidatos)
      /*this.candidatos.forEach(candidato => {
        this.votos.push(0);
      })*/
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
      console.log(`estamos en getvotos ${this.votos}`)
      if(this.votos.length === 0) {
        console.log(`estamos en cero v ${this.votos}`)
        this.candidatos.forEach(candidato => {
          let vo: number = null;
          console.log(this.tipo, candidato.idPartido, this.idMesa, this.persona.idPersona);
          this.db1.guardarVoto(this.tipo, candidato.idPartido, this.idMesa, vo, this.persona.idPersona)
        })
      }
    })
    

  }

  retornar() {
    this.fotos = [];
    this.votos = [];
    this.router.navigate(['/mesas', this.tipoNum])
  }

  async guardar() {
    console.log(this.votos);
    let bandera = 0;
    if(this.votos.length === this.candidatos.length){
      for await (let vot of this.votos) {
        if(isNaN(vot.voto) && (vot.voto % 1) !== 0 && (vot.voto < 0 && vot.voto > this.electores)) {
          bandera = 1;
          break;
        }
      }
      if (bandera === 1) {
        this.mensajeGuardar();
      } else {
        
        this.db1.updateSendData(this.tipo, this.idMesa, this.persona.idPersona, 2).then(d => {
          this.fotos = [];
          this.votos = [];
          this.router.navigate(['/mesas', this.tipoNum]);
        })
      }
      
    } else {
      this.mensajeGeneral('No se ingresó la votación de todos los candidatos, no se puede almacenar', 'top');
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
      alert('Los votos ingresados son incorrectos o superiores al número de electores, por favor verifique');
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
      alert('Los votos ingresados son incorrectos o superiores al número de electores, por favor verifique');
    }
    console.log(this.contador)
  }

  async mensajeGeneral(msg, pos) {
    const toast = await this.toastController.create({
      message: msg,
      position: pos,
      duration: 4000
    });
    toast.present();
  }

  async mensajeGuardar() {
    const toast = await this.toastController.create({
      header: 'ACTA INCONSISTENTE',
      message: 'Los valores que ingreso están incompletos o existen errores. Puede verificar los datos o continuar con el almacenamiento',
      position: 'top',
      buttons: [
        {
          side: 'start',
          icon: 'star',
          text: 'Favorite',
          handler: () => {
            this.db1.updateSendData(this.tipo, this.idMesa, this.persona.idPersona, 2).then(d => {
              this.fotos = [];
              this.votos = [];
              this.router.navigate(['/mesas', this.tipoNum]);
            })
          }
        }, {
          text: 'Done',
          role: 'cancel',
          handler: () => {
            console.log('Cancel clicked');
          }
        }
      ]
    });
    toast.present();
  }


}
