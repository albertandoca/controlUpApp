import { Component, OnInit } from '@angular/core';
import { FotoService } from '../services/foto.service';



@Component({
  selector: 'app-foto',
  templateUrl: './foto.page.html',
  styleUrls: ['./foto.page.scss'],
})
export class FotoPage implements OnInit {


  constructor(private fotoService: FotoService) { }

  ngOnInit() {
  }

  takePicture() {
    this.fotoService.takePicture();
  }

}
