import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { evenment } from 'src/app/models/evenment';
import { participe } from 'src/app/models/participe';
import { utilisateur } from 'src/app/models/utilisateur.model';
import { EvCrudService } from 'src/app/service/ev-crud.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { UserCRUDService } from 'src/app/service/user-crud.service';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-particip-event',
  templateUrl: './particip-event.component.html',
  styleUrls: ['./particip-event.component.css']
})
export class ParticipEventComponent implements OnInit {

  
    //particips?:[];
    particip!:any[];
    partrand!:any[];
    demandes!: any[];
    public annonces : any = [];
    public favoris: any = [];
    evenments!:evenment[];
    idU!:any;
    roles : string[] = [];
    public grandTotal !: number;
    constructor(private EvCrudService: EvCrudService,private UserCRUDService:UserCRUDService, private token: TokenStorageService) { }
  
    ngOnInit(): void {
      this.getalllist();
     
    
    const user = this.token.getUser();
      this.roles = user.roles;
      this.idU=user.id;
    }
  
    public getAllDemandes(): void {
       this.UserCRUDService.alldemande().subscribe(
        (response: utilisateur[]) => {
          this.demandes = response;
          console.log(this.demandes);
        },
        (error: HttpErrorResponse) => {
          alert(error.message);
        }
      );
    }
  
    
    public getalllist(): void {
      const user = this.token.getUser();
        this.roles = user.roles;
        this.idU=user.id;
        console.log('my2',this.idU)
      this.EvCrudService.AllparticipeEven(this.idU).subscribe(
        (response:participe[]) => {
          this.particip = response;
          console.log(this.particip);
        },
        (error: HttpErrorResponse) => {
          alert(error.message);
        }
      );
    }


  
    changetorand(id:any){
      console.log(id);
      this.UserCRUDService.changeRoleRand(id,{}).subscribe(
        (data) => {
          console.log(id);
          console.log("role est changer to randonneur");
          window.location.reload();
  },
        (error: HttpErrorResponse) => {
          alert(error.message);
        }
      );
    }
  
   
  
    public Deleteparticip(id: any): void {
      this.EvCrudService.deleteparticipe(id).subscribe(
        (response: void) => {
          console.log(response);
          this.getalllist();
          Swal.fire({
            //position: 'top-end',
            icon: 'success',
            title: 'Delete successfuly',
            showConfirmButton: true,
            timer: 1500
          })
        },
        (error: HttpErrorResponse) => {
          alert(error.message);
          Swal.fire({
            //position: 'top-end',
            icon: 'error',
            title: (error.message),
            showConfirmButton: false,
            timer: 1500
          })
        }
      );
    }
  }