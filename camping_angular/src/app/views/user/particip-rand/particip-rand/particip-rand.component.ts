
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
  selector: 'app-particip-rand',
  templateUrl: './particip-rand.component.html',
  styleUrls: ['./particip-rand.component.css']
})
export class ParticipRandComponent implements OnInit {


  
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
      
      this.getlistrand();
     
    }
  

 
    public getlistrand(): void {
      const user = this.token.getUser();
        this.roles = user.roles;
        this.idU=user.id;
        console.log('my2',this.idU)
      this.EvCrudService.Allparticiperand(this.idU).subscribe(
        (response:participe[]) => {
          this.partrand = response;
          console.log(this.partrand);
        },
        (error: HttpErrorResponse) => {
          alert(error.message);
        }
      );
    }
    
   
  
  
    public DeletepartRand(id: any): void {
      this.EvCrudService.deletepartRand(id).subscribe(
        (response: void) => {
          console.log(response);
          this.getlistrand();
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
        }
      );
    }
  }
