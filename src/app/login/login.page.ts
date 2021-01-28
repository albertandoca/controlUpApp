import { OfflineService } from './../services/offline.service';
import { Mesa } from './../modelos/mesa';
import { Persona } from './../modelos/persona';
import { OnlineService } from './../services/online.service';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {
  
  persona: Persona = {
    id: 0,
    idPersona: 0,
    cedula: '',
    apellidoPaterno: '',
    apellidoMaterno: '',
    primerNombre: '',
    segundoNombre: '',
    idLugar: 0
  };
  mesas: Mesa[] = [];
  data = {};
  usuario: string;
  seguro: string;

  constructor(private router:Router, 
              private db: OnlineService,
              private db1: OfflineService) { }

  ngOnInit() {
    this.usuario = '';
    this.seguro = '';
    
    
  }

  async entrar() {
    if (this.usuario !== '' && this.seguro !== '') {
      this.data = {
        usuario: this.usuario,
        seguro: this.seguro
      }
      await this.db.runLogin(this.data)
      .then (async d => {
        this.db.fetchPersonas().subscribe(item => {
          this.persona = item[0];
          if(this.persona.id > 0) {
            let datos = Object.values(this.persona)
            datos.push(this.seguro)
            this.db1.guardarPersona(datos).then(d =>{
              this.db.runMesas({idPersona: this.persona.id})
              .then(async d => {
                await this.db.fetchMesas().subscribe(item => {
                  this.mesas = item;
                  if (this.mesas.length > 0) {
                    this.mesas.forEach(mesa => {
                      datos = Object.values(mesa);
                      this.db1.guardarMesas(datos).then(d => {
                        this.router.navigate(['/menu']);
                      })
                    })
                  }
                })
              })
            })
          }
        });
      });
    } else {
      this.router.navigate(['/resetlogin'])
    }
    
    
  }

  salir() {
    //this.router.navigate(['/resetlogin'])
    alert('getpersona');
    this.db.getPersonas();
  }

}

