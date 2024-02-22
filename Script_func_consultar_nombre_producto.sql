CREATE DEFINER=`root`@`localhost` FUNCTION `Consultar nombre producto`(IdProducto_param INT) RETURNS varchar(200) CHARSET utf8mb4
    NO SQL
BEGIN

	DECLARE nombre_producto VARCHAR(200);
    
    SELECT Producto into nombre_producto
    FROM productos
    WHERE IdProducto = IdProducto_param;
    
    RETURN nombre_producto;
END