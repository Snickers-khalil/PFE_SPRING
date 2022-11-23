import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { Annonce } from 'src/app/models/annonce.model';
import { AnnonceService } from 'src/app/service/annonce.service';
import { CartService } from 'src/app/service/cart.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { UserCRUDService } from 'src/app/service/user-crud.service';
import { DetailsAnnComponent } from '../details-ann/details-ann.component';
import { MatDialog, MatDialogConfig } from "@angular/material/dialog";
import Swal from 'sweetalert2';
import { Favoris } from 'src/app/models/favoris';

@Component({
  selector: 'app-shop',
  templateUrl: './shop.component.html',
  styleUrls: ['./shop.component.css']
})
export class ShopComponent implements OnInit {
  public favoris: any = [];
  //imagepath:any='http://127.0.0.1:3306/'
  images:any;
  ajouter = false;
  annonces!:Annonce[];
  annonce?: any;
  loading=false;
  public editAnnonce!: Annonce;
  public detailAnnonce!: Annonce;
  public deleteAnnonce!: Annonce;
  private roles : string[] = [];
  isLoggedIn = false;
  showAdminBoard = false;
  showRandonneurBoard = false;
   utilisateur?:any;
   utilisateur_id?:any;
  id: any;
  msg="allready in your favoris ...!";
  like=false;
  idann: any;
  test: any;
  constructor(private anse: AnnonceService,
               private UserCRUDService: UserCRUDService,
               private cartService: CartService, 
               public dialog: MatDialog ,
               private tokenStorageService: TokenStorageService , 
               private route:Router) 
              { 
            }

  ngOnInit(): void {
      this.getAnnonces();
     // this.getAllFavoris();
      // console.log(this.like)
      // console.log(this.test)
      this.isLoggedIn = !!this.tokenStorageService.getToken();
      const user = this.tokenStorageService.getUser();
      this.roles = user.roles;
      //
      this.showAdminBoard = this.roles.includes('ADMIN');
      this.showRandonneurBoard = this.roles.includes('RANDONNEUR');
     this.utilisateur=this.tokenStorageService.getUser();
      console.log(this.utilisateur)
      this.utilisateur_id = user.id;
       this.idann=this.annonce.id;
      console.log(this.utilisateur_id)
  }

//   addtofavorie(annonceId:any):void{
//  this.anse.favorie(this.utilisateur_id,annonceId).subscribe(
//     (data) => {
//       console.log(this.utilisateur_id,annonceId);
//       console.log("favorie avec succ");
//       console.log(data);
//       this.ajouter=true;
//       const my=this.anse.getFavoris(annonceId);
//       // if(this.anse.isinfavorie(this.utilisateur_id,annonceId)){
//       //    this.like=true;
//       //   }else{
//       //     this.like=false;
//       //   }
//     },
//     (error: HttpErrorResponse) => {
//       alert(error.message);
//     }
//   );
// }

// isfavorie(idann:any):any{
// this.anse.isinfavorie(idann,this.utilisateur_id).subscribe(
//   (data)=>{
//     if(data=true){
//      // this.like=data;
//       console.log("is true",data);
//     }else{
//       console.log("false",data)
//     }
//   }
// )
// }

  addtofavorie(annonceId: any): void{
  this.anse.favorie(this.utilisateur_id,annonceId).subscribe(
    (data) => {
      console.log(this.utilisateur_id,annonceId);
      console.log("favorie avec succ");
      console.log(data);
      this.ajouter=true;
      const my=this.anse.getFavoris(annonceId);
      if(data.message==this.msg){
         this.like=true;
         Swal.fire({
         // position: 'top-end',
          icon: 'error',
          title: (data.message),
          showConfirmButton: false,
          timer: 3500
        })
        }else{
          this.like=false;
          Swal.fire({
          //  position: 'top-end',
            icon: 'success',
            title: (data.message),
            showConfirmButton: false,
            timer: 3500
          })
        }
    },
    (error: HttpErrorResponse) => {
      Swal.fire({
        //position: 'top-end',
        icon: 'error',
        title: (error.message,"erreur"),
        showConfirmButton: false,
        timer: 4000
      })
     // alert(error.message);
    }
  );
  }
 
  // public getAllFavoris(): void {
  //   const user = this.tokenStorageService.getUser();
  //   const idu=user.id;
  //   this.anse.getFavoris(idu).subscribe(
  //     (response:Favoris[]) => {
  //       this.favoris = response;
  //       console.log(this.favoris);
  //       this.test=this.anse.isinfavorie(idu,this.favoris.id)
  //       console.log("ttt",this.anse.isinfavorie(idu,this.favoris.id))
  //       if(this.anse.isinfavorie(idu,this.favoris.id)){
  //         this.like=true;
  //     //    console.log(this.like)
  //       }else{
  //         this.like=false;
  //       }
  //      // console.log(this.like)
  //     },
  //     (error: HttpErrorResponse) => {
  //       alert(error.message);
  //     }
  //   );
  // }

  public getAnnonces(): void {
    this.anse.getAnnonces().subscribe(
      (response: Annonce[]) => {
        this.annonces = response;
        this.loading=true;
        console.log(this.annonces);
      },
      (error: HttpErrorResponse) => {
       //alert(error.message);
       this.loading=true;
        Swal.fire({
         // position: 'top-end',
          icon: 'error',
          title: (error.message,"erreur Fetching Data"),
          showConfirmButton: false,
          timer: 3500
        })
      }
    );
  }

  public onAddAnnonce(addForm:any): void { 
  console.log(addForm.value)
  let data=addForm.value
  console.log(data)
    const formData = new FormData();
    formData.append('titre',addForm.value.titre)
    formData.append('description',addForm.value.description)
    formData.append('date_ajout',"2022-04-05")
    formData.append('phone',addForm.value.phone)
    formData.append('Prix',addForm.value.prix)
    formData.append('imageUrl', this.images)
    formData.append('adresse',addForm.value.adresse)
    formData.append('categorie',addForm.value.categorie)
    console.log(formData)
    this.anse.addAnnonce(formData,this.utilisateur_id).subscribe(data=>{
        console.log('annonce ajouter')
        Swal.fire({
         // position: 'top-end',
          icon: 'success',
          title: ("Add successfuly"),
          showConfirmButton: false,
          timer: 3500
        })
        this.ngOnInit();
      },(err:HttpErrorResponse)=>{
        console.log(err.error)
        Swal.fire({
          //position: 'top-end',
          icon: 'error',
          title: ("erreur please try again"+ err.error),
          showConfirmButton: false,
          timer: 3500
        })
      }
      )
    }
  
  
  public onUpdateAnnonce(annonce: any): void {
    this.id=this.editAnnonce.id;
    this.anse.updateAnnonce(annonce,this.id).subscribe(
      (response: Annonce) => {
      console.log(response);
        this.ngOnInit();
        Swal.fire({
          //position: 'top-end',
          icon: 'success',
          title: ("Update succssfuly !!"),
          showConfirmButton: true,
          timer: 3500
        }) 
        this.ngOnInit();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        Swal.fire({
          //position: 'top-end',
          icon: 'error',
          title: (error.message),
          showConfirmButton: true,
          timer: 3500
        })
      }
    );
  }

  public onDeleteAnnonce(annonceId: any): void {
    this.anse.deleteAnnonce(annonceId).subscribe(
      (response: void) => {
        console.log(response);
        this.ngOnInit();
        Swal.fire({
          //position: 'top-end',
          icon: 'success',
          title: ("Removed succssfuly !!"),
          showConfirmButton: true,
          timer: 3500
        })
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        Swal.fire({
          //position: 'top-end',
          icon: 'error',
          title: (error.message),
          showConfirmButton: true,
          timer: 3500
        })
      }
    );
  }

  ongetAnnonce(id: any): void {
    this.id=this.editAnnonce.id;
    this.anse.get(id).subscribe(
        data => {
          this.annonce = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }
  
  public searchEmployees(key: string): void {
    console.log(key);
    const results: Annonce[] = [];
    for (const employee of this.annonces) {
      if (employee.titre?.toLowerCase().indexOf(key.toLowerCase()) !== -1
      || employee.description?.toLowerCase().indexOf(key.toLowerCase()) !== -1
      || employee.phone?.toLowerCase().indexOf(key.toLowerCase()) !== -1
      || employee.adresse?.toLowerCase().indexOf(key.toLowerCase()) !== -1) {
        results.push(employee);
      }
    }
    this.annonces = results;
    if (results.length === 0 || !key) {
      this.getAnnonces();
    }
  }
  public onOpenModal(annonce: Annonce, mode: string): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode === 'edit'&& this.isLoggedIn) {
      this.editAnnonce = annonce;
      button.setAttribute('data-target', '#updateEmployeeModal');
    }
    if (mode === 'delete' && this.isLoggedIn) {
      this.deleteAnnonce = annonce;
      button.setAttribute('data-target', '#deleteEmployeeModal');
    }
    if (mode === 'details' ) {
      this.detailAnnonce = annonce;
      button.setAttribute('data-target', '#detailsEmployeeModal');
    }
    if (mode === 'add'&& this.isLoggedIn) {
      button.setAttribute('data-target', '#addEmployeeModal');
    }
    else if(!this.isLoggedIn) {
      Swal.fire({
        position: 'top-end',
        icon: 'error',
        title: ("Please Login First"),
        showConfirmButton: false,
        timer: 4000
      })
     this.route.navigate(['/login']);
    }
    container!.appendChild(button);
    button.click();
  }

  selectImage(event:any) {
    if (event.target.files.length > 0) {
      const path = event.target.files[0];
      console.log(path)
      this.images = path;
      console.log(this.images)
    }
  }

  openDialog(){
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = true;
    dialogConfig.autoFocus = true;
    dialogConfig.data = {   
    };
    const dialogRef = this.dialog.open(DetailsAnnComponent);
    width:"30%"
  }
  
}

