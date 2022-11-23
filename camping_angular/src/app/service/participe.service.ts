import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
const AUTH_API = 'http://localhost:8080/participe';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};
@Injectable({
  providedIn: 'root'
})
export class ParticipeService {

  constructor(private http: HttpClient) { }

  register(part:any): Observable<any> {
    return this.http.post(AUTH_API + '/add', {
      firstname:part.firstname,
      lastname:part.lastname,
      nbr_gens:part.nbr_gens,
      phone:part.phone,
    
    }, httpOptions);
  }}
