import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { Annonce } from 'src/app/models/annonce.model';
import { utilisateur } from 'src/app/models/utilisateur.model';
import { AnnonceService } from 'src/app/service/annonce.service';
import { CartService } from 'src/app/service/cart.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { UserCRUDService } from 'src/app/service/user-crud.service';
import { DetailsAnnComponent } from 'src/app/views/user/shop/details-ann/details-ann.component';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-all-annonce',
  templateUrl: './all-annonce.component.html',
  styleUrls: ['./all-annonce.component.css']
})
export class AllAnnonceComponent implements OnInit {

  // //public annonces?: Annonce[];
  // annonces!:Annonce[];
  // public editannonce?: Annonce;
  // public deleteannonce?: Annonce;
  // form: any = {};
  // isSuccessful = false;
  // isSignUpFailed = false;
  // errorMessage = '';
  // utilisateur?:any;
  // id:any;
  
  images:any;
  annonces!:Annonce[];
  public editAnnonce!: Annonce;
  public detailAnnonce!: Annonce;
  public deleteAnnonce!: Annonce;
  private roles : string[] = [];
  isLoggedIn = false;
  showAdminBoard = false;
  showRandonneurBoard = false;
  annonce?: any;
   utilisateur?:any;
   utilisateur_id?:any;
  id: any;
  
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
this.isLoggedIn = !!this.tokenStorageService.getToken();
const user = this.tokenStorageService.getUser();
this.roles = user.roles;
this.showRandonneurBoard = this.roles.includes('RANDONNEUR');

this.utilisateur=this.tokenStorageService.getUser();
console.log(this.utilisateur)
this.utilisateur_id = user.id;
console.log(this.utilisateur_id)
}

public getAnnonces(): void {
this.anse.getAnnonces().subscribe(
(response: Annonce[]) => {
this.annonces = response;
console.log(this.annonces);
},
(error: HttpErrorResponse) => {
alert(error.message);
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
this.anse.addAnnonce(formData,this.utilisateur_id).subscribe(data=>{
console.log('annonce ajouter')
this.ngOnInit();
//addForm.reset();
},(err:HttpErrorResponse)=>{
console.log(err.error)
})
}

onUpload(id:any) {
  console.log(this.images);
  const formData = new FormData();
  formData.append('file', this.images);
  console.log(formData);
  this.anse.updatephoto(id, formData).subscribe(
    (response: utilisateur) => {
      console.log(response);
      Swal.fire({
        //position: 'top-end',
        icon: 'success',
        title: ("uploaded succssfuly !!"),
        showConfirmButton: true,
        timer: 3500
      })
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
}

public onUpdateAnnonce(annonce: any): void {
this.id=this.editAnnonce.id;
this.anse.updateAnnonce(annonce,this.id).subscribe(
(response: Annonce) => {
console.log(response);
this.getAnnonces();
Swal.fire({
  //position: 'top-end',
  icon: 'success',
  title: ("Update Successfully"),
  showConfirmButton: false,
  timer: 3500
})
},
(error: HttpErrorResponse) => {
alert(error.message);
}
);
}

public onDeleteAnnonce(annonceId: any): void {
this.anse.deleteAnnonce(annonceId).subscribe(
(response: void) => {
console.log(response);
this.getAnnonces();
Swal.fire({
  //position: 'top-end',
  icon: 'success',
  title: ("Deleted Successfully"),
  showConfirmButton: false,
  timer: 3500
})
},
(error: HttpErrorResponse) => {
alert(error.message);
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

}

