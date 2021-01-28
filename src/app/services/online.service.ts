import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { Persona } from '../modelos/persona';
import { Mesa } from '../modelos/mesa';

export interface DataRx {
  data: any;
  msg: string;
}



@Injectable({
  providedIn: 'root'
})
export class OnlineService {

  personas = new BehaviorSubject([{
    id: 0,
    idPersona: 0,
    cedula: '',
    apellidoPaterno: '',
    apellidoMaterno: '',
    primerNombre: '',
    segundoNombre: '',
    idLugar: 0
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
    private http: HttpClient
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
      let p = [];
      if(res.data.id) {
        p.push(res.data)
      } else {
        alert('Usuario o contraseña incorrectas')
        p = [
          {
            id: 0,
            idPersona: 0,
            cedula: '',
            apellidoPaterno: '',
            apellidoMaterno: '',
            primerNombre: '',
            segundoNombre: '',
            idLugar: 0
          }
        ]
        
      }
      return this.personas.next(p)
    })
  }

  async runMesas(data) {
    return await this.http.post<DataRx>(`${this.urlServer}mesas`, data, this.httpOptions)
    .subscribe(res => {
      if (res.data.length === 0) {
        alert('No tienes mesas asignadas');
      } else {
        this.mesas.next(res.data)
      }
      
    })
  }

  getPersonas() {
    this.http.get(`${this.urlServer}getpersonas`)
    .subscribe(d => {
      alert(JSON.stringify(d))
    })
  }
}
