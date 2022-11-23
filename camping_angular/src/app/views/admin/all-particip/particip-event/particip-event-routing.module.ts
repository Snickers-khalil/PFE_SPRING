
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ParticipEventComponent } from './particip-event/particip-event.component';

const routes: Routes = [{path:'',component:ParticipEventComponent},];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ParticipEventRoutingModule { }
