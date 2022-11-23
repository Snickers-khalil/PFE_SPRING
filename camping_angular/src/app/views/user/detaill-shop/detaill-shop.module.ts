import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { DetaillShopRoutingModule } from './detaill-shop-routing.module';
import { DetaillShopComponent } from './detaill-shop/detaill-shop.component';


@NgModule({
  declarations: [
    DetaillShopComponent
    
  ],
  imports: [
    CommonModule,
    DetaillShopRoutingModule
  ]
})
export class DetaillShopModule { }
