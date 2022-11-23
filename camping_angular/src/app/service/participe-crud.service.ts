import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { randonner } from './randonner';
const baseUrl = 'http://localhost:8080/participe';
@Injectable({
  providedIn: 'root'
})
export class ParticipeCrudService {

  constructor(private http: HttpClient) { }

  getAll(): Observable<randonner[]> {
    return this.http.get<randonner[]>(baseUrl+"/all");
  }

  get(id: any): Observable<randonner> {
    return this.http.get(`${baseUrl}/${id}`);
  }


  update(data: any): Observable<any> {
    return this.http.put(baseUrl , data);
  }

  delete(id: any): Observable<any> {
    return this.http.delete(`${baseUrl}/${id}`);
  }

  //deleteAll(): Observable<any> {
 //   return this.http.delete(baseUrl);
 // }

 // findByTitle(title: any): Observable<utilisateur[]> {
  //  return this.http.get<utilisateur[]>(`${baseUrl}?title=${title}`);
 // }

}
