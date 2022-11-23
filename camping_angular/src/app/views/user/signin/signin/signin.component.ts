import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoginService } from 'src/app/service/login.service';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.css']
})
export class SigninComponent implements OnInit {

  form: any = {};
  isLoggedIn = false;
  isLoginFailed = false;
  errorMessage = '';
  roles: string[] = [];
 username:any;
  constructor(private LoginService: LoginService, private tokenStorage: TokenStorageService,private route:Router) { }
  
  ngOnInit(): void {
    if (this.tokenStorage.getToken()) {
      this.isLoggedIn = true;
      this.username=this.tokenStorage.getUser().username;
      this.roles = this.tokenStorage.getUser().roles;
    }
  }
  onSubmit(): void {
    this.LoginService.login(this.form).subscribe(
      data => {
        this.tokenStorage.saveToken(data.accessToken);
        this.tokenStorage.saveUser(data);
        this.isLoginFailed = false;
        this.isLoggedIn = true;
        this.roles = this.tokenStorage.getUser().roles;
        Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: ("Login successfully"+this.roles),
          showConfirmButton: false,
          timer: 3500
        })
        window.location.reload();
        //this.route.navigate(['/profil']);
      },
      err => {
        this.errorMessage = err.error.message;
        this.isLoginFailed = true;
        Swal.fire({
          position: 'top-end',
          icon: 'error',
          title: ("login ou mot de passe erronés..  "+this.errorMessage),
          showConfirmButton: false,
          timer: 3500
        })
      }
    );
  }
  reloadPage(): void {
    window.location.reload();
  }

}
