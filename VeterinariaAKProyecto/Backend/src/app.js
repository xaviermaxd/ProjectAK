// app.js
const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const veterinarioRoutes = require('./routes/veterinarioRoutes');
const propietarioRoutes = require('./routes/propietarioRoutes');
const mascotaRoutes = require('./routes/mascotaRoutes');

const app = express();

app.use(cors({
    origin: 'http://localhost:4200', // o tu URL del frontend
    credentials: true, // para permitir el envío de cookies
    methods: ['GET', 'POST', 'PUT', 'DELETE']
}));

app.use(express.json()); // Middleware para parsear JSON, asegúrate de que esté antes de tus rutas
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Monta todas las rutas de veterinarios en '/api/veterinarios'
app.use('/api/veterinarios', veterinarioRoutes);
app.use('/api/propietarios', propietarioRoutes);
app.use('/api/mascotas', mascotaRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
});

module.exports = app;
