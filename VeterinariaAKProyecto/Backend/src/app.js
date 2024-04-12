// app.js
const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const veterinarioRoutes = require('./routes/veterinarioRoutes');
const propietarioRoutes = require('./routes/propietarioRoutes'); // Importar las rutas de propietarios
const mascotaRoutes = require('./routes/mascotaRoutes');

const app = express();

app.use(cors({
    origin: 'http://localhost:4200', // Asegúrate de ajustar esto si cambia el origen del cliente
    credentials: true // Permite el envío de cookies con las solicitudes (necesario para "credentials")
}));

app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Monta todas las rutas de veterinarios en '/api/veterinarios'
app.use('/api/veterinarios', veterinarioRoutes);

// Monta todas las rutas de propietarios en '/api/propietarios'
app.use('/api/propietarios', propietarioRoutes); // Asegúrate de que propietarioRoutes esté definido en otro archivo
app.use('/api/mascotas', mascotaRoutes); 

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
});

module.exports = app;
