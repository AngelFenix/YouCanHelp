import { Component, ElementRef, ViewChild } from '@angular/core';
ViewChild
@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss']
})
export class Tab1Page {
  @ViewChild('slider', { read: ElementRef })slider: ElementRef;

  img: any;

  sliderOpts = {
    autoplay: true,
    zoom: {
      maxRatio: 5
    }
  };

  
}
