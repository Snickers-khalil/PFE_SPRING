import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { roles } from '../models/roles.modul';
import { utilisateur } from '../models/utilisateur.model';

const baseUrl = 'http://localhost:8080/utilisateur';
@Injectable({
  providedIn: 'root'
})
export class UserCRUDService {

  public roles!:string[];

  constructor(private http: HttpClient) { }


  public allrole(): Observable<any[]> {
    return this.http.get<any[]>(baseUrl+"/allrole");
  }
  
  public alldemande(): Observable<any[]> {
    return this.http.get<any[]>('http://localhost:8080/demande/all');
  }
  
  public demande(idU:any):Observable<any>{
    return this.http.post<any>('http://localhost:8080/demande/add/'+idU,{})
  }
  refuser(id: any): Observable<any> {
    return this.http.delete('http://localhost:8080/demande/'+id);
  }

  getrole(id:any): Observable<roles> {
    return this.http.get(`http://localhost:8080/utilisateur/role/${id}`);
  }

  updatephoto(id:any,data: any): Observable<any> {
    return this.http.put<any>('http://localhost:8080/api/auth/updatePhoto/'+id , data);
  }

  getAll(): Observable<utilisateur[]> {
    return this.http.get<utilisateur[]>(baseUrl+"/all");
  }

  get(id: any): Observable<utilisateur> {
    return this.http.get(`${baseUrl}/${id}`);
  }

  update(data: any): Observable<any> {
    return this.http.put(baseUrl , data);
  }

  delete(id: BigInteger): Observable<any> {
    return this.http.delete(`${baseUrl}/${id}`);
  }

  isAdmin():Boolean{
    if (!this.roles) //this.roles== undefiened
    return false;
    return (this.roles.indexOf('ADMIN') >-1) ;
    }

    public getUsers(): Observable<utilisateur[]> {
    return this.http.get<utilisateur[]>(`${baseUrl}/all`);
    }

  public addUser(utilisateur: utilisateur): Observable<utilisateur> {
    return this.http.post<utilisateur>(`${baseUrl}/add`, utilisateur);
  }

  public updateUser(id:any,utilisateur: any): Observable<any> {
    return this.http.put<any>(`${baseUrl}/update/`+id,utilisateur);
  }

  public deleteUser(id: BigInteger): Observable<void> {
    return this.http.delete<void>(`${baseUrl}/${id}`);
  }

  changeRoleAdmin(id: any,value:any): Observable<any> {
    return this.http.put(`http://localhost:8080/utilisateur/changeradmin/`+id,value);
  }
  changeRoleRand(id: any,value:any): Observable<any> {
    return this.http.put(`http://localhost:8080/utilisateur/changerrandonneur/`+id,value);
  }
  changeRoleUser(id: any,user:any): Observable<any> {
    return this.http.put(`http://localhost:8080/utilisateur/changeruser/`+id,user);
  }

}
