import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AllUtilisateursRoutingModule } from './all-utilisateurs-routing.module';
import { AllUtilisateursComponent } from './all-utilisateurs/all-utilisateurs.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import {MatRadioModule} from '@angular/material/radio';

@NgModule({
  declarations: [
    AllUtilisateursComponent
  ],
  imports: [
    CommonModule,
    AllUtilisateursRoutingModule,
    FormsModule,
    HttpClientModule,
    MatRadioModule,
   
  ]
})
export class AllUtilisateursModule { }
