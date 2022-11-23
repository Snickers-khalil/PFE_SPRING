import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminlayoutComponent } from './layouts/adminlayout/adminlayout.component';
import { UserlayoutComponent } from './layouts/userlayout/userlayout.component';
import { GuardsadminGuard } from './views/guards/guardsadmin.guard';
import { GuardsloginGuard } from './views/guards/guardslogin.gard';
const routes: Routes = [
  {path:'',component:UserlayoutComponent,children:[
    {path:'',loadChildren:()=>import('./views/user/home/home.module').then(m=>m.HomeModule)},
    {path:'login',loadChildren:()=>import('./views/user/signin/signin.module').then(m=>m.SigninModule)},
    {path:'register',loadChildren:()=>import('./views/user/signup/signup.module').then(m=>m.SignupModule)},
    {path:'profil',loadChildren:()=>import('./views/user/profil/profil.module').then(m=>m.ProfilModule),canActivate:[GuardsloginGuard]},
    {path:'shop',loadChildren:()=>import('./views/user/shop/shop.module').then(m=>m.ShopModule)},
    {path:'mesannonce',loadChildren:()=>import('./views/user/add-annonce/add-annonce.module').then(m=>m.AddAnnonceModule),canActivate:[GuardsloginGuard]},
    {path:'contacter',loadChildren:()=>import('./views/user/contacter/contacter.module').then(m=>m.ContacterModule)},
    {path:'detail',loadChildren:()=>import('./views/user/detaill-shop/detaill-shop.module').then(m=>m.DetaillShopModule)},
    {path:'events',loadChildren:()=>import('./views/user/events/events.module').then(m=>m.EventsModule)}, 
    {path:'randonner',loadChildren:()=>import('./views/user/randonner/randonner.module').then(m=>m.RandonnerModule)}, 
   {path:'forbidden',loadChildren:()=>import('./views/user/forbidden/forbidden.module').then(m=>m.ForbiddenModule)},
   {path:'favoris',loadChildren:()=>import('./views/user/favoris/favoris.module').then(m=>m.FavorisModule),canActivate:[GuardsloginGuard]},
   {path:'particip_event',loadChildren:()=>import('./views/user/particip-event/particip-event.module').then(m=>m.ParticipEventModule)},
   {path:'particip_rand',loadChildren:()=>import('./views/user/particip-rand/particip-rand.module').then(m=>m.ParticipRandModule)},
   {path:'allpart',loadChildren:()=>import('./views/user/profil/all-particip/all-particip.module').then(m=>m.AllParticipModule)},
   {path:'chat',loadChildren:()=>import('./views/user/chat/chat.module').then(m=>m.ChatModule)}, 
   
   {path:'',redirectTo:'', pathMatch: 'full'} 
  ]},
  {path:'admin',component:AdminlayoutComponent,canActivate:[GuardsadminGuard],children:[
    {path:'dashboard',loadChildren:()=>import('./views/admin/dashboard/dashboard.module').then(m=>m.DashboardModule)},
    {path:'allusers',loadChildren:()=>import('./views/admin/all-utilisateurs/all-utilisateurs.module').then(m=>m.AllUtilisateursModule)},
    {path:'allannonces',loadChildren:()=>import('./views/admin/all-annonce/all-annonce.module').then(m=>m.AllAnnonceModule)},
    {path:'allevents',loadChildren:()=>import('./views/admin/all-event/all-event.module').then(m=>m.AllEventModule)},
    {path:'allronds',loadChildren:()=>import('./views/admin/all-rond/all-rond.module').then(m=>m.AllRondModule)},
    {path:'allpart',loadChildren:()=>import('./views/admin/all-particip/all-particip.module').then(m=>m.AllParticipModule)},
    {path:'adminlogin',loadChildren:()=>import('./views/admin/adminlogin/adminlogin.module').then(m=>m.AdminloginModule)},
    {path:'particip_event',loadChildren:()=>import('./views/admin/all-particip/particip-event/particip-event.module').then(m=>m.ParticipEventModule)},
    {path:'particip_rand',loadChildren:()=>import('./views/admin/all-particip/particip-rand/particip-rand.module').then(m=>m.ParticipRandModule)},
  
   
  ]},
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes,{scrollPositionRestoration:'enabled'})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
