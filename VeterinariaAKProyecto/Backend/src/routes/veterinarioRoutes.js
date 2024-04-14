// routes/veterinarioRoutes.js
const express = require('express');
const router = express.Router();
const veterinarioController = require('../controllers/veterinarioController');
const authMiddleware = require('../middleware/authMiddleware');

// Rutas que no requieren autenticación
router.post('/login', veterinarioController.login);
router.post('/', veterinarioController.createVeterinario); // Si esta es para crear y no debe estar protegida

// Aplica el middleware de autenticación a todas las demás rutas que sí lo requieren
router.use(authMiddleware);

// Rutas que requieren autenticación
router.get('/',veterinarioController.getAllVeterinarios);
router.get('/:id', veterinarioController.getVeterinario);
router.put('/:id', veterinarioController.updateVeterinario);
router.delete('/:id', veterinarioController.deleteVeterinario);
router.put('/:id/updateinfo', veterinarioController.updateVeterinarioInfo);
router.put('/:id/updatepassword', veterinarioController.updateVeterinarioPassword);
router.get('/logout', veterinarioController.logout);


module.exports = router;
