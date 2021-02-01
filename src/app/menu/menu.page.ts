import { OfflineService } from './../services/offline.service';
import { Persona } from './../modelos/persona';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { ToastController } from '@ionic/angular';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.page.html',
  styleUrls: ['./menu.page.scss'],
})
export class MenuPage implements OnInit {
  persona: Persona;
  usuario: string
  constructor(private router:Router, private db1: OfflineService, public toastController: ToastController) { }

  ngOnInit() {
    this.db1.fetchPersona().subscribe(item => {
      this.persona = item[0];
      console.log(this.persona)
      this.usuario = `${this.persona.nombres} ${this.persona.apellidos}`
    });
    this.db1.reiniciarCandidatos();
    
  }

  login() {
    this.router.navigate(['/login'])
  }

  resetlogin() {
    //this.router.navigate(['/resetlogin'])
    this.mensajeGeneral('La aplicación se encuentra actualizada', 'top')
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

  async mensajeGeneral(msg, pos) {
    const toast = await this.toastController.create({
      message: msg,
      position: pos,
      duration: 4000
    });
    toast.present();
  }
}
