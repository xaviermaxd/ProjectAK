import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';

const routes: Routes = [

  { path: '', redirectTo: '/login', pathMatch: 'full' }, // Redirige la ruta raíz al componente de login
  { path: 'login', component: LoginComponent }, // Define la ruta para el componente de login
  // ... puedes añadir aquí otras rutas para otros componentes
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
