const express = require('express');
const router = express.Router();
const propietarioController = require('../controllers/propietarioController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/', authMiddleware, propietarioController.getAllPropietarios);
router.get('/:id', authMiddleware, propietarioController.getPropietario);
router.post('/', authMiddleware, propietarioController.createPropietario);
router.put('/:id', authMiddleware, propietarioController.updatePropietario);
router.delete('/:id', authMiddleware, propietarioController.deletePropietario);

module.exports = router;
