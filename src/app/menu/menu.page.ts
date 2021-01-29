import { OfflineService } from './../services/offline.service';
import { Persona } from './../modelos/persona';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.page.html',
  styleUrls: ['./menu.page.scss'],
})
export class MenuPage implements OnInit {
  persona: Persona;
  usuario: string
  constructor(private router:Router, private db1: OfflineService) { }

  ngOnInit() {
    this.db1.fetchPersona().subscribe(item => {
      this.persona = item[0];
      this.usuario = `${this.persona.primerNombre} ${this.persona.segundoNombre} ${this.persona.apellidoPaterno} ${this.persona.apellidoMaterno}`
    })
    
  }

  login() {
    this.router.navigate(['/login'])
  }

  resetlogin() {
    this.router.navigate(['/resetlogin'])
  }

  presidente() {
    this.router.navigate(['/mesas',1])
  }

  nacional() {
    this.router.navigate(['/mesas',2])
  }

  provincial() {
    this.router.navigate(['/mesas',3])
  }

  parlamento() {
    this.router.navigate(['/mesas',4])
  }

}
