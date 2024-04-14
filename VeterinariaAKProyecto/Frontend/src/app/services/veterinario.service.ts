import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Veterinario } from '../models/veterinario.model';  // Asegúrate de que este modelo tiene todos los campos que necesitas

@Injectable({
  providedIn: 'root'
})
export class VeterinarioService {
  private apiUrl = 'http://localhost:3000/api/veterinarios';
  private isAuthenticated = new BehaviorSubject<boolean>(false);
  private currentVeterinario = new BehaviorSubject<Veterinario | null>(null);

  constructor(private http: HttpClient,  private router: Router) {
    this.checkSession();
  }

  private checkSession(): void {
    const token = localStorage.getItem('token');
    const vetData = localStorage.getItem('veterinario');
  
    if (token) {
      this.isAuthenticated.next(true);
      if (vetData) {
        try {
          const vet = JSON.parse(vetData);
          this.currentVeterinario.next(vet);
        } catch (error) {
          console.error('Error parsing veterinarian data:', error);
        }
      }
    }
  }

  login(usuario: string, contrasena: string): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/login`, { Usuario: usuario, Contrasena: contrasena }, { withCredentials: true })
      .pipe(
        map(response => {
          if (response && response.token) {
            localStorage.setItem('token', response.token);
            localStorage.setItem('veterinario', JSON.stringify(response.veterinario));
            this.isAuthenticated.next(true);
            console.log('Setting current veterinarian:', response.veterinario);
            this.currentVeterinario.next(response.veterinario); // Suponiendo que la API devuelve un objeto 'veterinario'
            return response;
          }
          throw new Error('Authentication response is missing token or user data');
        }),
        catchError(error => {
          console.error('Login error:', error);
          return throwError(error);
        })
      );
  }

  getCurrentVeterinario(): Observable<Veterinario | null> {
    return this.currentVeterinario.asObservable();
  }

  logout() {
    localStorage.removeItem('token');
    localStorage.removeItem('veterinario');
    this.isAuthenticated.next(false);
    this.currentVeterinario.next(null);
    this.router.navigate(['/login']);
  }

  isLoggedIn(): Observable<boolean> {
    return this.isAuthenticated.asObservable();
  }

  updatePassword(currentPassword: string, newPassword: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/updatePassword`, {
      currentPassword,
      newPassword
    }).pipe(catchError(this.handleError));
  }
}
