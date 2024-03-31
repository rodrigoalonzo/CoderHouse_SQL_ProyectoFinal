/* SCRIPTS DE FUNCIONES Y STORED PROCEDURES */


/* CALCULAR MONTO TOTAL DE PRODUCTO */
CREATE DEFINER=`root`@`localhost` FUNCTION `Calculadora monto total de producto`(IdProducto_param INT, cantidad_param INT) RETURNS decimal(10,0)
    NO SQL
BEGIN

	DECLARE precio_producto DECIMAL;
	DECLARE resultado DECIMAL;
	
	SELECT Precio into precio_producto
	FROM productos
	WHERE IdProducto = IdProducto_param;
	
	SET resultado = precio_producto * cantidad_param;
	
	RETURN resultado;
END

/* CALCULAR MONTO DE VENTAS POR EMPLEADO */
CREATE DEFINER=`root`@`localhost` FUNCTION `Calculadora monto de ventas por empleado`(IdEmpleado_param INT) RETURNS decimal(10,0)
    NO SQL
BEGIN

	DECLARE monto_ventas DECIMAL;
    
	SELECT SUM(Monto_total) into monto_ventas
    FROM ventas
    WHERE IdEmpleado = IdEmpleado_param;
    
    RETURN monto_ventas;
    
END

/* CALCULAR MONTO DE VENTAS POR SUCURSAL */
CREATE DEFINER=`root`@`localhost` FUNCTION `Calculadora monto de ventas por sucursal`(IdSucursal_param INT) RETURNS decimal(10,0)
    NO SQL
BEGIN

	DECLARE monto_ventas DECIMAL;
    
    SELECT SUM(Monto_total) into monto_ventas
    FROM ventas
    WHERE IdSucursal = IdSucursal_param;
    
    RETURN monto_ventas;
    
END

/* CONSULTAR NOMBRE DE PRODUCTO */
CREATE DEFINER=`root`@`localhost` FUNCTION `Consultar nombre producto`(IdProducto_param INT) RETURNS varchar(200) CHARSET utf8mb4
    NO SQL
BEGIN

	DECLARE nombre_producto VARCHAR(200);
    
    SELECT Producto into nombre_producto
    FROM productos
    WHERE IdProducto = IdProducto_param;
    
    RETURN nombre_producto;
END

/* CONSULTAR PRECIO DE PRODUCTO */
CREATE DEFINER=`root`@`localhost` FUNCTION `Consultar precio producto`(IdProducto_param INT) RETURNS decimal(10,0)
    NO SQL
BEGIN

    DECLARE precio_producto DECIMAL;
    
    SELECT Precio into precio_producto
    FROM productos
    WHERE IdProducto = IdProducto_param;
    
    RETURN precio_producto;
    
END

/* PROCESO PARA BUSCAR ID DE PRODUCTO */
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_buscar_Id_producto`(Producto_a_buscar VARCHAR(200))
BEGIN

	SELECT Producto, IdProducto
    FROM productos
    WHERE Producto LIKE CONCAT('%', Producto_a_buscar, '%');

END

/* PROCESO PARA ORDENAR PRODUCTOS */
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_ordenar_productos`(IN Campo_a_ordenar VARCHAR (50))
BEGIN

	if Campo_a_ordenar <> '' THEN
		SET @orden_productos = CONCAT('ORDER BY ', Campo_a_ordenar);
	else
		SET @orden_productos = '';
	end if;
    
    SET @clausula = CONCAT('SELECT * FROM proyectofinal_coderhouse.productos ', @orden_productos, ';');
    
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    
    DEALLOCATE PREPARE runSQL;
    
END

/* PROCESO PARA INSERTAR CATEGORIA DE PRODUCTO */
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertar_categoria_producto`(IN sp_Categoria VARCHAR (50), IN sp_Descripcion VARCHAR(150))
BEGIN

DECLARE new_Id INT;

IF sp_Categoria <> '' AND sp_Descripcion <> '' THEN
	
    SELECT max(IdCategoria) + 1 INTO @new_Id
    FROM proyectofinal_coderhouse.categoria_de_productos;
    
    INSERT INTO proyectofinal_coderhouse.categoria_de_productos (IdCategoria, Categoria, Descripcion)
    VALUES (@new_Id, sp_Categoria, sp_Descripcion);
    
    SELECT * FROM proyectofinal_coderhouse.categoria_de_productos
    ORDER BY IdCategoria desc;
    
ELSE
	SELECT 'Error: no se pudo crear la nueva categoría';
END IF;

END

/* PROCESO PARA ACTUALIZAR NOMBRE DE CATEGORIA DE PRODUCTO */
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_modificar_nombre_categoria`(IN sp_IdCategoria INT, IN sp_Categoria VARCHAR (50))
BEGIN

IF sp_IdCategoria <> '' AND sp_Categoria <> '' THEN

	UPDATE proyectofinal_coderhouse.categoria_de_productos
	SET Categoria = sp_Categoria
	WHERE IdCategoria = sp_IdCategoria;
 
 ELSE
	SELECT 'Error: no se pudo actualizar la categoría';
END IF;

END