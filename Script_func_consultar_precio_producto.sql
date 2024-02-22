CREATE DEFINER=`root`@`localhost` FUNCTION `Consultar precio producto`(IdProducto_param INT) RETURNS decimal(10,0)
    NO SQL
BEGIN

    DECLARE precio_producto DECIMAL;
    
    SELECT Precio into precio_producto
    FROM productos
    WHERE IdProducto = IdProducto_param;
    
    RETURN precio_producto;
    
END