import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { evenment } from 'src/app/models/evenment';
import { participe } from 'src/app/models/participe';
import { utilisateur } from 'src/app/models/utilisateur.model';
import { EvCrudService } from 'src/app/service/ev-crud.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { UserCRUDService } from 'src/app/service/user-crud.service';
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
      this.EvCrudService.AllparticipeEvenment().subscribe(
        (response: utilisateur[]) => {
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

    public searchEmployees(key: string): void {
      console.log(key);
      const results: utilisateur[] = [];
      for (const employee of this.particip) {
        if (employee.utilisateur.firstname?.toLowerCase().indexOf(key.toLowerCase()) !== -1
        || employee.evenment.title?.toLowerCase().indexOf(key.toLowerCase()) !== -1
        || employee.date_particip?.toLowerCase().indexOf(key.toLowerCase()) !== -1) {
          results.push(employee);
        }
      }
      this.particip = results;
      if (results.length === 0 || !key) {
        this.getalllist();
      }
    }
  
   
  
    public Deleteparticip(id: any): void {
      this.EvCrudService.deleteparticipe(id).subscribe(
        (response: void) => {
          console.log(response);
          this.getalllist();
        },
        (error: HttpErrorResponse) => {
          alert(error.message);
        }
      );
    }
  }