// src/app/components/menu/menu.component.ts
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css']
})
export class MenuComponent {

  constructor(private authService: AuthService, private router: Router) {}

  logout() {
    this.authService.logout(); // Limpia el token de la sesión
    this.router.navigate(['/login']); // Redirige al usuario al login
  }
}
