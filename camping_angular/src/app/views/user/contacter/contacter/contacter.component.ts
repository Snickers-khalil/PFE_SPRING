import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ChatService } from 'src/app/service/chat.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { UserCRUDService } from 'src/app/service/user-crud.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-contacter',
  templateUrl: './contacter.component.html',
  styleUrls: ['./contacter.component.css']
})
export class ContacterComponent implements OnInit {
  utilisateur_id: any;

  constructor( private chatserv:ChatService,
              private tokenStorageService:TokenStorageService) { }

  ngOnInit(): void {
    const user = this.tokenStorageService.getUser();
      console.log(user)
      this.utilisateur_id = user.id;
      console.log(this.utilisateur_id)
  }

  SendMssg(addForm:NgForm): void {
    console.log(addForm.value)
    let data=addForm.value
    console.log(data)
    const formData = new FormData();
    formData.append('objet',addForm.value.objet)
    formData.append('contenu',addForm.value.contenu)
      this.chatserv.SendMsg(this.utilisateur_id,formData).subscribe(data=>{
        console.log('Message Envoyer')
        Swal.fire({
          // position: 'top-end',
           icon: 'success',
           title: ("Send Successfully"),
           showConfirmButton: false,
           timer: 3500
         })
      },(err:HttpErrorResponse)=>{
        console.log(err.error)
        Swal.fire({
          // position: 'top-end',
           icon: 'error',
           title: (err.error,"erreur"),
           showConfirmButton: false,
           timer: 3500
         })
      })
    }
    
}
