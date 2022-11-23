import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { RandCrudService } from 'src/app/service/rand-crud.service';
import { randonner } from 'src/app/service/randonner';
import { TokenStorageService } from 'src/app/service/token-storage.service';

@Component({
  selector: 'app-all-rond',
  templateUrl: './all-rond.component.html',
  styleUrls: ['./all-rond.component.css']
})
export class AllRondComponent implements OnInit {

  randonners!:randonner[];
 public editRandonner!: randonner;
 public deleteRandonner!: randonner;
 isLoggedIn = true;
 images:any;
 utilisateur?:any;
 utilisateur_id?:any;
  id: Uint8Array | undefined;

 constructor(private anse:RandCrudService,private tokenStorageService: TokenStorageService , private route:Router ) { }
 
 
 ngOnInit(): void {
  this.getRandonners();
  this.isLoggedIn = !!this.tokenStorageService.getToken();
 
  this.utilisateur=this.tokenStorageService.getUser();
    console.log(this.utilisateur)
    this.utilisateur_id = this.utilisateur.id;
    console.log(this.utilisateur_id)
}


public getRandonners(): void {
  this.anse.getRandonners().subscribe(
    (response: randonner[]) => {
      this.randonners = response;
      console.log(this.randonners);
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
}


public onAddRandonner(addForm: NgForm): void { 
console.log(addForm.value)
let data=addForm.value
console.log(data)   
const formData = new FormData();
    formData.append('adress',addForm.value.adress)
    formData.append('programme',addForm.value.programme)
    formData.append('date',addForm.value.date)
    formData.append('cercuit',addForm.value.cercuit)
    formData.append('difficult',addForm.value.difficult)
    formData.append('imageUrl', this.images)
   
      this.anse.addRandonner(formData,this.utilisateur_id).subscribe(data=>{
        console.log('annonce ajouter')
      },(err:HttpErrorResponse)=>{
        console.log(err.error)
      })
    }

public onUpdateRandonner(randonner: randonner): void {
  this.id=this.editRandonner.id;
  this.anse.updateRandonner(randonner,this.id).subscribe(
    (response: randonner) => {
      console.log(response);
      this.getRandonners();
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
}


public onDeleteRandonner(annonceId: any): void {
  this.anse.deleteRandonner(annonceId).subscribe(
    (response: void) => {
      console.log(response);
      this.getRandonners();
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
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