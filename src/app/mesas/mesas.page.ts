import { async } from '@angular/core/testing';
import { OfflineService } from './../services/offline.service';
import { Router } from '@angular/router';
import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Mesa } from '../modelos/mesa';



@Component({
  selector: 'app-mesas',
  templateUrl: './mesas.page.html',
  styleUrls: ['./mesas.page.scss'],
})
export class MesasPage implements OnInit, AfterViewInit {

  provincia: string = '';
  distrito: string = '';
  canton: string = '';
  parroquia: string = '';
  zona: string = '';
  recinto: string = '';
  juntas: Array<Mesa> = [{
    id: 0,
    idMesa: 0,
    idLugar: 0,
    sexo: '',
    numero: 0,
    idPersona: 0,
    electores: 0,
    ctrl: false,
    takeImg: false,
    sendData: false,
    sendImg: false
  }];
  lugar = [];

  constructor(private router:Router, private db1: OfflineService) { }
o
  ngOnInit() {
    this.db1.fetchMesas().subscribe(items => {
      this.juntas = items
    })
    this.db1.fetchLugares().subscribe(items => {
      this.lugar = items
    })
    this.db1.getMesas().then(d => {
      this.ubicacion();
    })
    
  }

  ngAfterViewInit() {
    
    
    
    
  }

  login() {
    this.router.navigateByUrl('login')
  }

  resetlogin() {
    this.router.navigateByUrl('resetlogin')
  }

  enviarMesa() {
    this.router.navigate(['/foto'])
  }

  nacional() {

  }

  provincial() {

  }

  parlamento() {

  }

  ubicacion() {
    if (this.lugar.length === 0) {
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

}
