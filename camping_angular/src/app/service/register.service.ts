import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';


const AUTH_API = 'http://localhost:8080/api/auth';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};
@Injectable({
  providedIn: 'root'
})
export class registerService {

  constructor(private http: HttpClient) { }

  register(user:any): Observable<any> {
    return this.http.post(AUTH_API + '/register', {
      firstname: user.firstname,
      lastname: user.lastname,
      username: user.username,
      email: user.email,
      password:user.password,
      phone: user.phone,
      city: user.city
    }, httpOptions);
  }
}


