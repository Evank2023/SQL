CREATE OR ALTER  PROCEDURE [dbo].[ReportCustomerTurnover](@Choice int = 1, @Year int = 2013)

AS

BEGIN



SET NOCOUNT ON;



IF (@Choice = 1)

BEGIN

SELECT C.CustomerName,

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 1 

AND YEAR(I.InvoiceDate) = @Year ) as 'Jan',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND  MONTH(I.InvoiceDate) = 2 

AND YEAR(I.InvoiceDate) = @Year ) as 'Feb',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND  MONTH(I.InvoiceDate) = 3 

AND YEAR(I.InvoiceDate) = @Year ) as 'Mar',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 4 

AND YEAR(I.InvoiceDate) = @Year ) as 'Apr',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 5 

AND YEAR(I.InvoiceDate) = @Year ) as 'May',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 6 

AND YEAR(I.InvoiceDate) = @Year ) as 'Jun',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 7 

AND YEAR(I.InvoiceDate) = @Year ) as 'Jul',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 8 

AND YEAR(I.InvoiceDate) = @Year ) as 'Aug',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 9 

AND YEAR(I.InvoiceDate) = @Year ) as 'Sep',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 10 

AND YEAR(I.InvoiceDate) = @Year ) as 'Oct',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate)= 11 

AND YEAR(I.InvoiceDate) = @Year ) as 'Nov',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND MONTH(I.InvoiceDate) = 12 

AND YEAR(I.InvoiceDate) = @Year ) as 'Dec'

FROM Sales.Customers as C

ORDER BY C.CustomerName

END



IF (@Choice = 2)

BEGIN 

SELECT C.CustomerName,

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND YEAR(I.InvoiceDate) = @Year

AND DATEPART(QUARTER, I.InvoiceDate) = 1 ) as 'Q1',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND YEAR(I.InvoiceDate) = @Year

AND DATEPART(QUARTER, I.InvoiceDate) = 2 ) as 'Q2',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND YEAR(I.InvoiceDate) = @Year

AND DATEPART(QUARTER, I.InvoiceDate) = 3 ) as 'Q3',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM Sales.InvoiceLines as IL, Sales.Invoices as I

WHERE IL.InvoiceID = I.InvoiceID 

AND C.CustomerID = I.CustomerID

AND YEAR(I.InvoiceDate) = @Year

AND DATEPART(QUARTER, I.InvoiceDate) = 4 ) as 'Q4'

FROM Sales.Customers as C

ORDER BY C.CustomerName

END



IF (@Choice = 3)

BEGIN

SELECT CustomerName,

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM

Sales.InvoiceLines as IL,

Sales.Invoices as I

WHERE

IL.InvoiceID = I.InvoiceID 

AND Cu.CustomerID = I.CustomerID

AND YEAR(I.InvoiceDate) = 2013

) As '2013',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM

Sales.InvoiceLines as IL,

Sales.Invoices as I

WHERE

IL.InvoiceID = I.InvoiceID 

AND Cu.CustomerID = I.CustomerID

AND YEAR(I.InvoiceDate) = 2014

) As '2014',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM

Sales.InvoiceLines as IL,

Sales.Invoices as I

WHERE

IL.InvoiceID = I.InvoiceID 

AND Cu.CustomerID = I.CustomerID

AND YEAR(I.InvoiceDate) = 2015

) As '2015',

(

SELECT COALESCE(SUM(IL.UnitPrice*IL.Quantity), 0)

FROM

Sales.InvoiceLines as IL,

Sales.Invoices as I

WHERE

IL.InvoiceID = I.InvoiceID 

AND Cu.CustomerID = I.CustomerID

AND YEAR(I.InvoiceDate) = 2016

) As '2016'

FROM

Sales.Customers as Cu

ORDER By CustomerName



END



END