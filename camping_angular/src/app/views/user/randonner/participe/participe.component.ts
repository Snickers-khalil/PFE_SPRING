import { ParticipeService } from './../../../../service/participe.service';
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-participe',
  templateUrl: './participe.component.html',
  styleUrls: ['./participe.component.css']
})
export class ParticipeComponent implements OnInit {
  selectedFile!: File;
  imgURL: any;
  retrievedImage: any;
  base64Data: any;
  retrieveResonse: any;
  message!: string;
  imageName!: string;
   isLinear = false;


  constructor(private _formBuilder: FormBuilder,private route:Router, private ParticipeService:ParticipeService,private httpClient: HttpClient) {}

  ngOnInit() {
   
  }
  form: any = {};
  isSuccessful = false;
  isSignUpFailed = false;
  errorMessage = '';

  

 

  onSubmit(): void {
    this.ParticipeService.register(this.form).subscribe(
      data => {
        console.log(data);
        this.isSuccessful = true;
        this.isSignUpFailed = false;
        this.route.navigate(['/participe']);
      },
      err => {
        this.errorMessage = err.error.message;
        this.isSignUpFailed = true;
      }
    );
  }


}
