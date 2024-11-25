/* Nombre de usuario, Apellido de usuario, Correo de usuario, Nombre del evento, 
lugar del evento, Fecha del evento, Cantidad y Total vendidos */

CREATE TABLE full_data AS (
    SELECT 
        u.firstname AS nombre_usuario, 
        u.lastname AS apellido_usuario,
        u.email AS correo_usuario,
        e.eventname AS nombre_evento,
        v.venuename AS lugar_evento, -- v.venuename
        e.starttime AS fecha_evento,
        s.qtysold AS cantidad,
        s.pricepaid AS total
    FROM USERS u
    INNER JOIN (SELECT buyerid, eventid, qtysold, pricepaid FROM SALES) s
    ON u.userid = s.buyerid
    INNER JOIN (SELECT eventid, venueid, eventname, starttime FROM EVENT) e
    ON s.eventid = e.eventid
    INNER JOIN (SELECT venueid, venuename FROM VENUE) v
    ON e.venueid = v.venueid
);

-- Enviar a S3

UNLOAD ('SELECT * FROM FULL_DATA')   
TO 's3://tickit-sample-data/redshift/' 
IAM_ROLE DEFAULT
HEADER
DELIMITER ','
PARALLEL OFF
GZIP;