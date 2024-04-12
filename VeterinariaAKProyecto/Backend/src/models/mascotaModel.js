const db = require('../config/db'); // Ajusta la ruta según tu estructura

class Mascota {
    static findAll() {
        return db.execute('CALL sp_AllGetMascotas()');
    }

    static findById(id) {
        return db.execute('CALL sp_FindMascotaByID(?)', [id]);
    }

    static findByNombre(nombre) {
        return db.execute('CALL sp_FindMascotaByNombre(?)', [nombre]);
    }

    static findByEspecie(especie) {
        return db.execute('CALL sp_FindMascotaByEspecie(?)', [especie]);
    }

    static findByRaza(raza) {
        return db.execute('CALL sp_FindMascotaByRaza(?)', [raza]);
    }

    static findByPropietarioNombre(nombrePropietario) {
        return db.execute('CALL sp_FindPropietarioByNombre(?)', [nombrePropietario]);
    }

    static create(newMascota) {
        return db.execute(
            'CALL sp_InsertMascota(?, ?, ?, ?, ?, ?, ?, ?)',
            [newMascota.PropietarioID, newMascota.Nombre, newMascota.Especie, newMascota.Raza, newMascota.Sexo, newMascota.FechaNacimiento, newMascota.Color, newMascota.Alergias]
        );
    }

    static update(id, mascota) {
        return db.execute(
            'CALL sp_UpdateMascota(?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [id, mascota.PropietarioID, mascota.Nombre, mascota.Especie, mascota.Raza, mascota.Sexo, mascota.FechaNacimiento, mascota.Color, mascota.Alergias]
        );
    }

    static delete(id) {
        return db.execute('CALL sp_DeleteMascota(?)', [id]);
    }
}

module.exports = Mascota;
