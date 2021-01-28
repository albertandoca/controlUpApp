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

  constructor(private camera: Camera, private webview: WebView) { }

  takePicture() {
    const options: CameraOptions = {
      quality: 20,
      destinationType: this.camera.DestinationType.FILE_URI,
      encodingType: this.camera.EncodingType.PNG,
      mediaType: this.camera.MediaType.PICTURE,
      sourceType: this.camera.PictureSourceType.CAMERA,
      saveToPhotoAlbum: true
    };

    this.camera.getPicture(options).then((imageData) => {
      alert(imageData);
      this.fotos.push({
        data: this.webview.convertFileSrc(imageData)
      })
    }, (err) => {
      // Handle error
      console.log("Camera issue:" + err);
    });
  }
}
