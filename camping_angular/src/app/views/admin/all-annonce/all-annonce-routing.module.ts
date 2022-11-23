import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AllAnnonceComponent } from './all-annonce/all-annonce.component';

const routes: Routes = [
  {path:'',component:AllAnnonceComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AllAnnonceRoutingModule { }
