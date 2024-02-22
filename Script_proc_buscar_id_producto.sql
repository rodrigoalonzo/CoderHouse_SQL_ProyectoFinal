CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_buscar_Id_producto`(Producto_a_buscar VARCHAR(200))
BEGIN

	SELECT Producto, IdProducto
    FROM productos
    WHERE Producto LIKE CONCAT('%', Producto_a_buscar, '%');

END