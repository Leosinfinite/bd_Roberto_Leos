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

CREATE TABLE Medicamento (
    ID_Medicamento INTEGER PRIMARY KEY,
    Descripcion VARCHAR2(100),
    Laboratorio VARCHAR2(50),
    Presentacion VARCHAR2(50),
    Stock_Actual NUMBER
);

SELECT * FROM Medicamento;

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

CREATE TABLE Habitacion (
    ID_Habitacion INTEGER PRIMARY KEY,
    Numero_Habitacion VARCHAR2(10),
    Tipo_Habitacion VARCHAR2(50),
    Piso NUMBER
);

SELECT * FROM Habitacion;

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

CREATE TABLE Proveedor (
    ID_Proveedor INTEGER PRIMARY KEY,
    Nombre_Empresa VARCHAR2(100),
    Contacto_Telefono VARCHAR2(20),
    Email VARCHAR2(100)
);

SELECT * FROM Proveedor;