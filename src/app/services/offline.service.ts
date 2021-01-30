import { Eleccion } from './../modelos/eleccion';
import { ImgGeneral } from './../modelos/img-general';
import { Lugar } from './../modelos/lugar';
import { Partido } from './../modelos/partido';
import { Persona } from './../modelos/persona';
import { Injectable, ɵConsole } from '@angular/core';
import { Platform } from '@ionic/angular';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { SQLitePorter } from '@ionic-native/sqlite-porter/ngx';
import { SQLite, SQLiteObject } from '@ionic-native/sqlite/ngx';
import { Mesa } from '../modelos/mesa';

@Injectable({
  providedIn: 'root'
})
export class OfflineService {

  private storage: SQLiteObject;
  personas = new BehaviorSubject([]);
  partidos = new BehaviorSubject([]);
  mesas = new BehaviorSubject([]);
  lugares = new BehaviorSubject([]);
  imagenes = new BehaviorSubject([]);
  eleccion = new BehaviorSubject([]);
  joinMesas = new BehaviorSubject([]);
  candidatos = new BehaviorSubject([]);
  
  private isDbReady: BehaviorSubject<boolean> = new BehaviorSubject(false);

  constructor(
    private platform: Platform, 
    private sqlite: SQLite, 
    private http: HttpClient,
    private sqlPorter: SQLitePorter
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
    return this.personas.asObservable();
  }

  fetchMesas(): Observable<Mesa[]> {
    return this.mesas.asObservable();
  }

  fetchLugares(): Observable<Lugar[]> {
    return this.lugares.asObservable();
  }
  
  fetchImagenes(): Observable<ImgGeneral[]> {
    return this.imagenes.asObservable();
  }

  fetchEleccion(): Observable<Eleccion[]> {
    return this.eleccion.asObservable();
  }
  
  fetchJoinMesas(): Observable<Array<any>> {
    return this.joinMesas.asObservable();
  }

  fetchCandidatos(): Observable<Array<any>> {
    return this.candidatos.asObservable();
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
            idPersona: res.rows.item(i).idPersona,
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
      this.personas.next(items);
    });
  }

  guardarPersona(data) {
    return this.storage.executeSql(`INSERT INTO personas 
    (idPersona, cedula, apellidoPaterno, apellidoMaterno, primerNombre, 
    segundoNombre, idLugar, seguro) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`, data)
    .then(res => {
      this.getPersona();
    }).catch(err => {
      alert(err)
    })
  }

  guardarMesas(data) {
    return this.storage.executeSql(`INSERT INTO mesas 
    (idMesa, idLugar, sexo, numero, idPersona, electores, ctrl) VALUES 
      (?, ?, ?, ?, ?, ?, ?)`, data)
    .then(res => {
      console.log('ok')
    })
  }

  getMesas() {
    return this.storage.executeSql('SELECT * FROM mesas', [])
    .then(res => {
      let items: Mesa[] = [];
      if (res.rows.length > 0) {
        for (let i = 0; i < res.rows.length; i++) {
          items.push({
            id: res.rows.item(i).id,
            idMesa: res.rows.item(i).idMesa,
            idLugar: res.rows.item(i).idLugar,
            sexo: res.rows.item(i).sexo,
            numero: res.rows.item(i).numero,
            idPersona: res.rows.item(i).idPersona,
            electores: res.rows.item(i).electores,
            ctrl: JSON.parse(res.rows.item(i).ctrl)
          });
        }
      }
      this.mesas.next(items);
    });
  }

  getPartidos() {
    return this.storage.executeSql('SELECT * FROM partidos', [])
    .then(res => {
      let items: Partido[] = [];
      if (res.rows.length > 0) {
        for (let i = 0; i < res.row.length; i++) {
          items.push({
            id: res.rows.item(i).id,
            detalle: res.rows.item(i).detalle,
            lista: res.rows.item(i).lista,
            urlLogo: res.rows.item(i).urlLogo,
          });
        }
      }
      this.partidos.next(items);
    });
  }

  ubicacion(lugar) {
    return this.storage.executeSql('SELECT * FROM lugares WHERE id = ?', [lugar])
    .then(res => {
      let l: Lugar[] = [];
      l.push(
        {
          id: res.rows.item(0).id,
          codigo: res.rows.item(0).codigo,
          detalle: res.rows.item(0).detalle,
          idLugar: res.rows.item(0).idLugar
        }
      )
      this.lugares.next(l);
    })
  }

  getImagenes(tipoEleccion, idMesa) {
    console.log(tipoEleccion);
    console.log(idMesa);
    return this.storage.executeSql(`SELECT * FROM ${tipoEleccion} WHERE idMesa = ?`, [idMesa])
    .then(res => {
      let items: ImgGeneral[] = [];
      if (res.rows.length > 0) {
        items.push({
          id: res.rows.item(0).id,
          idMesa: res.rows.item(0).idMesa,
          urlImg1: res.rows.item(0).urlImg1,
          urlImg2: res.rows.item(0).urlImg2,
          urlImg3: res.rows.item(0).urlImg3,
        });
      }
      console.log(items);
      this.imagenes.next(items);
    });
  }

  reiniciarImagenes() {
    this.imagenes.next([]);
  }

  guardarImagenes(tipoEleccion, data) {
    return this.storage.executeSql(`INSERT INTO ${tipoEleccion} 
    (idMesa, urlImg1, urlImg2, urlImg3) VALUES (?, ?, ?, ?)`, data)
    .then(res => {
      this.getImagenes(tipoEleccion, data[0]);
    })
  }

  actualizarImagenes(tipoEleccion, data) {
    return this.storage.executeSql(`UPDATE ${tipoEleccion} SET urlImg1 = ?, 
    urlImg2 = ?, urlImg3 = ? WHERE idMesa = ?`, data)
    .then(res => {
      this.getImagenes(tipoEleccion, data[3]);
    })
  }

  guardarEleccion(data) {
    console.log(JSON.stringify(data));
    return this.storage.executeSql(`INSERT INTO eleccion(tipoEleccion, idMesa, idPersona, takeImg, sendData, sendImg) VALUES (?, ?, ?, ?, ?, ?)`, data)
    .then(res => {

    })
    
  }

  getEleccion(data) {
    return this.storage.executeSql(`SELECT * FROM eleccion WHERE tipoEleccion = ? AND idMesa = ?`, data)
    .then(res => {
      let items: Eleccion[] = [];
      if (res.rows.length > 0) {
        items.push({
          id: res.rows.item(0).id,
          tipoEleccion: res.rows.item(0).tipoEleccion,
          idMesa: res.rows.item(0).idMesa,
          idPersona: res.rows.item(0).idPersona,
          takeImg: res.rows.item(0).takeImg,
          sendData: res.rows.item(0).sendData,
          sendImg: res.rows.item(0).sendImg
        });
      }
      this.eleccion.next(items);
    });
    
  }

  mesasEleccion(data) {
    console.log(`JOIN: ${JSON.stringify(data)}`);
    return this.storage.executeSql(`SELECT eleccion.id AS id, mesas.idMesa AS idMesa, mesas.sexo AS sexo, mesas.numero AS numero,
    mesas.electores AS electores, mesas.ctrl AS ctrl, eleccion.idPersona AS idPersona, eleccion.takeImg AS takeImg,
    eleccion.sendData AS sendData, eleccion.sendImg 
    FROM eleccion LEFT JOIN mesas ON eleccion.idMesa = mesas.idMesa
    WHERE eleccion.tipoEleccion = ? AND eleccion.idPersona = ?`, data).then(res => {
      let items = [];
      if (res.rows.length > 0) {
        
        for (let i = 0; i < res.rows.length; i++) {
          items.push({
            id: parseInt(res.rows.item(i).id),
            idMesa: parseInt(res.rows.item(i).idMesa),
            sexo: res.rows.item(i).sexo,
            numero: parseInt(res.rows.item(i).numero),
            electores: parseInt(res.rows.item(i).electores),
            ctrl: JSON.parse(res.rows.item(i).ctrl),
            idPersona: res.rows.item(i).idPersona,
            takeImg: JSON.parse(res.rows.item(i).takeImg),
            sendData: JSON.parse(res.rows.item(i).sendData),
            sendImg: JSON.parse(res.rows.item(i).sendImg)
          })
        }
      }
      this.joinMesas.next(items);
    })
  }

  updateTakeImg(id, data) {
    return this.storage.executeSql(`UPDATE eleccion SET takeImg = true WHERE id = ?`, [id])
    .then(res => {
      this.mesasEleccion(data);
    })
  }

  updateSendData(tipoEleccion, idMesa) {
    return this.storage.executeSql(`UPDATE eleccion SET sendData = true WHERE tipoEleccion = ? AND idMesa = ?`, [tipoEleccion, idMesa])
    .then(res => {

    })
  }

  updateSendImg(tipoEleccion, idMesa, idPersona) {
    return this.storage.executeSql(`UPDATE eleccion SET sendImg = true WHERE tipoEleccion = ? AND idMesa = ?`, [tipoEleccion, idMesa])
    .then(res => {
      this.mesasEleccion([tipoEleccion, idPersona]);
    })
  }

  getCandidatos(idLugar) { 
    console.log(`get candidatos ${idLugar}`);
    return this.storage.executeSql(`SELECT partidos.detalle AS detalle, partidos.lista AS lista,
    partidos.urlLogo AS urlLogo FROM partidos LEFT JOIN candidatos 
    ON partidos.id = candidatos.idPartido WHERE candidatos.idLugar = ?`, [idLugar])
    .then(res => {
      console.log(`res ${res}`);
      let items = [];
      if (res.rows.length > 0) {
        for (let i = 0; i < res.rows.length; i++) {
          items.push({
            detalle: res.rows.item(i).detalle,
            lista: res.rows.item(i).lista,
            urlLogo: res.rows.item(i).urlLogo
          })
        }
      }
      console.log(items);
      this.candidatos.next(items);
    }).catch(err => {
      console.log(err);
    })
  }

}
