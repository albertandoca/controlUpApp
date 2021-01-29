import { OfflineService } from './offline.service';
import { Injectable } from '@angular/core';
import { WebView } from '@ionic-native/ionic-webview/ngx';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';

class Foto {
  data: any;
}

@Injectable({
  providedIn: 'root'
})
export class FotoService {

  public fotos: Foto[] = [];
  public contador: number = 0;
  options: CameraOptions = {
    quality: 100,
    destinationType: this.camera.DestinationType.FILE_URI,
    encodingType: this.camera.EncodingType.JPEG,
    mediaType: this.camera.MediaType.PICTURE,
    sourceType: this.camera.PictureSourceType.CAMERA
  };

  constructor(private camera: Camera,
    private webview: WebView,
    private db1: OfflineService) { }

  takePicture() {
    this.camera.getPicture(this.options).then((imageData) => {
      this.fotos.unshift({
        data: this.webview.convertFileSrc(imageData)
      });

      this.contador++;

    }, (err) => {
      console.log("Camera issue:" + err);
    });
  }

  readPicture(foto1, foto2, foto3) {
    this.fotos = [];
    this.fotos.push({data: foto3});
    this.fotos.push({data: foto2});
    this.fotos.push({data: foto1});
    this.contador = 3;
  }


  savePicture(sendTipo, idMesa) {
    let data = [idMesa, this.fotos[2].data, this.fotos[1].data, this.fotos[0].data];
    return this.db1.guardarImagenes(sendTipo, data).then(d => {
      this.contador = 0;
      this.fotos = [];
    })
  }

  reiniciarContador() {
    this.contador = 0;
    this.fotos = [];
    return 'ok';
  }

  deletePicture(index) {
    return this.camera.getPicture(this.options).then((imageData) => {
      this.fotos[index] = {data: this.webview.convertFileSrc(imageData)};
    }, (err) => {
      console.log("Camera issue:" + err);
    });
  }

  updatePicture(tipoEleccion, idMesa) {
    let data = [this.fotos[2].data, this.fotos[1].data, this.fotos[0].data, idMesa,];
    return this.db1.actualizarImagenes(tipoEleccion, data).then(d => {

    })
  }
  
}
