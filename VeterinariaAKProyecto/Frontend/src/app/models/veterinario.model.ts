// src/app/models/veterinario.model.ts
export class Veterinario {
    VeterinarioID: number;
    Nombre: string;
    Usuario: string;
    Especialidad: string;
    Telefono: string;
    CorreoElectronico: string;
  
    // Contraseña removida del modelo
  
    constructor(veterinarioID: number, nombre: string, usuario: string, especialidad: string, telefono: string, correoElectronico: string) {
      this.VeterinarioID = veterinarioID;
      this.Nombre = nombre;
      this.Usuario = usuario;
      this.Especialidad = especialidad;
      this.Telefono = telefono;
      this.CorreoElectronico = correoElectronico;
    }
  }
  