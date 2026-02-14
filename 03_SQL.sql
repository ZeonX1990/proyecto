--Llistat d’alumnes amb puntuació global, ordenat descendent (rànquing).

SELECT a.Nombre,a.Apellido,e.RA2_IPO AS Estado_RA2, (e.Trabajo_Equipo + e.Comunicacion + e.Puntualidad + e.Actitud + e.Nivel_Tecnico + e.Autonomia) AS Puntuacion_Global
FROM Evaluacion_interna e
JOIN Alumno a ON a.DNI_Alumne = e.DNI_Alumne_Evaluacion_interna
ORDER BY Puntuacion_Global DESC;

--Top 5 alumnes per puntuació que encara no tenen assignació.
SELECT DNI_Alumne,Estado_Asignado
FROM Alumno
WHERE Estado_Practica IS NULL
LIMIT 5;

--Per cada empresa: nombre de currículums rebuts, i quants estan en estat “entrevista/acceptat”.
SELECT CIF_NIF_Empresa_Recibir,COUNT(Data_Enviamiento)
FROM Recibir
WHERE Estado_Recibir IN ('entrevista', 'acceptat')
GROUP BY CIF_NIF_Empresa_Recibir
ORDER BY CIF_NIF_Empresa_Recibir DESC;

--Historial d’enviaments d’un alumne (totes les empreses, dates, estat, última versió de CV).
SELECT c.DNI_Alumne_Curriculum AS DNI,e.Nombre AS Empresa,r.Data_Enviamiento,r.Estado_Recibir,c.Version AS CV_Versio
FROM Curriculum c
JOIN Recibir r ON c.ID_Curriculum = r.ID_Curriculum_Recibir
JOIN Empresa e ON r.CIF_NIF_Empresa_Recibir = e.CIF_NIF_Empresa
ORDER BY r.Data_Enviamiento DESC;

--Alumnes amb més de X enviaments sense resposta (estat “enviat” i han passat N dies).

SELECT c.DNI_Alumne_Curriculum
FROM Recibir r
JOIN Curriculum c ON c.ID_Curriculum = r.ID_Curriculum_Recibir
JOIN Empresa e ON r.CIF_NIF_Empresa_Recibir = e.CIF_NIF_Empresa
WHERE r.Estado_Recibir = 'enviat' AND r.Data_Enviamiento <= CURRENT_DATE - 10
GROUP BY c.DNI_Alumne_Curriculum
HAVING COUNT(r.ID_Curriculum_Recibir) > 1;


--Informe d’assignacions actives: alumne + empresa + dates + tutor.

SELECT a.Nombre,a.DNI_Alumne,e.Nombre,e.CIF_NIF_Empresa,a.Fecha_Inicio,a.Tutor_Empresa
FROM Alumno a
JOIN Empresa e ON a.CIF_NIF_Empresa_Alumno = e.CIF_NIF_Empresa
WHERE Estado_Practica = 'confirmada';

--alumnes amb assignació però sense cap enviament “acceptat” prèviament (si el vostre flux ho contempla).

SELECT a.Nombre,a.DNI_Alumne,e.Nombre,e.CIF_NIF_Empresa,a.Fecha_Inicio,a.Tutor_Empresa
FROM Alumno a 
JOIN Empresa e ON a.CIF_NIF_Empresa_Alumno = e.CIF_NIF_Empresa
WHERE Estado_Practica = 'proposada'OR a.Estado_Practica IS NULL
;

--Alumnes actius amb puntuació global superior a 7, mostrant també la mitjana global.

SELECT a.DNI_Alumne, a.Nombre, a.Apellido, e.Puntuacion, (SELECT AVG(Puntuacion) FROM Evaluacion_interna) AS Mitjana_Global
FROM Alumno a
JOIN Evaluacion_interna e ON a.DNI_Alumne = e.DNI_Alumne_Evaluacion_interna
WHERE a.Estado_Alumne = 'actiu' AND e.Puntuacion > 7;

--Empreses d’un sector concret (per exemple, ‘Tecnologia’ o ‘Educació’) que no han rebut cap enviament.

SELECT emp.CIF_NIF_Empresa, emp.Nombre
FROM Empresa emp
LEFT JOIN Recibir r ON emp.CIF_NIF_Empresa = r.CIF_NIF_Empresa_Recibir
WHERE emp.Sector = 'Tecnología' AND r.ID_Curriculum_Recibir IS NULL;