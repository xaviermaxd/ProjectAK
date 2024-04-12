const Propietario = require('../models/propietarioModel');

exports.getAllPropietarios = async (req, res) => {
    try {
        const [propietarios, _] = await Propietario.findAll();
        res.status(200).json(propietarios);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener propietarios", error: error });
    }
};

exports.getPropietario = async (req, res) => {
    try {
        const [propietario, _] = await Propietario.findById(req.params.id);
        if (propietario.length > 0) {
            res.status(200).json(propietario[0]);
        } else {
            res.status(404).json({ message: "Propietario no encontrado" });
        }
    } catch (error) {
        res.status(500).json({ message: "Error al obtener propietario", error: error });
    }
};

exports.createPropietario = async (req, res) => {
    try {
        const { Nombre, Direccion, Telefono, CorreoElectronico } = req.body;
        const result = await Propietario.create({ Nombre, Direccion, Telefono, CorreoElectronico });
        res.status(201).json({ message: "Propietario creado exitosamente", result: result });
    } catch (error) {
        res.status(500).json({ message: "Error al crear propietario", error: error });
    }
};

exports.updatePropietario = async (req, res) => {
    try {
        const { Nombre, Direccion, Telefono, CorreoElectronico } = req.body;
        const result = await Propietario.update(req.params.id, { Nombre, Direccion, Telefono, CorreoElectronico });
        res.status(200).json({ message: "Propietario actualizado exitosamente", result: result });
    } catch (error) {
        res.status(500).json({ message: "Error al actualizar propietario", error: error });
    }
};

exports.deletePropietario = async (req, res) => {
    try {
        const result = await Propietario.delete(req.params.id);
        res.status(200).json({ message: "Propietario eliminado exitosamente", result: result });
    } catch (error) {
        res.status(500).json({ message: "Error al eliminar propietario", error: error });
    }
};

exports.findPropietarioByNombre = async (req, res) => {
    try {
        const { nombre } = req.params;
        const [propietario, _] = await Propietario.findByNombre(nombre);
        if (propietario.length > 0) {
            res.status(200).json(propietario);
        } else {
            res.status(404).json({ message: "Propietario no encontrado" });
        }
    } catch (error) {
        res.status(500).json({ message: "Error al buscar propietario por nombre", error: error });
    }
};
