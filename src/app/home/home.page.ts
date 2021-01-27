import { Persona } from './../modelos/persona';
import { Router } from '@angular/router';
import { OfflineService } from './../services/offline.service';
import { AfterViewInit, Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit, AfterViewInit {
  persona: Persona;
  constructor(
    private db: OfflineService,
    private router: Router
  ) {}

  ngOnInit() {
    
  }

  ngAfterViewInit() {
    this.db.dbState().subscribe((res) => {
      if (res) {
        this.db.fetchPersona().subscribe(item => {
          if (item.length > 0) {
            this.persona = item[0];
            this.router.navigate(['/menu']);
          } else {
            this.router.navigate(['/login']);
          }
        })
      }
    }); 
  }

}
