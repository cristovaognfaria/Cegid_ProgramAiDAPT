--1) Crie as tabelas abaixo:
--•	customers(customer_id, name, email, city, created_at)
--•	products(product_id, name, category, price, active)
--•	orders(order_id, customer_id, order_date, status)
--•	order_items(order_id, product_id, quantity, unit_price)
--•	payments(payment_id, order_id, payment_date, amount, method, status)

CREATE TABLE EX_CUSTOMERS3(
Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
City VARCHAR(100),
Created_at DATETIME DEFAULT GETDATE())

CREATE TABLE EX_PRODUCTS2(
Product_ID INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Category VARCHAR(100),
Price DECIMAL(10,2),
Active VARCHAR(100))

CREATE TABLE EX_F_ORDERS2(
Order_ID INT IDENTITY(1,1) PRIMARY KEY,
Customer_ID INT,
Order_Date DATE,
Status VARCHAR(100))

CREATE TABLE EX_ORDER_ITEMS2(
Order_ID INT,
Product_ID INT,
Quantity DECIMAL(10,2),
Unit_Price DECIMAL(10,2))

CREATE TABLE EX_PAYMENTS2(
Payment_ID INT IDENTITY(1,1) PRIMARY KEY,
Order_ID INT,
Payment_Date DATE,
Amount DECIMAL(10,2),
Method VARCHAR(50),
Status VARCHAR(100))


-- 2) INSERT DADOS:
-- TABLE CUSTOMER
INSERT INTO [dbo].[EX_CUSTOMERS3] (Name, Email, City)

VALUES
('Ana Silva',     'ana.silva@email.com',      'Porto'),
('Bruno Costa',   'bruno.costa@email.com',    'Lisboa'),
('Carla Souza',   'carla.souza@email.com',    'Madrid'),
('Daniel Rocha',  'daniel.rocha@email.com',   'Porto'),
('Eva Martins',   'eva.martins@email.com',    'Paris'),
('Felipe Lima',   'felipe.lima@email.com',    'Porto'),
('Gabriela Nunes','gabriela.nunes@email.com', 'Berlin'),
('Hugo Mendes',   'hugo.mendes@email.com',    'Lisboa')

SELECT
*
FROM [dbo].[EX_CUSTOMERS3]

-- Fazer drop tabelas criadas erradamente

Drop Table [dbo].[EX_CUSTOMERS]

Drop Table [dbo].[EX_CUSTOMERS2]

-- TABLE PRODUCT
INSERT INTO [dbo].[EX_PRODUCTS2] (Name, Category, Price, Active)
VALUES
('Power BI Pro Course',     'Courses', 199.90, 1),
('Excel Advanced Course',   'Courses', 149.90, 1),
('SQL Server Fundamentals', 'Courses', 129.90, 1),
('Keyboard',                'Hardware', 49.90, 1),
('Mouse',                   'Hardware', 29.90, 1),
('Notebook Stand',          'Accessories', 19.90, 1),
('USB Hub',                 'Accessories', 15.00, 1),
('Old Cable',               'Accessories', 3.50, 0),
('Monitor 24"',             'Hardware', 120.00, 1),
('Fabric Workshop',         'Courses', 299.90, 1)

SELECT
*
FROM [dbo].[EX_PRODUCTS2]

DROP TABLE [dbo].[EX_PRODUCTS]


-- TABLE ORDERS
INSERT INTO [dbo].[EX_F_ORDERS2] (Customer_ID, Order_Date, Status)
VALUES
(1, DATEADD(DAY,-10, Getdate()), 'PAID'),
(2, DATEADD(DAY,-5,  Getdate()), 'NEW'),
(3, DATEADD(DAY,-20, Getdate()), 'CANCELLED'),
(4, DATEADD(DAY,-2,  Getdate()), 'SHIPPED'),
(5, DATEADD(DAY,-40, Getdate()), 'PAID'),
(6, DATEADD(DAY,-1,  Getdate()), 'NEW'),
(7, DATEADD(DAY,-15, Getdate()), 'PAID'),
(8, DATEADD(DAY,-3,  Getdate()), 'PAID'),
(1, DATEADD(DAY,-60, Getdate()), 'SHIPPED'),
(2, DATEADD(DAY,-12, Getdate()), 'PAID'),
(3, DATEADD(DAY,-8,  Getdate()), 'NEW'),
(4, DATEADD(DAY,-25, Getdate()), 'CANCELLED')

SELECT
*
FROM [dbo].[EX_F_ORDERS2]

DROP TABLE [dbo].[EX_F_ORDERS]

-- TABLE ORDER ITEM

INSERT INTO [dbo].[EX_ORDER_ITEMS2] (Order_ID, Product_ID, Quantity, Unit_Price)
VALUES
(1, 1, 1, 199.90),
(1, 6, 2, 19.90),
(2, 2, 1, 149.90),
(2, 5, 1, 29.90),
(3, 4, 1, 49.90),
(4, 9, 1, 120.00),
(4, 7, 2, 15.00),
(5, 10, 1, 299.90),
(5, 6, 1, 19.90),
(6, 3, 1, 129.90),
(7, 1, 1, 199.90),
(7, 2, 1, 149.90),
(8, 4, 1, 49.90),
(8, 5, 1, 29.90),
(8, 7, 2, 15.00),
(9, 9, 2, 120.00),
(10, 3, 1, 129.90),
(10, 6, 1, 19.90),
(11, 2, 2, 149.90),
(12, 4, 1, 49.90)

SELECT
*
FROM[dbo].[EX_ORDER_ITEMS2]

DROP TABLE [dbo].[EX_ORDER_ITEMS]
 

 -- TABLE PAYMENTS

INSERT INTO [dbo].[EX_PAYMENTS2] (Order_ID, Payment_Date, Amount, Method, Status)
VALUES
(1, DATEADD(DAY,-9, Getdate()), 239.70, 'CARD', 'CONFIRMED'),
(4, DATEADD(DAY,-2, Getdate()), 150.00, 'TRANSFER', 'CONFIRMED'),
(5, DATEADD(DAY,-38, Getdate()), 319.80, 'PIX', 'CONFIRMED'),
(7, DATEADD(DAY,-14, Getdate()), 349.80, 'CARD', 'CONFIRMED'),
(8, DATEADD(DAY,-3, Getdate()), 124.90, 'CASH', 'CONFIRMED'),
(9, DATEADD(DAY,-59, Getdate()), 240.00, 'PIX', 'CONFIRMED'),
(10, DATEADD(DAY,-11, Getdate()), 149.80, 'CARD', 'FAILED')

SELECT
*
FROM [dbo].[EX_PAYMENTS2]

DROP TABLE [dbo].[EX_PAYMENTS]





-- EX. 2 - SELECT
-- 1) SELECT TODOS OS CLIENTE

SELECT
*
FROM [dbo].[EX_CUSTOMERS3]

-- 2. Liste FullName, Email, City.
SELECT
NAME, 
EMAIL, 
CITY

FROM[dbo].[EX_CUSTOMERS3]

--3. Liste os produtos ordenados por Price desc.

SELECT
*
FROM [dbo].[EX_PRODUCTS2]
ORDER BY PRICE DESC


--4.	Liste as categorias distintas.

SELECT 
DISTINCT(Category)
FROM [dbo].[EX_PRODUCTS2]


--5. Liste os 5 produtos mais caros (TOP 5)
SELECT
TOP 5 * 
FROM [dbo].[EX_PRODUCTS2]
ORDER BY PRICE DESC 


--6. Produtos com preço maior que 100
SELECT
*
FROM [dbo].[EX_PRODUCTS2]
WHERE PRICE > 100

--7. Clientes da cidade “Porto”.

SELECT
*
FROM [dbo].[EX_CUSTOMERS3]
WHERE City = 'Porto'

--8.Pedidos com status CANCELLED.

SELECT
*
FROM [dbo].[EX_F_ORDERS2]
WHERE STATUS = 'CANCELLED'


--9.Pedidos dos últimos 30 dias (DATEADD).
SELECT
*
FROM [dbo].[EX_F_ORDERS2]
WHERE Order_Date >= DATEADD(DAY,-30,GETDATE())

--10.Produtos das categorias “Accessories” ou “Hardware”.
SELECT
*
FROM [dbo].[EX_PRODUCTS2]
WHERE CATEGORY = 'Accessories' or Category = 'Hardware'

--11.Produtos com nome contendo “Course”.
SELECT
*
FROM [dbo].[EX_PRODUCTS2]
where name like '%course%'

--12.Clientes com email terminando em “.com”.
SELECT
*
FROM [dbo].[EX_CUSTOMERS3]
WHERE EMAIL LIKE '%.com'


----4) GROUP BY / HAVING
--13.	Preço médio por categoria.
SELECT
*
FROM [dbo].[EX_PRODUCTS2]

SELECT
Category,
AVG(Price) AS P_Medio
FROM [dbo].[EX_PRODUCTS2]
GROUP BY Category
ORDER BY AVG(Price) DESC

--14.	Quantidade de produtos por categoria.
SELECT
*
FROM [dbo].[EX_PRODUCTS2]

-- NÃO FUNCIONA
--SELECT
--COUNT(NAME)
--FROM [dbo].[EX_PRODUCTS2]
--GROUP BY Category
--WHERE CATEGORY = 'COURSES'

SELECT
CATEGORY,
COUNT(NAME)
FROM [dbo].[EX_PRODUCTS2]
GROUP BY Category
HAVING CATEGORY = 'COURSES'

--15.	Quantidade de pedidos por status.
SELECT
*
FROM [dbo].[EX_F_ORDERS2]

SELECT
STATUS,
COUNT(STATUS) AS QTD_STATUS
FROM [dbo].[EX_F_ORDERS2]
GROUP BY STATUS
ORDER BY COUNT(STATUS) DESC

--16.	Total confirmado recebido (sum payments).
SELECT
* 
FROM [dbo].[EX_PAYMENTS2]

SELECT
Status,
SUM(AMOUNT) AS TOTAL
FROM [dbo].[EX_PAYMENTS2]
WHERE STATUS = 'CONFIRMED'
--WHERE STATUS = 'FAILED'

--17.	Total pago por cliente.
SELECT
*
FROM [dbo].[EX_F_ORDERS2]

SELECT
*
FROM [dbo].[EX_CUSTOMERS3]

SELECT
*
FROM [dbo].[EX_PAYMENTS2]


SELECT
*
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.CUSTOMER_ID
LEFT JOIN [dbo].[EX_PAYMENTS2] P ON O.Order_ID = P.Order_ID

SELECT
NAME,
SUM(AMOUNT) AS TOTAL
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.CUSTOMER_ID
LEFT JOIN [dbo].[EX_PAYMENTS2] P ON O.Order_ID = P.Order_ID
GROUP BY NAME
ORDER BY SUM(AMOUNT) DESC

--18.	Clientes com total gasto > 300 (HAVING).
SELECT
NAME,
SUM(AMOUNT) AS TOTAL
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.CUSTOMER_ID
LEFT JOIN [dbo].[EX_PAYMENTS2] P ON O.Order_ID = P.Order_ID
GROUP BY NAME
HAVING SUM(AMOUNT) > 300
ORDER BY SUM(AMOUNT) DESC

--19.	Total de cada pedido (somar itens). => FALTA

SELECT *
--ORDER_ID
--SUM(quantity)
FROM [dbo].[EX_F_ORDERS2] O
Group by Order_Id
LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.CUSTOMER_ID
LEFT JOIN [dbo].[EX_PAYMENTS2] P ON O.Order_ID = P.Order_ID


------5) JOINS
--20.	INNER JOIN: pedidos + nome do cliente.

SELECT
*
FROM [dbo].[EX_F_ORDERS2]

SELECT
*
FROM [dbo].[EX_CUSTOMERS3]

SELECT
*
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.Customer_ID

--21.	INNER JOIN: itens + nome do produto.

SELECT
*
FROM [dbo].[EX_ORDER_ITEMS2]

SELECT
*
FROM [dbo].[EX_PRODUCTS2]

SELECT
*
FROM [dbo].[EX_ORDER_ITEMS2] OI
LEFT JOIN [dbo].[EX_PRODUCTS2] P ON OI.Product_ID = P.Product_ID

SELECT
*
FROM [dbo].[EX_ORDER_ITEMS2] OI
inner JOIN [dbo].[EX_PRODUCTS2] P ON OI.Product_ID = P.Product_ID


--22.	Total do pedido com nome do cliente.
--SELECT *
--O.Order_ID,
--NAME,
--Amount
--FROM [dbo].[EX_F_ORDERS2] O
--LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.Customer_ID
--LEFT JOIN [dbo].[EX_PAYMENTS2] P ON P.Order_ID = O.Order_ID

SELECT
*
FROM EX_F_ORDERS2 O
INNER JOIN EX_ORDER_ITEMS2 OI ON O.Order_ID = OI.Order_ID

SELECT
C.NAME, O.Order_ID, suM(Quantity*Unit_Price) AS TOTAL_PEDIDO
FROM EX_F_ORDERS2 O
INNER JOIN EX_ORDER_ITEMS2 OI ON O.Order_ID = OI.Order_ID
INNER JOIN EX_CUSTOMERS3 C ON O.Customer_ID = C.Customer_ID
GROUP BY o.Order_ID, C.Name



--23.	Pagamentos com nome do cliente e status do pedido.
SELECT
P.Payment_ID,
C.NAME,
P.Status,
p.Amount
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.Customer_ID
LEFT JOIN [dbo].[EX_PAYMENTS2] P ON P.Order_ID = O.Order_ID


--24.	LEFT JOIN: clientes e seus pedidos.
SELECT
*
FROM [dbo].[EX_CUSTOMERS3]

SELECT
*
FROM [dbo].[EX_F_ORDERS2]


SELECT
*
FROM [dbo].[EX_CUSTOMERS3] C
LEFT JOIN [dbo].[EX_F_ORDERS2] O ON C.Customer_ID = O.Customer_ID



--25.	Clientes que NÃO possuem pedidos (anti join). da os registo de cliente que não tem pedidos orders
SELECT
*
FROM [dbo].[EX_CUSTOMERS3] C
LEFT JOIN [dbo].[EX_F_ORDERS2] O ON C.Customer_ID = O.Customer_ID
WHERE O.ORDER_ID IS NULL

--26.	Pedidos SEM pagamento confirmado.
SELECT
*
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.Customer_ID
LEFT JOIN [dbo].[EX_PAYMENTS2] P ON P.Order_ID = O.Order_ID
WHERE P.Status <> 'CONFIRMED'

--27.	Pedidos com mais de 2 itens.
SELECT
*
FROM [dbo].[EX_F_ORDERS2] O

SELECT
*
FROM [dbo].[EX_ORDER_ITEMS2] OI

SELECT
*
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_ORDER_ITEMS2] OI ON O.Order_ID = OI.Order_ID

SELECT
O.ORDER_ID,
COUNT(PRODUCT_ID)
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_ORDER_ITEMS2] OI ON O.Order_ID = OI.Order_ID
GROUP BY O.ORDER_ID
HAVING COUNT(PRODUCT_ID) > 2


--6) UPDATE
--28.	Aumente em 10% produtos da categoria “Accessories”.
SELECT
*
FROM [dbo].[EX_PRODUCTS2]

UPDATE [dbo].[EX_PRODUCTS2]
SET PRICE = (Price*1.10)
WHERE Category = 'Accessories'

SELECT
*
FROM [dbo].[EX_PRODUCTS2]


--29.	Marque Active=0 para produtos com preço < 5.
SELECT
*
FROM [dbo].[EX_PRODUCTS2]

UPDATE [dbo].[EX_PRODUCTS2]
SET ACTIVE = 0
WHERE PRICE < 5 

SELECT
*
FROM [dbo].[EX_PRODUCTS2]

--30.	Alterar status de pedidos NEW para CANCELLED se tiverem mais de 7 dias.
SELECT
*
FROM [dbo].[EX_F_ORDERS2]

UPDATE [dbo].[EX_F_ORDERS2]
SET Status = 'CANCELLED'
WHERE Status = 'NEW' AND Order_Date < DATEADD(DAY, -7, GETDATE())

SELECT
*
FROM [dbo].[EX_F_ORDERS2]


--31.	Corrigir o email de um cliente.

SELECT
*
FROM [dbo].[EX_CUSTOMERS3]

UPDATE [dbo].[EX_CUSTOMERS3]
SET Email = 'hugo.mendes.mendes@email.com'
WHERE Customer_ID = 8

SELECT
*
FROM [dbo].[EX_CUSTOMERS3]




--EXERCÍCIO 7 – DELETE
--32.	Remover pagamentos FAILED.

SELECT
*
FROM [dbo].[EX_PAYMENTS2]

DELETE FROM [dbo].[EX_PAYMENTS2]
WHERE STATUS = 'FAILED'

--33.	Remover pedidos CANCELLED (se não houver pagamentos confirmados). => FALTA



--34.	Remover produtos inativos que nunca foram vendidos. => FALTA
SELECT
*
FROM [dbo].[EX_PRODUCTS2]

SELECT
Product_ID,
COUNT(Quantity)
FROM [dbo].[EX_ORDER_ITEMS2]
GROUP BY Product_ID

DELETE FROM [dbo].[EX_PRODUCTS2]
WHERE Product_ID = 8

SELECT 
*
FROM [dbo].[EX_PRODUCTS2] 


--35.	Remover clientes sem pedido.

SELECT
*
FROM [dbo].[EX_F_ORDERS2]

SELECT
*
FROM [dbo].[EX_CUSTOMERS3]

SELECT
*
FROM [dbo].[EX_F_ORDERS2] O
LEFT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.Customer_ID 

SELECT
*
FROM [dbo].[EX_F_ORDERS2] O
RIGHT JOIN [dbo].[EX_CUSTOMERS3] C ON C.Customer_ID = O.Customer_ID 

DELETE FROM [dbo].[EX_CUSTOMERS3]
WHERE Customer_ID = 3

SELECT 
*
FROM [dbo].[EX_CUSTOMERS3]


-----------------------------------//--------------------------------------------

