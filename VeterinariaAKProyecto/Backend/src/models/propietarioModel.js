const db = require('../config/db');

class Propietario {

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

    static findAll(offset, limit) {
        return db.execute('CALL sp_GetAllPropietarios(?, ?)', [offset, limit]);
    }

    static countAll() {
        return db.execute('CALL sp_CountAllPropietarios()');
    }
    
}


module.exports = Propietario;
