CREATE TABLE Paciente (
    ID_Paciente INTEGER PRIMARY KEY,
    Nombre VARCHAR2(50),
    Apellido_Paterno VARCHAR2(50),
    Apellido_Materno VARCHAR2(50),
    Fecha_Nacimiento DATE,
    Sexo VARCHAR2(10),
    Tipo_Sangre VARCHAR2(5),
    Telefono VARCHAR2(20),
    Direccion VARCHAR2(100),
    Email VARCHAR2(100),
    Fecha_Registro DATE
);

SELECT * FROM Paciente;

INSERT INTO Paciente VALUES (101, 'Ana', 'López', 'Gómez', TO_DATE('1990-05-20', 'YYYY-MM-DD'), 'Femenino', 'O+', '2281234567', 'Calle A #123', 'ana.lopez@mail.com', TO_DATE('2025-07-01', 'YYYY-MM-DD'));
INSERT INTO Paciente VALUES (102, 'Juan', 'Pérez', 'Ramírez', TO_DATE('1985-08-15', 'YYYY-MM-DD'), 'Masculino', 'A+', '2287654321', 'Calle B #456', 'juanperez@mail.com', TO_DATE('2025-07-02', 'YYYY-MM-DD'));
INSERT INTO Paciente VALUES (103, 'María', 'Torres', 'Delgado', TO_DATE('1992-11-30', 'YYYY-MM-DD'), 'Femenino', 'B+', '2289876543', 'Calle C #789', 'maria.torres@mail.com', TO_DATE('2025-07-03', 'YYYY-MM-DD'));
INSERT INTO Paciente VALUES (104, 'Carlos', 'Hernández', 'Suárez', TO_DATE('1978-04-10', 'YYYY-MM-DD'), 'Masculino', 'AB-', '2283332221', 'Calle D #321', 'carlos.h@mail.com', TO_DATE('2025-07-04', 'YYYY-MM-DD'));
INSERT INTO Paciente VALUES (105, 'Laura', 'Martínez', 'Rojas', TO_DATE('1995-12-05', 'YYYY-MM-DD'), 'Femenino', 'O-', '2281122334', 'Calle E #654', 'laura.martinez@mail.com', TO_DATE('2025-07-05', 'YYYY-MM-DD'));

CREATE TABLE Doctor (
    ID_Doctor INTEGER PRIMARY KEY,
    Nombre VARCHAR2(50),
    Apellido_Paterno VARCHAR2(50),
    Apellido_Materno VARCHAR2(50),
    Cedula_Profesional VARCHAR2(20),
    Especialidad VARCHAR2(50),
    Telefono VARCHAR2(20),
    Email VARCHAR2(100),
    Fecha_Contratacion DATE
);

SELECT * FROM Doctor;

INSERT INTO Doctor VALUES (201, 'Roberto', 'Sánchez', 'Ortiz', 'CED123456', 'Pediatría', '2289998888', 'rsanchez@mail.com', TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO Doctor VALUES (202, 'Elena', 'Jiménez', 'Castro', 'CED234567', 'Cardiología', '2288887777', 'ejimenez@mail.com', TO_DATE('2022-02-15', 'YYYY-MM-DD'));
INSERT INTO Doctor VALUES (203, 'Diego', 'Gómez', 'Navarro', 'CED345678', 'Cirugía General', '2287776666', 'dgomez@mail.com', TO_DATE('2021-03-20', 'YYYY-MM-DD'));
INSERT INTO Doctor VALUES (204, 'Andrea', 'Ramírez', 'Pineda', 'CED456789', 'Ginecología', '2286665555', 'aramirez@mail.com', TO_DATE('2024-04-10', 'YYYY-MM-DD'));
INSERT INTO Doctor VALUES (205, 'Luis', 'Pérez', 'Luna', 'CED567890', 'Neurología', '2285554444', 'lperez@mail.com', TO_DATE('2020-05-05', 'YYYY-MM-DD'));

CREATE TABLE Cita (
    ID_Cita INTEGER PRIMARY KEY,
    Fecha_Hora DATE,
    Motivo VARCHAR2(100),
    ID_Paciente INTEGER,
    ID_Doctor INTEGER,
    Observaciones CLOB,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Doctor) REFERENCES Doctor(ID_Doctor)
);

SELECT * FROM Cita;

INSERT INTO Cita VALUES (301, TO_DATE('2025-07-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dolor de cabeza', 101, 202, 'Paciente refiere dolor desde hace 2 días');
INSERT INTO Cita VALUES (302, TO_DATE('2025-07-08 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Control de embarazo', 105, 204, 'Primera consulta prenatal');
INSERT INTO Cita VALUES (303, TO_DATE('2025-07-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Chequeo general', 102, 201, 'Consulta preventiva sin síntomas');
INSERT INTO Cita VALUES (304, TO_DATE('2025-07-09 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Consulta postoperatoria', 103, 203, 'Seguimiento quirúrgico');
INSERT INTO Cita VALUES (305, TO_DATE('2025-07-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Problemas de sueño', 104, 205, 'Insomnio reportado desde hace meses');

CREATE TABLE Consulta (
    ID_Consulta INTEGER PRIMARY KEY,
    ID_Cita INTEGER,
    Diagnostico CLOB,
    Tratamiento CLOB,
    Receta CLOB,
    Fecha DATE,
    FOREIGN KEY (ID_Cita) REFERENCES Cita(ID_Cita)
);

SELECT * FROM Consulta;

INSERT INTO Consulta VALUES (401, 301, 'Migraña leve', 'Paracetamol y descanso', 'Paracetamol 500mg cada 8h', TO_DATE('2025-07-08', 'YYYY-MM-DD'));
INSERT INTO Consulta VALUES (402, 302, 'Embarazo 8 semanas', 'Control mensual', 'Ácido fólico 5mg', TO_DATE('2025-07-08', 'YYYY-MM-DD'));
INSERT INTO Consulta VALUES (403, 303, 'Paciente sano', 'Revisión anual', 'Multivitamínico diario', TO_DATE('2025-07-09', 'YYYY-MM-DD'));
INSERT INTO Consulta VALUES (404, 304, 'Post cirugía estable', 'Revisión de suturas', 'Amoxicilina cada 8h', TO_DATE('2025-07-09', 'YYYY-MM-DD'));
INSERT INTO Consulta VALUES (405, 305, 'Insomnio crónico', 'Terapia + medicamento', 'Melatonina antes de dormir', TO_DATE('2025-07-10', 'YYYY-MM-DD'));

CREATE TABLE Medicamento (
    ID_Medicamento INTEGER PRIMARY KEY,
    Descripcion VARCHAR2(100),
    Laboratorio VARCHAR2(50),
    Presentacion VARCHAR2(50),
    Stock_Actual NUMBER
);

SELECT * FROM Medicamento;

INSERT INTO Medicamento VALUES (501, 'Paracetamol 500mg', 'Genéricos de México', 'Caja con 20 tabletas', 100);
INSERT INTO Medicamento VALUES (502, 'Ácido fólico 5mg', 'Farmacia Nacional', 'Frasco con 30 tabletas', 75);
INSERT INTO Medicamento VALUES (503, 'Multivitamínico completo', 'Suplementos Vida', 'Caja con 60 cápsulas', 50);
INSERT INTO Medicamento VALUES (504, 'Amoxicilina 500mg', 'Laboratorios Faro', 'Caja con 12 cápsulas', 60);
INSERT INTO Medicamento VALUES (505, 'Melatonina 5mg', 'NaturalMed', 'Frasco con 30 cápsulas', 40);

CREATE TABLE Prescripcion (
    ID_Prescripcion INTEGER PRIMARY KEY,
    ID_Consulta INTEGER,
    ID_Medicamento INTEGER,
    Dosis VARCHAR2(50),
    Frecuencia_Dias NUMBER,
    FOREIGN KEY (ID_Consulta) REFERENCES Consulta(ID_Consulta),
    FOREIGN KEY (ID_Medicamento) REFERENCES Medicamento(ID_Medicamento)
);

SELECT * FROM Prescripcion;

INSERT INTO Prescripcion VALUES (601, 401, 501, '1 tableta cada 8h', 1);
INSERT INTO Prescripcion VALUES (602, 402, 502, '1 tableta diaria', 1);
INSERT INTO Prescripcion VALUES (603, 403, 503, '1 cápsula diaria', 1);
INSERT INTO Prescripcion VALUES (604, 404, 504, '1 cápsula cada 8h', 1);
INSERT INTO Prescripcion VALUES (605, 405, 505, '1 cápsula por la noche', 1);

CREATE TABLE Habitacion (
    ID_Habitacion INTEGER PRIMARY KEY,
    Numero_Habitacion VARCHAR2(10),
    Tipo_Habitacion VARCHAR2(50),
    Piso NUMBER,
    Estatus VARCHAR2 (50)
);

SELECT * FROM Habitacion;

INSERT INTO Habitacion VALUES (701, '101', 'Individual', '1', 'Disponible');
INSERT INTO Habitacion VALUES (702, '102', 'Doble', '1', 'Ocupada');
INSERT INTO Habitacion VALUES (703, '201', 'Suite', '2', 'Disponible');
INSERT INTO Habitacion VALUES (704, '202', 'Individual', '2', 'Mantenimiento');
INSERT INTO Habitacion VALUES (705, '301', 'Terapia Intensiva', '3', 'Ocupada');

CREATE TABLE Cirugia (
    ID_Cirugia INTEGER PRIMARY KEY,
    Tipo_Cirugia VARCHAR2(100),
    ID_Paciente INTEGER,
    ID_Doctor INTEGER,
    Duracion_Minutos NUMBER,
    Notas_Medicas CLOB,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Doctor) REFERENCES Doctor(ID_Doctor)
);

SELECT * FROM Cirugia;

INSERT INTO Cirugia VALUES (801, 'Apendicectomía', 103, 203, 60, 'Cirugía exitosa, sin complicaciones.');
INSERT INTO Cirugia VALUES (802, 'Cesárea', 105, 204, 90, 'Paciente y bebé estables.');
INSERT INTO Cirugia VALUES (803, 'Resección de tumor', 104, 205, 120, 'Requiere seguimiento oncológico.');
INSERT INTO Cirugia VALUES (804, 'Herniorrafia', 101, 203, 75, 'Recuperación sin complicaciones.');
INSERT INTO Cirugia VALUES (805, 'Colocación de marcapasos', 102, 202, 110, 'Paciente en monitoreo postoperatorio.');

CREATE TABLE Factura (
    ID_Factura INTEGER PRIMARY KEY,
    Fecha_Factura DATE,
    ID_Paciente INTEGER,
    Monto_Total NUMBER(10, 2),
    Metodo_Pago VARCHAR2(50),
    Estatus_Pago VARCHAR2(50),
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente)
);

SELECT * FROM Factura;

INSERT INTO Factura VALUES (901, TO_DATE('2025-07-08', 'YYYY-MM-DD'), 101, 750.00, 'Tarjeta de crédito', 'Pagado');
INSERT INTO Factura VALUES (902, TO_DATE('2025-07-08', 'YYYY-MM-DD'), 105, 1200.00, 'Efectivo', 'Pagado');
INSERT INTO Factura VALUES (903, TO_DATE('2025-07-09', 'YYYY-MM-DD'), 102, 500.00, 'Transferencia', 'Pendiente');
INSERT INTO Factura VALUES (904, TO_DATE('2025-07-09', 'YYYY-MM-DD'), 103, 1300.00, 'Tarjeta de débito', 'Pagado');
INSERT INTO Factura VALUES (905, TO_DATE('2025-07-10', 'YYYY-MM-DD'), 104, 980.00, 'Efectivo', 'Pendiente');

CREATE TABLE Proveedor (
    ID_Proveedor INTEGER PRIMARY KEY,
    Nombre_Empresa VARCHAR2(100),
    Contacto_Telefono VARCHAR2(20),
    Email VARCHAR2(100)
);

SELECT * FROM Proveedor;

INSERT INTO Proveedor VALUES (1001, 'Farmacia Mayorista S.A.', '2284567890', 'contacto@farmamayor.com');
INSERT INTO Proveedor VALUES (1002, 'MediStock México', '2281234560', 'ventas@medistock.com');
INSERT INTO Proveedor VALUES (1003, 'Distribuidora Médica Total', '2287896543', 'info@medicatotal.com');
INSERT INTO Proveedor VALUES (1004, 'Laboratorios VitaPlus', '2283216549', 'clientes@vitaplus.com');
INSERT INTO Proveedor VALUES (1005, 'Proveedor Hospitalario Central', '2287412589', 'soporte@phc.com');
