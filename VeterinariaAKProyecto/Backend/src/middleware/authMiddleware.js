// middleware/authMiddleware.js
const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
    const openPaths = [
        '/api/veterinarios/login',
        '/api/veterinarios' 
    ];

    if (openPaths.includes(req.path)) {
        return next();
    }

    const token = req.cookies.token || req.headers.authorization?.split(' ')[1];
    if (!token) {
        return res.status(403).json({ message: "No token provided" });
    }
    
    try {
        const decoded = jwt.verify(token, 'secret');
        req.veterinario = decoded;
        next();
    } catch (error) {
        return res.status(401).json({ message: "Unauthorized", error: error.message });
    }
};

module.exports = authMiddleware;
