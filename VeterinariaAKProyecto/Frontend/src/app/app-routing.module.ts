// src/app/app-routing.module.ts
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { InicioComponent } from './components/inicio/inicio.component';
import { PerfilComponent } from './components/perfil/perfil.component';
import { AuthGuard } from './guards/auth.guard';

const routes: Routes = [

  { path: 'login', component: LoginComponent },
  { path: 'inicio', component: InicioComponent}, // Protege esta ruta con AuthGuard
  { path: 'perfil', component: PerfilComponent },
  { path: '', redirectTo: '/login', pathMatch: 'full' }
  // ... puedes añadir aquí otras rutas para otros componentes
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
