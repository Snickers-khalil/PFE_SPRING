import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { evenment } from 'src/app/models/evenment';
import { EvCrudService } from 'src/app/service/ev-crud.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-all-event',
  templateUrl: './all-event.component.html',
  styleUrls: ['./all-event.component.css']
})
export class AllEventComponent implements OnInit {

  public evenments?: evenment[];
  public editEvenment!: evenment;
  public deleteEvenment?: evenment;
  form: any = {};
  
  images:any;
  utilisateur?:any;
  utilisateur_id?:any;

  private roles : string[] = [];
  isLoggedIn = true;
  showAdminBoard = false;
  showRandonneurBoard = false;
  id: any;

  constructor( private EvCrudService: EvCrudService ,private tokenStorageService: TokenStorageService , private route:Router ) { }
 
  ngOnInit(): void {
   
    this.getEvenments();
    this.isLoggedIn = !!this.tokenStorageService.getToken();
 
  this.utilisateur=this.tokenStorageService.getUser();
    console.log(this.utilisateur)
    this.utilisateur_id = this.utilisateur.id;
    console.log(this.utilisateur_id)
  }


  public getEvenments(): void {
    this.EvCrudService.getEvenments().subscribe(
      (response: evenment[]) => {
        this.evenments = response;
        console.log(this.evenments);
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }
  
  
  public onAddEvenment(addForm: NgForm): void {
    console.log(addForm.value)
    let data=addForm.value
    console.log(data)
    const formData = new FormData();
        formData.append('title',addForm.value.title)
        formData.append('description',addForm.value.description)
        formData.append('debut_event',addForm.value.debut_event)
        formData.append('fin_event',addForm.value.fin_event)
        formData.append('imageUrl', this.images)
          this.EvCrudService.addEvenment(formData,this.utilisateur_id).subscribe(data=>{
            console.log('annonce ajouter')
            Swal.fire({
             // position: 'top-end',
              icon: 'success',
              title: ("Add Successfully"),
              showConfirmButton: false,
              timer: 3500
            })
          },(err:HttpErrorResponse)=>{
            console.log(err.error)
          })
        }

  public onUpdateEvenment(Evenment: evenment): void {
    this.id=this.editEvenment.id;
    this.EvCrudService.updateEvenment(Evenment,this.id).subscribe(
      (response: evenment) => {
        console.log(response);
        this.getEvenments();
        Swal.fire({
         // position: 'top-end',
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

  public onDeleteEvenment(id: any): void {
    this.EvCrudService.deleteEvenment(id).subscribe(
      (response: void) => {
        console.log(response);
        this.getEvenments();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public onOpenModal(Evenment: evenment, mode: string): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode === 'add') {
      button.setAttribute('data-target', '#addEmployeeModal');
    }
    if (mode === 'edit') {
      this.editEvenment = Evenment;
      button.setAttribute('data-target', '#updateEmployeeModal');
    }
    if (mode === 'delete') {
      this.deleteEvenment = Evenment;
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
