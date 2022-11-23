import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ParticipEventRoutingModule } from './particip-event-routing.module';
import { ParticipEventComponent } from './particip-event/particip-event.component';

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
    ParticipEventComponent
  ],
  imports: [
    CommonModule,
    ParticipEventRoutingModule,
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
export class ParticipEventModule { }
