import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { randonner } from './randonner';

const baseUrl = 'http://localhost:8080/rand';
@Injectable({
  providedIn: 'root'
})
export class RandCrudService {

constructor(private http: HttpClient) { }

  getRandonners(): Observable<randonner[]> {
    return this.http.get<randonner[]>(baseUrl+"/all");
  }

  getRandonner(id: any): Observable<randonner> {
    return this.http.get(`${baseUrl}/${id}`);
  }

   addRandonner(randonner: any, id:any) {
    return this.http.post(`${baseUrl}/add/`+id,randonner);
  }

  updateRandonner(data: any,id:any): Observable<any> {
    return this.http.put(`${baseUrl}/`+id , data);
  }

  deleteRandonner(id: any): Observable<any> {
    return this.http.delete(`${baseUrl}/${id}`);
  }
  public participeRandonner(idU:any,idR:any):Observable<any> {
    return this.http.post<any>('http://localhost:8080/particip/add_pr/'+idU+'/'+idR,idR)
  }
  
}
