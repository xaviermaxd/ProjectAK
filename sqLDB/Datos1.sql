Create database VeterinariaAKDB

use VeterinariaAKDB;

CREATE TABLE Propietarios (
    PropietarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    CorreoElectronico VARCHAR(255)
);

CREATE TABLE Mascotas (
    MascotaID INT AUTO_INCREMENT PRIMARY KEY,
    PropietarioID INT,
    Nombre VARCHAR(255),
    Especie VARCHAR(50),
    Raza VARCHAR(50),
    Sexo VARCHAR(10),
    FechaNacimiento DATE,
    Color VARCHAR(50),
    Alergias VARCHAR(255),
    FOREIGN KEY (PropietarioID) REFERENCES Propietarios(PropietarioID)
);

CREATE TABLE Veterinarios (
    VeterinarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Usuario VARCHAR(255),
    Contrasena VARCHAR(255),
    Especialidad VARCHAR(255),
    Telefono VARCHAR(20),
    CorreoElectronico VARCHAR(255)
);

SELECT * FROM veterinarios;


CREATE TABLE Medicamentos (
    MedicamentoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreComercial VARCHAR(255),
    PrincipioActivo VARCHAR(255),
    Marca VARCHAR(255),
    Descripcion TEXT,
    Presentacion VARCHAR(255),
    Stock INT,
    Dosis VARCHAR(255)
);

CREATE TABLE Proveedores (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    CorreoElectronico VARCHAR(255),
    Contacto VARCHAR(255),
    SitioWeb VARCHAR(255)
);

CREATE TABLE HistorialMedico (
    HistorialID INT AUTO_INCREMENT PRIMARY KEY,
    MascotaID INT,
    VeterinarioID INT,
    FechaVisita DATE,
    MotivoVisita VARCHAR(255),
    Peso FLOAT,
    Observaciones VARCHAR(400),
    Tratamiento VARCHAR(400),
    FOREIGN KEY (MascotaID) REFERENCES Mascotas(MascotaID),
    FOREIGN KEY (VeterinarioID) REFERENCES Veterinarios(VeterinarioID)
);

CREATE TABLE MedicamentosProveedores (
    MedicamentoProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    MedicamentoID INT,
    ProveedorID INT,
    Precio DECIMAL(10, 2),
    Disponibilidad BIT,
    UltimoPedido DATE,
    FOREIGN KEY (MedicamentoID) REFERENCES Medicamentos(MedicamentoID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

CREATE TABLE CitasDeBano (
    CitaBanoID INT AUTO_INCREMENT PRIMARY KEY,
    MascotaID INT,
    VeterinarioID INT,
    FechaHora DATETIME,
    Duracion INT,
    ServicioDetalles TEXT,
    Estado VARCHAR(50),
    Notas TEXT,
    FOREIGN KEY (MascotaID) REFERENCES Mascotas(MascotaID),
    FOREIGN KEY (VeterinarioID) REFERENCES Veterinarios(VeterinarioID)
);

CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ProveedorID INT,
    FechaPedido DATE,
    FechaEntregaEstimada DATE,
    EstadoPedido VARCHAR(50),
    Observaciones TEXT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

CREATE TABLE DetallePedidos (
    DetallePedidoID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    MedicamentoID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (MedicamentoID) REFERENCES Medicamentos(MedicamentoID)
);


INSERT INTO Propietarios (Nombre, Direccion, Telefono, CorreoElectronico) VALUES 
('Juan Pérez', 'Calle Falsa 123, Ciudad Real', '555-1234', 'juan.perez@example.com'),
('Ana López', 'Av. del Libertador 456, Metrópolis', '555-5678', 'ana.lopez@example.com'),
('Carlos García', 'Paseo de la Reforma 789, Capital', '555-9101', 'carlos.garcia@example.com'),
('Lucía Martínez', 'Diagonal Norte 101, Gran Ciudad', '555-1122', 'lucia.martinez@example.com'),
('Miguel Hernández', 'Ruta 20 Km 34, Pueblo', '555-3344', 'miguel.hernandez@example.com'),
('Sofía González', 'Calle Nueva 567, Ciudad Vieja', '555-5566', 'sofia.gonzalez@example.com'),
('Diego Rodríguez', 'Avenida Siempreviva 890, Springfield', '555-7788', 'diego.rodriguez@example.com'),
('María Fernández', 'Camino Largo 1234, Faraway', '555-9900', 'maria.fernandez@example.com'),
('Jorge Alonso', 'Plaza Central 432, Mediana', '555-2233', 'jorge.alonso@example.com'),
('Laura Jiménez', 'Alameda del Río 654, Ciudad Jardín', '555-4455', 'laura.jimenez@example.com'),
('Sergio Moreno', 'Bulevar de los Sueños 321, Dreamland', '555-6677', 'sergio.moreno@example.com'),
('Carmen Ruiz', 'Cuesta de Moyano 987, Booktown', '555-8899', 'carmen.ruiz@example.com');


select * from Propietarios




INSERT INTO Mascotas (PropietarioID, Nombre, Especie, Raza, Sexo, FechaNacimiento, Color, Alergias) VALUES 
(1, 'Max', 'Perro', 'Labrador Retriever', 'M', '2018-05-10', 'Amarillo', 'Ninguna'),
(1, 'Luna', 'Gato', 'Siames', 'F', '2019-07-23', 'Blanco y negro', 'Alergia a alimentos con conservantes'),
(2, 'Rocky', 'Perro', 'Bulldog', 'M', '2020-03-15', 'Blanco', 'Tolerancia a ciertos medicamentos reducida'),
(3, 'Bella', 'Perro', 'Golden Retriever', 'F', '2017-11-02', 'Dorado', 'Ninguna'),
(3, 'Simba', 'Gato', 'Maine Coon', 'M', '2021-09-14', 'Marrón', 'Alergia a picaduras de pulgas'),
(4, 'Coco', 'Perro', 'Chihuahua', 'F', '2019-06-04', 'Marrón', 'Sensibilidad a productos de baño con base de amoniaco'),
(5, 'Oreo', 'Gato', 'Persa', 'M', '2018-01-26', 'Negro y blanco', 'Ninguna'),
(5, 'Nala', 'Gato', 'Bengala', 'F', '2020-10-30', 'Atigrado', 'Alergia a mariscos'),
(6, 'Leo', 'Perro', 'Beagle', 'M', '2016-04-17', 'Tricolor', 'Ninguna'),
(7, 'Mía', 'Perro', 'Pomerania', 'F', '2021-02-09', 'Blanco', 'Hiposensibilidad a la anestesia'),
(7, 'Toby', 'Perro', 'Boxer', 'M', '2015-08-25', 'Marrón', 'Intolerancia al gluten'),
(8, 'Loki', 'Gato', 'Sphynx', 'M', '2022-05-13', 'Rosa pálido', 'Reacción alérgica a ciertos sustratos de arena'),
(9, 'Olivia', 'Gato', 'Ragdoll', 'F', '2020-12-07', 'Azul y blanco', 'Ninguna'),
(10, 'Thor', 'Perro', 'Husky Siberiano', 'M', '2018-03-01', 'Gris y blanco', 'Sensibilidad a temperaturas extremas'),
(11, 'Zoe', 'Perro', 'Dálmata', 'F', '2017-07-19', 'Blanco con manchas', 'Ninguna'),
(12, 'Felix', 'Gato', 'Británico de pelo corto', 'M', '2019-04-21', 'Gris', 'Ninguna'),
(12, 'Rex', 'Perro', 'Pastor Alemán', 'M', '2020-06-30', 'Negro y marrón', 'Sensibilidad a la lactosa');




INSERT INTO Veterinarios (Nombre, Usuario, Contrasena, Especialidad, Telefono, CorreoElectronico) VALUES 
('Dra. Ana Torres', 'atorres', 'password123', 'Medicina General', '555-0101', 'ana.torres@veterinaria.com'),
('Dr. Luis Navarro', 'lnavarro', 'password123', 'Cirugía Veterinaria', '555-0202', 'luis.navarro@veterinaria.com'),
('Dra. Carmen Ruiz', 'cruiz', 'password123', 'Dermatología Veterinaria', '555-0303', 'carmen.ruiz@veterinaria.com');






INSERT INTO Medicamentos (NombreComercial, PrincipioActivo, Marca, Descripcion, Presentacion, Stock) VALUES 
('Amoxicilina', 'Amoxicilina', 'Genérico', 'Antibiótico de amplio espectro', 'Tabletas 500 mg', 100),
('Prednisolona', 'Prednisolona', 'Genérico', 'Corticosteroide para inflamaciones y alergias', 'Tabletas 5 mg', 80),
('Carprofeno', 'Carprofeno', 'Rimadyl', 'Antiinflamatorio no esteroideo', 'Tabletas 75 mg', 150),
('Meloxicam', 'Meloxicam', 'Metacam', 'Antiinflamatorio no esteroideo', 'Suspensión oral 1.5 mg/ml', 90),
('Tramadol', 'Tramadol', 'Genérico', 'Analgésico opioide', 'Tabletas 50 mg', 70),
('Ivermectina', 'Ivermectina', 'Ivomec', 'Antiparasitario', 'Solución inyectable 1%', 120),
('Doxiciclina', 'Doxiciclina', 'Genérico', 'Antibiótico para infecciones bacterianas', 'Tabletas 100 mg', 95),
('Fenobarbital', 'Fenobarbital', 'Genérico', 'Anticonvulsivo', 'Tabletas 30 mg', 50),
('Furosemida', 'Furosemida', 'Lasix', 'Diurético', 'Tabletas 40 mg', 110),
('Atropina', 'Sulfato de Atropina', 'Genérico', 'Antiespasmódico y anticolinérgico', 'Solución inyectable 0.5 mg/ml', 60),
('Metronidazol', 'Metronidazol', 'Flagyl', 'Antimicrobiano y antiparasitario', 'Tabletas 250 mg', 85),
('Enrofloxacina', 'Enrofloxacina', 'Baytril', 'Antibiótico fluoroquinolona', 'Tabletas 150 mg', 100),
('Clindamicina', 'Clindamicina', 'Antirobe', 'Antibiótico para infecciones dentales y óseas', 'Cápsulas 150 mg', 70),
('Cefovecina', 'Cefovecina', 'Convenia', 'Antibiótico cefalosporina de acción prolongada', 'Polvo para inyección', 40),
('Fluconazol', 'Fluconazol', 'Diflucan', 'Antifúngico', 'Tabletas 150 mg', 65),
('Praziquantel', 'Praziquantel', 'Drontal', 'Antiparasitario para cestodos', 'Tabletas', 120),
('Ketoconazol', 'Ketoconazol', 'Nizoral', 'Antifúngico', 'Tabletas 200 mg', 80),
('Amitraz', 'Amitraz', 'Mitaban', 'Acaricida para el tratamiento de la sarna', 'Solución tópica', 75),
('Levetiracetam', 'Levetiracetam', 'Keppra', 'Anticonvulsivo', 'Tabletas 500 mg', 50),
('Maropitant', 'Maropitant', 'Cerenia', 'Anti-vómito para perros', 'Tabletas 60 mg', 100),
('Acepromazina', 'Acepromazina', 'PromAce', 'Sedante y tranquilizante', 'Tabletas 25 mg', 55),
('Tilosina', 'Tilosina', 'Tylan', 'Antibiótico macrólido', 'Polvo soluble', 60),
('Gabapentina', 'Gabapentina', 'Neurontin', 'Anticonvulsivo y analgésico', 'Cápsulas 100 mg', 90),
('Loperamida', 'Loperamida', 'Imodium', 'Antidiarreico', 'Tabletas 2 mg', 100),
('Omeprazol', 'Omeprazol', 'Prilosec', 'Inhibidor de la bomba de protones', 'Cápsulas 20 mg', 85),
('Trazodona', 'Trazodona', 'Desyrel', 'Antidepresivo y ansiolítico', 'Tabletas 50 mg', 75),
('Glucosamina', 'Glucosamina', 'Genérico', 'Suplemento para la salud de las articulaciones', 'Tabletas 500 mg', 150),
('Sulfadiazina/Trimetoprim', 'Sulfadiazina/Trimetoprim', 'Bactrim', 'Antibiótico combinado', 'Suspensión oral', 100),
('Insulina', 'Insulina', 'Lantus', 'Hormona para el tratamiento de la diabetes', 'Solución inyectable', 30),
('Hidrocortisona', 'Hidrocortisona', 'Cortef', 'Corticosteroide para el tratamiento de la inflamación', 'Crema tópica', 70),
('Ciprofloxacino', 'Ciprofloxacino', 'Cipro', 'Antibiótico fluoroquinolona para infecciones bacterianas', 'Tabletas 500 mg', 80),
('Tiamulina', 'Tiamulina', 'Tiamutin', 'Antibiótico para infecciones entéricas y respiratorias', 'Solución oral', 50),
('Diclofenaco', 'Diclofenaco', 'Voltaren', 'Antiinflamatorio no esteroideo', 'Tabletas 50 mg', 100),
('Selegilina', 'Selegilina', 'Anipryl', 'Utilizado en el tratamiento de la enfermedad de Cushing y disfunción cognitiva', 'Tabletas 5 mg', 60),
('Lidocaína', 'Lidocaína', 'Xylocaine', 'Anestésico local', 'Solución inyectable 2%', 120),
('Espironolactona', 'Espironolactona', 'Aldactone', 'Diurético ahorrador de potasio', 'Tabletas 25 mg', 90),
('Ranitidina', 'Ranitidina', 'Zantac', 'Reduce la producción de ácido estomacal', 'Tabletas 150 mg', 85),
('Azitromicina', 'Azitromicina', 'Zithromax', 'Antibiótico para infecciones bacterianas', 'Tabletas 250 mg', 100),
('Fenilbutazona', 'Fenilbutazona', 'Bute', 'Antiinflamatorio no esteroideo para el dolor y la fiebre', 'Polvo oral', 70),
('Dipirona', 'Dipirona', 'Novalgina', 'Analgésico y antipirético', 'Solución inyectable', 80);




INSERT INTO Proveedores (Nombre, Direccion, Telefono, CorreoElectronico, Contacto, SitioWeb) VALUES 
('Distribuidora VetSalud', 'Av. Los Veterinarios 1234, Lima', '01-800-555-1234', 'contacto@vetsalud.pe', 'Jorge Gutiérrez', 'http://www.vetsalud.pe'),
('Suministros PetMed', 'Calle Los Farmacéuticos 567, Lima', '01-800-555-5678', 'servicio@petmed.com.pe', 'Luisa Fernández', 'http://www.petmed.com.pe');




INSERT INTO MedicamentosProveedores (MedicamentoID, ProveedorID, Precio, Disponibilidad, UltimoPedido) VALUES 
(1, 1, 15.00, 1, '2023-04-01'),
(2, 1, 12.00, 1, '2023-04-01'),
(3, 1, 25.00, 1, '2023-04-01'),
(4, 1, 20.00, 1, '2023-04-01'),
(5, 1, 18.00, 1, '2023-04-01'),
(6, 1, 30.00, 1, '2023-04-01'),
(7, 1, 22.00, 1, '2023-04-01'),
(8, 1, 10.00, 1, '2023-04-01'),
(9, 1, 15.00, 1, '2023-04-01'),
(10, 1, 5.00, 1, '2023-04-01'),
(11, 1, 24.00, 1, '2023-04-01'),
(12, 1, 17.50, 1, '2023-04-01'),
(13, 1, 29.00, 1, '2023-04-01'),
(14, 1, 33.00, 1, '2023-04-01'),
(15, 1, 27.00, 1, '2023-04-01'),
(16, 1, 22.50, 1, '2023-04-01'),
(17, 1, 18.00, 1, '2023-04-01'),
(18, 1, 14.50, 1, '2023-04-01'),
(19, 1, 31.00, 1, '2023-04-01'),
(20, 1, 20.00, 1, '2023-04-01'),
(21, 1, 25.50, 1, '2023-04-01'),
(22, 1, 34.00, 1, '2023-04-01'),
(23, 1, 15.00, 1, '2023-04-01'),
(24, 1, 21.00, 1, '2023-04-01'),
(25, 1, 19.00, 1, '2023-04-01'),
(26, 1, 26.00, 1, '2023-04-01'),
(27, 1, 28.00, 1, '2023-04-01'),
(28, 1, 32.00, 1, '2023-04-01'),
(29, 1, 23.00, 1, '2023-04-01'),
(30, 1, 30.00, 1, '2023-04-01');

INSERT INTO MedicamentosProveedores (MedicamentoID, ProveedorID, Precio, Disponibilidad, UltimoPedido) VALUES 
(11, 2, 11.50, 1, '2023-04-01'),
(12, 2, 23.00, 1, '2023-04-01'),
(13, 2, 19.00, 1, '2023-04-01'),
(14, 2, 28.00, 1, '2023-04-01'),
(15, 2, 16.00, 1, '2023-04-01'),
(16, 2, 21.00, 1, '2023-04-01'),
(17, 2, 17.50, 1, '2023-04-01'),
(18, 2, 14.00, 1, '2023-04-01'),
(19, 2, 13.00, 1, '2023-04-01'),
(20, 2, 6.00, 1, '2023-04-01'),
(21, 2, 26.50, 1, '2023-04-01'),
(22, 2, 35.00, 1, '2023-04-01'),
(23, 2, 16.00, 1, '2023-04-01'),
(24, 2, 22.00, 1, '2023-04-01'),
(25, 2, 20.00, 1, '2023-04-01'),
(26, 2, 27.00, 1, '2023-04-01'),
(27, 2, 29.00, 1, '2023-04-01'),
(28, 2, 33.00, 1, '2023-04-01'),
(29, 2, 24.00, 1, '2023-04-01'),
(30, 2, 31.00, 1, '2023-04-01'),
(31, 2, 18.50, 1, '2023-04-01'),
(32, 2, 23.50, 1, '2023-04-01'),
(33, 2, 34.50, 1, '2023-04-01'),
(34, 2, 36.00, 1, '2023-04-01'),
(35, 2, 38.00, 1, '2023-04-01'),
(36, 2, 40.00, 1, '2023-04-01'),
(37, 2, 37.00, 1, '2023-04-01'),
(38, 2, 39.00, 1, '2023-04-01'),
(39, 2, 41.00, 1, '2023-04-01'),
(40, 2, 42.00, 1, '2023-04-01');

select * from MedicamentosProveedores




-- Historiales para Max (MascotaID = 1)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(1, 1, '2019-05-10', 'Chequeo anual', 30, 'En buen estado general. Se recomienda dieta balanceada.', 'Vacuna contra la rabia'),
(1, 1, '2020-05-15', 'Chequeo anual', 32, 'Ligera ganancia de peso. Todo lo demás normal.', 'Refuerzo vacuna polivalente'),
(1, 3, '2021-03-22', 'Dermatitis', 31, 'Detectada dermatitis alérgica. No se observan pulgas.', 'Corticosteroides tópicos y cambio a dieta hipoalergénica');

-- Historiales para Luna (MascotaID = 2)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(2, 1, '2020-07-23', 'Chequeo anual', 4, 'Saludable. Alergia alimentaria bajo control.', 'Continuar con dieta especial sin conservantes'),
(2, 3, '2021-06-19', 'Control de alergias', 4.5, 'Buen manejo de la alergia alimentaria.', 'Mantener dieta especial y administrar antihistamínicos según sea necesario'),
(2, 1, '2022-07-28', 'Chequeo anual', 4.3, 'En excelente condición física.', 'Vacunación anual completa');

-- Historiales para Rocky (MascotaID = 3)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(3, 1, '2021-03-15', 'Chequeo anual', 25, 'Salud general buena. Se observa leve tartar en dientes.', 'Limpieza dental bajo anestesia. Observar tolerancia a medicamentos.'),
(3, 2, '2021-08-30', 'Cirugía menor', 24.5, 'Extracción de quiste sebáceo en dorso.', 'Extracción exitosa. Recuperación sin incidencias. Antibióticos y analgésicos prescritos.'),
(3, 1, '2022-03-16', 'Chequeo anual', 26, 'Peso ligeramente elevado. Buena recuperación post-quirúrgica.', 'Dieta para reducción de peso y ejercicio regular');

-- Historiales para Bella (MascotaID = 4)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(4, 1, '2018-11-05', 'Vacunación inicial', 28, 'Primera ronda de vacunas.', 'Vacuna múltiple'),
(4, 1, '2019-11-07', 'Chequeo anual', 29, 'Saludable, sin problemas reportados.', 'Vacunación anual'),
(4, 2, '2020-04-14', 'Consulta por cojera', 29.5, 'Cojera leve en pata trasera derecha. Sin fracturas detectadas.', 'Reposo y antiinflamatorios');

-- Historiales para Simba (MascotaID = 5)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(5, 3, '2022-01-20', 'Problemas de piel', 6, 'Dermatitis atópica confirmada.', 'Corticosteroides y champú medicado'),
(5, 1, '2022-09-15', 'Chequeo anual', 6.2, 'Buena salud general. Controlar dermatitis.', 'Vacunas de rutina'),
(5, 1, '2023-01-30', 'Control de dermatitis', 6.1, 'Mejoría en el estado de la piel.', 'Continuar tratamiento según sea necesario');

-- Historiales para Coco (MascotaID = 6)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(6, 1, '2020-06-10', 'Vacunación inicial', 3, 'Primera visita. Vacunación completa.', 'Vacuna múltiple y antiparasitario'),
(6, 3, '2021-06-15', 'Reacción alérgica', 3.5, 'Reacción a producto de limpieza.', 'Antihistamínicos y recomendación de productos hipoalergénicos'),
(6, 1, '2022-06-20', 'Chequeo anual', 3.7, 'Saludable. Se recomienda cambio en productos de limpieza.', 'Vacunas de rutina y control de parásitos');

-- Historiales para Oreo (MascotaID = 7)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(7, 1, '2019-01-28', 'Chequeo anual', 5, 'Sin problemas de salud reportados.', 'Vacuna anual y revisión general'),
(7, 3, '2020-02-10', 'Consulta dermatológica', 5.2, 'Se detecta inicio de dermatitis.', 'Cambio de dieta y champú especial'),
(7, 1, '2021-01-30', 'Chequeo anual', 5.3, 'Buen estado general.', 'Vacunación y recomendación de mantener dieta especial');

-- Historiales para Nala (MascotaID = 8)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(8, 1, '2021-01-05', 'Problema gastrointestinal', 4, 'Vómitos ocasionales. Se sospecha alergia a mariscos.', 'Dieta especial sin mariscos, seguimiento en 2 semanas'),
(8, 1, '2021-01-20', 'Seguimiento problema gastrointestinal', 4.1, 'Mejora significativa con la nueva dieta.', 'Continuar con la dieta especial'),
(8, 1, '2021-11-15', 'Chequeo anual', 4.3, 'En excelente condición.', 'Vacunación anual');

-- Historiales para Leo (MascotaID = 9)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(9, 1, '2017-06-17', 'Chequeo inicial', 10, 'Chequeo general. Se encuentra en buen estado de salud.', 'Vacunas iniciales'),
(9, 1, '2018-06-17', 'Chequeo anual', 12, 'Buen estado general. Recomendaciones de ejercicio.', 'Vacunas de refuerzo'),
(9, 1, '2019-06-17', 'Chequeo anual', 13, 'Saludable. Se recomienda control de dieta.', 'Vacunación anual y control de parásitos');

-- Historiales para Mía (MascotaID = 10)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(10, 2, '2022-03-09', 'Extracción dental', 2, 'Extracción de diente afectado por caries.', 'Antibióticos y analgésicos post-procedimiento'),
(10, 1, '2022-09-09', 'Chequeo anual', 2.2, 'Recuperación completa de la cirugía dental.', 'Vacunación anual completa'),
(10, 1, '2023-03-09', 'Control de peso', 2.1, 'Peso saludable después de ajustes dietéticos.', 'Mantener dieta actual');

-- Historiales para Toby (MascotaID = 11)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(11, 1, '2016-09-25', 'Chequeo anual', 20, 'Control de peso debido a intolerancia al gluten.', 'Dieta libre de gluten, vacunación anual'),
(11, 1, '2017-09-25', 'Chequeo anual', 22, 'Buena respuesta a la dieta libre de gluten.', 'Continuar con la dieta, vacunas de refuerzo'),
(11, 1, '2018-09-25', 'Lesión en la pata', 23, 'Lesión jugando, sin fractura.', 'Reposo y antiinflamatorios');

-- Historiales para Loki (MascotaID = 12)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(12, 3, '2023-01-10', 'Dermatitis atópica', 3, 'Reacción alérgica a sustrato de arena.', 'Cambio de sustrato y medicación tópica para la piel'),
(12, 3, '2023-04-10', 'Control dermatitis', 3.5, 'Mejoría notable con el cambio de sustrato.', 'Continuar con el nuevo sustrato y revisión en 6 meses'),
(12, 1, '2023-05-10', 'Chequeo anual', 3.6, 'En buena salud general.', 'Vacunas de rutina');

-- Historiales para Olivia (MascotaID = 13)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(13, 3, '2021-01-12', 'Control de alergias', 4.5, 'Síntomas leves de alergia observados.', 'Antihistamínicos y cambio a dieta hipoalergénica'),
(13, 3, '2022-02-22', 'Revisión de piel', 4.8, 'Mejora en la condición de la piel.', 'Continuar con el mismo régimen de tratamiento'),
(13, 1, '2022-12-15', 'Chequeo anual', 5, 'Salud general excelente. Buen manejo de alergias.', 'Vacunas de rutina y recomendación de continuar con cuidados preventivos');

-- Historiales para Thor (MascotaID = 14)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(14, 1, '2019-04-01', 'Chequeo anual', 20, 'Buen estado general. Activo y saludable.', 'Vacunación completa, incluida la de leptospirosis'),
(14, 2, '2020-05-20', 'Lesión por actividad', 22, 'Lesión en la pata trasera durante el juego.', 'Reposo, antiinflamatorios y seguimiento'),
(14, 1, '2021-04-07', 'Chequeo anual', 23, 'Recuperación completa de la lesión. Saludable.', 'Vacunas de refuerzo y control de peso');

-- Historiales para Zoe (MascotaID = 15)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(15, 1, '2018-08-10', 'Vacunación y chequeo inicial', 15, 'Primera visita. Se administra vacunación inicial.', 'Plan de vacunación establecido'),
(15, 1, '2019-08-15', 'Chequeo anual', 17, 'En forma y saludable. Sin alergias ni condiciones preexistentes.', 'Vacunación anual y recomendaciones dietéticas'),
(15, 1, '2020-08-20', 'Chequeo anual', 18, 'Mantenimiento de buena salud.', 'Vacunas de rutina y recomendación de ejercicios regulares');

-- Historiales para Felix (MascotaID = 16)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(16, 3, '2020-05-05', 'Consulta dermatológica', 3.2, 'Signos de dermatitis leve. No se observan parásitos.', 'Tratamiento tópico y seguimiento en un mes'),
(16, 1, '2021-05-11', 'Chequeo anual', 3.5, 'Buena condición general. La piel ha mejorado notablemente.', 'Vacunación completa y revisión dental'),
(16, 3, '2022-05-17', 'Revisión de piel', 3.7, 'La piel se mantiene sana. No se reportan nuevos brotes.', 'Continuar con cuidados preventivos de la piel');

-- Historiales para Rex (MascotaID = 17)
INSERT INTO HistorialMedico (MascotaID, VeterinarioID, FechaVisita, MotivoVisita, Peso, Observaciones, Tratamiento) VALUES 
(17, 1, '2021-07-03', 'Chequeo anual', 28, 'Excelente salud. Vigilar la sensibilidad a la lactosa.', 'Exclusión de lácteos en la dieta, vacunas de rutina'),
(17, 1, '2022-07-08', 'Chequeo anual', 29, 'Salud general muy buena. La dieta sin lácteos va bien.', 'Vacunación anual y recomendaciones para actividad física'),
(17, 2, '2022-12-14', 'Control de displasia de cadera', 30, 'Leve displasia detectada en cadera derecha.', 'Manejo del dolor y fisioterapia recomendada');


select * from HistorialMédico

DELIMITER $$

CREATE PROCEDURE `LeerPropietarios`()
BEGIN
    SELECT * FROM propietarios;
END$$

DELIMITER ;


CALL LeerPropietarios();





























