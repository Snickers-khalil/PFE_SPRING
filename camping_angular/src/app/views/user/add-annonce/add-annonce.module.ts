import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MesAnnonceRoutingModule } from './add-annonce-routing.module';
import { MesAnnonceComponent } from './Mes-annonce/Mes-annonce.component';
import {MatStepperModule} from '@angular/material/stepper';
import { MatIconModule } from '@angular/material/icon';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {MatButtonModule} from '@angular/material/button';
import { FormsModule } from '@angular/forms';
@NgModule({
  declarations: [
    MesAnnonceComponent
  ],
  imports: [
    CommonModule,
    MesAnnonceRoutingModule,
    MatFormFieldModule,
    MatIconModule,
    MatStepperModule, 
    MatInputModule,
    MatButtonModule,
    FormsModule
  ]
})
export class AddAnnonceModule { }
