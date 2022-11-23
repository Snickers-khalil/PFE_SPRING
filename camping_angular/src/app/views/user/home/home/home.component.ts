import { AfterViewInit, Component, OnInit } from '@angular/core';
import { AnnonceService } from 'src/app/service/annonce.service';

import { OwlOptions } from 'ngx-owl-carousel-o';
declare var anime: any; 
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements AfterViewInit {
  constructor(private anse:AnnonceService) { }
  ngAfterViewInit(): void {
// Wrap every letter in a span
var textWrapper = document.querySelector('.an-2');
textWrapper!.innerHTML = textWrapper!.textContent!.replace(/\S/g, "<span class='letter'>$&</span>");
anime.timeline({loop: true})
  .add({
    targets: '.an-2 .letter',
    opacity: [0,1],
    easing: "easeInOutQuad",
    duration: 150,
    delay: (el: any, i: number) => 150 * (i+1)
  }).add({
    targets: '.an-2',
    opacity: 0,
    duration: 100,
    easing: "easeOutExpo",
    delay: 100
  });
  anime.timeline({loop: true})
  .add({
    targets: '.c2 .word',
    scale: [14,1],
    opacity: [0,1],
    easing: "easeOutCirc",
    duration: 800,
    delay: (el: any, i: number) => 800 * i
  }).add({
    targets: '.c2',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1000
  });
  }

  ngOnInit(): void {
  }
  customOptions: OwlOptions = {
    loop: true,
    mouseDrag: true,
    touchDrag: true,
    pullDrag: true,
    dots: true,
    navSpeed: 700,
    navText: ['', ''],
    responsive: {
      0: {
        items: 1
      },
      400: {
        items: 2
      },
      740: {
        items: 3
      },
      940: {
        items: 1
      }
    },
    nav: true

  }

}
