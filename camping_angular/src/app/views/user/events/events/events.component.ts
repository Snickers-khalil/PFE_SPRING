import { HttpErrorResponse } from '@angular/common/http';
import { AfterViewInit, Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { evenment } from 'src/app/models/evenment';
import { EvCrudService } from 'src/app/service/ev-crud.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import Swal from 'sweetalert2';
import { DetailsAnnComponent } from '../../shop/details-ann/details-ann.component';
import { DialogContentComponent } from '../dialog-content/dialog-content.component';
import { ParticipeComponent } from '../participe/participe.component';
declare var anime: any;
@Component({
  selector: 'app-events',
  templateUrl: './events.component.html',
  styleUrls: ['./events.component.css']
})
export class EventsComponent implements AfterViewInit {

  public participeEvenment!: evenment;
  images:any;
  utilisateur?:any;
  utilisateur_id?:any;
  evenments!:evenment[];
  public editEvenment!: evenment;
  public detailEvenment!: evenment;
  public deleteEvenment!: evenment;
  private roles : string[] = [];
  isLoggedIn = true;
  showAdminBoard = false;
  showRandonneurBoard = false;
  id:any;
  evenment: any;
  loading=false;
  like=false;
  msg="allready Participate ...!";

  constructor(private anse:EvCrudService,public dialog: MatDialog ,private tokenStorageService: TokenStorageService , private route:Router) { }
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
    this.getEvenments();
    this.isLoggedIn = !!this.tokenStorageService.getToken();
    const user = this.tokenStorageService.getUser();
    this.roles = user.roles;
    this.showRandonneurBoard = this.roles.includes('RANDONNEUR');
    this.utilisateur=this.tokenStorageService.getUser();
    console.log(this.utilisateur)
    this.utilisateur_id = this.utilisateur.id;
    console.log(this.utilisateur_id);
  }
  public getEvenments(): void {
    this.anse.getEvenments().subscribe(
      (response: evenment[]) => {
        this.evenments = response;
        this.loading=true;
        console.log(this.evenments);
      },
      (error: HttpErrorResponse) => {
        //alert(error.message);
        this.loading=true;
        Swal.fire({
          //position: 'top-end',
          icon: 'error',
          title: (error.message,"erreur Fetching Data"),
          showConfirmButton: false,
          timer: 5000
        })
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
          this.anse.addEvenment(formData,this.utilisateur_id).subscribe(data=>{
            console.log('annonce ajouter')
            Swal.fire({
             // position: 'top-end',
              icon: 'success',
              title: 'Ajouter avec success',
              showConfirmButton: false,
              timer: 1500
            })
            window.setTimeout(function(){location.reload()},1500)
          },(err:HttpErrorResponse)=>{
            console.log(err.error)
          })
        }
        
        
  public onUpdateEvenment(Evenment: evenment): void {
    this.id=this.editEvenment.id;
    this.anse.updateEvenment(Evenment,this.id).subscribe(
      (response: evenment) => {
        console.log(response);
        this.getEvenments();
        Swal.fire({
          //position: 'top-end',
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
  exist(){
    this.ngOnInit();
  }
  public onparticipeEvennment(evenmentId: any): void  {
    //this.idE=this.evenments.evenmentId;
    this.anse.participeEvenment(this.utilisateur_id,evenmentId).subscribe(
      (data) => {
        console.log(this.utilisateur_id,evenmentId);
        console.log("ajouter");
        this.ngOnInit();
        if(data.message==this.msg){
          this.like=true;
          Swal.fire({
           //position: 'top-end',
           icon: 'error',
           title: (data.message),
           showConfirmButton: false,
           timer: 3000
         })
         }else{
          this.like=false;
           Swal.fire({
            // position: 'top-end',
             icon: 'success',
             title: (data.message),
             showConfirmButton: false,
             timer: 3000
           })
         }
      //  window.setTimeout(function(){location.reload()},3000)
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        Swal.fire({
          // position: 'top-end',
           icon: 'error',
           title: (error.message),
           showConfirmButton: false,
           timer: 3000
         })
      }
    );
  }

  public onDeleteEvennment(annonceId: any): void {
    this.anse.deleteEvenment(annonceId).subscribe(
      (response: void) => {
        console.log(response);
        this.ngOnInit();
        Swal.fire({
         // position: 'top-end',
          icon: 'success',
          title: 'Delete successfuly',
          showConfirmButton: false,
          timer: 1500
        })
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }
  ongetEvenment(id: any): void {
    this.id=this.editEvenment.id;
    this.anse.get(id).subscribe(
        data => {
          this.evenment = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }

  public onOpenModal(evenment: evenment, mode: string): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode === 'add') {
      button.setAttribute('data-target', '#addEmployeeModal');
    }
    if (mode === 'edit') {
      this.editEvenment = evenment;
      button.setAttribute('data-target', '#updateEmployeeModal');
    }
    if (mode === 'delete') {
      this.deleteEvenment = evenment;
      button.setAttribute('data-target', '#deleteEmployeeModal');
    }
    if (mode === 'details' ) {
      this.detailEvenment = evenment;
      button.setAttribute('data-target', '#detailsEmployeeModal');
    }
     if (mode === 'participe') {
      this.participeEvenment = evenment;
      button.setAttribute('data-target', '#participeEmployeeModal');
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
    const dialogRef = this.dialog.open(DialogContentComponent);
    width:"30%"
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

