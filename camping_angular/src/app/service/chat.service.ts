import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';


const baseUrl = 'http://localhost:8080/message';
@Injectable({
  providedIn: 'root'
})
export class ChatService {

  constructor(private http: HttpClient) { }

  public getMsgs(): Observable<any[]> {
    return this.http.get<any[]>(`${baseUrl}/AllMessage`);
  }
  public SendMsg(id:any,msg: any): Observable<any> {
    return this.http.post<any>(`${baseUrl}/addMessage/`+id, msg);
  }

  public updateMsg(id:any,msg: any): Observable<any> {
    return this.http.put<any>(`${baseUrl}/updateMessage/`+id, msg);
  }

  public deleteMsg(id: any): Observable<void> {
    return this.http.delete<void>(`${baseUrl}/deleteMessage/${id}`);
  }
}
