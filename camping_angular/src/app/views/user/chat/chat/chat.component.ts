import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { utilisateur } from 'src/app/models/utilisateur.model';
import { ChatService } from 'src/app/service/chat.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-chat',
  templateUrl: './chat.component.html',
  styleUrls: ['./chat.component.css']
})
export class ChatComponent implements OnInit {

msgs!:any[];
utilisateur_id: any;
currentUser: any;
isLoggedIn=false;
loading=false;
  constructor( private chatserv:ChatService,
    private tokenStorageService:TokenStorageService) { }
  ngOnInit(): void {
    this.currentUser = this.tokenStorageService.getUser();
    console.log(this.currentUser)
    this.isLoggedIn = !!this.tokenStorageService.getToken();
    const user = this.tokenStorageService.getUser();
      console.log(user)
      this.utilisateur_id = user.id;
      console.log(this.utilisateur_id)
    this.getmsgs();
  }


getmsgs(){
  this.chatserv.getMsgs().subscribe(
    (response: utilisateur[]) => {
      this.msgs = response;
      this.loading=true;
      console.log(this.msgs);
    },
    (error: HttpErrorResponse) => {
      //alert(error.message);
      this.loading=true;
      Swal.fire({
        position: 'top-end',
        icon: 'error',
        title: (error.message,"erreur Fetching Data"),
        showConfirmButton: false,
        timer: 5000
      })
    }
  );
}


SendMssg(addForm:NgForm): void {
  if(this.isLoggedIn){
  console.log(addForm.value)
  let data=addForm.value
  console.log(data)
  const formData = new FormData();
  formData.append('contenu',addForm.value.contenu)
    this.chatserv.SendMsg(this.utilisateur_id,formData).subscribe(data=>{
      console.log('Message Envoyer')
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Ajout avec success',
        showConfirmButton: false,
        timer: 1500
      })
      window.setTimeout(function(){location.reload()},3000)
    },(err:HttpErrorResponse)=>{
      console.log(err.error)
    })
  }
  Swal.fire({
    position: 'top-end',
    icon: 'error',
    title: 'Oops...',
    text: 'Please Login to join!',
    showConfirmButton: false,
    timer: 1500
  }) 
}
}
