import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { utilisateur } from 'src/app/models/utilisateur.model';
import { EvCrudService } from 'src/app/service/ev-crud.service';
import { UserCRUDService } from 'src/app/service/user-crud.service';

@Component({
  selector: 'app-all-particip',
  templateUrl: './all-particip.component.html',
  styleUrls: ['./all-particip.component.css']
})
export class AllParticipComponent implements OnInit {
  
  //particips?:[];
  particip!:any[];
  partrand!:any[];
  demandes!: any[];
  
  constructor(private EvCrudService: EvCrudService,private UserCRUDService:UserCRUDService) { }

  ngOnInit(): void {
    this.getalllist();
    this.getlistrand();
    this.getAllDemandes();
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
  public getlistrand(): void {
    this.EvCrudService.AllparticipeRandonner().subscribe(
      (response: utilisateur[]) => {
        this.partrand = response;
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

  public refuserDemande(id: any): void {
    this.UserCRUDService.refuser(id).subscribe(
      (response: void) => {
        console.log(response);
        this.getAllDemandes();
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
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }
}
