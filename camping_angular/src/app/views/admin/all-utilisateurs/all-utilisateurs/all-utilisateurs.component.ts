import { utilisateur } from 'src/app/models/utilisateur.model';
import { UserCRUDService } from 'src/app/service/user-crud.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Form, NgForm } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { registerService } from 'src/app/service/register.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { roles } from 'src/app/models/roles.modul';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-all-utilisateurs',
  templateUrl: './all-utilisateurs.component.html',
  styleUrls: ['./all-utilisateurs.component.css']
})

export class AllUtilisateursComponent implements OnInit {
  isLoggedIn = false;
  showAdminBoard = false;
  dataArrayrole:any=[]
  public utilisateurs?: utilisateur[];
  roles!: roles;
  utilisateur?:utilisateur;
   public Rolees?:roles[];
  public roleuser!: utilisateur;
  public edituser?: utilisateur;
  public deleteuser?: utilisateur;
  form: any = {};
  isSuccessful = false;
  isSignUpFailed = false;
  errorMessage = '';
  idU:any;
  
  //role?: any;

  constructor( private registerService: registerService, 
                private token:TokenStorageService,
                private register :registerService,
                private UserCRUDService: UserCRUDService ) { }

  ngOnInit(): void {
    this.getUsers();
    const user = this.token.getUser();
    this.roles = user.roles;
    this.idU=user.id;
  }
  
  public getuserrole(id:any): void {
    console.log(id);
    this.UserCRUDService.getrole(id).subscribe(
      (response: roles) => {
        console.log(this.roles);
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }
  changetoadmin(id:any){
    console.log(id);
    this.UserCRUDService.changeRoleAdmin(id,{}).subscribe(
      (data) => {
        console.log(id);
        console.log("role est changer to admin");
        this.ngOnInit();
      //  window.location.reload();
        Swal.fire({
          //position: 'top-end',
          icon: 'success',
          title: ("change to admin succssfuly !!"),
          showConfirmButton: true,
          timer: 3500
        })
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
        this.ngOnInit();
        Swal.fire({
          //position: 'top-end',
          icon: 'success',
          title: ("change to randonneur succssfuly !!"),
          showConfirmButton: true,
          timer: 3500
        })
        //window.location.reload();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  changetouser(id:any){
    console.log(id);
    this.UserCRUDService.changeRoleUser(id,{}).subscribe(
      (data) => {
        console.log(id);
        console.log("role est changer to user");
        this.ngOnInit();
        Swal.fire({
          //position: 'top-end',
          icon: 'success',
          title: ("change to user succssfuly !!"),
          showConfirmButton: true,
          timer: 3500
        })
        //window.location.reload();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
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
  
  public onAddUser(addForm: NgForm): void {
    document.getElementById('add-employee-form')!.click();
    this.registerService.register(this.form).subscribe(
      data => {
        console.log(data);
        this.getUsers();
        addForm.reset();
        window.location.reload();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
        addForm.reset();
      }
    );
  }

  public onUpdateUser(id:any,utilisateur: utilisateur): void {
    console.log(id);
    console.log(utilisateur);
    this.UserCRUDService.updateUser(id,utilisateur).subscribe(
      (response: utilisateur) => {
        console.log(response);
        this.ngOnInit();
        Swal.fire({
          //position: 'top-end',
          icon: 'success',
          title: ("update succssfuly !!"),
          showConfirmButton: true,
          timer: 3500
        })
       // window.location.reload();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }

  public onDeleteUser(id: BigInteger): void {
    this.UserCRUDService.deleteUser(id).subscribe(
      (response: void) => {
        console.log(response);
        this.ngOnInit();
        Swal.fire({
          //position: 'top-end',
          icon: 'success',
          title: ("Removed succssfuly !!"),
          showConfirmButton: true,
          timer: 3500
        })
        //window.location.reload();
      },
      (error: HttpErrorResponse) => {
        alert(error.message);
      }
    );
  }
  
  public searchEmployees(key: string): void {
    console.log(key);
    const results: utilisateur[] = [];
    for (const employee of this.utilisateurs!) {
      if (employee.firstname?.toLowerCase().indexOf(key.toLowerCase()) !== -1
      || employee.lastname?.toLowerCase().indexOf(key.toLowerCase()) !== -1
      || employee.username?.toLowerCase().indexOf(key.toLowerCase()) !== -1
      || employee.phone?.toLowerCase().indexOf(key.toLowerCase()) !== -1) {
        results.push(employee);
      }
    }
    this.utilisateurs = results;
    if (results.length === 0 || !key) {
      this.getUsers();
    }
  }
  public onOpenModal(utilisateur: utilisateur, mode: string): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode === 'add') {
      button.setAttribute('data-target', '#addEmployeeModal');
    }
    if (mode === 'edit') {
      this.edituser = utilisateur;
      button.setAttribute('data-target', '#updateEmployeeModal');
    }
    if (mode === 'delete') {
      this.deleteuser = utilisateur;
      button.setAttribute('data-target', '#deleteEmployeeModal');
    }
    if (mode === 'role') {
      this.roleuser = utilisateur;
      button.setAttribute('data-target', '#roleEmployeeModal');
    }
    container!.appendChild(button);
    button.click();
  }
}
