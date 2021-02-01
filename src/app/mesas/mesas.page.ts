
import { OfflineService } from './../services/offline.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { Component, OnInit, AfterViewInit, OnDestroy } from '@angular/core';
import { Mesa } from '../modelos/mesa';
import { Subscription } from 'rxjs';
import { Platform } from '@ionic/angular';
import { Eleccion } from '../modelos/eleccion';
import { ToastController } from '@ionic/angular';




@Component({
  selector: 'app-mesas',
  templateUrl: './mesas.page.html',
  styleUrls: ['./mesas.page.scss'],
})
export class MesasPage implements OnInit, AfterViewInit, OnDestroy {

  provincia: string = '';
  distrito: string = '';
  canton: string = '';
  parroquia: string = '';
  zona: string = '';
  recinto: string = '';
  upload: boolean = false;
  juntas: Array<Mesa> = [{
    id: 0,
    idMesa: 0,
    idLugar: 0,
    sexo: '',
    numero: 0,
    idPersona: 0,
    electores: 0,
    ctrl: false
  }];
  lugar = [];
  tipo: number;
  fetchMesas: Subscription;
  fetchLugares: Subscription;
  fetchEleccion: Subscription;
  fetchJoinMesas: Subscription;
  plataforma: Subscription;
  tipoEleccion: string;
  eleccionEstado: Array<Eleccion>;
  joinMesas: Array<any>;
  sendTipo: string;
  idMesa: number;
  electores: number;
  idPersona: number;

  constructor(private router:Router,
    private db1: OfflineService,
    private platform: Platform,
    public toastController: ToastController,
    private activatedRoute: ActivatedRoute) { }
o
  ngOnInit() {
    this.eleccion();    
  }

  ngAfterViewInit() {
    this.plataforma = this.platform.backButton.subscribe(() => {
      navigator['app'].exitApp();
    });
  }


  login() {
    this.router.navigateByUrl('login')
  }

  resetlogin() {
    this.router.navigateByUrl('resetlogin')
  }
  
  enviarMesa(idMesa, numero, sexo, idEleccion, idPersona) {
    this.router.navigate(['/foto', this.tipo, idMesa, numero, sexo, idEleccion, idPersona]);
  }

  eleccion() {
    this.fetchMesas = this.db1.fetchMesas().subscribe(items => {
      this.juntas = items
    })
    this.fetchLugares = this.db1.fetchLugares().subscribe(items => {
      this.lugar = items
    })

    this.fetchEleccion = this.db1.fetchEleccion().subscribe(items => {
      this.eleccionEstado = items;
    })

    this.fetchJoinMesas = this.db1.fetchJoinMesas().subscribe(items => {
      this.joinMesas = items;
    })
  
    this.tipo = parseInt(this.activatedRoute.snapshot.params.tipo);
    if (this.tipo === 1) {
      this.tipoEleccion = 'JRV PRESIDENTE';
      this.sendTipo = 'presidentes';
    } else if (this.tipo === 2) {
      this.tipoEleccion = 'JRV ASAMBLEA NACIONAL';
      this.sendTipo = 'nacionales';
    } else if (this.tipo === 3) {
      this.tipoEleccion = 'JRV ASAMBLEA PROVINCIAL';
      this.sendTipo = 'provinciales';
    } else if (this.tipo === 4) {
      this.tipoEleccion = 'JRV PARLAMENTO ANDINO';
      this.sendTipo = 'parlamentos';
    }
    console.log('regresa')
    this.db1.getMesas().then(async d => {
      this.ubicacion();
      await this.db1.getEleccion([this.sendTipo, this.juntas[0].idMesa]).then(d => {
        if(this.eleccionEstado.length === 0) {
          this.juntas.forEach(async junta => {
            let c = await this.db1.guardarEleccion([this.sendTipo, junta.idMesa, junta.idPersona, false, 0, false])
          })
        }
      })
      await this.db1.mesasEleccion([this.sendTipo, this.juntas[0].idPersona])
    })
  }

  ubicacion() {
    this.db1.ubicacion(this.juntas[0].idLugar)
    .then(async d => {
      this.recinto = await this.lugar[0].detalle;
      this.db1.ubicacion(this.lugar[0].idLugar)
      .then(async d => {
        this.zona = await this.lugar[0].detalle;
        this.db1.ubicacion(this.lugar[0].idLugar)
        .then(async d => {
          this.parroquia = await this.lugar[0].detalle;
          this.db1.ubicacion(this.lugar[0].idLugar)
          .then(async d => {
            this.canton = await this.lugar[0].detalle;
            this.db1.ubicacion(this.lugar[0].idLugar)
            .then(async d => {
              this.distrito = await this.lugar[0].detalle;
              this.db1.ubicacion(this.lugar[0].idLugar)
              .then(async d => {
                this.provincia = await this.lugar[0].detalle;
              })
            })
          })
        })
      })
    })
  }

  irMenu() {
    this.router.navigate(['/menu']);
  }

  exitApp(){
    navigator['app'].exitApp();
  }

  enviarDatos(idMesa, electores) {
    this.idMesa = idMesa;
    this.electores = electores;
    this.router.navigate(['/datos', this.sendTipo, idMesa, electores]);
  }

  enviarImg(idMesa, idPersona) {
    this.db1.updateSendImg(this.sendTipo, idMesa, idPersona);
    this.db1.updateSendData(this.sendTipo, idMesa, idPersona, 3);
    this.mensajeGeneral('Las imágenes llegaron con éxito al servidor', 'top');
    this.db1.getEleccion([this.sendTipo, this.juntas[0].idMesa]);

  }

  ngOnDestroy() {
    this.fetchLugares.unsubscribe();
    this.fetchMesas.unsubscribe();
    this.plataforma.unsubscribe();
  }

  async mensajeGeneral(msg, pos) {
    const toast = await this.toastController.create({
      message: msg,
      position: pos,
      duration: 4000
    });
    toast.present();
  }

  async mensajeGuardar(idMesa, idPersona) {
    const toast = await this.toastController.create({
      header: 'EDITAR O ENVIAR',
      message: 'Usted puede EDITAR los votos ingresados o ENVIAR al servidor',
      position: 'top',
      buttons: [
        {
          side: 'start',
          icon: 'star',
          text: 'EDITAR',
          handler: () => {
            alert('jjjj')
            this.router.navigate(['/datos', this.sendTipo, this.idMesa, this.electores]);
          }
        }, {
          text: 'ENVIAR',
          icon: 'send',
          role: 'cancel',
          handler: () => {
            this.mensajeGeneral('Los votos llegaron con éxito al servidor', 'top');
            console.log(idPersona, this.sendTipo, idMesa)
            this.db1.updateSendData(this.sendTipo, idMesa, idPersona, 3);
            this.db1.getEleccion([this.sendTipo, this.juntas[0].idMesa]);

          }
        }
      ]
    });
    toast.present();
  }

}
