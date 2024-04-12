const express = require('express');
const router = express.Router();
const mascotaController = require('../controllers/mascotaController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/', authMiddleware, mascotaController.getAllMascotas);
router.get('/:id', authMiddleware, mascotaController.getMascotaById);
router.post('/', authMiddleware, mascotaController.createMascota);
router.put('/:id', authMiddleware, mascotaController.updateMascota);
router.delete('/:id', authMiddleware, mascotaController.deleteMascota);
router.get('/by-propietario/:nombrePropietario', authMiddleware, mascotaController.getMascotasByPropietarioNombre);

module.exports = router;
