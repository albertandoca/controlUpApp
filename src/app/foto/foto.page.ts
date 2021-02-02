import { ImgGeneral } from './../modelos/img-general';
import { Subscription } from 'rxjs';
import { OfflineService } from './../services/offline.service';
import { Component, OnInit } from '@angular/core';
import { FotoService } from '../services/foto.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { ToastController } from '@ionic/angular';


@Component({
  selector: 'app-foto',
  templateUrl: './foto.page.html',
  styleUrls: ['./foto.page.scss'],
})
export class FotoPage implements OnInit {

  tipo: number;
  idMesa: number;
  tipoEleccion: string;
  sendTipo: string;
  sendTipoEleccion: string;
  fetchImagenes: Subscription;
  imagenes: ImgGeneral[] = [];
  bandera: number;
  numero: number;
  sexo: string;
  idEleccion: number;
  idPersona: number;

  constructor(public fotoService: FotoService,
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private db1: OfflineService,
    public toastController: ToastController) { }

  ngOnInit() {
    this.bandera = 0;
    this.eleccion();
    
    this.fetchImagenes = this.db1.fetchImagenes().subscribe(items => {
      this.imagenes = items;
      if (this.imagenes.length > 0) {
        this.fotoService.readPicture(this.imagenes[0].urlImg1, this.imagenes[0].urlImg2, this.imagenes[0].urlImg3);
        this.bandera = 1;
      } else {
        this.bandera = 0;
      }
    });
  }

  takePicture() {
    this.fotoService.takePicture();
  }

  eleccion() {
    this.fotoService.reiniciarContador();
    this.db1.reiniciarImagenes();
    this.tipo = parseInt(this.activatedRoute.snapshot.params.tipo);
    this.idMesa = parseInt(this.activatedRoute.snapshot.params.idMesa);
    this.numero = parseInt(this.activatedRoute.snapshot.params.numero);
    this.sexo = this.activatedRoute.snapshot.params.sexo;
    this.idEleccion = parseInt(this.activatedRoute.snapshot.params.idEleccion);
    this.idPersona = parseInt(this.activatedRoute.snapshot.params.idPersona);

    if (this.tipo === 1) {
      this.tipoEleccion = 'PRESIDENTE';
      this.sendTipo = 'imgPresidentes';
      this.sendTipoEleccion = 'presidentes';
    } else if (this.tipo === 2) {
      this.tipoEleccion = 'ASAMBLEA NACIONAL';
      this.sendTipo = 'imgNacionales';
      this.sendTipoEleccion = 'nacionales';
    } else if (this.tipo === 3) {
      this.tipoEleccion = 'ASAMBLEA PROVINCIAL';
      this.sendTipo = 'imgProvinciales';
      this.sendTipoEleccion = 'provinciales';
    } else if (this.tipo === 4) {
      this.tipoEleccion = 'PARLAMENTO ANDINO';
      this.sendTipo = 'imgParlamentos';
      this.sendTipoEleccion = 'parlamentos';
    }
    this.db1.getImagenes(this.sendTipo, this.idMesa).then(d => {
      
    })
  }

  deletePicture(index){
    this.fotoService.deletePicture(index).then(d => {
      if (this.bandera === 1) {
        this.fotoService.updatePicture(this.sendTipo, this.idMesa).then(d => {
          this.mensajeGeneral('La imágen se actualizó', 'middel', 'primary')
        })
      }
    })
  }

  async retornarMesas() {
    this.fotoService.reiniciarContador();
    this.db1.reiniciarImagenes();
    if (this.bandera === 0) {
      this.mensajeGuardar();
    }
  }

  savePictures() {
    this.fotoService.savePicture(this.sendTipo, this.idMesa).then(async d => {
      this.mensajeGeneral('Las imágenes se guardaron en su celular', 'middle', 'primary');
      this.db1.updateTakeImg(this.idEleccion,[this.sendTipoEleccion, this.idPersona] );
      this.fotoService.fotos = [];
      this.fotoService.contador = 0;
      this.router.navigate(['/mesas', this.tipo])
    }).catch(err => {
      this.mensajeGeneral('No se pudieron guardar las imagenes, cierre la aplicación y realice nuevamente el procedimiento', 'meddle', 'danger');
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
      header: 'SALIR SIN GUARDAR',
      message: 'No se guardó ninguna imágen, está seguro de salir',
      position: 'middle',
      color: 'warning',
      buttons: [
        {
          side: 'end',
          icon: 'star',
          text: 'SÍ',
          handler: () => {
            this.router.navigate(['/mesas', this.tipo])
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

}
