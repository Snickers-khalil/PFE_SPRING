import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { registerService } from 'src/app/service/register.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {

  form: any = {};
  isSuccessful = false;
  isSignUpFailed = false;
  errorMessage = '';
  constructor(private registerService: registerService , private route:Router ) { }

  ngOnInit(): void {
  }

  onSubmit(): void {
    this.registerService.register(this.form).subscribe(
      data => {
        console.log(data);
        this.isSuccessful = true;
        this.isSignUpFailed = false;
        this.route.navigate(['/login']);
      },
      err => {
        this.errorMessage = err.error.message;
        this.isSignUpFailed = true;
        //errorMessage!=''
        Swal.fire({
          position: 'top-end',
          icon: 'error',
          title: (this.errorMessage),
          showConfirmButton: false,
          timer: 3500
        })
      }
    );
  }

}
