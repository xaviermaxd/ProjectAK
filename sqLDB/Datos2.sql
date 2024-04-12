DELIMITER //
CREATE PROCEDURE sp_InsertVeterinario(IN _Nombre VARCHAR(255), IN _Usuario VARCHAR(255), IN _Contrasena VARCHAR(255), IN _Especialidad VARCHAR(255), IN _Telefono VARCHAR(20), IN _CorreoElectronico VARCHAR(255))
BEGIN
    INSERT INTO Veterinarios (Nombre, Usuario, Contrasena, Especialidad, Telefono, CorreoElectronico) VALUES (_Nombre, _Usuario, _Contrasena, _Especialidad, _Telefono, _CorreoElectronico);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_UpdateVeterinario(IN _VeterinarioID INT, IN _Nombre VARCHAR(255), IN _Usuario VARCHAR(255), IN _Contrasena VARCHAR(255), IN _Especialidad VARCHAR(255), IN _Telefono VARCHAR(20), IN _CorreoElectronico VARCHAR(255))
BEGIN
    UPDATE Veterinarios SET Nombre = _Nombre, Usuario = _Usuario, Contrasena = _Contrasena, Especialidad = _Especialidad, Telefono = _Telefono, CorreoElectronico = _CorreoElectronico WHERE VeterinarioID = _VeterinarioID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_DeleteVeterinario(IN _VeterinarioID INT)
BEGIN
    DELETE FROM Veterinarios WHERE VeterinarioID = _VeterinarioID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_GetAllVeterinarios()
BEGIN
    SELECT * FROM Veterinarios;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE sp_FindVeterinarioByID(IN _VeterinarioID INT)
BEGIN
    SELECT * FROM Veterinarios WHERE VeterinarioID = _VeterinarioID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_FindVeterinarioByUsuario(IN _Usuario VARCHAR(255))
BEGIN
    SELECT * FROM Veterinarios WHERE Usuario = _Usuario;
END //
DELIMITER ;




----------------Procedimeinto almacenado de Propietarios

-- Procedimiento para obtener todos los propietarios
DELIMITER //
CREATE PROCEDURE sp_GetAllPropietarios()
BEGIN
    SELECT * FROM Propietarios;
END //
DELIMITER ;

-- Procedimiento para insertar un nuevo propietario
DELIMITER //
CREATE PROCEDURE sp_InsertPropietario(IN _Nombre VARCHAR(255), IN _Direccion VARCHAR(255), IN _Telefono VARCHAR(20), IN _CorreoElectronico VARCHAR(255))
BEGIN
    INSERT INTO Propietarios (Nombre, Direccion, Telefono, CorreoElectronico) VALUES (_Nombre, _Direccion, _Telefono, _CorreoElectronico);
END //
DELIMITER ;

-- Procedimiento para actualizar un propietario
DELIMITER //
CREATE PROCEDURE sp_UpdatePropietario(IN _PropietarioID INT, IN _Nombre VARCHAR(255), IN _Direccion VARCHAR(255), IN _Telefono VARCHAR(20), IN _CorreoElectronico VARCHAR(255))
BEGIN
    UPDATE Propietarios SET Nombre = _Nombre, Direccion = _Direccion, Telefono = _Telefono, CorreoElectronico = _CorreoElectronico WHERE PropietarioID = _PropietarioID;
END //
DELIMITER ;

-- Procedimiento para eliminar un propietario
DELIMITER //
CREATE PROCEDURE sp_DeletePropietario(IN _PropietarioID INT)
BEGIN
    DELETE FROM Propietarios WHERE PropietarioID = _PropietarioID;
END //
DELIMITER ;

-- Procedimiento para encontrar un propietario por ID
DELIMITER //
CREATE PROCEDURE sp_FindPropietarioByID(IN _PropietarioID INT)
BEGIN
    SELECT * FROM Propietarios WHERE PropietarioID = _PropietarioID;
END //
DELIMITER ;

-- Procedimiento para encontrar un propietario por nombre
DELIMITER //
CREATE PROCEDURE sp_FindPropietarioByNombre(IN _Nombre VARCHAR(255))
BEGIN
    SELECT * FROM Propietarios WHERE Nombre LIKE CONCAT('%', _Nombre, '%');
END //
DELIMITER ;


------------------------Procedimeintos almacenado de Mascotas

DELIMITER //
CREATE PROCEDURE sp_AllGetMascotas()
BEGIN
    SELECT m.*, p.Nombre AS PropietarioNombre, p.Telefono AS PropietarioTelefono
    FROM Mascotas m
    JOIN Propietarios p ON m.PropietarioID = p.PropietarioID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_InsertMascota(IN _PropietarioID INT, IN _Nombre VARCHAR(255), IN _Especie VARCHAR(50), IN _Raza VARCHAR(50), IN _Sexo VARCHAR(10), IN _FechaNacimiento DATE, IN _Color VARCHAR(50), IN _Alergias VARCHAR(255))
BEGIN
    INSERT INTO Mascotas (PropietarioID, Nombre, Especie, Raza, Sexo, FechaNacimiento, Color, Alergias)
    VALUES (_PropietarioID, _Nombre, _Especie, _Raza, _Sexo, _FechaNacimiento, _Color, _Alergias);
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE sp_UpdateMascota(IN _MascotaID INT, IN _PropietarioID INT, IN _Nombre VARCHAR(255), IN _Especie VARCHAR(50), IN _Raza VARCHAR(50), IN _Sexo VARCHAR(10), IN _FechaNacimiento DATE, IN _Color VARCHAR(50), IN _Alergias VARCHAR(255))
BEGIN
    UPDATE Mascotas
    SET PropietarioID = _PropietarioID, Nombre = _Nombre, Especie = _Especie, Raza = _Raza, Sexo = _Sexo, FechaNacimiento = _FechaNacimiento, Color = _Color, Alergias = _Alergias
    WHERE MascotaID = _MascotaID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_DeleteMascota(IN _MascotaID INT)
BEGIN
    DELETE FROM Mascotas WHERE MascotaID = _MascotaID;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE sp_FindMascotaByID(IN _MascotaID INT)
BEGIN
    SELECT m.*, p.Nombre AS PropietarioNombre, p.Telefono AS PropietarioTelefono
    FROM Mascotas m
    JOIN Propietarios p ON m.PropietarioID = p.PropietarioID
    WHERE m.MascotaID = _MascotaID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_FindMascotaByNombre(IN _Nombre VARCHAR(255))
BEGIN
    SELECT m.*, p.Nombre AS PropietarioNombre, p.Telefono AS PropietarioTelefono
    FROM Mascotas m
    JOIN Propietarios p ON m.PropietarioID = p.PropietarioID
    WHERE m.Nombre LIKE CONCAT('%', _Nombre, '%');
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE sp_FindMascotaByPropietarioNombre(IN _NombrePropietario VARCHAR(255))
BEGIN
    SELECT 
        m.MascotaID,
        m.Nombre AS MascotaNombre,
        m.Especie,
        m.Raza,
        m.Sexo,
        m.FechaNacimiento,
        m.Color,
        m.Alergias,
        p.Nombre AS PropietarioNombre,
        p.Telefono AS PropietarioTelefono
    FROM Mascotas m
    JOIN Propietarios p ON m.PropietarioID = p.PropietarioID
    WHERE p.Nombre LIKE CONCAT('%', _NombrePropietario, '%');
END //
DELIMITER ;































