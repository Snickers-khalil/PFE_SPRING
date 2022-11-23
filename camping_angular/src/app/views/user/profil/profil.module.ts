import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProfilComponent } from './profil/profil.component';
import { ProfilRoutingModule } from './profil-routing.module';
import {MatDialogModule} from '@angular/material/dialog';
import { EditProfilComponent } from './edit-profil/edit-profil.component';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {MatIconModule} from '@angular/material/icon';
import {MatRadioModule} from '@angular/material/radio';
import {MatButtonModule} from '@angular/material/button';
import { FormsModule } from '@angular/forms';
import { DataSharingService } from 'src/app/service/DataSharingService.service';
@NgModule({
  providers:[
    DataSharingService
  ],

  declarations: [
    ProfilComponent,
    EditProfilComponent
  ],
  imports: [
    CommonModule,
    ProfilRoutingModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatIconModule,
    MatRadioModule,
    MatButtonModule,
    FormsModule,
    
  ]
})
export class ProfilModule { }
