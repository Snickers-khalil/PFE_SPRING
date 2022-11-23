import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
const AUTH_API = 'http://localhost:8080/rand';
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};
@Injectable({
  providedIn: 'root'
})
export class RandonnerService {
  constructor(private http: HttpClient) { }

  register(rand:any): Observable<any> {
    return this.http.post(AUTH_API + '/add', {
      adress:rand.adress,
      programme:rand.programme,
      cercuit:rand.cercuit,
      difficult:rand.difficult,
      date:rand.date,
      imageUrl:rand.imageUrl,
    }, httpOptions);
  }


 
}
