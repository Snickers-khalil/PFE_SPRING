import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AllAnnonceRoutingModule } from './all-annonce-routing.module';
import { AllAnnonceComponent } from './all-annonce/all-annonce.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatIconModule } from '@angular/material/icon';
import { MatRadioModule } from '@angular/material/radio';
import { MatButtonModule } from '@angular/material/button';


@NgModule({
  declarations: [
    AllAnnonceComponent
  ],
  imports: [
    CommonModule,
    AllAnnonceRoutingModule,
    HttpClientModule,
    CommonModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatIconModule,
    MatRadioModule,
    MatButtonModule,
    FormsModule,
  ]
})
export class AllAnnonceModule { }
