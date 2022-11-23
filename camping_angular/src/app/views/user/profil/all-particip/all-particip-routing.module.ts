import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AllParticipComponent } from './all-particip/all-particip.component';

const routes: Routes = [
  {path:'',component:AllParticipComponent}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AllParticipRoutingModule { }
