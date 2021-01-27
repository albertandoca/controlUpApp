import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-reset-login',
  templateUrl: './reset-login.page.html',
  styleUrls: ['./reset-login.page.scss'],
})
export class ResetLoginPage implements OnInit {
  constructor(private router:Router) { }

  ngOnInit() {
  }

  cambiar() {
    this.router.navigateByUrl('menu')
  }

  salir() {
    this.router.navigateByUrl('login')
  }

}
