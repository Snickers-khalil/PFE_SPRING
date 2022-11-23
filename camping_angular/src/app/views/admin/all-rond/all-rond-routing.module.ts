import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AllRondComponent } from './all-rond/all-rond.component';

const routes: Routes = [
  {path:'',component:AllRondComponent}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AllRondRoutingModule { }
