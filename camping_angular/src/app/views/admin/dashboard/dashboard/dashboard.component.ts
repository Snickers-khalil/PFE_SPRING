import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { utilisateur } from 'src/app/models/utilisateur.model';
import { AnnonceService } from 'src/app/service/annonce.service';
import { EvCrudService } from 'src/app/service/ev-crud.service';
import { RandCrudService } from 'src/app/service/rand-crud.service';
import { registerService } from 'src/app/service/register.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { UserCRUDService } from 'src/app/service/user-crud.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  utilisateurs?: any[];
  annonces!:any[];
  events!:any[];
  randonners!: any[];
  evenments!: any[];

  constructor( private registerService: registerService, 
    private anse: AnnonceService,
    private EvCrudService: EvCrudService,
    private rand:RandCrudService,
    private register :registerService,
    private UserCRUDService: UserCRUDService ) { }

  ngOnInit(): void {
    this.getUsers();
    this.getAnnonces();
    this.getEvenments();
    this.getRandonners();
  }

  public getUsers(): void {
    this.UserCRUDService.getUsers().subscribe(
      (response: utilisateur[]) => {
        this.utilisateurs = response;
        console.log(this.utilisateurs);
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }
  public getAnnonces(): void {
    this.anse.getAnnonces().subscribe(
    (response: any[]) => {
    this.annonces = response;
    console.log(this.annonces);
    },
    (error: HttpErrorResponse) => {
    alert(error.message);
    }
    );
    }
    public getEvenments(): void {
      this.EvCrudService.getEvenments().subscribe(
        (response: any[]) => {
          this.evenments = response;
          console.log(this.evenments);
        },
        (error: HttpErrorResponse) => {
          alert(error.message);
        }
      );
    }
    public getRandonners(): void {
      this.rand.getRandonners().subscribe(
        (response: any[]) => {
          this.randonners = response;
          console.log(this.randonners);
        },
        (error: HttpErrorResponse) => {
          alert(error.message);
        }
      );
    }
}
