/* CREACION DE TABLA BITACORA
DE NUEVAS CATEGORIAS DE PRODUCTOS */

CREATE TABLE nueva_categoria_de_productos (
IdCategoria INT NOT NULL AUTO_INCREMENT,
Categoria VARCHAR(50) NOT NULL,
Descripcion VARCHAR(150) NOT NULL,
Fecha_alta DATETIME NOT NULL,
Usuario_alta VARCHAR(100),
PRIMARY KEY (`IdCategoria`)
);

/* CREACION DE TABLA BITACORA
DE MODIFICACION CATEGORIAS DE PRODUCTOS */

CREATE TABLE modificacion_categoria_de_productos (
IdCategoria INT NOT NULL AUTO_INCREMENT,
Categoria VARCHAR(50) NOT NULL,
Descripcion VARCHAR(150) NOT NULL,
Fecha_alta DATETIME NOT NULL,
Usuario_alta VARCHAR(100),
PRIMARY KEY (`IdCategoria`)
);

/* CREACION DE TRIGGER TIPO AFTER INSERT DE CATEGORIA DE PRODUCTO */
CREATE TRIGGER `tr_insert_categoria_producto`
AFTER INSERT ON categoria_de_productos
FOR EACH ROW
INSERT INTO `nueva_categoria_de_productos` (IdCategoria, Categoria, Descripcion, Fecha_alta, Usuario_alta)
VALUES (
NEW.IdCategoria,
NEW.Categoria,
NEW.Descripcion,
NOW(),
SESSION_USER()
);

/* CREACION DE TRIGGER TIPO AFTER UPDATE DE CATEGORIA DE PRODUCTO */
CREATE TRIGGER `tr_update_categoria_producto`
AFTER UPDATE ON categoria_de_productos
FOR EACH ROW
INSERT INTO `modificacion_categoria_de_productos` (IdCategoria, Categoria, Descripcion, Fecha_alta, Usuario_alta)
VALUES (
NEW.IdCategoria,
NEW.Categoria,
NEW.Descripcion,
NOW(),
SESSION_USER()
);