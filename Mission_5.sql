SELECT *
FROM    Customer as Cu
WHERE NOT EXISTS
(
    SELECT *
    FROM Product as P
    WHERE NOT EXISTS
    (
        SELECT *
        FROM Purchase as Pu
        WHERE
            Pu.ProductId = P.ProductId
            AND Cu.CustomerId = Pu.CustomerId
    )
)
AND (
        SELECT SUM(Pu2.Qty)
        FROM Purchase as Pu2
        WHERE
            Pu2.CustomerId = Cu.CustomerId
    ) >= 50