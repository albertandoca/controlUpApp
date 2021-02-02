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
    destinationType: this.camera.DestinationType.DATA_URL,
    encodingType: this.camera.EncodingType.JPEG,
    mediaType: this.camera.MediaType.PICTURE,
    sourceType: this.camera.PictureSourceType.CAMERA,
    correctOrientation: true
  };

  constructor(private camera: Camera,
    private webview: WebView,
    private db1: OfflineService) { }

  takePicture() {
    this.camera.getPicture(this.options).then((imageData) => {
      let base64Imagen = 'data:image/jpeg;base64,' + imageData;
        this.fotos.unshift({
          data: base64Imagen
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
  
  resizeImg(img, MAX_WIDTH: number = 720,MAX_HEIGHT: number = 1280, quality: number = 0.4, callback) {
    let canvas: any = document.createElement('canvas');
    let image = new Image(); 
    image.onload = () => {
      let width = image.width;
      let height = image.height;

      if (width > height) {
        if (width > MAX_WIDTH) {
          height *= MAX_WIDTH / width;
          width = MAX_WIDTH
        }
      } else {
        if (height > MAX_HEIGHT) {
          width *= MAX_HEIGHT / height;
          height = MAX_HEIGHT;
        }
      }
      canvas.width = width;
      canvas.height = height;
      let ctx = canvas.getContext('2d');
      ctx.drawImage(image, 0, 0, width, height);

      let dataUrl = canvas.toDataURL('image/jpeg', quality);
      callback(dataUrl);
    };
    image.src = img;
  }
}
