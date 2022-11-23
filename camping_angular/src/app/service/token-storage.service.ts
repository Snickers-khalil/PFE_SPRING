import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { JwtHelperService } from "@auth0/angular-jwt";

const TOKEN_KEY = 'auth-token';
const USER_KEY = 'auth-user';

@Injectable({
  providedIn: 'root'
})
export class TokenStorageService {

  helper = new JwtHelperService();
  constructor(private http:HttpClient) { }

  signOut(): void {
    //sessionStorage.clear();
    localStorage.clear();
  }

  public saveToken(token: string): void {
    //sessionStorage.removeItem(TOKEN_KEY);
    //sessionStorage.setItem(TOKEN_KEY, token);
    localStorage.removeItem(USER_KEY);
    localStorage.setItem(TOKEN_KEY, token);
  }

  public getToken(): string |null {
    return localStorage.getItem(TOKEN_KEY);
   // return sessionStorage.getItem(TOKEN_KEY);
  }

  public saveUser(user: any): void {
    localStorage.removeItem(USER_KEY);
    localStorage.setItem(USER_KEY, JSON.stringify(user));
    //sessionStorage.removeItem(USER_KEY);
    //sessionStorage.setItem(USER_KEY, JSON.stringify(user));
  }

  public getUser(): string[]|any{
    return JSON.parse(localStorage.getItem(USER_KEY)|| '{}');
   // return JSON.parse(sessionStorage.getItem(USER_KEY)|| '{}');
  }
  
  isLoggedIN(){
    let token:any=localStorage.getItem(TOKEN_KEY)
    let decodeToken=this.helper.decodeToken(token)
    if (!localStorage.getItem(TOKEN_KEY))
    {
      return false
    }
    return true
  }
   
  isAdmin(){
    let token:any=localStorage.getItem(TOKEN_KEY)
    let roletoken: any = localStorage.getItem(USER_KEY);
    let decodeToken=this.helper.decodeToken(token)

    if (!localStorage.getItem(TOKEN_KEY))
    {
      return false
    }
    let role=roletoken.roles
    if (role=='ADMIN'){
      return false
    }
    if (this.helper.isTokenExpired(token)){
      return false
    }
    return true
  }
}
