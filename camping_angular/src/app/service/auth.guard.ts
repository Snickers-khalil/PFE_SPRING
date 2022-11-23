import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { UserCRUDService } from 'src/app/service/user-crud.service';
import { TokenStorageService } from './token-storage.service';
@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  
  isLoggedIn = false;
  roles: string[] = [];

constructor( private logs: UserCRUDService ,private router:Router ){}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    
      if (this.logs.isAdmin())
      return true;
      else
      {
      this.router.navigate(['forbidden']);
      return false;
      }
  }
 
}

