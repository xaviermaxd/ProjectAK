import { Component, OnInit } from '@angular/core';
import { PropietarioService } from '../../services/propietario.service';


@Component({
  selector: 'app-propietario',
  templateUrl: './propietario.component.html',
  styleUrls: ['./propietario.component.css']
})
export class PropietarioComponent implements OnInit {
  propietarios: any[] = [];
  nombreBusqueda: string = '';
  paginaActual: number = 1;
  resultadosPorPagina: number = 4; // Cambia este valor según tus necesidades
  totalPropietarios?: number;
  totalPaginas?: number;

  constructor(private propietarioService: PropietarioService) { }

  ngOnInit(): void {
    this.loadPropietarios();
    console.log(this.loadPropietarios());
  }

  loadPropietarios(offset: number = 0, limit: number = this.resultadosPorPagina) {
    this.propietarioService.getAllPropietarios(offset, limit).subscribe(
      (data: any) => {
        this.propietarios = data.propietarios[0]; // Asignamos los propietarios directamente desde la respuesta
        this.totalPropietarios = data.totalPropietarios[0][0]?.total_propietarios; // Accedemos a totalPropietarios desde la respuesta
        if (this.totalPropietarios !== undefined) {
          this.totalPaginas = Math.ceil(this.totalPropietarios / this.resultadosPorPagina);
        } else {
          console.error('Error: totalPropietarios es undefined');
        }
      },
      error => {
        console.error('Error al obtener propietarios:', error);
      }
    );
  }
  
  searchOwner() {
    if (this.nombreBusqueda.trim() !== '') {
      this.propietarioService.searchByName(this.nombreBusqueda).subscribe(
        (data: any) => {
          // El primer elemento del array es el array de propietarios encontrados
          this.propietarios = data[0];
        },
        error => {
          console.error('Error al buscar propietario por nombre:', error);
        }
      );
    } else {
      // Si el campo de búsqueda está vacío, volvemos a cargar todos los propietarios
      this.loadPropietarios();
    }
  }

  changePage(pagina: number) {
    this.paginaActual = pagina;
    const offset = (this.paginaActual - 1) * this.resultadosPorPagina;
    this.loadPropietarios(offset); // Llamamos a loadPropietarios con el nuevo offset
  }
  
  
  isLastPage(): boolean {
    // Verificar si totalPaginas no es indefinido antes de realizar la comparación
    if (this.totalPaginas !== undefined && this.totalPaginas > 0) {
      return this.paginaActual >= this.totalPaginas;
    } else {
      // Si totalPaginas es indefinido o 0, asumir que es la última página
      return true;
    }
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
