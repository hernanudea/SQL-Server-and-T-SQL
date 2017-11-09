-- 45 - Vistas
-- Tablas virtuales creadas a partir de una consulta
-- no se pueden llamar como se llama alguna tabla o vista ya existente
--dinamico con respecto ala tabla original

CREATE VIEW LIBROS_VW AS
/*Sentencia SQL*/
SELECT TITULO, PRECIO FROM LIBROS;

--Consultas sobre la vista

SELECT COUNT(*) FROM LIBROS_VW;
SELECT * FROM LIBROS_VW;
SELECT * FROM LIBROS_VW WHERE PRECIO > 150;

-- 46 - Cifrado de Vistas
--esto muestra el SQL con que fue creado la vista
sp_helptext libros_vw;

--para evitar esto encriptamos la view

CREATE VIEW LIBROS_ENCRIP WITH ENCRYPTION AS
SELECT TITULO, PRECIO FROM LIBROS;

SP_HELPTEXT LIBROS_ENCRIP;
SELECT * FROM LIBROS_ENCRIP;

-- 47 - Eliminar Vistas
--Si elimino la tabla origen de los datos, la vista no se borra

DROP VIEW LIBROS_VW;

--48 - Update & Delate con Vistas

-- Se Actualiza el dato en la tabla origen
CREATE VIEW LIBROS_COSTOSOS AS
SELECT * FROM LIBROS WHERE PRECIO > 150;

SELECT * FROM LIBROS_COSTOSOS; 

UPDATE LIBROS_COSTOSOS SET PRECIO = 350 WHERE ID_LIBRO = 3;

SELECT * FROM LIBROS WHERE PRECIO > 300 ORDER BY NUM_PAG;
SELECT * FROM LIBROS_COSTOSOS WHERE PRECIO > 300 ORDER BY NUM_PAG;

--DELETE hace lo mismo, actua sobre la tabla original

-- 49 - Sentencia Witch Check Option en Vistas
-- Con With Check Option controlamos la modificación de las tablas originales por medio de las vistas
-- Obliga a que cumpla los filtros

CREATE VIEW LIBROS_LARGOS AS
SELECT * FROM LIBROS WHERE NUM_PAG > 500
WITH CHECK OPTION;

SELECT * FROM LIBROS_LARGOS;

-- 50 - Tutoriales SQL - Vistas Modificadas

--para modificar uan vista, usamos ALTER VIEW NOMBREVISTA
--Quitamos el ENCRYPTION a la vista
ALTER VIEW LIBROS_ENCRIP AS
SELECT TITULO, PRECIO FROM LIBROS;

SELECT * FROM LIBROS_ENCRIP;
SP_HELPTEXT LIBROS_ENCRIP;