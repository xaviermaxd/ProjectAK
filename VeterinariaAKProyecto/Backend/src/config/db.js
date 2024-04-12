const mysql = require('mysql2/promise');
const config = require('./config');

const pool = mysql.createPool(config.db);

const testConnection = async () => {
    try {
        const connection = await pool.getConnection();
        console.log('Conexión a la base de datos establecida con éxito');
        connection.release();
    } catch (error) {
        console.error('Error al conectar a la base de datos:', error.message);
    }
};

const execute = async (query, params) => {
    return pool.execute(query, params);
};

module.exports = {
    execute,
    testConnection,
};
