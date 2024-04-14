import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, throwError  } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PropietarioService {
  private apiUrl = 'http://localhost:3000/api/propietarios';

  constructor(private http: HttpClient) { }

  getAllPropietarios(offset: number, limit: number): Observable<any> {
    const token = localStorage.getItem('token'); // Obtener el token almacenado
  
    // Agregar el token al encabezado de autorización
    const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);
  
    // Verificar si offset y limit son números válidos antes de enviar la solicitud
    if (!isNaN(offset) && !isNaN(limit)) {
      // Pasar los parámetros de offset y limit en la URL
      const params = new HttpParams()
        .set('offset_param', offset.toString())
        .set('limit_param', limit.toString());
  
      return this.http.get<any>(this.apiUrl, { headers, params });
    } else {
      console.error('Offset y limit deben ser números válidos.');
      return throwError('Offset y limit deben ser números válidos.');
    }
  }
  

  searchByName(nombre: string): Observable<any> {
    const token = localStorage.getItem('token'); // Obtener el token almacenado

    // Agregar el token al encabezado de autorización
    const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);

    // Agregar el parámetro de nombre a la URL
    const params = new HttpParams().set('nombre', nombre);

    return this.http.get<any>(`${this.apiUrl}/search`, { headers, params });
  }

  getOwnersPerPage(offset: number, limit: number): Observable<any> {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders().set('Authorization', `Bearer ${token}`);
    const params = new HttpParams()
        .set('offset', offset.toString())
        .set('limit', limit.toString());
  
    return this.http.get<any>(`${this.apiUrl}/pagination`, { headers, params });
  }
  
  

  deletePropietario(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`);
  }

  updatePropietario(id: number, propietario: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, propietario);
  }
}

