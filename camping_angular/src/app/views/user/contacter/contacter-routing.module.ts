import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ContacterComponent } from './contacter/contacter.component';

const routes: Routes = [
  {path:'',component:ContacterComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ContacterRoutingModule { }
