import { ImgGeneral } from './../modelos/img-general';
import { Router, ActivatedRoute } from '@angular/router';
import { Persona } from './../modelos/persona';
import { Subscription } from 'rxjs';
import { OfflineService } from './../services/offline.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-datos',
  templateUrl: './datos.page.html',
  styleUrls: ['./datos.page.scss'],
})
export class DatosPage implements OnInit {
  
  fotos = [];
  fetchPersona: Subscription;
  fetchCandidatos: Subscription;
  fetchImagenes: Subscription;
  persona: Persona;
  candidatos: Array<any> = [];
  imagenes: ImgGeneral[] = [];
  tipo: string;
  idMesa: number;
  contador: number = 0;
  votos: Array<number> = [];
  tipoNum: number;


  constructor(private db1: OfflineService,
              private activatedRoute: ActivatedRoute,
              private router: Router
              ) { }

  ngOnInit() {
    this.fetchPersona = this.db1.fetchPersona().subscribe(items => {
      this.persona = items[0];
    });
    this.fetchCandidatos = this.db1.fetchCandidatos().subscribe(items => {
      this.candidatos = items;
      this.candidatos.forEach(candidato => {
        this.votos.push(0);
      })
    });
    this.fetchImagenes = this.db1.fetchImagenes().subscribe(items => {
      this.imagenes = items;
      if(this.imagenes.length > 0) {
        this.fotos = [];     
        this.fotos.push(this.imagenes[0].urlImg1);
        this.fotos.push(this.imagenes[0].urlImg2);
        this.fotos.push(this.imagenes[0].urlImg3);
      }
    });
    this.tipo = this.activatedRoute.snapshot.params.tipo;
    console.log(`tipo: ${this.tipo}`);
    this.idMesa = parseInt(this.activatedRoute.snapshot.params.idMesa);
    
    if (this.tipo === 'presidentes') {
      this.db1.getCandidatos(8871).then(d => { 
        console.log(this.candidatos)
      });
      this.db1.getImagenes('imgPresidentes', this.idMesa).then(d => { 
        console.log(this.imagenes
          )});
      this.tipoNum = 1;
    } else if (this.tipo === 'nacionales') {
      this.db1.getCandidatos(8872).then(d => { 
        console.log(this.candidatos)
      });
      this.db1.getImagenes('imgNacionales', this.idMesa).then(d => { 
        console.log(this.imagenes)
      });
      this.tipoNum = 2;
    } else if (this.tipo === 'provinciales') {
      this.db1.getCandidatos(this.persona.idLugar).then(d => { 
        console.log(this.candidatos)
      });
      this.db1.getImagenes('imgProvinciales', this.idMesa).then(d => { 
        console.log(this.imagenes)
      });
      this.tipoNum = 3;
    } else if (this.tipo === 'parlamentos') {
      this.db1.getCandidatos(8873).then(d => { 
        console.log(this.candidatos)
      });
      this.db1.getImagenes('imgParlamentos', this.idMesa).then(d => { 
        console.log(this.imagenes)
      });
      this.tipoNum = 4;
    }

    this.candidatos.forEach(candidato => {
      this.votos.push(0);
    })

  }

  retornar() {
    this.fotos = [];
    this.router.navigate(['/mesas', this.tipoNum])
  }

  guardar() {
    this.fotos = [];
    this.db1.updateSendData(this.tipo, this.idMesa, this.persona.idPersona).then(d => {
      this.router.navigate(['/mesas', this.tipoNum]);
    })
    
  }

  siguiente() {
    if (this.contador < this.candidatos.length) {
      this.contador++;
    } else {
      this.contador = 0;
    }
  }

  anterior() {
    if (this.contador >= 0 ) {
      this.contador--;
    } else {
      this.contador = this.candidatos.length - 1;
    }
  }

}
