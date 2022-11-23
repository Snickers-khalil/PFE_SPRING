import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AllParticipRoutingModule } from './all-particip-routing.module';
import { AllParticipComponent } from './all-particip/all-particip.component';
import { NgxPrintModule } from 'ngx-print';


@NgModule({
  declarations: [
    AllParticipComponent
  ],
  imports: [
    CommonModule,
    AllParticipRoutingModule,
    NgxPrintModule,
  ]
})
export class AllParticipModule { }
