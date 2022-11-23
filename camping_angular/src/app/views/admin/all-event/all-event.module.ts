import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AllEventRoutingModule } from './all-event-routing.module';
import { AllEventComponent } from './all-event/all-event.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    AllEventComponent
  ],
  imports: [
    CommonModule,
    AllEventRoutingModule,
    FormsModule,
    HttpClientModule,
  ]
})
export class AllEventModule { }
