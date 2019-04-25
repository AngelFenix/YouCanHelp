import { Component } from '@angular/core';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss']
})
export class Tab2Page {
	constructor(public alertController:AlertController)
	{

	}
  async presentAlert() {
		const alert = await this.alertController.create({
			header: 'Exito',

			message: 'Preferencias heroicamente guardadas',
			buttons: ['OK']
		});
	
		await alert.present();
	}
    //cambioDeImagen:boolean=true;
    //cambiar() {
    //this.cambioDeImagen=false;
    public proteccion = '../../assets/img/PROTECCION ANIMAL.png';
    cambiarProteccion(){
  	if(this.proteccion=='../../assets/img/PROTECCION ANIMAL.png')
  	{
  		this.proteccion='../../assets/img/checked.png';
  	}else{
		this.proteccion = '../../assets/img/PROTECCION ANIMAL.png';
  	}
    }

    public ambiente = '../../assets/img/AMBIENTE.png';
    cambiarAmbiente(){
  	if(this.ambiente=='../../assets/img/AMBIENTE.png')
  	{
  		this.ambiente='../../assets/img/checked.png';
  	}else{
		this.ambiente = '../../assets/img/AMBIENTE.png';
  	}
    }
    
    public equidad = '../../assets/img/EQUIDAD.png';
    cambiarEquidad(){
  	if(this.equidad=='../../assets/img/EQUIDAD.png')
  	{
  		this.equidad='../../assets/img/checked.png';
  	}else{
		this.equidad = '../../assets/img/EQUIDAD.png';
  	}
    }
    
    public tolerancia = '../../assets/img/TOLERANCIA.png';
    cambiarTolerancia(){
  	if(this.tolerancia=='../../assets/img/TOLERANCIA.png')
  	{
  		this.tolerancia='../../assets/img/checked.png';
  	}else{
		this.tolerancia = '../../assets/img/TOLERANCIA.png';
  	}
    }
    
    public bienestar = '../../assets/img/BIENESTAR SOCIAL.png';
    cambiarBienestar(){
  	if(this.bienestar=='../../assets/img/BIENESTAR SOCIAL.png')
  	{
  		this.bienestar='../../assets/img/checked.png';
  	}else{
		this.bienestar= '../../assets/img/BIENESTAR SOCIAL.png';
  	}
    }

    public salud = '../../assets/img/SALUD.png';
    cambiarSalud(){
  	if(this.salud=='../../assets/img/SALUD.png')
  	{
  		this.salud='../../assets/img/checked.png';
  	}else{
		this.salud= '../../assets/img/SALUD.png';
  	}
  	}
}
