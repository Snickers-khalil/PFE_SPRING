import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AllEventComponent } from './all-event/all-event.component';

const routes: Routes = [
  {path:'',component:AllEventComponent}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AllEventRoutingModule { }
