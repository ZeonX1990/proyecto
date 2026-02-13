SELECT DNI_Alumne_Evaluacion_interna,Puntuacion
FROM Evaluacion_interna
ORDER BY DESC;

SELECT DNI_Alumne_Evaluacion_interna,Estado_Asignado
FROM Alumno
WHERE Estado_Asignado = false
;

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
