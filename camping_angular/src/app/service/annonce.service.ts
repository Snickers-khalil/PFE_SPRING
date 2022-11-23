import { Favoris } from 'src/app/models/favoris';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Annonce } from '../models/annonce.model';

const baseUrl = 'http://localhost:8080/annonce';
const favUrl= 'http://localhost:8080/favorie';
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};
@Injectable({
  providedIn: 'root'
})
export class AnnonceService {
  

constructor(private http: HttpClient) {}

  public getAnnonces(): Observable<Annonce[]> {
    return this.http.get<Annonce[]>(`${baseUrl}/all`);
  }

  public getMyAnnonces(id:any): Observable<Annonce[]> {
    return this.http.get<Annonce[]>('http://localhost:8080/annonce/myann/'+id);
  }
  
  updatephoto(id:any,data: any): Observable<any> {
    return this.http.put('http://localhost:8080/annonce/updateann/'+id , data);
  }

  get(id_ann: any): Observable<any> {
    return this.http.get(`${baseUrl}/${id_ann}`);
  }

public addAnnonce(annonce:any,id:any){
  return this.http.post('http://localhost:8080/annonce/add/'+id,annonce)
}

public updateAnnonce(annonce: any,id:any): Observable<any> {
  return this.http.put<Annonce>(`${baseUrl}/`+id, annonce);
}

public deleteAnnonce(id: any): Observable<void> {
  return this.http.delete<void>(`${baseUrl}/${id}`);
}

public favorie(idU:any,idA:any):Observable<any> {
  return this.http.post<any>('http://localhost:8080/favorie/add/'+idU+'/'+idA,{})
}

public isinfavorie(idU:any,idA:any):Observable<any> {
  return this.http.get<any>('http://localhost:8080/favorie/add/'+idU+'/'+idA,{})
}

//public getFavoris(): Observable<any[]> {
 // return this.http.get<any[]>("http://localhost:8080/favorie/all");
//}

public getFavoris(id:any): Observable<Favoris[]> {
  return this.http.get<Favoris[]>('http://localhost:8080/favorie/myfav/'+id);
}
public deleteFavoris(id: any): Observable<any> {
  return this.http.delete<any>(`http://localhost:8080/favorie/${id}`);
}

}
