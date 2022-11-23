import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { TokenStorageService } from 'src/app/service/token-storage.service';
import { UserCRUDService } from 'src/app/service/user-crud.service';

@Injectable({
  providedIn: 'root'
})
export class GuardsadminGuard implements CanActivate {
  constructor(private as:TokenStorageService,private route:Router){

  }
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> |
                 Promise<boolean | UrlTree> | boolean | UrlTree {
    return new Promise((resolve,reject)=>{
      if (this.as.isAdmin()==true)
      {
        resolve(true)
      }
      else{
      this.route.navigate(['/'],{queryParams:{returnUrl:state.url}})
      //this.route.navigate([''])
      resolve(false)
    }
    }
    )
  }


  
}
