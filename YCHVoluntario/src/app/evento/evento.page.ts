import { Component, OnInit } from '@angular/core';
import { ModalController, NavController } from '@ionic/angular';
import { MapaPage } from '../mapa/mapa.page';
import { AlertController } from '@ionic/angular';
@Component({
  selector: 'app-evento',
  templateUrl: './evento.page.html',
  styleUrls: ['./evento.page.scss'],
})
export class EventoPage  {

  
c:number=2302 
status = false
constructor(public modalController: ModalController, public alertController:AlertController, public navctrl:NavController) {

}
async presentAlert() {
  const alert = await this.alertController.create({
    header: 'Felicidades',
    subHeader: 'Hemos agregado el evento a tu lista',
    message: 'Recuerda el dia, fecha y lugar, lleva toda tu actitud para cambiar el mundo ;)',
    buttons: [ {
      text: 'Okay',
      handler: (blah) => {
        this.navctrl.navigateRoot('')
        console.log('Confirm Cancel: blah');
      }
    },]
  });

  await alert.present();
}
segmentChanged(ev: any) {
  console.log('Segment changed', ev);
}
liked() {
  console.log("changd")
  if (status) {

    this.status = false
  } else {
    this.c +=1
    this.status = true
  }
}
async presentModal() {
  const modal = await this.modalController.create({
    component: MapaPage
  });
  return await modal.present();
}

}
