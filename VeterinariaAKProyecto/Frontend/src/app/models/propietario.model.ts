export class Propietario {
    PropietarioID: number;
    Nombre: string;
    Direccion: string;
    Telefono: string;
    CorreoElectronico: string;
  
    constructor(
      propietarioID: number,
      nombre: string,
      direccion: string,
      telefono: string,
      correoElectronico: string
    ) {
      this.PropietarioID = propietarioID;
      this.Nombre = nombre;
      this.Direccion = direccion;
      this.Telefono = telefono;
      this.CorreoElectronico = correoElectronico;
    }
  }
  