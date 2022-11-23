import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute } from '@angular/router';
import { evenment } from 'src/app/models/evenment';
import { EvCrudService } from 'src/app/service/ev-crud.service';

@Component({
  selector: 'app-dialog-content',
  templateUrl: './dialog-content.component.html',
  styleUrls: ['./dialog-content.component.css']
})
export class DialogContentComponent implements OnInit {
  roles: string[] = [];
  evenment?: evenment[];
  currentuser: evenment = {};
  currentIndex = -1;
  title = '';

  constructor(public dialog: MatDialog,private EvCrudService:EvCrudService , private route:ActivatedRoute) {}


  ngOnInit(): void {
    //this.retrieveTutorials();
    this.getTutorial(this.route.snapshot.params.id);
  }

  getTutorial(id: any): void {
    this.EvCrudService.get(id)
      .subscribe(
        data => {
          this.evenment = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }

  retrieveTutorials(): void {
    this.EvCrudService.getEvenments()
      .subscribe(
        data => {
          this.evenment = data;
          console.log(data);
        },
        error => {
          console.log(error);
        });
  }

  refreshList(): void {
    this.retrieveTutorials();
    this.currentuser = {};
    this.currentIndex = -1;
  }
  setActiveTutorial(evenment: evenment, index: number): void {
    this.currentuser = evenment;
    this.currentIndex = index;
  }
  deleteTutorial(): void {
    this.EvCrudService.deleteEvenment(this.currentuser.id)
      .subscribe(
        response => {
          console.log(response);
         
        },
        error => {
          console.log(error);
        });
  }
}