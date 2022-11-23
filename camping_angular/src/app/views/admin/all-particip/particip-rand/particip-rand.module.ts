import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ParticipRandRoutingModule } from './particip-rand-routing.module';
import { ParticipRandComponent } from './particip-rand/particip-rand.component';


@NgModule({
  declarations: [
    ParticipRandComponent
  ],
  imports: [
    CommonModule,
    ParticipRandRoutingModule
  ]
})
export class ParticipRandModule { }
