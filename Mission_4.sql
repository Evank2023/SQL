SELECT

WorstLoses.CustomerCategoryName,

WorstLoses.MaxLoss,

Sub2AllTotals.CustomerName,

Sub2AllTotals.CustomerID

  FROM

  (

  SELECT    Sub1AllTotals.CustomerCategoryName,

MAX(Sub1AllTotals.TotalValueLostOrders) as MaxLoss

  FROM 

  (

  SELECT Cu.CustomerID,

Cu.CustomerName,

Ca.CustomerCategoryName,

SUM(OL.Quantity * OL.UnitPrice) as TotalValueLostOrders



  FROM Sales.Orders as O,

Sales.OrderLines as OL,

Sales.Customers as Cu,

Sales.CustomerCategories as Ca

  WHERE NOT EXISTS

  (

SELECT *

FROM Sales.Invoices as I

WHERE I.OrderID = O.OrderID

  )

  AND OL.OrderId = O.OrderId

  AND Cu.CustomerID = O.CustomerID

  AND Ca.CustomerCategoryID = Cu.CustomerCategoryID



GROUP BY Cu.CustomerID, Cu.CustomerName, Ca.CustomerCategoryName

) as Sub1AllTotals



GROUP BY CustomerCategoryName

) as WorstLoses,

(

SELECT Cu.CustomerID,

Cu.CustomerName,

Ca.CustomerCategoryName,

SUM(OL.Quantity * OL.UnitPrice) as TotalValueLostOrders



  FROM Sales.Orders as O,

Sales.OrderLines as OL,

Sales.Customers as Cu,

Sales.CustomerCategories as Ca

  WHERE NOT EXISTS

  (

SELECT *

FROM Sales.Invoices as I

WHERE I.OrderID = O.OrderID

  )

  AND OL.OrderId = O.OrderId

  AND Cu.CustomerID = O.CustomerID

  AND Ca.CustomerCategoryID = Cu.CustomerCategoryID



GROUP BY Cu.CustomerID, Cu.CustomerName, Ca.CustomerCategoryName

) as Sub2AllTotals



WHERE

WorstLoses.CustomerCategoryName = Sub2AllTotals.CustomerCategoryName

AND WorstLoses.MaxLoss = Sub2AllTotals.TotalValueLostOrders



ORDER BY

WorstLoses.MaxLoss DESC