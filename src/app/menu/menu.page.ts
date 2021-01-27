import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.page.html',
  styleUrls: ['./menu.page.scss'],
})
export class MenuPage implements OnInit {

  usuario: string
  constructor(private router:Router) { }

  ngOnInit() {
    this.usuario = 'Rosa Paulina Jacome Rosero'
  }

  login() {
    this.router.navigate(['/login'])
  }

  resetlogin() {
    this.router.navigate(['/resetlogin'])
  }

  presidente() {
    this.router.navigate(['/mesas'])
  }

  nacional() {

  }

  provincial() {

  }

  parlamento() {

  }

}
