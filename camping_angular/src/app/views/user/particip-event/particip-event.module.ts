import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ParticipEventRoutingModule } from './particip-event-routing.module';
import { ParticipEventComponent } from './particip-event/particip-event.component';


@NgModule({
  declarations: [
    ParticipEventComponent
  ],
  imports: [
    CommonModule,
    ParticipEventRoutingModule
  ]
})
export class ParticipEventModule { }
