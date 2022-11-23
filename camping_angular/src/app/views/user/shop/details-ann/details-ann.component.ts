import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Annonce } from 'src/app/models/annonce.model';
import { AnnonceService } from 'src/app/service/annonce.service';
import { ShopComponent } from '../shop/shop.component';

@Component({
  selector: 'app-details-ann',
  templateUrl: './details-ann.component.html',
  styleUrls: ['./details-ann.component.css']
})
export class DetailsAnnComponent implements OnInit {

  //annonce?:Annonce;

  annonce?: Annonce;
  
  constructor(private anse: AnnonceService,private route: ActivatedRoute) { }

  ngOnInit(): void {
    //const routeParams=this.route.snapshot.paramMap;
    //const annonceidFromRoute=String (routeParams.get('annonceid'));
   //this.id=ShopComponent.find(annonce=>annonce.id===annonceidFromRoute)snapshot.params.id
    //this.getTutorial();
  }

  getTutorial(id: string): void {
    this.anse.get(id)
      .subscribe(
        data => {
          this.annonce = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }
  }
