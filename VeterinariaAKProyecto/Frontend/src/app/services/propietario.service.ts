import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PropietarioService {
  private apiUrl = 'http://localhost:3000/api/propietarios';

  constructor(private http: HttpClient) { }

  getAllPropietarios(): Observable<any> {
    const token = localStorage.getItem('token'); // Obtener el token almacenado

    // Agregar el token al encabezado de autorización
    const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);

    return this.http.get<any>(this.apiUrl, { headers });
  }

  deletePropietario(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`);
  }

  updatePropietario(id: number, propietario: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, propietario);
  }
}
