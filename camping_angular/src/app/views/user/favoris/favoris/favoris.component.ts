import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { evenment } from 'src/app/models/evenment';
import { Favoris } from 'src/app/models/favoris';
import { AnnonceService } from 'src/app/service/annonce.service';
import { CartService } from 'src/app/service/cart.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-favoris',
  templateUrl: './favoris.component.html',
  styleUrls: ['./favoris.component.css']
})
export class FavorisComponent implements OnInit {
  public annonces : any = [];
  public favoris: any = [];
  evenments!:evenment[];
  idU!:any;
  roles : string[] = [];
  public grandTotal !: number;
  constructor(private token: TokenStorageService,private anse : AnnonceService) { }
  ngOnInit(): void {
    this.getAllFavoris();
    const user = this.token.getUser();
      this.roles = user.roles;
      this.idU=user.id;
  }
  
  public getAllFavoris(): void {
    const user = this.token.getUser();
      this.roles = user.roles;
      this.idU=user.id;
      console.log('my2',this.idU)
    this.anse.getFavoris(this.idU).subscribe(
      (response:Favoris[]) => {
        this.favoris = response;
        console.log(this.favoris);
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }
  //ngOnInit(): void {
   // this.getAllFavoris();
   // console.log("donn")

    // .subscribe(res=>{
    //   this.annonces = res;
    //   this.grandTotal = this.cartService.getTotalPrice();
    // })
 // }
  //public getAllFavoris(): void {
   // this.anse.getFavoris().subscribe(
     // (response: Favoris[]) => {
      //  this.favoris = response;
       // console.log(this.favoris);
     // },
     // (error: HttpErrorResponse) => {
     //   alert(error.message);
    //  }
    //);
 // }

  public removeFav(id: any):void{
    // this.anse.deleteFavoris(item);
    console.log(id)
    this.anse.deleteFavoris(id).subscribe(
      (response: void) => {
        console.log(response);
        this.ngOnInit();
        //this.getAllFavoris();
        Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: ("remove successfuly"),
          showConfirmButton: false,
          timer: 3500
        })
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }
  

}
