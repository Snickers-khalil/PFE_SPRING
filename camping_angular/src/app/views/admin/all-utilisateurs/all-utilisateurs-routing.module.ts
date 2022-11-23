import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AllUtilisateursComponent } from './all-utilisateurs/all-utilisateurs.component';

const routes: Routes = [
  {path:'',component:AllUtilisateursComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AllUtilisateursRoutingModule { }
