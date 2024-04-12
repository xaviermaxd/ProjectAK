const Mascota = require('../models/mascotaModel');

exports.getAllMascotas = async (req, res) => {
    try {
        const [mascotas, _] = await Mascota.findAll();
        res.json(mascotas);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener mascotas", error });
    }
};

exports.getMascotaById = async (req, res) => {
    try {
        const [mascota, _] = await Mascota.findById(req.params.id);
        if (mascota.length > 0) {
            res.json(mascota[0]);
        } else {
            res.status(404).send("Mascota no encontrada");
        }
    } catch (error) {
        res.status(500).json({ message: "Error al obtener la mascota", error });
    }
};

exports.createMascota = async (req, res) => {
    try {
        const result = await Mascota.create(req.body);
        res.status(201).json({ message: "Mascota creada con éxito", result });
    } catch (error) {
        res.status(500).json({ message: "Error al crear la mascota", error });
    }
};

exports.updateMascota = async (req, res) => {
    try {
        const result = await Mascota.update(req.params.id, req.body);
        res.status(200).json({ message: "Mascota actualizada con éxito", result });
    } catch (error) {
        res.status(500).json({ message: "Error al actualizar la mascota", error });
    }
};

exports.deleteMascota = async (req, res) => {
    try {
        await Mascota.delete(req.params.id);
        res.status(200).json({ message: "Mascota eliminada con éxito" });
    } catch (error) {
        res.status(500).json({ message: "Error al eliminar la mascota", error });
    }
};

exports.getMascotasByPropietarioNombre = async (req, res) => {
    try {
        const [mascotas, _] = await Mascota.findByPropietarioNombre(req.params.nombrePropietario);
        res.json(mascotas);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener mascotas por nombre de propietario", error });
    }
};
