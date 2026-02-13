SELECT DNI_Alumne_Evaluacion_interna,Puntuacion
FROM Evaluacion_interna
ORDER BY DNI_Alumne_Evaluacion_interna DESC;

SELECT 
    a.Nombre,a.Apellido,e.RA2_IPO AS Estado_RA2,
    (e.Trabajo_Equipo + e.Comunicacion + e.Puntualidad + e.Actitud + e.Nivel_Tecnico + e.Autonomia) AS Puntuacion_Global
FROM Evaluacion_interna e
JOIN Alumno a ON a.DNI_Alumne = e.DNI_Alumne_Evaluacion_interna
ORDER BY Puntuacion_Global DESC;

SELECT DNI_Alumne,Estado_Asignado
FROM Alumno
WHERE Estado_Practica IS NULL
LIMIT 5;

SELECT COUNT(Data_Enviamiento)
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
