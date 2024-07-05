SELECT

t.CustomerID,

t.CustomerName,

SUM(t.TotalNBOrders) as TotalNBOrders,

SUM(t.TotalNBInvoices) as TotalNBInvoices,

SUM(t.OrdersTotalValue) as OrdersTotalValue,

SUM(t.InvoicesTotalValue) as InvoicesTotalValue,

ABS(SUM(OrdersTotalValue) - SUM(InvoicesTotalValue)) as AbsoluteValueDifference

FROM

(

(

SELECT

Cu.CustomerID,

Cu.CustomerName,

COALESCE(COUNT(DISTINCT O.OrderId),0) AS TotalNBOrders,

0 AS TotalNBInvoices,

COALESCE(SUM(OL.Quantity * OL.UnitPrice),0) as OrdersTotalValue,

0 as InvoicesTotalValue,

0 as AbsoluteValueDifference





FROM Sales.Customers as Cu,

Sales.Orders as O,

Sales.OrderLines as OL



WHERE

O.CustomerId = Cu.CustomerID

AND OL.OrderID = O.OrderID

AND EXISTS

(

SELECT *

FROM Sales.Invoices AS IP1

WHERE

IP1.OrderID = O.OrderID



)

GROUP BY

Cu.CustomerID,

Cu.CustomerName

)

UNION 

(

SELECT

Cu.CustomerID,

Cu.CustomerName,

0 AS TotalNBOrders,

COALESCE(COUNT(DISTINCT I.InvoiceID),0) AS TotalNBInvoices,

0 as OrdersTotalValue,

COALESCE(SUM(IL.Quantity * IL.UnitPrice),0) as InvoicesTotalValue,

0 as AbsoluteValueDifference





FROM Sales.Customers as Cu,

Sales.Invoices as I,

Sales.InvoiceLines as IL



WHERE

I.CustomerId = Cu.CustomerID

AND IL.InvoiceID = I.InvoiceID

AND EXISTS

(

SELECT *

FROM Sales.Orders AS OP2

WHERE

OP2.OrderID = I.OrderID



)



GROUP BY

Cu.CustomerID,

Cu.CustomerName

)

) as t



GROUP BY

CustomerID,

CustomerName



ORDER BY

AbsoluteValueDifference DESC,

TotalNBOrders,

CustomerName;