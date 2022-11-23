import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AllRondRoutingModule } from './all-rond-routing.module';
import { AllRondComponent } from './all-rond/all-rond.component';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    AllRondComponent
  ],
  imports: [
    CommonModule,
    AllRondRoutingModule,
    FormsModule
  ]
})
export class AllRondModule { }
