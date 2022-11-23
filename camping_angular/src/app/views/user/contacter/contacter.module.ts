import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ContacterRoutingModule } from './contacter-routing.module';
import { ContacterComponent } from './contacter/contacter.component';
import { FormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    ContacterComponent
  ],
  imports: [
    CommonModule,
    ContacterRoutingModule,
    FormsModule
  ]
})
export class ContacterModule { }
