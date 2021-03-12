SELECT * FROM dashboard.kpis;
SELECT * FROM dashboard.vistas;
SELECT * FROM dashboard.detallespantalla;
SELECT * FROM dashboard.params;
SELECT * FROM dashboard.pvistas;

SELECT * FROM dashboard.pantalla;


SELECT * FROM tickets.BITACORA;


SELECT MAX(fecha), B.idCasos, fecha, accion, accionUltima FROM tickets.bitacora B 
	JOIN tickets.casos C
    ON C.idCasos=B.idCasos
WHERE idCategoria=2 group by idCasos;



SELECT B.idCasos, MAX(B2.fecha) fechaAccionPrimera, B2.accion accionPrimera, MAX(B.fecha) fecha, B.accion FROM tickets.bitacora B 
JOIN tickets.bitacora B2 ON B.idCasos=B2.idCasos AND B2.accion='C'
JOIN dashboard.calendarView ON theDate='20201208'
WHERE (date(B.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth))) AND 
(date(B2.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth))) 
AND B.accion IN ('A') GROUP BY B.idCasos;


SELECT 'Total de Tickets' etiqueta, count(C.idCasos) valor  FROM tickets.casos C
	JOIN 
		(SELECT B.idCasos, MAX(B2.fecha) fechaAccionPrimera, B2.accion accionPrimera, MAX(B.fecha) fecha, B.accion FROM tickets.bitacora B 
			JOIN tickets.bitacora B2 ON B.idCasos=B2.idCasos AND B2.accion='C'
			JOIN dashboard.calendarView ON theDate='20201208'
			WHERE (date(B.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth))) AND 
			(date(B2.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth))) 
		AND B.accion IN ('A') GROUP BY B.idCasos) B 
    ON C.idCasos=B.idCasos
    JOIN dashboard.calendarView CV 
    ON theDate = '20201208'    
WHERE C.idCategoria=2 AND (date(B.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth)));
    
-- TICKETS CREADOS RECIBIDOS O RESUELTOS EN UN PERIODO DE TIEMPO
SELECT 'Total de Tickets' etiqueta, count(C.idCasos) valor  FROM tickets.casos C
	JOIN 
		(SELECT MAX(fecha), idCasos, fecha, accion FROM tickets.bitacora B WHERE B.accion IN ('A') GROUP BY idCasos) B 
    ON C.idCasos=B.idCasos
    JOIN dashboard.calendarView CV 
    ON theDate = '20201208'    
    WHERE C.idCategoria=2 AND (date(B.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth)));
-- TICKETS CREADOS, RESUELTOS Y TERMINADOS EN UN MISMO PERIODO DE TIEMPO
SELECT 'Total de Tickets' etiqueta, count(C.idCasos) valor  FROM tickets.casos C
	JOIN 
		(SELECT MAX(fecha), idCasos, fecha, accion FROM tickets.bitacora B WHERE B.accion IN ('R') GROUP BY idCasos) B 
    ON C.idCasos=B.idCasos
    JOIN dashboard.calendarView CV 
    ON theDate = '20201208'    
    WHERE C.idCategoria=1 AND (date(B.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth)));
    
    
-- TICKETS CREADOS EN UN MISMO PERIODO DE TIEMPO Y TERMINADOS EN EL MISMO PERIODO

SELECT '%1' etiqueta, count(C.idCasos) valor  FROM tickets.casos C
	JOIN 
		(SELECT B.idCasos, MAX(B2.fecha) fechaAccionPrimera, B2.accion accionPrimera, MAX(B.fecha) fecha, B.accion FROM tickets.bitacora B 
				JOIN tickets.bitacora B2 ON B.idCasos=B2.idCasos AND B2.accion='C'
				JOIN dashboard.calendarView ON theDate='%3'
				WHERE (date(B.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth))) AND 
				(date(B2.fecha) between (date(theFirstOfMonth)) AND date((theLastOfMonth))) 
		AND B.accion IN (%2) GROUP BY B.idCasos) B 
    ON C.idCasos=B.idCasos
    JOIN dashboard.calendarView CV 
    ON theDate = '%3'    
WHERE C.idCategoria=%4 AND (date(B.fecha) between (date(%5)) AND date((%6)));
    
    
    
    

SELECT '%1' etiqueta, count(C.idCasos) valor  FROM tickets.casos C
	JOIN 
		(SELECT MAX(fecha), idCasos, fecha, accion FROM tickets.bitacora B WHERE B.accion IN (%2) GROUP BY idCasos) B 
    ON C.idCasos=B.idCasos
    JOIN dashboard.calendarView CV 
    ON theDate = '%3'    
    WHERE C.idCategoria=%4 AND (date(B.fecha) between (date(%5)) AND date((%6)));
    
    
    
    e(theFirstOfMonth) AND date(theLastOfMonth)) 

SELECT 'Total de Tickets' etiqueta, count(C.idCasos) valor
	FROM tickets.casos C
    JOIN dashboard.calendarView ON theDate = '2020'
    WHERE C.idCategoria=2 
    ;


SELECT '%1' etiqueta, count(idVale) valor FROM plus.vales_personal 
       JOIN plus.usuarios U ON noEmp=U.nColaborador
       JOIN dashboard.calendarview ON theDate = '%2' 
       WHERE (date(fecha) between (date(%3)) AND date((%4))) AND tipo IN (%5)
       AND autoriza %6 ('') AND verifica %7 ('') 