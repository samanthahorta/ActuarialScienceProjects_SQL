CREATE DATABASE BookShop;

USE Bookshop;

--ESTUDIO DE CASO DE LIBRERIA
--HORTA LÓPEZ SAMANTHA YAMILÉ
--MATRÍCULA: 68653

--Se desea encontrar un aumento en las ganancias de BookShop el proximo año 2021.
--Para esto se deben de tener en cuenta las siguientes áreas en donde nosotros trabajamos que serviran para estimar como incrementar las ganancias:

--ÁREA DE VENTAS(SUCURSALES DE VENTA/ ENVIOS)
--LOS MEJORES CLIENTES
--ÁREA DE COMPRAS.
--NUESTROS PRINCIPALES PROVEEDORES.

--Se procedera a realizar las consultas en nuestra base de datos de BookShop, donde ya tenemos registro de nuestra actividad economica del año 2020. 
--Gracias a esta base de datos sabremos hacia donde dirigir nuestra atención para implementar soluciones que aumenten las ganancias el proximo año.


--BookShop 
--CONSULTAS EN BASE DE DATOS PARA OBJETIVO DE AUMENTO DE LA GANANCIA EN EL AÑO 2021.

--TABLAS DE BOOKSHOP
 
 SELECT *
 FROM Books;

 SELECT *
 FROM Customers;

 SELECT *
 FROM Employees;

 SELECT *
 FROM Publisher;

 SELECT *
 FROM Sales;

 SELECT * 
 FROM Shipments;


--VENTAS TOTALES DE BOOKSHOP 
--¿Cuales fueron las ventas Totales de BookShop del 2020 entre las Sucursales y los Envios?
----(Consulta 1)

--Se empezara por sacar una estimacion de las ventas Totales de BookShop del año 2020, asi como las ventas de cada mes de ahi partiremos para las demas consultas.

--¿Cuales fueron las ventas totales de BookShop del año 2020?
SELECT SUM(BookPrice) AS [Ventas Totales BookShop]
FROM Sales
UNION ALL
SELECT SUM(BookPrice) 
FROM Shipments;

--$85,118.00 Sucursales
--$148,423.00 Envios 

--Nos da un total de $233,541.00 pesos en el Total de Ventas de BookShop, que nos servira para estimar cuanto es lo que esperamos aumentar el proximo año.





--VENTAS POR MES EN BOOKSHOP
--¿En que mes BookShop  vendio menos en Sucursales y Envios?
--(Consulta 2)


SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE ENERO]
FROM Sales AS S
WHERE SaleDate LIKE  '%01/2020%' 
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%01/2020%' ; 

--Enero Ventas Totales $12,327.00

SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE FEBRERO]
FROM Sales AS S
WHERE SaleDate LIKE  '%02/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%02/2020%' ; 

-- Febrero Ventas Totales $19,763.00

SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE MARZO]
FROM Sales AS S
WHERE SaleDate LIKE  '%03/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%03/2020%'; 

--Marzo Ventas Totales $50,340.00


SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE ABRIL]
FROM Sales AS S
WHERE SaleDate LIKE  '%04/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%04/2020%'; 

--Abril Ventas Totales $18,215.00


SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE MAYO]
FROM Sales AS S
WHERE SaleDate LIKE  '%05/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%05/2020%'; 

--Mayo Ventas Totales $21,957

SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE JUNIO]
FROM Sales AS S
WHERE SaleDate LIKE  '%06/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%06/2020%'; 

--Junio Ventas Totales $15,099.00

SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE JULIO]
FROM Sales AS S
WHERE SaleDate LIKE  '%07/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%07/2020%'; 

--Julio Ventas Totales $14,319.00


SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE AGOSTO]
FROM Sales AS S
WHERE SaleDate LIKE  '%08/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%08/2020%'; 
--Agosto Ventas Totales $12,334.00

SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE SEPTIEMBRE]
FROM Sales AS S
WHERE SaleDate LIKE  '%09/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%09/2020%'; 

-- Septiembre Ventas totales $11,685.00

SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE OCTUBRE]
FROM Sales AS S
WHERE SaleDate LIKE  '%10/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%10/2020%'; 

-- Octubre Ventas totales $14,942.00

SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE NOVIEMBRE]
FROM Sales AS S
WHERE SaleDate LIKE  '%11/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%11/2020%'; 


-- Noviembre Ventas totales $27,478.00

SELECT SUM(S.BookPrice) AS [VENTAS TOTALES DE DICIEMBRE]
FROM Sales AS S
WHERE SaleDate LIKE  '%12/2020%'
UNION ALL 
SELECT SUM(SH.BookPrice)
FROM Shipments AS SH 
WHERE SaleDate LIKE  '%12/2020%'; 


-- Diciembre Ventas totales $15,082.00

--Vemos reflejado en las consultas que las ventas más bajas en sucursal y envios fueron en el mes de Septiembre con tan solo $11,685.00
--Por lo que nosotros decidimos para el 2021, dirigir mayor capital a Propaganda y Publicidad durante este mes de "SEPTIEMBRE" en todas nuestras sucursales y anuncios en linea, para ver si asi logramos subir las ganancias.
--Ahora proseguiremos a hacer un analisis del inventario TOTAL


--PROMEDIO DE VENTAS DE BookShop del año 2020
--¿Cual fue el promedio de ventas de todas las sucursales de BookShop en el año 2020?
--(Consulta 3)

SELECT  S.Subsidiary, AVG(S.BookPrice+SH.BookPrice) AS [PROMEDIO DE VENTAS DE BOOKSHOP]
FROM Sales AS S 
JOIN Shipments AS SH ON S.Subsidiary=SH.Subsidiary
GROUP BY S.Subsidiary;
--Campestre 	2471.0208
--Centro	2247.4886
--Panorama	2236.2222
--Torres Landa	2295.3621

--El promedio de ventas parece muy similar en todas las sucursales en su totalidad, ya que estamos contando envios y ventas
--Sin embargo se espera que este promedio se eleve el siguiente año, entonces tomaremos este promedio como base para compararlo el siguiente año con las ganancias
--Y asi se sabra si se logro aumentar o no el promedio de ventas de BookShop


--INVENTARIO GENERAL
--¿Cuantos libros se tienen en inventario?
--(Consulta 4)

SELECT B.BookTitle, COUNT(*) AS [ Total de Libros En Stock]
FROM Books AS B
WHERE State = 'Active'
GROUP BY BookTitle;
--Tenemos 735 libros en inventario.



--¿Cuantos libros ya no se tienen en Stock? 
--Lista de libros a comprar.
--(Consulta 5)
SELECT B.BookTitle, COUNT(*) AS [Libros que ya no tenemos en Stock]
FROM Books AS B
WHERE State = 'Inactive'
GROUP BY BookTitle;
-- 535 libros ya no tenemos en stock



--TOTAL DE CAPITAL A TENER EN CUENTA PARA EL ÁREA DE COMPRAS 2021
--¿Cuál es el capital que se debe tener el proximo año para concepto de compra de libros inactivos en BookShop?
--(CONSULTA 6) 

SELECT SUM(B.BookPrice) AS  [Costo Total de libros a comprar año 2021 ]
FROM Sales AS S
JOIN Books AS B ON S.BookID =B.BookID
WHERE State = 'Inactive';
--$94,540.00

--¿A que proveedor debemos priorizar por ser el más vedidos en Envios y cuál por ser el más vendido en Sucursales?
--(Consulta 7)

SELECT TOP(1) S.PublisherName,COUNT(B.BookID) AS [Número de libros vendidos]
FROM Sales AS S 
JOIN Books AS B ON S.BookID=B.BookID
GROUP BY S.PublisherName
ORDER BY [Número de libros vendidos] DESC

SELECT TOP(1) SH.PublisherName,COUNT(B.BookID) AS [Número de libros vendidos]
FROM Shipments AS SH
JOIN Books AS B ON SH.BookID=B.BookID
GROUP BY SH.PublisherName
ORDER BY [Número de libros vendidos] DESC;
--springer Nature: 19 libros vendidos

--En Sucursales la editorial que más se vende es "Elsevier" por lo que decidimos invertir al menos nuestro 15% de la inversion total en compras esta editorial, ya que es la que tiene
--mas demanda y para los envios la editorial más vendida es "Springer Nature" por lo que se espera invertir tambien el 15% de la inversion total, esto para que la demanda siga creciendo
-- y asi las ventas lo hagan tambien.

--¿En cuales Idiomas tenemos que comprar más libros por su demanda en BookShop?
--(Consulta 8)

SELECT *
FROM Books;

SELECT B.Languaje, COUNT(B.BookID) AS  [Número de libros Vendidos]
FROM Sales AS S
JOIN Books AS B ON S.BookID =B.BookID
WHERE State = 'Inactive'
GROUP BY B.Languaje
ORDER BY [Número de Libros Vendidos] DESC; 

--IDIOMA MAS VENDIDO EN SUCURSALES: INGLES Y ESPAÑOL

SELECT B.Languaje, COUNT(B.BookID) AS  [Número de libros Vendidos]
FROM Shipments AS SH
JOIN Books AS B ON SH.BookID =B.BookID
WHERE State = 'Inactive'
GROUP BY B.Languaje
ORDER BY [Número de Libros Vendidos] DESC; 

--IDIOMA MÁS VENDIDO EN ENVIOS: INGLES Y ESPAÑOL



--LISTA DE IDIOMAS PARA ADQUISICION DE NUEVOS LIBROS.
--¿Cual es la lista de todos los idiomas que se manejan en los libros de Bookshop para adquisicion de nuevos libros?
--(Consulta 9)

SELECT B.Languaje, COUNT(B.BookID) AS [TOTAL DE LIBROS IDIOMA]
FROM Books AS B
GROUP BY Languaje
ORDER BY [TOTAL DE LIBROS IDIOMA] DESC;
--Lista de Idiomas que se manejan en BookShop


-- Lo que se piensa invertir para área de compras en el año 2021  son $94,540.00 en los libros faltantes en stock.
--Se invertiran $45,460 pesos en libros nuevos en los Idiomas Ingles y Español ya que son los idiomas más demandados. 
--Y se invertira $10,000 pesos en libros nuevos en todos los 20 idiomas existentes en lista de Bookshop.
--Esto nos da un total de inversion en compras de $150,000.00

--por lo que en base a esto necesitamos que nuestra empresa tenga ganancia de más del 20% en cada uno de los medios(Físico y Digital) de las ventas totales del año 2020.
--Así se podra cubrir la inversion del proximo año y obtendremos una mayor utilidad gracias al área de Compras y ventas;



--PROCEDEREMOS A HACER CONSULTAS EN AMBOS MEDIOS
--FÍSICO (Sucursales)
--DIGITAL (Envios)
--PARA ASÍ TOMAR DECISIONES ESPECIFICAS EN COMPRAS Y VENTAS RESPECTO AL ÁREA EN DONDE MÁS FALLA LA EMPRESA PARA LOGRAR MEJORAR Y OBTENER LAS GANANCIAS ESPERADAS.



--ANALISIS MEDIO FÍSICO(SUCURSALES) 
--TOMA DE DECISIONES PARA AUMENTAR GANANCIAS.


--ÁREA DE VENTAS 
--¿Cuál es la sucursal de nuestra Libreria a la que debemos enfocar nuestra atención para aumentar nuestra ganancia el proximo año? 
--(Consulta 10)

SELECT * 
FROM Sales;

SELECT DISTINCT(Subsidiary)
FROM Sales;
--SUBSIDIARY: CAMPESTRE, CENTRO, PANORAMA, TORRES LANDA 

SELECT SUM(BookPrice) AS [Venta total de libros]
FROM Sales
WHERE Subsidiary= 'Campestre';
-- $38,329.00

SELECT SUM(BookPrice) AS [Venta total de libros]
FROM Sales
WHERE Subsidiary= 'Centro';
--$23,467.00

SELECT SUM(BookPrice) AS [Venta total de libros]
FROM Sales
WHERE Subsidiary= 'Panorama';
-- $7,205.00

SELECT SUM(BookPrice) AS [Venta total de libros]
FROM Sales
WHERE Subsidiary= 'Torres Landa';
-- $16,117.00 

-- Se muestra en la consulta que debeos concentrar la atencion para que la sucursal "PANORAMA" suba sus ganancias, ya que solo vendio $7,205.00





--SUCURSAL "PANORAMA" SUJETO A ANALISIS PROFUNDO PARA AUMENTAR GANANCIAS EN AÑO 2021.
--DE ACUERDO A NUESTRAS VENTAS TOTALES DEL 2020, SE SACARA EL PROMEDIO Y DESVIACIÓ ESTANDAR DE LAS VENTAS 
--PARA ANALIZAR SU COMPORTAMIENTO EN EL AÑO Y ASI TENER UN VALOR ESPERADO BASE PARA EL PROXIMO AÑO.

--¿Cuál es el promedio de precio de libros vendidos en sucursal Panorama?
--(CONSULTA 11)

SELECT *  
FROM Sales;


SELECT AVG(S.BookPrice) AS [Promedio de Precio de Libros Vendidos], STDEV(S.BookPrice) AS [DE de Precio de Libros Vendidos]
FROM Sales AS S
WHERE Subsidiary = 'Panorama';

--GRACIAS A ESTA CONSULTA PUDIMOS PERCATARNOS
--Promedio de precio de los libros vendidos = 800.5555
--DE de precio de Libros vendidos = 224.891146

--Por lo que nos damos cuenta de que debemos empezar a incentivar a nuestros empleados a que vendan libros más caros y asi poder subir las ganancias el proximo año en la sucursal.




-- Asi que se implementaran bonos a los mejores vendedores de este año en la sucursal "PANORAMA" para motivacion del personal del área de ventas
--Esto creara que el personal se motive y logren más ventas el proximo año.
--¿Cualés son los Empleados que ganaran bonos este año por ser los mejores vendedores?
--(consulta 12)

SELECT TOP(5) E.EmployeeID, COUNT(S.BookID) AS [Numero de libros Vendidos por Empleado]
FROM Sales AS S
JOIN Employees AS E ON S.EmployeeID = E.EmployeeID
WHERE S.Subsidiary= 'Panorama'
GROUP BY E.EmployeeID
ORDER BY [Numero de libros Vendidos por Empleado] DESC;


--Observamos que fueron dos Empleados los que vendieron >1 libro, por lo que la empresa decidio dar los bonos solo a estas dos personas.
--¿Cual es el nombre, domicilio, codigo postal y telefono de los Empleados que ganaron los bonos por concepto de venta?
--(Consulta 13) 

SELECT E.EmployeeID, E.FirstName, E.LastName, E.Address, E.PostalCode, E.Phone
FROM Employees AS E
WHERE E.EmployeeID IN ('44945','43323');

-- Los 2 empleados que ganaran bonos este año en la sucursal "PANORAMA" con el fin de motivar el aumento de ventas del proximo año por sus ventas son:
-- NOMBRE/ EmployeeID
--Victoria Alguea Urreta    44945
-- Diego Dominguez Cardenas   43323




--NUESTROS MEJORES CLIENTES 
--VAMOS A OFRECER EL 30% DE DESCUENTO A NUESTROS 5 CLIENTES PRINCIPALES EN LA SUCURSAL, PARA ASÍ HACER PROMOCION DE NUESTRA EMPRESA Y VENDER MÁS.
--¿Cuál es el ID de los cinco clientes que recibiran descuento por concepto de compras?
--(Consulta 14)

SELECT TOP(5) C.CustomerID, COUNT(S.BookID) AS [Numero de libros Comprados por Cliente]
FROM Sales AS S
JOIN Customers AS C ON S.CustomerID = C.CustomerID
WHERE S.Subsidiary= 'Panorama'
GROUP BY C.CustomerID
ORDER BY [Numero de libros Comprados por Cliente] DESC;

--Los 5 clientes que recibiran descuento de fin de año son los Clientes con ID: 
--52319,52612,56794,57808,58585




--Procedemos a buscar los datos de los 5 clientes para contactarnos con ellos y poderles hacer el descuento, asi como para que difundan nuestra empresa.
--¿Cúal es el nombre de la compañia,RFC y telefono de nuestros clientes que recibiran descuento?
--(Consulta 15)

SELECT DISTINCT C.CustomerID, C.CompanyName, C.RFC, C.Phone, S.Subsidiary
FROM Customers AS C
JOIN Sales AS S ON S.CustomerID=C.CustomerID
WHERE C.CustomerID IN ('52319','52612','56794','57808','58585')
AND S.Subsidiary= 'Panorama';

--Entonces la lista de nuestros clientes ganadores es:
--COORDINADOS DE CARGA PAQUETEXPRESS S DE R L DE C V            tel.8761739190
--LRH CONSULTORES S C                                           tel.8207030250
--SERVICIO REGIO TRECE SA DE CV                                 tel.7961587051
--GoSpaces                                                      tel.5556880401
--CASA LEY S.A.P.I. DE C.V                                      tel.6748290567






--ÁREA DE COMPRAS EN SUCURSAL "PANORAMA"

--PARA AUMENTAR LA GANANCIA AHORA DEBEMOS HACER  INVENTARIO DE  LIBROS HAY EN STOCK PARA HACER UN ANALISIS DEL AREA DE COMPRAS,
--TOMAR DECISIONES DE ACUERDO A LOS RESULTADOS Y ASI MEJORAR NUESTRAS VENTAS PARA EL PROXIMO AÑO EN LA SUCURSAL.


--LIBRO MAS VENDIDO 
--CATEGORIA MAS VENDIDA
--SUBSIDIARY 
--STATE 
--LANGUAJE




--Categoria más vendida 
--¿Cúal es el TOP 3 de categorias en la que más se tiene que invertir por concepto de mayores ventas?
--(Consulta 16)

SELECT TOP(3) B.Classification, COUNT(B.BookID) AS [Número de libros vendidos por categoria]
FROM Sales AS S
JOIN Books AS B ON S.BookID = B.BookID
WHERE S.Subsidiary= 'Panorama'
GROUP BY Classification
ORDER BY [Número de libros vendidos por categoria] DESC;

--DEBEMOS DE TENER EN STOCK EL SIGUIENTE AÑO MÁS LIBROS DE LAS SIGUIENTES CATEGORIAS PARA AUMENTAR NUESTRAS VENTAS YA QUE LA DEMANDA ES MÁS GRANDE
--1. Earth and Planetary Sciences
--2. Arts and Humanities
--3. Biochemistry Genetics and Molecular Biology




--LENGUAJE MAS VENDIDO PARA TERMINOS DE COMPRA
--¿En que Idiomas se necesitan adquirir los libros en sucursal "Panorama" por el numero de la demanda?
--(CONSULTA 17)


SELECT TOP(3) B.Languaje, COUNT(B.BookID) AS [Número de libros vendidos por Idioma]
FROM Sales AS S
JOIN Books AS B ON S.BookID = B.BookID
WHERE S.Subsidiary= 'Panorama'
GROUP BY Languaje
ORDER BY [Número de libros vendidos por Idioma] DESC;
-- ENG, GER 

--El lenguaje en el que más se venden los libros es en Ingles, por lo que de nuestra inversion destinaremos 20% de los libros en ingles a la sucursla "Panorama" 
--Aumentaremos el numero de libros en Aleman, ya que se ve que tambien se han estado vendidendo.




--EDITORIAL
--¿Cuál es el TOP 5 de las editoriales que se venden más y cuantos libros vendieron en Sucursal Panorama?
--(CONSULTA 18)

SELECT TOP(5) B.PublisherName, COUNT(B.BookID) AS [Número de libros vendidos por Editorial]
FROM Sales AS S
JOIN Books AS B ON S.BookID = B.BookID
WHERE S.Subsidiary= 'Panorama'
GROUP BY B.PublisherName
ORDER BY [Número de libros vendidos por Editorial] DESC;


--Las editoriales que se vendieron en la sucursal "PANORAMA" son: 
--Austrian Academy of Sciences, 1
--Brill, 1
--Elsevier, 2
--Gebr. Mann Verlag, 1
--Springer Nature, 4




--Con esto decidimos invertir más el proximo año con nuestros proveedores de la editorial "Springer Nature" Ya que fueron los libros que más se vendieron.
--¿Cuáles libros de Springer Nature debemos comprar para el proximo año dada la demanda?
--(Consulta 19)
 
 SELECT S.BookTitle, COUNT(P.PublisherName) AS [TOTAL LIBROS VENDIDOS]
 FROM Publisher AS P  
 JOIN Sales AS S ON P.PublisherName= S.PublisherName
 WHERE P.PublisherName= 'Springer Nature'
 AND S.Subsidiary= 'Panorama'
 GROUP BY S.BookTitle

 -- Esta es la lista de los libros que vendimos de Springer Nature; Genome Dynamics and Stability y Lecture Notes in Earth Sciences, por lo que estos nombres 
 --seran parte de nuestra inversion el siguiente año. 





--CALCULO DE INVERSIÓN PARA AÑO 2021
--¿Cuanto se tiene que tener en capital el proximo año para destinar a compras en la sucursal "Panorama"
--(Consulta 20)

SELECT SUM(B.BookPrice+(B.BookPrice*0.40)) AS  [Costo Total de libros a comprar año 2021 ]
FROM Sales AS S
JOIN Books AS B ON S.BookID =B.BookID
WHERE S.Subsidiary= 'Panorama'
AND State = 'Inactive'; 
--$14,403.20

--Vamos a destinar $14,403.20 del total de nuestra inversión al área de compras de la sucursal "Panorama" por los libros que ya no hay en stock 
--Y destinaremos $15,596.8 en libros nuevos que se hayan comprado en BookShop a esta sucursal con las especificaciones de los analisis de compra y venta que ya estimamos, para motivos de crecimiento economico. 
--Con un total de parte de inversión de $30,000.00 a esta sucural.
--Por lo que se espera al menos una ganancia que formará parte del 20% esperado de las Ventas totales de las sucursales sobre la inversion en el año 2021.
--Ya terminamos nuestro analisis de la sucursal que menos vende fisicamente, ahora proseguiremos a hacerlo con la que opera mal en envios 



--ANALISIS MEDIO DIGITAL(ENVIOS) 
--TOMA DE DECISIONES PARA AUMENTAR GANANCIAS.



--VENTAS TOTALES EN ENVIOS 
--¿Cuales fueron las ventas totales en envios en el año 2020?¿En que Sucursal se vendio menos en Envios? 
--(CONSULTA 21)

SELECT *
FROM Shipments;

SELECT SUM(S.BookPrice) as [Venta Total de BookShop en Envios]
FROM Shipments AS S;
-- $148, 423.00


SELECT SUM(BookPrice) AS [Venta total de libros]
FROM Shipments
WHERE Subsidiary= 'Campestre';
--$6,690.00

SELECT SUM(BookPrice) AS [Venta total de libros]
FROM Shipments
WHERE Subsidiary= 'Torres Landa';
--$61,070.00

SELECT SUM(BookPrice) AS [Venta total de libros]
FROM Shipments
WHERE Subsidiary= 'Centro';
--$41,900.00

SELECT SUM(BookPrice) AS [Venta total de libros]
FROM Shipments
WHERE Subsidiary= 'Panorama';
--$38,763.00

--Como nuestros envios estan operando bien con ventas totales de $148,423.00 y no se necesita de mucho capital para mantener este medio, 
--Se tomaran solo pocas decisiones pero fuertes para poder aumentar las ganancias un 20%.

--Gracias al al analisis nos damos cuenta de que la Sucursal que peor opera en Envios es "Campestre" con $6,690.00 pesos en ventas.
--Por lo que se espera incentivar a los empleados a estar más al pendiente de la pagína en internet donde se realizan los envios. 


--VENTAS 

--Se tomara la decision de aumentar el puesto a Gerente al empleado de ventas que haya vendido más en Envios en Sucursal Campestre.
--Asi el proximo año nuestros empleados serán más competitivos y aumentaran las ventas, en cambio si se sigue viendo una venta menor, se despedira al encargado.
--¿Cuál es el nombre del empleado que ha vendido más libros en envios y tomará la gerencia?
--(Consulta 22)

SELECT TOP(1) S.EmployeeID, COUNT(S.BookID) AS [Total Libros Vendidos]
FROM Shipments AS S 
JOIN Employees AS E ON S.EmployeeID=E.EmployeeID
GROUP BY S.EmployeeID
ORDER BY [Total Libros Vendidos] DESC;
 

SELECT E.EmployeeID, E.FirstName, E.LastName
FROM Employees AS E
WHERE E.EmployeeID= '43953';

--El empleado que recibira el ascenso es Tarsicio Landeta Tormejon.


--Buscaremos los  libros  vendidos en Envios para implementar más cantidades de estos en la inversión
--¿Cúales fueron los libros vendidos en Envios?
--(Consulta 23)

SELECT  S.BookTitle, S.BookPrice,B.Classification, COUNT(S.BookID) AS [TOTAL DE LIBROS VENDIDOS]
FROM Shipments AS S 
JOIN Books AS B ON S.BookID= B.BookID
WHERE S.Subsidiary= 'Campestre' 
GROUP BY S.BookTitle, S.BookPrice, B.Classification
ORDER BY [TOTAL DE LIBROS VENDIDOS] DESC;

--Observamos que las ventas son muy malas, solo se vendieron 4 libros y la mayoria de Artes y Humanidades, asi que aumentaremos más libros de Artes y Humanidades a nuetsra inversión
--en envios pero tambien implementaremos publicidad y propaganda en nuestros medios digitales en sucursal "Campestre" para llegar a mas publico y que conozcan la variedad
--de libros, idiomas y clasificaciones que trabajamos.





--Ahora proseguimos a implementar un 50% de descuento a nuestro mejor cliente en Bookshop Envios para incentivar a mayor compra futura. 
--¿Cuál es el nombre y datos generales de nuestro mejor cliente al que le daremos el descuento por concepto de compras en Sucursal "Campestre?
--(Consulta 24)


SELECT TOP(1) S.CustomerID, COUNT(S.BookID) AS [Total Libros Vendidos al Cliente]
FROM Shipments AS S 
JOIN Customers AS C ON S.CustomerID=C.CustomerID
GROUP BY S.CustomerID
ORDER BY [Total Libros Vendidos al Cliente] DESC;
--56922 

SELECT *
FROM Customers AS C
WHERE C.CustomerID= '56922';
--COSTCO DE MEXICO S.A. DE C.V.

--Con estas grandes decisiones se espera que en Envios en la Sucursal "Campestre" aumenten las ventas y consigo las ganancias en el año 2021. 




--Estimación de lo que se espera aumentar en el año 2021 considerando que se pueden elevar nuestras ganancias mas del 20%
--(Consulta 25)

SELECT SUM(BookPrice+(BookPrice*0.2)) AS [Ventas Totales BookShop Esperadas 2021]
FROM Sales
UNION ALL
SELECT SUM(BookPrice+(BookPrice*0.2)) AS [Ventas Totales BookShop Esperadas 2021]
FROM Shipments;
--$102,141.60 
--$178,107.60

--En base a nuestras estadisticas y decisiones a tomar por cada área de la empresa
--Se espera ganar el proximo año 2021 un total de $280,249.2 en el área de ventas de Sucursales y Envios 
--En BookShop que finalmente aumentara las ganancias y utilidades totales de la Empresa. 

