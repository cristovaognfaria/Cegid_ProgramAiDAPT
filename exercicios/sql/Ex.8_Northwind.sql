
--EXERCICIO 8: SQL - NORTHWIND

--1.	Mostrar o primeiro nome, apelido e data de nascimento dos empregados que são Sales Managers, ordenados por data de nascimento.
SELECT
*
FROM [dbo].[Employees]

SELECT
FirstName,
LastName,
BirthDate
FROM [dbo].[Employees]
WHERE Title = 'Sales Manager'
ORDER BY BirthDate Asc

--2.	Criar uma lista de empregados com o nome completo em maiúsculas numa única coluna e criar uma coluna de saída chamada Género, com base no campo Title of Courtesy (Mrs. e Ms. são do sexo feminino e Mr. do sexo masculino). Considerar que pode existir um empregado sem género definido, que deve aparecer como Desconhecido.

SELECT
*
FROM [dbo].[Employees]

ALTER TABLE [dbo].[Employees]
ADD Nome_Completo VARCHAR(200)

UPDATE [dbo].[Employees]
SET Nome_Completo = FirstName + ' ' + LastName

UPDATE [dbo].[Employees]
SET Nome_Completo = UPPER(FirstName + ' ' + LastName)


ALTER TABLE [dbo].[Employees]
ADD Genero VARCHAR(200)

UPDATE [dbo].[Employees]
SET Genero =

 CASE
  WHEN TitleOfCourtesy IN ('Mrs.', 'Ms.') THEN 'Feminino'
  WHEN TitleOfCourtesy IN ('Mr.') THEN 'Masculino'
  ELSE 'Desconhecido'
  
  END


  SELECT
*
FROM [dbo].[Employees]

--3.	Selecionar todas as empresas fornecedoras e respetiva pessoa de contacto que sejam da Alemanha.

SELECT
*
FROM [dbo].[Suppliers]
WHERE COUNTRY = 'Germany'

--4.	Criar uma lista com o nome da empresa fornecedora e a pessoa de contacto que não sejam dos Estados Unidos.
SELECT
CompanyName,
ContactName
FROM [dbo].[Suppliers]
WHERE COUNTRY <> 'USA'

--5.	Selecionar todos os IDs e nomes dos clientes que sejam do Reino Unido e de Londres.
SELECT
*
FROM [dbo].[Customers]
WHERE Country = 'UK' AND CITY = 'London'

--6.	Identificar os clientes do Reino Unido que não estão sediados em Londres.
SELECT
*
FROM [dbo].[Customers]
WHERE Country = 'UK' AND CITY <>'London'

--7.	Selecionar as pessoas de contacto dos fornecedores cujo título de contacto começa por “Marketing” ou termina com “Marketing”.
SELECT
*
FROM [dbo].[Suppliers]
WHERE ContactTitle LIKE '%Marketing%'

--8.	Mostrar todos os fornecedores que sejam japoneses e trabalhem em marketing ou todos os fornecedores que sejam proprietários do negócio (business owners).
SELECT
*
FROM [dbo].[Suppliers]
WHERE COUNTRY = 'Japan' or ContactTitle = 'Owner'

--9.	Criar uma lista de clientes com o nome do cliente numa coluna, país, região e cidade. Quando o campo região for nulo, mostrar “Região não definida”. => FALTA
SELECT
CompanyName,
Country,
Region,
City

FROM [dbo].[Customers]

UPDATE [dbo].[Customers]
SET Region = 'Região não definida'
WHERE Region IS NULL

ALTER TABLE [dbo].[Customers]
ALTER COLUMN Region VARCHAR(100)




--10.	Identificar os fornecedores com quem trabalhamos que não têm site nem número de fax.
SELECT
*
FROM [dbo].[Suppliers]
WHERE HomePage IS NULL AND Fax IS NULL

--11.	Selecionar todos os clientes que não sejam de Itália, França ou Espanha.
SELECT
*
FROM [dbo].[Customers]
WHERE Country <> 'Italy' AND  Country <> 'France' AND Country <> 'Spain'


--12.	Mostrar o nome da empresa fornecedora, o nome da pessoa de contacto e o título de contacto, considerando que os que são Owners devem aparecer como “Owner - Não especificado”.
SELECT
*
FROM [dbo].[Suppliers]


SELECT
CompanyName,
ContactName,
ContactTitle
FROM [dbo].[Suppliers]

UPDATE [dbo].[Suppliers]
SET ContactTitle = 'Owner-Nao Especificado'
WHERE ContactTitle = 'Owner'

--13.	Mostrar todas as encomendas cujo valor do Freight (porte) seja maior ou igual a 5 e menor ou igual a 10, que tenham sido enviadas para os Estados Unidos e para as quais já conhecemos a data de envio.
SELECT
*
FROM [dbo].[Orders]
WHERE Freight >= 5 AND Freight <10 AND ShipCountry = 'USA' AND ShippedDate IS NOT NULL

--14.	Selecionar as encomendas para as quais não temos a data de envio e também não conhecemos a região.
SELECT
*
FROM [dbo].[Orders]
WHERE ShippedDate IS NULL AND ShipRegion IS NULL

--15.	Criar uma lista de encomendas que foram enviadas para o Reino Unido (UK) e cujo Freight seja inferior a 40, ou encomendas cujo CustomerID seja “ALFKI” e Freight também seja inferior a 40.
SELECT
*
FROM [dbo].[Orders]
WHERE ShipCountry = 'UK' AND Freight <40 OR CustomerID = 'ALFKI' AND Freight <40