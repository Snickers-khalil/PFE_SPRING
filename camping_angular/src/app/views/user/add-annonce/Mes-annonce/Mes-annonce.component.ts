import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Annonce } from 'src/app/models/annonce.model';
import { utilisateur } from 'src/app/models/utilisateur.model';
import { AnnonceService } from 'src/app/service/annonce.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-add-annonce',
  templateUrl: './mes-annonce.component.html',
  styleUrls: ['./mes-annonce.component.css']
})
export class MesAnnonceComponent implements OnInit {
   
  
  images:any;

  annonces!:Annonce[];
  public editAnnonce!: Annonce;
  public detailAnnonce!: Annonce;
  public deleteAnnonce!: Annonce;
  roles : string[] = [];
  annonce?: any;
   utilisateur?:any;
   utilisateur_id?:any;
   idU?: any;

  constructor(private token: TokenStorageService,private anse:AnnonceService) { }

ngOnInit(): void {
  this.getMyAnnonces();
  const user = this.token.getUser();
    this.roles = user.roles;
    this.idU=user.id;
}

public getMyAnnonces(): void {
  const user = this.token.getUser();
    this.roles = user.roles;
    this.idU=user.id;
    console.log('my2',this.idU)
  this.anse.getMyAnnonces(this.idU).subscribe(
    (response: Annonce[]) => {
      this.annonces = response;
      console.log(this.annonces);
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
}

public onUpdateAnnonce(annonce: any): void {
  this.idU=this.editAnnonce.id;
  this.anse.updateAnnonce(annonce,this.idU).subscribe(
    (response: Annonce) => {
    console.log(response);
      this.getMyAnnonces();
      window.location.reload();
      Swal.fire({
      //  position: 'top-end',
        icon: 'success',
        title: ("update successfuly"),
        showConfirmButton: false,
        timer: 3500
      })
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
    }
  );
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
      //  position: 'top-end',
        icon: 'success',
        title: ("upload image successfuly"),
        showConfirmButton: false,
        timer: 3500
      })
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
      Swal.fire({
        //position: 'top-end',
        icon: 'error',
        title: (error.message,"erreur "),
        showConfirmButton: false,
        timer: 3500
      })
    }
  );
}
public onDeleteAnnonce(annonceId: any): void {
  this.anse.deleteAnnonce(annonceId).subscribe(
    (response: void) => {
      console.log(response);
      this.getMyAnnonces();
      Swal.fire({
       // position: 'top-end',
        icon: 'success',
        title: ("Deleted"),
        showConfirmButton: false,
        timer: 3500
      })
    },
    (error: HttpErrorResponse) => {
      alert(error.message);
      Swal.fire({
       // position: 'top-end',
        icon: 'error',
        title: (error.message,"erreur"),
        showConfirmButton: false,
        timer: 3500
      })
    }
  );
}
public onOpenModal(annonce: Annonce, mode: string): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode === 'edit') {
      this.editAnnonce = annonce;
      button.setAttribute('data-target', '#updateEmployeeModal');
    }
    if (mode === 'delete' ) {
      this.deleteAnnonce = annonce;
      button.setAttribute('data-target', '#deleteEmployeeModal');
    }
    if (mode === 'details' ) {
      this.detailAnnonce = annonce;
      button.setAttribute('data-target', '#detailsEmployeeModal');
    }
    if (mode === 'add') {
      button.setAttribute('data-target', '#addEmployeeModal');
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