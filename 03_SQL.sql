SELECT DNI_Alumne_Evaluacion_interna,Puntuacion -- 1
FROM Evaluacion_interna
ORDER BY DNI_Alumne_Evaluacion_interna DESC;

SELECT a.Nombre,a.Apellido,e.RA2_IPO AS Estado_RA2, (e.Trabajo_Equipo + e.Comunicacion + e.Puntualidad + e.Actitud + e.Nivel_Tecnico + e.Autonomia) AS Puntuacion_Global
FROM Evaluacion_interna e
JOIN Alumno a ON a.DNI_Alumne = e.DNI_Alumne_Evaluacion_interna
ORDER BY Puntuacion_Global DESC;

SELECT DNI_Alumne,Estado_Asignado -- 2
FROM Alumno
WHERE Estado_Practica IS NULL
LIMIT 5;

SELECT COUNT(Data_Enviamiento) -- 3
FROM Empresa
ORDER BY DESC;

SELECT Data_Entrevista,Data_Enviamiento,Data_Respuesta,Estado_Recibir
FROM 
ORDER BY DESC;

SELECT CIF_NIF_Empresa_Recibir,DNI_Alumne_Evaluacion_interna,Puntuacion
FROM Recibir
JOIN Curriculum ON ID_Curriculum = ID_Curriculum_Recibir
JOIN Empresa ON CIF_NIF_Empresa = CIF_NIF_Empresa_Recibir
WHERE DNI_Alumne_Curriculum = ;

SELECT DNI_Alumne_Evaluacion_interna,Puntuacion
FROM Evaluacion_interna
ORDER BY DESC;

SELECT a.Nombre, a.Apellido, emp.Nombre AS Empresa, a.Fecha_Inicio, a.Fecha_Finalizacion, a.Tutor_Empresa -- 6
FROM Alumno a
JOIN Recibir r ON a.DNI_Alumne = (SELECT c.DNI_Alumne_Curriculum FROM Curriculum c WHERE c.ID_Curriculum = r.ID_Curriculum_Recibir)
JOIN Empresa emp ON r.CIF_NIF_Empresa_Recibir = emp.CIF_NIF_Empresa
WHERE a.Estado_Practica = 'confirmada' AND r.Estado_Recibir = 'acceptat';

SELECT a.DNI_Alumne, a.Nombre, a.Apellido -- 7
FROM Alumno a
WHERE a.Estado_Practica = 'confirmada' AND NOT EXISTS (SELECT * FROM Curriculum c JOIN Recibir r ON c.ID_Curriculum = r.ID_Curriculum_Recibir WHERE c.DNI_Alumne_Curriculum = a.DNI_Alumne AND r.Estado_Recibir = 'acceptat');

SELECT a.DNI_Alumne, a.Nombre, a.Apellido, e.Puntuacion, (SELECT AVG(Puntuacion) FROM Evaluacion_interna) AS Mitjana_Global -- 8
FROM Alumno a
JOIN Evaluacion_interna e ON a.DNI_Alumne = e.DNI_Alumne_Evaluacion_interna
WHERE a.Estado_Alumne = 'actiu' AND e.Puntuacion > 7;

SELECT emp.CIF_NIF_Empresa, emp.Nombre -- 9
FROM Empresa emp
LEFT JOIN Recibir r ON emp.CIF_NIF_Empresa = r.CIF_NIF_Empresa_Recibir
WHERE emp.Sector = 'Tecnología' AND r.ID_Curriculum_Recibir IS NULL;