import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DetaillShopComponent } from './detaill-shop/detaill-shop.component';

const routes: Routes = [
  {path:'',component:DetaillShopComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class DetaillShopRoutingModule { }
