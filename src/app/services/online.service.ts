import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { Persona } from '../modelos/persona';
import { Mesa } from '../modelos/mesa';
import { ToastController } from '@ionic/angular';
import { DataRx } from '../modelos/datarx';

@Injectable({
  providedIn: 'root'
})
export class OnlineService {

  personas = new BehaviorSubject([{
    idPersona: 0,
    cedula: '',
    apellidos: '',
    nombres: '',
    correo:'',
    idLugar: 0,
    frase: ''
  }]);
  mesas = new BehaviorSubject([]);
  urlServer = 'https://192.168.1.61:3000/app/';
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type':  'application/json'//,
      // Authorization: 'my-auth-token'
    })
  };

  constructor(
    private http: HttpClient,
    private toastController: ToastController
  ) { 
    
  }

  fetchPersonas(): Observable<Persona[]> {
    return this.personas.asObservable();
  }

  fetchMesas(): Observable<Mesa[]> {
    return this.mesas.asObservable();
  }

  async runLogin(data) {
    return await this.http.post<DataRx>(`${this.urlServer}login`, data, this.httpOptions)
    .subscribe(res => {
      let p: Persona[] = [
        {
          id: 0,
          idPersona: 0,
          cedula: '',
          apellidos: '',
          nombres: '',
          correo: '',
          idLugar: 0,
          frase: ''
        }
      ];
      if (!res) {
        this.presentToast('No hay comunicación con el servidor, revise su conexión a internet');
      } else {
        if (res.data.frase === false) {
          this.presentToast('Usuario o contraseña incorrecto')
        } else {
          if(res.data.id) {
            p[0] = {
              idPersona: parseInt(res.data.id),
              cedula: res.data.cedula,
              apellidos: res.data.apellidos,
              nombres: res.data.nombres,
              correo: res.data.correo,
              idLugar: parseInt(res.data.idLugar),
              frase: res.data.frase
            }
          } else {
            this.presentToast('Usuario o contraseña incorrecto')
          }
        }
      }
      return this.personas.next(p);
    }), error => {
      this.presentToast('No se pudo conectar con el servidor, verifique su conexión a internet')
    }
  }

  async runMesas(data) {
    return await this.http.post<DataRx>(`${this.urlServer}mesas`, data, this.httpOptions)
    .subscribe(res => {
      console.log(res)
      if(res.data.token === false) {
        this.mesas.next([])
      } else {
        this.mesas.next(res.data)
      }
    })
  }

  getPersonas() {
    this.http.get(`${this.urlServer}getpersonas`)
    .subscribe(res => {
      alert(JSON.stringify(res))
    })
  }

  async presentToast(mensaje) {
    const toast = await this.toastController.create({
      message: mensaje,
      position: 'middle',
      color: 'danger',
      duration: 2000
    });
    toast.present();
  }
}
