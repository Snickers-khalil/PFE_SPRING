import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EditProfilComponent } from './edit-profil/edit-profil.component';
import { ProfilComponent } from './profil/profil.component';

const routes: Routes = [
  {path:'',component:ProfilComponent},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProfilRoutingModule { }
