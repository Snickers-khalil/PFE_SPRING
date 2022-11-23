import { RandCrudService } from './../../../../service/rand-crud.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogContentComponent } from '../../events/dialog-content/dialog-content.component';
import { randonner } from 'src/app/service/randonner';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { HttpErrorResponse } from '@angular/common/http';
import { NgForm } from '@angular/forms';
import { ParticipeComponent } from '../participe/participe.component';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-randonner',
  templateUrl: './randonner.component.html',
  styleUrls: ['./randonner.component.css']
})
export class RandonnerComponent implements OnInit {

  public participeRandonner!: randonner;
images:any;
 randonners!:randonner[];
 public editRandonner!: randonner;
 public detailRandonner!: any;
 
 public deleteRandonner!: randonner;
 private roles : string[] = [];
 isLoggedIn = true;
 showAdminBoard = false;
 showRandonneurBoard = false;
 utilisateur?:any;
 utilisateur_id?:any;
  id: Uint8Array | undefined;
  randonner: any;
  like=false;
  loading=false;
  msg= "allready Participe ...!";
 constructor(public dialog: MatDialog,private route:Router,private anse:RandCrudService,private tokenStorageService: TokenStorageService ) { }

 ngOnInit(): void {
  this.getRandonners();
  this.isLoggedIn = !!this.tokenStorageService.getToken();
  const user = this.tokenStorageService.getUser();
  this.roles = user.roles;
  this.showRandonneurBoard = this.roles.includes('RANDONNEUR');
  this.utilisateur=this.tokenStorageService.getUser();
    console.log(this.utilisateur)
    this.utilisateur_id = user.id;
    console.log(this.utilisateur_id)
}


public getRandonners(): void {
  this.anse.getRandonners().subscribe(
    (response: randonner[]) => {
      this.randonners = response;
      this.loading=true;
      console.log(this.randonners);
    },
    (error: HttpErrorResponse) => {
      //alert(error.message);
      this.loading=true;
      Swal.fire({
        // position: 'top-end',
        icon: 'error',
        title: (error.message,"erreur Fetching Data"),
        showConfirmButton: false,
        timer: 5000
      })
      
    }
  );
}

selectImage(event:any) {
  if (event.target.files.length > 0) {
    const path = event.target.files[0];
    console.log(path)
    this.images = path;
    console.log(this.images)
  }
}
public onAddRandonner(addForm: NgForm): void {
console.log(addForm.value)
let data=addForm.value
console.log(data)
console.log(this.images)
const formData = new FormData();
    
    formData.append('adress',addForm.value.adress)
    formData.append('programme',addForm.value.programme)
    formData.append('date',addForm.value.date)
    formData.append('cercuit',addForm.value.cercuit)
    formData.append('difficult',addForm.value.difficult)
    formData.append('imageUrl', this.images)
   
      this.anse.addRandonner(formData,this.utilisateur_id).subscribe(data=>{
        console.log('annonce ajouter')
        this.getRandonners();
        Swal.fire({
          icon: 'success',
          title: 'Ajout avec success',
          showConfirmButton: false,
          timer: 1500
        })
        window.setTimeout(function(){location.reload()},3000)

      },(err:HttpErrorResponse)=>{
        console.log(err.error)
        Swal.fire({
          icon: 'error',
          title: ('Something went wrong!'),
          text: (err.error),
         // footer: '<a href="">Why do I have this issue?</a>'
        })
      })
    }


public onUpdateRandonner(randonner: randonner): void {
  this.id=this.editRandonner.id;
  this.anse.updateRandonner(randonner,this.id).subscribe(
    (response: randonner) => {
      console.log(response);
      this.getRandonners();
      Swal.fire({
        // position: 'top-end',
        icon: 'success',
        title: 'Modifier avec success',
        showConfirmButton: false,
        timer: 1500
      })
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
}

public onparticipeRandonner(randonnerId: any): void  {
  //this.idE=this.evenments.evenmentId;
  this.anse.participeRandonner(this.utilisateur_id,randonnerId).subscribe(
    (data) => {
      console.log(this.utilisateur_id,randonnerId);
      console.log("ajouter");
      //const my=this.anse.getFavoris(annonceId);
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
            // position: 'top-end',
            icon: 'success',
            title: (data.message),
            showConfirmButton: false,
            timer: 3500
          })
        }
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
}
// const my=this.anse.getFavoris(annonceId);
//       if(data.message==this.msg){
//          this.like=true;
//          Swal.fire({
//           position: 'top-end',
//           icon: 'error',
//           title: (data.message),
//           showConfirmButton: false,
//           timer: 3500
//         })
//         }else{
//           this.like=false;
//           Swal.fire({
//             position: 'top-end',
//             icon: 'success',
//             title: (data.message),
//             showConfirmButton: false,
//             timer: 3500
//           })
//         }
public onDeleteRandonner(annonceId: any): void {
  this.anse.deleteRandonner(annonceId).subscribe(
    (response: void) => {
      console.log(response);
      this.getRandonners();
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'supprisson avec success',
        showConfirmButton: false,
        timer: 1500
      })
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
}
ongetRandonner(id: any): void {
  this.id=this.editRandonner.id;
  this.anse.getRandonner(id).subscribe(
      data => {
        this.randonner = data;
        console.log(data);
      },
      error => {
        console.log(error);
      });
}
public searchEmployees(key: string): void {
  console.log(key);
  const results: randonner[] = [];
  for (const employee of this.randonners) {
    if (employee.adress?.toLowerCase().indexOf(key.toLowerCase()) !== -1
    || employee.programme?.toLowerCase().indexOf(key.toLowerCase()) !== -1
    || employee.difficult?.toLowerCase().indexOf(key.toLowerCase()) !== -1
    || employee.cercuit?.toLowerCase().indexOf(key.toLowerCase()) !== -1) {
      results.push(employee);
    }
  }
  this.randonners = results;
  if (results.length === 0 || !key) {
    this.getRandonners();
  }
}


public onOpenModal(randonner: randonner, mode: string): void {
  const container = document.getElementById('main-container');
  const button = document.createElement('button');
  button.type = 'button';
  button.style.display = 'none';
  button.setAttribute('data-toggle', 'modal');
  if (mode === 'add') {
    button.setAttribute('data-target', '#addEmployeeModal');
  }
  if (mode === 'edit') {
    this.editRandonner = randonner;
    button.setAttribute('data-target', '#updateEmployeeModal');
  }
  if (mode === 'delete') {
    this.deleteRandonner = randonner;
    button.setAttribute('data-target', '#deleteEmployeeModal');
  }
  if (mode === 'details' ) {
    this.detailRandonner = randonner;
    button.setAttribute('data-target', '#detailsEmployeeModal');
  }
  if (mode === 'participe') {
    this.participeRandonner= randonner;
    button.setAttribute('data-target', '#participeEmployeeModal');
  }
  container!.appendChild(button);
  button.click();
}


openDiagg(){
  if (this.isLoggedIn){
    const dialogRef = this.dialog.open(ParticipeComponent);
  }else{
      this.route.navigate(['/login']);
  }
  width:"30%"
}
}