import { Component, OnInit } from '@angular/core';
import { PropietarioService } from '../../services/propietario.service';

@Component({
  selector: 'app-propietario',
  templateUrl: './propietario.component.html',
  styleUrls: ['./propietario.component.css']
})
export class PropietarioComponent implements OnInit {
  propietarios: any[] = [];

  constructor(private propietarioService: PropietarioService) { }

  ngOnInit(): void {
    this.loadPropietarios();
  }

  loadPropietarios() {
    this.propietarioService.getAllPropietarios().subscribe(
      (data: any) => {
        // El primer elemento del array es el array de propietarios
        this.propietarios = data[0];
      },
      error => {
        console.error('Error al obtener propietarios:', error);
      }
    );
  }

  onDelete(id: number) {
    this.propietarioService.deletePropietario(id).subscribe(() => {
      this.loadPropietarios(); // Recargar los datos después de eliminar
    });
  }

  onEdit(propietario: any) {
    // Lógica para manejar la edición (puede ser un modal o un formulario en la misma página)
  }
}
