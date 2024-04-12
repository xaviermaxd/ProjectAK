// controllers/veterinarioController.js
const Veterinario = require('../models/veterinarioModel');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

exports.getAllVeterinarios = async (req, res) => {
    try {
        const [veterinarios, _] = await Veterinario.findAll();
        res.status(200).json(veterinarios);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener veterinarios", error: error });
    }
};

exports.getVeterinario = async (req, res) => {
    try {
        const [veterinario, _] = await Veterinario.findById(req.params.id);
        res.status(200).json(veterinario[0]);
    } catch (error) {
        res.status(500).json({ message: "Error al obtener veterinario", error: error });
    }
};

exports.createVeterinario = async (req, res) => {
    try {
        const hash = await bcrypt.hash(req.body.Contrasena, 12);
        const newVet = new Veterinario({
            Nombre: req.body.Nombre,
            Usuario: req.body.Usuario,
            Contrasena: hash,
            Especialidad: req.body.Especialidad,
            Telefono: req.body.Telefono,
            CorreoElectronico: req.body.CorreoElectronico
        });

        await Veterinario.create(newVet);
        res.status(201).json({ message: "Veterinario creado" });
    } catch (error) {
        console.error("Error al crear veterinario:", error); // Imprime el error completo en la consola del servidor
        res.status(500).json({
            message: "Error al crear veterinario",
            error: error.message, // Envía solo el mensaje de error al cliente, no el stack completo
            stack: error.stack // Opcional: incluir el stack si es necesario para debugging profundo (no recomendado en producción)
        });
    }
};

exports.updateVeterinario = async (req, res) => {
    try {
        const hash = await bcrypt.hash(req.body.Contrasena, 12);
        const vet = {
            Nombre: req.body.Nombre,
            Usuario: req.body.Usuario,
            Contrasena: hash,
            Especialidad: req.body.Especialidad,
            Telefono: req.body.Telefono,
            CorreoElectronico: req.body.CorreoElectronico
        };

        await Veterinario.update(req.params.id, vet);
        res.status(200).json({ message: "Veterinario actualizado" });
    } catch (error) {
        res.status(500).json({ message: "Error al actualizar veterinario", error: error });
    }
};

exports.deleteVeterinario = async (req, res) => {
    try {
        await Veterinario.delete(req.params.id);
        res.status(200).json({ message: "Veterinario eliminado" });
    } catch (error) {
        res.status(500).json({ message: "Error al eliminar veterinario", error: error });
    }
};



// exports.login = async (req, res) => {
//     try {
//         const [vet, _] = await Veterinario.findByUsuario(req.body.Usuario);
//         if (vet.length > 0) {
//             const isValid = await bcrypt.compare(req.body.Contrasena, vet[0].Contrasena);
//             if (isValid) {
//                 const token = jwt.sign(
//                     { VeterinarioID: vet[0].VeterinarioID, Nombre: vet[0].Nombre, Usuario: vet[0].Usuario, Telefono: vet[0].Telefono },
//                     'secret', // Asegúrate de usar una clave secreta segura y configurada externamente
//                     { expiresIn: '1m' }
//                 );
//                 res.cookie('token', token, { httpOnly: true });
//                 res.status(200).json({ message: "Autenticación exitosa", token: token });
//             } else {
//                 res.status(401).json({ message: "Contraseña incorrecta" });
//             }
//         } else {
//             res.status(404).json({ message: "Usuario no encontrado" });
//         }
//     } catch (error) {
//         console.error("Error en el proceso de login:", error);
//         res.status(500).json({ message: "Error en la autenticación", error: error.message });
//     }
// };

exports.login = async (req, res) => {
    try {
        const vets = await Veterinario.findByUsuario(req.body.Usuario);
        if (vets && vets.length > 0) {
            const vet = vets[0]; // Asume que el primer resultado es el veterinario correcto
            const isValid = await bcrypt.compare(req.body.Contrasena, vet.Contrasena);
            if (isValid) {
                const token = jwt.sign(
                    { VeterinarioID: vet.VeterinarioID, Nombre: vet.Nombre, Usuario: vet.Usuario, Telefono: vet.Telefono },
                    'secret', // Cambia 'secret' por tu clave secreta real
                    { expiresIn: '1h' } // O el tiempo que consideres necesario
                );
                res.cookie('token', token, { httpOnly: true });
                res.status(200).json({ message: "Autenticación exitosa", token: token });
            } else {
                res.status(401).json({ message: "Contraseña incorrecta" });
            }
        } else {
            res.status(404).json({ message: "Usuario no encontrado" });
        }
    } catch (error) {
        console.error("Error en el proceso de login:", error);
        res.status(500).json({ message: "Error en la autenticación", error: error.message });
    }
};


