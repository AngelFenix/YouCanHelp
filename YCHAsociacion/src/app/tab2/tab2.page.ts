import { Component } from '@angular/core';
import { NavController } from '@ionic/angular';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
  constructor(public navctrl:NavController)
  {

  }
  detalles()
  {
this.navctrl.navigateForward('details')
  }

  nuevoEvento()
  {
    this.navctrl.navigateForward('nuevo-evento')
  }
}
