import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MesAnnonceComponent } from './Mes-annonce/Mes-annonce.component';

const routes: Routes = [
  {path:'',component:MesAnnonceComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MesAnnonceRoutingModule { }
