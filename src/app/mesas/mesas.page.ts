import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { Mesa } from '../modelos/mesa';



@Component({
  selector: 'app-mesas',
  templateUrl: './mesas.page.html',
  styleUrls: ['./mesas.page.scss'],
})
export class MesasPage implements OnInit {

  provincia: string
  distrito: string
  canton: string
  parroquia: string
  recinto: string
  juntas: Array<Mesa>

  constructor(private router:Router) { }
o
  ngOnInit() {
    this.juntas = [
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'F',
        numero: 1,
        idPersona: 1,
        electores: 350,
        ctrl: true,
        auditoria: false,
        takeImg: true,
        sendData: true,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'F',
        numero: 2,
        idPersona: 1,
        electores: 350,
        ctrl: false,
        takeImg: false,
        auditoria: false,
        sendData: false,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'F',
        numero: 3,
        idPersona: 1,
        electores: 350,
        ctrl: false,
        takeImg: true,
        auditoria: false,
        sendData: true,
        sendImg: true
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'F',
        numero: 24,
        idPersona: 1,
        electores: 350,
        ctrl: true,
        takeImg: true,
        auditoria: false,
        sendData: true,
        sendImg: true
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'F',
        numero: 5,
        idPersona: 1,
        electores: 350,
        ctrl: false,
        takeImg: true,
        auditoria: false,
        sendData: false,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'F',
        numero: 6,
        idPersona: 1,
        electores: 350,
        ctrl: false,
        takeImg: true,
        auditoria: false,
        sendData: false,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'M',
        numero: 1,
        idPersona: 1,
        electores: 350,
        ctrl: false,
        takeImg: true,
        auditoria: false,
        sendData: false,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'M',
        numero: 2,
        idPersona: 1,
        electores: 350,
        ctrl: true,
        takeImg: true,
        auditoria: false,
        sendData: false,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'M',
        numero: 3,
        idPersona: 1,
        electores: 350,
        ctrl: false,
        takeImg: true,
        auditoria: false,
        sendData: false,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'M',
        numero: 4,
        idPersona: 1,
        electores: 350,
        ctrl: false,
        takeImg: true,
        auditoria: false,
        sendData: false,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'M',
        numero: 5,
        idPersona: 1,
        electores: 350,
        ctrl: true,
        takeImg: true,
        auditoria: false,
        sendData: false,
        sendImg: false
      },
      {
        id: 4966,
        idLugar: 5259,
        sexo: 'M',
        numero: 6,
        idPersona: 1,
        electores: 350,
        ctrl: false,
        takeImg: true,
        auditoria: false,
        sendData: false,
        sendImg: false
      }
    ]
    this.provincia = 'Chimborazo'
    this.distrito = 'jhjhljk'
    this.canton = 'Riobamba'
    this.parroquia = 'Lizarzaburu'
    this.recinto = 'Colegio Cardenal Spelman de mujeres y acompañantes'
  
  }

  login() {
    this.router.navigateByUrl('login')
  }

  resetlogin() {
    this.router.navigateByUrl('resetlogin')
  }

  presidente() {

  }

  nacional() {

  }

  provincial() {

  }

  parlamento() {

  }

}
