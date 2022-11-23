import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FavorisRoutingModule } from './favoris-routing.module';
import { FavorisComponent } from './favoris/favoris.component';


@NgModule({
  declarations: [
    FavorisComponent
  ],
  imports: [
    CommonModule,
    FavorisRoutingModule
  ]
})
export class FavorisModule { }
