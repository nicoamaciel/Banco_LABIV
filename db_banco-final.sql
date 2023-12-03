drop database DB_Banco;
CREATE DATABASE DB_Banco;
USE DB_Banco;

CREATE TABLE Clientes
(
 Dni varchar(10) PRIMARY KEY NOT NULL,
 Cuil varchar(15) NOT NULL,
 CBU varchar (25)null,
 Apellido varchar(30) NOT NULL,
 Nombre varchar (30) NOT NULL,
 FechaNacimiento varchar(15) NOT NULL,
 Sexo varchar(15) NOT NULL,
 Nacionalidad varchar(15) NOT NULL,
 Email varchar(30) NOT NULL,
 Telefono varchar (20) NOT NULL,
 Direccion varchar(30) NOT NULL,
 Provincia varchar(20) NOT NULL,
 Localidad varchar(20) NOT NULL,
 activo boolean default 1 ,
 Administrador boolean default 0,
 Contrasenia varchar(6)
);

CREATE TABLE TiposCuenta
(
Id INT PRIMARY KEY NOT NULL,
Descripcion varchar(20)
);

CREATE TABLE Cuentas
(
NroCuenta varchar(20) PRIMARY KEY NOT NULL,
DniCliente varchar (10) NOT NULL,
CBU varchar(25) NOT NULL,
Tipo varchar(25) NOT NULL,
FechaCreacion varchar(15) NOT NULL,
Saldo decimal,
DeudaPrestamo decimal,
CuotasPendientes int,	
Activa boolean,
FOREIGN KEY (DniCliente) REFERENCES Clientes(Dni) 
);	

CREATE TABLE provincias (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE localidades (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
    );
    
    CREATE TABLE nacionalidades (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
	
	CREATE TABLE Movimientos (
		Id INT PRIMARY KEY AUTO_INCREMENT,
		NroCuenta VARCHAR(20) NOT NULL,
		Detalle VARCHAR(100) ,
		Fecha VARCHAR(20),
		Importe DOUBLE,
		Movimiento varchar(30),
        Cuotas int null,
        NroCuentaDestino VARCHAR(20) NULL,
		Activa BOOLEAN,
        FOREIGN KEY (NroCuenta) REFERENCES Cuentas(NroCuenta) 
	);

CREATE TABLE TiposMovimiento(
Id INT PRIMARY KEY,
Descripcion VARCHAR(30)
);

CREATE TABLE CuotasPrestamos(
ID_CuotasPrestamos INT PRIMARY KEY AUTO_INCREMENT,
NroCuenta VARCHAR(20) NOT NULL,
Cuotas int,

CuotasPagas int,
/*Datos parar calcular interes en cuotas e importe*/
ImporteSolicitado DOUBLE,
/*Intereses: 12 cuotas 1.2 - 24 cuotas 1.5 - 36 cuotas 1.8*/
PorcentajeInteres DOUBLE,
/*cuotas fijas importeSolicitado dividido cuotas*/
ImporteFijoCuota DOUBLE,
/*importeSolicitado multiplicado interes con aumento: 1.2 - 1.5 - 1.8 */
ImporteFinalconInteres DOUBLE,
/*ImporteFinalconInteres dividido cuotas*/
ImporteFinalCuota DOUBLE,

Estado BOOLEAN,
FOREIGN KEY (NroCuenta) REFERENCES Cuentas(NroCuenta) 
);
 
 
INSERT INTO provincias (id, nombre) VALUES
(1, 'Buenos Aires'),
(2, 'Córdoba'),
(3, 'Santa Fe'),
(4, 'Mendoza'),
(5, 'Salta'),
(6, 'Tucumán'),
(7, 'Entre Ríos'),
(8, 'Misiones'),
(9, 'Corrientes'),
(10, 'Jujuy'),
(11, 'Formosa'),
(12, 'San Juan'),
(13, 'San Luis'),
(14, 'La Pampa'),
(15, 'Catamarca'),
(16, 'Chaco'),
(17, 'Neuquén'),
(18, 'La Rioja'),
(19, 'Chubut'),
(20, 'Santiago del Estero'),
(21, 'Tierra del Fuego'),
(22, 'Rio Negro'),
(23, 'Santa Cruz');



INSERT INTO localidades (id, nombre) VALUES
(101, 'La Plata'),
(102, 'Mar del Plata'),
(103, 'Córdoba Capital'),
(104, 'Rosario'),
(105, 'Mendoza Capital'),
(106, 'Salta Capital'),
(107, 'San Miguel de Tucumán'),
(108, 'Paraná'),
(109, 'Posadas'),
(110, 'Corrientes Capital'),
(111, 'San Salvador de Jujuy'),
(112, 'Formosa Capital'),
(113, 'San Juan Capital'),
(114, 'San Luis Capital'),
(115, 'Santa Rosa'),
(116, 'San Fernando del Valle de Catamarca'),
(117, 'Resistencia'),
(118, 'Neuquén Capital'),
(119, 'La Rioja Capital'),
(120, 'Rawson'),
(121, 'Santiago del Estero Capital'),
(122, 'Ushuaia'),
(123, 'Viedma'),
(124, 'Río Gallegos'),
(125, 'CABA'); 


INSERT INTO nacionalidades (id, nombre) VALUES
(1001, 'Argentina'),
(1002, 'Uruguaya'),
(1003, 'Paraguaya'),
(1004, 'Chilena'),
(1005, 'Brasileña'),
(1006, 'Peruana'),
(1007, 'Boliviana'),
(1008, 'Colombiana'),
(1009, 'Venezolana'),
(1010, 'Ecuatoriana');


insert into TiposCuenta values (1,"Caja de ahorro");
insert into TiposCuenta VALUES (2,"Cuenta Corriente");

 
INSERT INTO clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, Activo,Administrador,Contrasenia)
VALUES
    ('admin', 'admin', 'admin', 'admin', 'admin', '0000', 'M', 'Argentino', 'admin@admin.com', '111', 'admin', 'admin', 'admin', 1,1,'admin1');


/*CLIENTES*/
/*01*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1234567890', '20345678901', '1234567890123456789012345', 'González', 'Juan', '1990-01-01', 'Masculino', 'Argentino', 'juan@gmail.com', '1234567890', 'Calle 123', 'Buenos Aires', 'Ciudad A', 1, 0, '123abc');

/*02*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1152357334', '40345678901', '5678901234567890123456789', 'López', 'María', '1985-05-15', 'Femenino', 'Argentino', 'maria@gmail.com', '9876543210', 'Calle 456', 'Córdoba', 'Ciudad B', 1, 0, '456def');

/*03*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1112223334', '30345678901', '9876543210987654321098765', 'Martínez', 'Pedro', '1982-09-20', 'Masculino', 'Argentino', 'pedro@gmail.com', '1112223334', 'Calle 789', 'Santa Fe', 'Ciudad C', 1, 0, '789ghi');

/*04*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('5554443334', '50345678901', '5432109876543210987654321', 'Rodríguez', 'Ana', '1995-08-12', 'Femenino', 'Argentino', 'ana@gmail.com', '54124443334', 'Calle 987', 'Mendoza', 'Ciudad D', 1, 0, '987jkl');

/*05*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('9998887776', '60345672504', '4321098765432109876543210', 'Fernández', 'Carlos', '1988-03-25', 'Masculino', 'Argentino', 'carlos@gmail.com', '9998887776', 'Calle 654', 'Salta', 'Ciudad E', 1, 0, '654mno');

/*06*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('2223334445', '70345253587', '7654321098765432109876543', 'Gómez', 'Laura', '1992-11-03', 'Femenino', 'Argentino', 'laura@gmail.com', '2223334445', 'Calle 321', 'Tucumán', 'Ciudad F', 1, 0, '321pqr');

/*07*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1112214334', '70125672501', '8765432109876543210987654', 'Díaz', 'Martín', '1997-07-08', 'Masculino', 'Argentino', 'martin@gmail.com', '7776665554', 'Calle 123', 'Buenos Aires', 'Ciudad A', 1, 0, '123abc');

/*08*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1554223334', '90345678901', '9876543210987654321098766', 'Suárez', 'Lucía', '1994-01-19', 'Femenino', 'Argentino', 'lucia@gmail.com', '1112223336', 'Calle 456', 'Córdoba', 'Ciudad B', 1, 0, '456def');

/*09*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('8889990007', '00345678901', '1098765432109876543210987', 'López', 'Marcos', '1986-06-29', 'Masculino', 'Argentino', 'marcos@gmail.com', '8889990007', 'Calle 789', 'Santa Fe', 'Ciudad C', 1, 0, '789ghi');

/*10*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1112634634', '70325674311', '0987654321098765432109878', 'Parker', 'Pedro', '1994-06-20', 'Masculino', 'Argentino', 'Parker@gmail.com', '2235555558', 'Calle 527', 'Chaco', 'Ciudad ñ', 1, 0, '123abc');

/*11*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1116974634', '10345678901', '09876543555576543555878', 'Fabian', 'Cohete', '1990-02-13', 'Masculino', 'Argentino', 'Fabian@gmail.com', '311235558', 'Calle 231', 'Buenos Aires', 'Ciudad D', 1, 0, '987jkl');

/*12*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('8769615792', '10345678901', '0987654321098765432155522', 'Lopez', 'Gabriela', '1989-04-17', 'Femenino', 'Argentino', 'gabriela@gmail.com', '3334445558', 'Calle 987', 'Mendoza', 'Ciudad D', 1, 0, '987jkl');

/*13*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1112147164', '10468678901', '0987654321098765432104448', 'Pereyra', 'Paula', '1989-04-17', 'Femenino', 'Argentino', 'Paula@gmail.com', '3334445558', 'Calle 987', 'Mendoza', 'Ciudad D', 1, 0, '987jkl');

/*14*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('1789134634', '10341248901', '0558996543210987654321091', 'Sanchez', 'Luciana', '2000-10-17', 'Femenino', 'Argentino', 'Luciana@gmail.com', '3334445558', 'Calle 987', 'Mendoza', 'Ciudad D', 1, 0, '98lasd');

/*15*/
INSERT INTO Clientes (Dni, Cuil, CBU, Apellido, Nombre, FechaNacimiento, Sexo, Nacionalidad, Email, Telefono, Direccion, Provincia, Localidad, activo, Administrador, Contrasenia)
VALUES ('199124634', '1034215901', '0982358121098765432109878', 'Peralta', 'Mariana', '1929-04-12', 'Femenino', 'Argentino', 'Mariana@gmail.com', '3334445558', 'Calle 987', 'Mendoza', 'Ciudad D', 1, 0, '123jkl');




/*CUENTAS */


INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
	/*Paula@gmail.com*/
    ('1068680001','1112147164', '0987654321098765432104448', 'Cuenta Corriente', '10/11/2023', 1000000 , 1);
    
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*Peralta@gmail.com*/
  ('100065464','199124634', '0987654321098765432102222', 'Caja de ahorro', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*juan@gmail.com*/
  ('100003463','1234567890', '1234567890123456789012345', 'Cuenta Corriente', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*maria@gmail.com*/
  ('100003534','1152357334', '5678901234567890123456789', 'Cuenta Corriente', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*ana@gmail.com*/
  ('100005235','5554443334', '5432109876543210987654321', 'Caja de ahorro', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*marcos@gmail.com*/
  ('100000533','8889990007', '1098765432109876543210987', 'Cuenta Corriente', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*carlos@gmail.com*/
  ('100234563','9998887776', '4321098765432109876543210', 'Cuenta Corriente', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*gabriela@gmail.com*/
  ('100004343','8769615792', '0987654321098765432155522', 'Cuenta Corriente', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*Parker@gmail.com*/
  ('100523523','1112634634', '0987654321098765432109878', 'Cuenta Corriente', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*lucia@gmail.com*/
  ('100121231','1554223334', '9876543210987654321098766', 'Caja de ahorro', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES  
  /*laura@gmail.com*/
  ('100235235','2223334445', '7654321098765432109876543', 'Caja de ahorro', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  /*Fabian@gmail.com*/
  ('105235235','1116974634', '09876543555576543555878', 'Caja de ahorro', '10/11/2023', 1000000 , 1);
  
INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES
  ('105895278','1116974634', '12356432412313578890487', 'Cuenta Corriente', '10/11/2023', 1000000 , 1);
  
 INSERT INTO cuentas (NroCuenta,DniCliente,CBU,Tipo,FechaCreacion,Saldo,Activa)
VALUES 
  /*martin@gmail.com*/
  ('195123380','1112214334', '8765432109876543210987654', 'Caja de ahorro', '10/11/2023', 1000000 , 1);
  

/*Insert tipos*/
insert into TiposMovimiento values(1,"Transferencia");
insert into TiposMovimiento values(2,"Alta Prestamo");
insert into TiposMovimiento values(3,"Pago Cuota Prestamo");

/*Trigger no se permiten mas de tres cuentas*/

DELIMITER $$

CREATE TRIGGER cuentaMayorAtres
BEFORE INSERT ON db_banco.cuentas
FOR EACH ROW
BEGIN
    DECLARE dniIngreso VARCHAR(10);
    DECLARE cuentaVerificador INT;

    SET dniIngreso = NEW.DniCliente;

    SELECT COUNT(*) INTO cuentaVerificador
    FROM db_banco.cuentas
    WHERE DniCliente = dniIngreso;

    IF cuentaVerificador >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede ingresar más de tres cuentas por cliente';
    END IF;
END $$
DELIMITER ;