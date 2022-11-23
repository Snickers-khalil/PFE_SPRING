import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { EditProfilComponent } from '../edit-profil/edit-profil.component';
import { Router } from '@angular/router';
import { utilisateur } from 'src/app/models/utilisateur.model';
import { UserCRUDService } from 'src/app/service/user-crud.service';
import Swal from 'sweetalert2';
import { DataSharingService } from 'src/app/service/DataSharingService.service';


@Component({
  selector: 'app-profil',
  templateUrl: './profil.component.html',
  styleUrls: ['./profil.component.css']
})
export class ProfilComponent implements OnInit {
  utilisateurrs?:utilisateur[];
  currentUser: any;
  selectedFile!: File;
  imgURL: any;
  retrievedImage: any;
  base64Data: any;
  retrieveResonse: any;
  message!: string;
  imageName!: string;
  images:any;
  isLoggedIn = false;
  isSend = false;
  isChanger=false;
  isSelected=false;
  showAdminBoard = false;
  showRandonneurBoard = false;
  private roles : string[] = [];
  editAnnonce!: utilisateur;
  public roleeuser!: utilisateur;
  msg="votre Demande Encours ...!";
  idU: any;
  select: any;
  isUserLoggedIn!: boolean;
  envoyer=false;

  constructor(private token: TokenStorageService,
               private route:Router, 
               private dialog :MatDialog,
               private dataSharingService: DataSharingService,
               private UserCRUDService:UserCRUDService,
              private httpClient: HttpClient) {
                this.dataSharingService.isUserLoggedIn.subscribe( value => {
                  this.isUserLoggedIn = value; });
              }
  
  ngOnInit(): void {
    this.currentUser = this.token.getUser();
    console.log(this.currentUser)
    this.isLoggedIn = !!this.token.getToken();
    const user = this.token.getUser();
    this.roles = user.roles;
    this.idU=user.id;
    this.showRandonneurBoard = this.roles.includes('RANDONNEUR');
    this.showAdminBoard = this.roles.includes('ADMIN');
    if (this.isLoggedIn==false) {
      this.route.navigate(['/'])
    }
  }
  public onUpdateprofil(utilisateur: utilisateur): void {
    this.UserCRUDService.updateUser(this.idU,utilisateur).subscribe(
      (response) => {
        this.ngOnInit();
        console.log(response);
        Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: 'Modifier avec success',
          showConfirmButton: false,
          timer: 1500
        })
        this.ngOnInit();
       window.setTimeout(function(){location.reload()},2000)
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  ChangerRole(UD_Id: any): void{
      console.log(this.idU);
    this.UserCRUDService.demande(this.idU).subscribe(
      (data) => {
        console.log(this.idU);
        console.log("Demande Envoyer avec succ");
        this.isSend=true;
        if(data.message==this.msg){
          this.envoyer=true;
          Swal.fire({
           icon: 'warning',
           title: (data.message),
           showConfirmButton: false,
           timer: 3500
         })
         }else{
          this.envoyer=false;
           Swal.fire({
             icon: 'success',
             title: (data.message),
             showConfirmButton: false,
             timer: 3500
           })
         }
         this.ngOnInit();
       // window.location.reload();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        this.isSend=false;
      }
    );
  }

  selectImage(event:any) {
    if (event.target.files.length > 0) {
      const path = event.target.files[0];
      this.select="true";
      console.log(path)
      this.images = path;
      this.isSelected=true;
      console.log(this.images)
    }
  }

  onUpload(id:any) {
    console.log(this.images);
    const formData = new FormData();
    formData.append('file', this.images);
    console.log(formData);
    this.UserCRUDService.updatephoto(id, formData).subscribe(
      (response) => {
        console.log(response);
        this.isChanger=true;
        Swal.fire({
          icon: 'success',
          title: (response.message),
          showConfirmButton: false,
          timer: 3500
        })
        this.ngOnInit();
       window.setTimeout(function(){location.reload()},3000)
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        Swal.fire({
          icon: 'error',
          title: (error.message),
          showConfirmButton: false,
          timer: 3500
        })
      }
    );
  }
  
  // getImage() {
  //   this.httpClient.get('http://localhost:8080/image/get/'+ this.imageName)
  //     .subscribe(
  //       res => {
  //         this.retrieveResonse = res;
  //         this.base64Data = this.retrieveResonse.picByte;
  //         this.retrievedImage = 'data:image/jpeg;base64,' + this.base64Data;
  //       }
  //     );
  // }

  public onOpenModal(utilisateur: utilisateur, mode: string): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode === 'edit'&& this.isLoggedIn) {
      this.editAnnonce = utilisateur;
      button.setAttribute('data-target', '#updateEmployeeModal');
    }
    if (mode === 'role') {
      this.roleeuser = utilisateur;
      button.setAttribute('data-target', '#roleEmployeeModal');
    }
    container!.appendChild(button);
    button.click();
  }


  openDialog() {
    this.dialog.open(EditProfilComponent, {
    width:'30%'
    });
  }
}

