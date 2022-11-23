import { participe } from 'src/app/models/participe';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { evenment } from '../models/evenment';

const baseUrl = 'http://localhost:8080/event';
@Injectable({
  providedIn: 'root'
})
export class EvCrudService {

  constructor(private http: HttpClient) { }

  public getEvenments(): Observable<evenment[]> {
    return this.http.get<evenment[]>(`${baseUrl}/all`);
  }

  get(id: number): Observable<any> {
    return this.http.get(`${baseUrl}/${id}`);
  }
 
  
public addEvenment(evenment: any,id:any) {
  return this.http.post(`${baseUrl}/add/`+id,evenment);
}

public updateEvenment(evenment: evenment,id:any): Observable<evenment> {
  return this.http.put<evenment>(`${baseUrl}/`+id, evenment);
}

public deleteEvenment(id: any): Observable<void> {
  return this.http.delete<void>(`${baseUrl}/${id}`);
}
public participeEvenment(idU:any,idE:any):Observable<any>  {
  return this.http.post<any>('http://localhost:8080/particip/add/'+idU+'/'+idE,idE)
}

public AllparticipeEvenment(): Observable<any[]> {
  return this.http.get<any[]>('http://localhost:8080/particip/all_pe');
}
public AllparticipeEven(id:any): Observable<participe[]> {
  return this.http.get<participe[]>('http://localhost:8080/particip/myev/'+id);
}
public Allparticiperand(id:any): Observable<participe[]> {
  return this.http.get<participe[]>('http://localhost:8080/particip/myran/'+id);
}

public deleteparticipe(id: any): Observable<void> {
  return this.http.delete<void>('http://localhost:8080/particip/de/'+id);
}
public AllparticipeRandonner(): Observable<any[]> {
  return this.http.get<any[]>('http://localhost:8080/particip/all_pr');
}

public deletepartRand(id: any): Observable<void> {
  return this.http.delete<void>('http://localhost:8080/particip/dr/'+id);
}
}
