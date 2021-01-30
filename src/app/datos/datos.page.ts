import { ImgGeneral } from './../modelos/img-general';
import { Router, ActivatedRoute } from '@angular/router';
import { Persona } from './../modelos/persona';
import { Subscription } from 'rxjs';
import { OfflineService } from './../services/offline.service';
import { Component, OnInit } from '@angular/core';
import { ToastController } from '@ionic/angular';
import { Console } from 'console';

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
  votos: Array<number> = [];
  tipoNum: number;


  constructor(private db1: OfflineService,
              private activatedRoute: ActivatedRoute,
              private router: Router,
              public toastController: ToastController
              ) { }

  ngOnInit() {
    this.tipo = this.activatedRoute.snapshot.params.tipo;
    this.idMesa = parseInt(this.activatedRoute.snapshot.params.idMesa);

    this.fetchPersona = this.db1.fetchPersona().subscribe(items => {
      this.persona = items[0];
    });
    this.fetchCandidatos = this.db1.fetchCandidatos().subscribe(items => {
      this.candidatos = items;
      this.candidatos.forEach(candidato => {
        this.votos.push(0);
      })
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
    
    this.db1.getVoto(this.tipo, this.idMesa).then(d => {
      if(this.votos.length === 0) {
        this.candidatos.forEach(candidato => {
          this.db1.guardarVoto(this.tipo, candidato.idPartido, this.idMesa, this.persona.idPersona)
        })
      }
    })

    
    
    
    if (this.tipo === 'presidentes') {
      this.db1.getCandidatos(8871).then(d => { 
        console.log(this.candidatos)
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

    

  }

  retornar() {
    this.fotos = [];
    this.router.navigate(['/mesas', this.tipoNum])
  }

  guardar() {
    
    this.fotos = [];

    this.db1.updateSendData(this.tipo, this.idMesa, this.persona.idPersona).then(d => {
      this.router.navigate(['/mesas', this.tipoNum]);
    })
    
  }

  siguiente() {
    if (this.votos[this.contador] > 350) {
      this.mensajeGeneral('El valor ingresado es mayor al permitido', 'top')
    }

    if (this.contador < this.candidatos.length) {
      this.contador++;
    } else {
      this.contador = 0;
    }
  }

  anterior() {
    if (this.contador >= 0 ) {
      this.contador--;
    } else {
      this.contador = this.candidatos.length - 1;
    }
  }

  async mensajeGeneral(msg, pos) {
    const toast = await this.toastController.create({
      message: msg,
      position: pos,
      duration: 2000
    });
    toast.present();
  }

  async presentToastWithOptions(msg) {
    const toast = await this.toastController.create({
      header: 'Toast header',
      message: 'Click to Close',
      position: 'top',
      buttons: [
        {
          side: 'start',
          icon: 'star',
          text: 'Favorite',
          handler: () => {
            console.log('Favorite clicked');
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
