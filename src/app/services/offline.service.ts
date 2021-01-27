import { Partido } from './../modelos/partido';
import { Persona } from './../modelos/persona';
import { Injectable } from '@angular/core';
import { Platform } from '@ionic/angular';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { SQLitePorter } from '@ionic-native/sqlite-porter/ngx';
import { SQLite, SQLiteObject } from '@ionic-native/sqlite/ngx';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class OfflineService {

  private storage: SQLiteObject;
  persona = new BehaviorSubject([]);
  partido = new BehaviorSubject([]);
  
  private isDbReady: BehaviorSubject<boolean> = new BehaviorSubject(false);

  constructor(
    private platform: Platform, 
    private sqlite: SQLite, 
    private http: HttpClient,
    private sqlPorter: SQLitePorter,
    private router: Router
  ) { 
    this.platform.ready().then(() => {
      this.sqlite.create({
        name: 'control_up.db',
        location: 'default'
      }).then((db: SQLiteObject) => {
        this.storage = db;
        this.getFakeData();
      });
    });
  }

  dbState() {
    return this.isDbReady.asObservable();
  }

  fetchPersona(): Observable<Persona[]> {
    return this.persona.asObservable();
  }

  async getFakeData() {
    this.http.get('assets/dump.sql', {responseType: 'text'})
    .subscribe(async data => {
      await this.sqlPorter.importSqlToDb(this.storage, data)
      .then(async d => {
        this.storage.executeSql('SELECT * FROM partidos', [])
        .then(count => {
          if (count.rows.length === 0) {
            this.http.get('assets/dumpLugares.sql', {responseType: 'text'})
            .subscribe(data1 => {
              this.sqlPorter.importSqlToDb(this.storage, data1)
              .then(d1 => {
                this.http.get('assets/dumpPartidos.sql', {responseType: 'text'})
                .subscribe(data2 => {
                  this.sqlPorter.importSqlToDb(this.storage, data2)
                  .then(d2 => {
                    this.http.get('assets/dumpCandidatos.sql', {responseType: 'text'})
                    .subscribe(data3 => {
                      this.sqlPorter.importSqlToDb(this.storage, data3)
                      .then(d3 => {
                        this.isDbReady.next(true);
                      })
                    });
                  })
                });
              })
            });
          } else {
            this.getPersona();
            this.isDbReady.next(true);
          }
        }) 
      })
    })
  }

  getPersona() {
    return this.storage.executeSql('SELECT * FROM personas', [])
    .then(res => {
      let items: Persona[] = [];
      if (res.rows.length > 0) {
        for (let i = 0; i < res.rows.length; i++) {
          items.push({
            id: res.rows.item(i).id,
            cedula: res.rows.item(i).cedula,
            apellidoPaterno: res.rows.item(i).apellidoPaterno,
            apellidoMaterno: res.rows.item(i).apellidoMaterno,
            primerNombre: res.rows.item(i).primerNombre,
            segundoNombre: res.rows.item(i).segundoNombre,
            idLugar: res.rows.item(i).idLugar,
            seguro: res.rows.item(i).seguro
          });
        }
      }
      this.persona.next(items);
    });
  }

  getPartidos() {
    return this.storage.executeSql('SELECT * FROM partidos', [])
    .then(res => {
      let items: Partido[] = [];
      if (res.row.length > 0) {
        for (let i = 0; i < res.row.length; i++) {
          items.push({
            id: res.row.item(i).id,
            detalle: res.row.item(i).detalle,
            lista: res.row.item(i).lista,
            urlLogo: res.row.item(i).urlLogo,
          });
        }
      }
      this.partido.next(items);
    });
  }
}
