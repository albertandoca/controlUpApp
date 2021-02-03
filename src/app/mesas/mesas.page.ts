import { Persona } from './../modelos/persona';
import { OnlineService } from './../services/online.service';

import { OfflineService } from './../services/offline.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { Component, OnInit, AfterViewInit, OnDestroy } from '@angular/core';
import { Mesa } from '../modelos/mesa';
import { Subscription } from 'rxjs';
import { Platform } from '@ionic/angular';
import { Eleccion } from '../modelos/eleccion';
import { ToastController } from '@ionic/angular';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { DataRx } from '../modelos/datarx';




@Component({
  selector: 'app-mesas',
  templateUrl: './mesas.page.html',
  styleUrls: ['./mesas.page.scss'],
})
export class MesasPage implements OnInit, AfterViewInit, OnDestroy {

  urlServer = 'https://192.168.1.61:3000/app/';
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type':  'application/json'//,
      // Authorization: 'my-auth-token'
    })
  };
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
    ctrl: false,
    presidente: 0,
    nacional: 0,
    provincial: 0,
    parlamento: 0
  }];
  lugar = [];
  tipo: number;
  fetchMesas: Subscription;
  fetchLugares: Subscription;
  fetchEleccion: Subscription;
  fetchJoinMesas: Subscription;
  fetchVotos: Subscription;
  fetchImg: Subscription;
  fetchPersona: Subscription;
  plataforma: Subscription;
  tipoEleccion: string;
  eleccionEstado: Array<Eleccion>;
  joinMesas: Array<any>;
  sendTipo: string;
  idMesa: number;
  electores: number;
  idPersona: number;
  urlEleccion: string;
  urlImg: string;
  tipoImg: string;
  persona: Persona;

  constructor(private router:Router,
    private db1: OfflineService,
    private db: OnlineService,
    private platform: Platform,
    public toastController: ToastController,
    private http: HttpClient,
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

    this.fetchPersona = this.db1.fetchPersona().subscribe(items => {
      this.persona = items[0];
    })
  
    this.tipo = parseInt(this.activatedRoute.snapshot.params.tipo);
    if (this.tipo === 1) {
      this.tipoEleccion = 'JRV PRESIDENTE';
      this.sendTipo = 'presidentes';
      this.urlEleccion = 'uploaddatapresidente';
      this.tipoImg = 'imgPresidentes';
      this.urlImg = 'uploadimgpresidente';
    } else if (this.tipo === 2) {
      this.tipoEleccion = 'JRV ASAMBLEA NACIONAL';
      this.sendTipo = 'nacionales';
      this.urlEleccion = 'uploaddatanacional';
      this.tipoImg = 'imgNacionales';
      this.urlImg = 'uploadimgnacional';
    } else if (this.tipo === 3) {
      this.tipoEleccion = 'JRV ASAMBLEA PROVINCIAL';
      this.sendTipo = 'provinciales';
      this.urlEleccion = 'uploaddataprovincial';
      this.tipoImg = 'imgProvinciales';
      this.urlImg = 'uploadimgprovincial';
    } else if (this.tipo === 4) {
      this.tipoEleccion = 'JRV PARLAMENTO ANDINO';
      this.sendTipo = 'parlamentos';
      this.urlEleccion = 'uploaddataparlamento';
      this.tipoImg = 'imgParlamentos';
      this.urlImg = 'uploadimgparlamento';
    }
    console.log('regresa')
    this.db1.getMesas().then(async d => {
      this.ubicacion();
      await this.db1.getEleccion([this.sendTipo, this.juntas[0].idMesa]).then(d => {
        if(this.eleccionEstado.length === 0) {
          this.juntas.forEach(async junta => {
            let takeImg = false;
            let sendImg = 0;
            let sendData = false;
            if(this.tipo === 1) {
              if(junta.presidente === 1) {
                takeImg = true;
                sendImg = 2;
              } else if(junta.presidente === 2) {
                takeImg = true;
                sendImg = 2;
                sendData = true
              }
            } else if(this.tipo === 2) {
              if(junta.nacional === 1) {
                takeImg = true;
                sendImg = 2;
              } else if(junta.nacional === 2) {
                takeImg = true;
                sendImg = 3;
                sendData = true
              }
            } else if(this.tipo === 3) {
              if(junta.provincial === 1) {
                takeImg = true;
                sendImg = 2;
              } else if(junta.provincial === 2) {
                takeImg = true;
                sendImg = 2;
                sendData = true
              }
            } else if(this.tipo === 4) {
              if(junta.parlamento === 1) {
                takeImg = true;
                sendImg = 2;
              } else if(junta.parlamento === 2) {
                takeImg = true;
                sendImg = 2;
                sendData = true
              }
            }

            let c = await this.db1.guardarEleccion([this.sendTipo, junta.idMesa, junta.idPersona, takeImg, sendImg, sendData])
          })
        }
      })
      await this.db1.mesasEleccion([this.sendTipo, this.juntas[0].idPersona])
    })
  }

  ubicacion() {
    console.log('this.ubicacion')
    if(this.juntas.length === 0) {
      this.mensajeGeneral('No tiene mesas asignadas, comuniquese con el coordinador provincial', 'middle')
      this.router.navigate(['/login'])
    } else {
      console.log('paso ubica')
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

  generateFormImage(img, MAX_WIDTH: number = 720, MAX_HEIGHT: number = 1200, quality: number = 1, callback) {
    let canvas: any = document.createElement('canvas');
    let image = new Image();

    image.onload = () => {
      let width = image.width;
      let height = image.height;

      if (width > height) {
        if (width > MAX_WIDTH) {
          height *= MAX_WIDTH / width
          width = MAX_WIDTH
        }
      } else {
        if (height > MAX_HEIGHT) {
          width *= MAX_HEIGHT / height;
          height = MAX_HEIGHT
        }
      }
      canvas.width = width;
      canvas.height = height;
      let ctx = canvas.getContext('2d');

      ctx.drawImage(image, 0, 0, width, height);
      
      let dataUrl = canvas.toDataURL('image/jpeg', quality)
       callback(dataUrl)
    };
    image.src = img;
  }

  async convertir(img1, img2, img3, idMesa, idPersona) {
    let imagenes = {
      data: {
        idMesa: idMesa,
        urlImg1: '',
        urlImg2: '',
        urlImg3: '',
      }
    }
    
    await this.generateFormImage(img1, 720, 1200, 0.5, async data => {
      let imagen = data;
      console.log(data)
      imagenes.data.urlImg1 = await imagen.split(',')[1];
      await this.generateFormImage(img2, 720, 1200, 0.5, async data1 => {
        let imagen = data1;
        console.log(data1)
        imagenes.data.urlImg2 = await imagen.split(',')[1];
        await this.generateFormImage(img3, 720, 1200, 0.5, async data2 => {
          let imagen = data2;
          console.log(data2)
          imagenes.data.urlImg3 = await imagen.split(',')[1];
          let datos = {
            data: imagenes.data,
            frase: this.persona.frase,
            seguro: this.persona.cedula
          }
          this.http.put<DataRx>(`${this.urlServer}${this.urlImg}`, datos, this.httpOptions)
          .subscribe(items => {
            if(!items) {
              this.mensajeGeneral('No se guardaron los datos, revise su conexión a internet o intentelo más tarde.', 'middle', 'danger');
            } else {
              this.mensajeGeneral('Las imágenes llegaron con éxito al servidor', 'middle', 'primary');
              this.db1.updateSendImg(this.sendTipo, idMesa, idPersona);
              this.db1.updateSendData(this.sendTipo, idMesa, idPersona, 3);
              this.db1.getEleccion([this.sendTipo, this.juntas[0].idMesa]);
            } 
          }, error => {
            this.mensajeGeneral('Las imágenes no se guardaron en el servidor, por favor conpruebe su conexión a internet e intente más tarde.', 'middle', 'danger')
          });  
        })
      })
    })
    
  }

  async enviarImg(idMesa, idPersona) {
    let data: any;
    this.db1.getImagenes(this.tipoImg, idMesa).then( async d => {
      this.fetchImg = await this.db1.fetchImagenes().subscribe(items => {
        data = items;
      })
      await this.convertir(data[0].urlImg1, data[0].urlImg2, data[0].urlImg3, idMesa, idPersona).then(res => {
        console.log('ddd',res)
      })
    })
  }

  ngOnDestroy() {
    this.fetchLugares.unsubscribe();
    this.fetchMesas.unsubscribe();
    this.plataforma.unsubscribe();
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

  async mensajeGuardar(idMesa, idPersona, electores) {
    const toast = await this.toastController.create({
      header: 'EDITAR O ENVIAR',
      message: 'Usted puede EDITAR los votos ingresados o GUARDAR en el servidor',
      position: 'middle',
      color: 'tertiary',
      buttons: [
        {
          side: 'end',
          icon: 'star',
          text: 'EDITAR',
          handler: () => {
            console.log(this.sendTipo, idMesa, electores);
            this.router.navigate(['/datos', this.sendTipo, idMesa, electores]);
          }
        }, {
          text: 'GUARDAR',
          icon: 'send',
          role: 'cancel',
          handler: () => {
            let data : any;
            this.db1.getVoto(this.sendTipo, idMesa).then(d => {
              this.fetchVotos = this.db1.fetchVotos().subscribe(items => {
                data = {
                  data: items,
                  frase: this.persona.frase,
                  seguro: this.persona.cedula
                };
              }); 
              this.http.put<DataRx>(`${this.urlServer}${this.urlEleccion}`, data, this.httpOptions)
              .subscribe(items => {
                if(!items) {
                  this.mensajeGeneral('No se guardaron los datos, revise su conexión a internet o intentelo más tarde.', 'middle', 'danger');
                } else {
                  this.mensajeGeneral('Los datos llegaron con éxito al servidor', 'middle', 'primary');
                  this.db1.updateSendData(this.sendTipo, idMesa, idPersona, 3);
                  this.db1.getEleccion([this.sendTipo, this.juntas[0].idMesa]);
                } 
              }, error => {
                this.mensajeGeneral('Los datos no se guardaron en el servidor, por favor conpruebe su conexión a internet e intente más tarde.', 'middle', 'danger')
              });         
            })
            this.fetchVotos.unsubscribe();
          }
        }
      ]
    });
    toast.present();
  }

}
