const db = require('../config/db');

class Propietario {
    static findAll() {
        return db.execute('CALL sp_GetAllPropietarios()');
    }

    static findById(id) {
        return db.execute('CALL sp_FindPropietarioByID(?)', [id]);
    }

    static findByNombre(nombre) {
        return db.execute('CALL sp_FindPropietarioByNombre(?)', [nombre]);
    }

    static create({ Nombre, Direccion, Telefono, CorreoElectronico }) {
        return db.execute(
            'CALL sp_InsertPropietario(?, ?, ?, ?)',
            [Nombre, Direccion, Telefono, CorreoElectronico]
        );
    }

    static update(id, { Nombre, Direccion, Telefono, CorreoElectronico }) {
        return db.execute(
            'CALL sp_UpdatePropietario(?, ?, ?, ?, ?)',
            [id, Nombre, Direccion, Telefono, CorreoElectronico]
        );
    }

    static delete(id) {
        return db.execute('CALL sp_DeletePropietario(?)', [id]);
    }
}

module.exports = Propietario;
