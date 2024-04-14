import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import Swal from 'sweetalert2';
import { VeterinarioService } from '../../services/veterinario.service';
import { Veterinario } from '../../models/veterinario.model';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.component.html',
  styleUrls: ['./perfil.component.css']
})
export class PerfilComponent implements OnInit {
  veterinario: Veterinario | null = null;
  changePasswordForm: FormGroup;

  constructor(
    private vetService: VeterinarioService, 
    private fb: FormBuilder, 
    private modalService: NgbModal
  ) {
    this.changePasswordForm = this.fb.group({
      currentPassword: ['', Validators.required],
      newPassword: ['', [Validators.required, Validators.minLength(6)]],
      confirmNewPassword: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.vetService.getCurrentVeterinario().subscribe(vet => {
      this.veterinario = vet;
    });
  }

  openChangePasswordModal(content: any) {
    this.modalService.open(content);
  }

  submitChangePassword() {
    if (this.changePasswordForm.valid && this.changePasswordForm.value.newPassword === this.changePasswordForm.value.confirmNewPassword) {
      // Confirm dialog
      Swal.fire({
        title: '¿Estás seguro?',
        text: "Confirma que deseas cambiar tu contraseña.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, cambiar!'
      }).then((result) => {
        if (result.isConfirmed) {
          this.vetService.updatePassword(
            this.changePasswordForm.value.currentPassword,
            this.changePasswordForm.value.newPassword
          ).subscribe({
            next: (response) => {
              Swal.fire(
                '¡Cambiada!',
                'Tu contraseña ha sido actualizada.',
                'success'
              );
            },
            error: (error) => {
              Swal.fire(
                'Error',
                'No se pudo cambiar la contraseña: ' + error.message,
                'error'
              );
            }
          });
        }
      });
    } else {
      Swal.fire(
        'Formulario inválido',
        'Por favor, asegúrate de que las contraseñas coincidan y cumplan con todos los requisitos.',
        'error'
      );
    }
  }
}
