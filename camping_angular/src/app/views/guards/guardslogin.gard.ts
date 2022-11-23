

import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { TokenStorageService } from 'src/app/service/token-storage.service';

@Injectable({
  providedIn: 'root'
})
export class GuardsloginGuard implements CanActivate {
  constructor(private as:TokenStorageService,private route:Router){

  }
    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean | 
                    UrlTree | Observable<boolean | UrlTree> | Promise<boolean | UrlTree> {
                        return new Promise((resolve,reject)=>{
                                  if (this.as.isLoggedIN()==true)
                                  {
                                    resolve(true)
                                  }
                                  else{
                                  //this.route.navigate([''],{queryParams:{returnUrl:state.url}})
                                  this.route.navigate(['/login'])
                                  resolve(false)
                                }
                                }

                        )
                    }
                }

// canAccees(
//     route: ActivatedRouteSnapshot,
//     state: RouterStateSnapshot): Observable<boolean | UrlTree> |
//                  Promise<boolean | UrlTree> | boolean | UrlTree {
//     return new Promise((resolve,reject)=>{
//       if (this.as.isLoggedIN()==true)
//       {
//         resolve(true)
//       }
//       else{
//       //this.route.navigate([''],{queryParams:{returnUrl:state.url}})
//       this.route.navigate(['/login'])
//       resolve(false)
//     }
//     }
//     )
//   }