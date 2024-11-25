-- ¿Cuántos Usuarios gustan del Jazz?
SELECT COUNT(1) FROM USERS
WHERE likejazz = TRUE;

-- b. ¿Cuántos Usuarios gustan de la ópera y del rock al mismo tiempo?
SELECT COUNT(1) FROM USERS 
WHERE likeopera = TRUE AND likerock = TRUE;

-- c. ¿Cuál es el promedio, moda y mediana del total de Ventas?
SELECT
    AVG(pricepaid) AS promedio_ventas,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY pricepaid) AS mediana_ventas,
    (
        SELECT pricepaid
        FROM SALES
        GROUP BY pricepaid
        HAVING COUNT(1) = (
            SELECT MAX(price)
            FROM (
                SELECT pricepaid, COUNT(1) as price
                FROM SALES
                GROUP BY pricepaid
            ) 
        )
    ) AS moda_ventas
FROM SALES;

-- d. ¿Cuál el promedio de ventas de usuarios que gustan del rock, pero NO del Jazz?
SELECT AVG(s.pricepaid) AS promedio_ventas 
FROM USERS u
INNER JOIN (SELECT buyerid, pricepaid FROM SALES) s
ON u.userid = s.buyerid
WHERE u.likerock = TRUE AND u.likejazz = FALSE;