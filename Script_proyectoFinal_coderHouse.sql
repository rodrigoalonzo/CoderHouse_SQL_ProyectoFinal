CREATE SCHEMA `proyectofinal_coderhouse`;

USE proyectofinal_coderhouse;

CREATE TABLE Proveedores (
IdProveedor INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(50) NOT NULL,
CUIT INT NOT NULL,
Direccion VARCHAR(50) NOT NULL,
Localidad VARCHAR (50) NOT NULL,
Provincia VARCHAR (50) NOT NULL,
Pais TEXT (50) NOT NULL,
Contacto VARCHAR(50) NOT NULL,
Telefono INT NOT NULL,
Email VARCHAR(50) NOT NULL,
PRIMARY KEY (`IdProveedor`)
);

CREATE TABLE Categoria_de_productos (
IdCategoria INT NOT NULL AUTO_INCREMENT,
Categoria VARCHAR(50) NOT NULL,
Descripcion VARCHAR(150) NOT NULL,
PRIMARY KEY (`IdCategoria`)
);

CREATE TABLE Medios_de_pago (
IdFormaDePago INT NOT NULL AUTO_INCREMENT,
Forma_de_pago VARCHAR(50) NOT NULL,
PRIMARY KEY (`IdFormaDePago`)
);

CREATE TABLE Clientes (
IdCliente INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
DNI INT NOT NULL,
Fecha_de_nacimiento DATE NOT NULL,
Fecha_de_alta DATETIME NOT NULL,
CUIT INT NOT NULL,
PRIMARY KEY (`IdCliente`)
);

CREATE TABLE Sucursales (
IdSucursal INT NOT NULL AUTO_INCREMENT,
Nombre_sucursal VARCHAR(50) NOT NULL,
Direccion VARCHAR(50) NOT NULL,
Localidad VARCHAR(50) NOT NULL,
Provincia VARCHAR(50) NOT NULL,
Pais TEXT(50) NOT NULL,
PRIMARY KEY (`IdSucursal`)
);

CREATE TABLE Empleados (
IdEmpleado INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
DNI INT NOT NULL,
Fecha_ingreso DATE NOT NULL,
IdSucursal INT NOT NULL,
PRIMARY KEY (`IdEmpleado`),
KEY `FK_Sucursal_1` (`IdSucursal`),
CONSTRAINT `FK_Sucursal_1` FOREIGN KEY (`IdSucursal`) REFERENCES `Sucursales`(`IdSucursal`)
);

CREATE TABLE Productos (
IdProducto INT NOT NULL AUTO_INCREMENT,
IdCategoria INT NOT NULL,
IdProveedor INT NOT NULL,
IdFormaDePago INT NOT NULL,
Producto VARCHAR(50) NOT NULL,
Marca VARCHAR(50) NOT NULL,
Descripcion VARCHAR(150) NOT NULL,
Precio DECIMAL(20,2) NOT NULL,
PRIMARY KEY (`IdProducto`),
KEY `FK_Categoria` (`IdCategoria`),
KEY `FK_Proveedor` (`IdProveedor`),
KEY `FK_FormaDePago_1` (`IdFormaDePago`),
CONSTRAINT `FK_Categoria` FOREIGN KEY (`IdCategoria`) REFERENCES Categoria_de_productos(`IdCategoria`),
CONSTRAINT `FK_Proveedor` FOREIGN KEY (`IdProveedor`) REFERENCES Proveedores(`IdProveedor`),
CONSTRAINT `FK_FormaDePago_1` FOREIGN KEY (`IdFormaDePago`) REFERENCES Medios_de_pago(`IdFormaDePago`)
);

CREATE TABLE Ventas (
IdRegistroVenta INT NOT NULL AUTO_INCREMENT,
IdVenta INT NOT NULL,
IdProducto INT NOT NULL,
IdCliente INT NOT NULL,
IdFormaDePago INT NOT NULL,
IdEmpleado INT NOT NULL,
IdSucursal INT NOT NULL,
Fecha_venta DATETIME NOT NULL,
Remito VARCHAR(50) NOT NULL,
Factura VARCHAR(50) NOT NULL,
Cantidad INT NOT NULL,
Precio_unitario DECIMAL(20, 2) NOT NULL,
Monto_total DECIMAL(20, 2) NOT NULL,
PRIMARY KEY (`IdRegistroVenta`),
KEY `FK_Producto` (`IdProducto`),
KEY `FK_Cliente` (`IdCliente`),
KEY `FK_FormaDePago_2` (`IdFormaDePago`),
KEY `FK_Empleado` (`IdEmpleado`),
KEY `FK_Sucursal_2` (`IdSucursal`),
CONSTRAINT `FK_Producto` FOREIGN KEY (`IdProducto`) REFERENCES Productos(`IdProducto`),
CONSTRAINT `FK_Cliente` FOREIGN KEY (`IdCliente`) REFERENCES Clientes(`IdCliente`),
CONSTRAINT `FK_Empleado` FOREIGN KEY (`IdEmpleado`) REFERENCES Empleados(`IdEmpleado`),
CONSTRAINT `FK_Sucursal_2` FOREIGN KEY (`IdSucursal`) REFERENCES Sucursales(`IdSucursal`)
);
