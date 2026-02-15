-- Llistat d'alumnes amb puntuació global, ordenat descendent (rànquing).
SELECT 
    a.DNI_Alumne,
    a.Nombre, 
    a.Apellido, 
    e.RA2_IPO AS Estado_RA2, 
    (e.Trabajo_Equipo + e.Comunicacion + e.Puntualidad + e.Actitud + e.Nivel_Tecnico + e.Autonomia) AS Puntuacion_Global
FROM Evaluacion_interna e
JOIN Alumno a ON a.DNI_Alumne = e.DNI_Alumne_Evaluacion_interna
ORDER BY Puntuacion_Global DESC;

--Calcula la nota final sumando las 6 competencias bajo con el nombre Total.
--Junta los datos del alumno (DNI, nombre y apellido).
--Crea un ranking donde el alumno con mayor puntuación aparece el primero.

-- Top 5 alumnes per puntuació que encara no tenen assignació.
SELECT 
    a.DNI_Alumne,
    a.Nombre,
    a.Estado_Practica
FROM Alumno a
JOIN Evaluacion_interna e ON a.DNI_Alumne = e.DNI_Alumne_Evaluacion_interna
WHERE a.Estado_Practica IS NULL
ORDER BY (e.Trabajo_Equipo + e.Comunicacion + e.Puntualidad + e.Actitud + e.Nivel_Tecnico + e.Autonomia) DESC
LIMIT 5;

--Coge el DNI y el Nombre del alumno y el estado de practicas.
--Sólo elige alumnos que no tienen ninguna práctica asignada.
--Suma las 6 notas, las ordena de mayor a menor y, con el LIMIT 5, se queda sólo con los 5 mejores que están libres.

--Per cada empresa: nombre de currículums rebuts, i quants estan en estat “entrevista/acceptat”.
SELECT 
    CIF_NIF_Empresa_Recibir,
    COUNT(Data_Enviamiento)
FROM Recibir
WHERE Estado_Recibir IN ('entrevista', 'acceptat')
GROUP BY CIF_NIF_Empresa_Recibir
ORDER BY CIF_NIF_Empresa_Recibir DESC;

--Identifica la empresa y cuenta las fechas de envío.
--Sólo cuenta los currículos que ya han pasado a fase de entrevista o aceptado.
--Agrupa los resultados por empresa para que el contador no sea general, sino específico para cada centro.

-- Historial d’enviaments d’un alumne (totes les empreses, dates, estat, última versió de CV).
SELECT 
    c.DNI_Alumne_Curriculum AS DNI, 
    e.Nombre AS Empresa, 
    r.Data_Enviamiento, 
    r.Estado_Recibir, 
    c.Version AS CV_Versio
FROM Curriculum c
JOIN Recibir r ON c.ID_Curriculum = r.ID_Curriculum_Recibir
JOIN Empresa e ON r.CIF_NIF_Empresa_Recibir = e.CIF_NIF_Empresa
ORDER BY r.Data_Enviamiento DESC;

--Muestra DNI, Nombre de la empresa, fecha de envío, estado y versión del CV.
--Conecta al alumno con su currículum, el currículum con el envío y el envío con la empresa final.
--Ordena cronológicamente para ver la actividad más reciente primero.


--Alumnes amb més de X enviaments sense resposta (estat “enviat” i han passat N dies).

SELECT c.DNI_Alumne_Curriculum
FROM Recibir r
JOIN Curriculum c ON c.ID_Curriculum = r.ID_Curriculum_Recibir
JOIN Empresa e ON r.CIF_NIF_Empresa_Recibir = e.CIF_NIF_Empresa
WHERE r.Estado_Recibir = 'enviat' AND r.Data_Enviamiento <= CURRENT_DATE - 10
GROUP BY c.DNI_Alumne_Curriculum
HAVING COUNT(r.ID_Curriculum_Recibir) > 1;

--Identifica a los alumnos sin respuesta.
--Busca envíos realizados hace más de 10 días que todavía están en estado "enviado".
--Solo muestra a aquellos alumnos que tienen más de un envío.


-- Informe d’assignacions actives: alumne + empresa + dates + tutor.
SELECT 
    a.Nombre AS Alumne, 
    a.DNI_Alumne, 
    e.Nombre AS Empresa, 
    e.CIF_NIF_Empresa, 
    a.Fecha_Inicio, 
    a.Tutor_Empresa
FROM Alumno a
JOIN Empresa e ON a.CIF_NIF_Empresa_Alumno = e.CIF_NIF_Empresa
WHERE a.Estado_Practica = 'confirmada';

--Muestra  Alumno, Empresa, Fecha de inicio y el Tutor asignado.
--Sólo muestra las prácticas que ya están confirmadas oficialmente.

--alumnes amb assignació però sense cap enviament “acceptat” prèviament (si el vostre flux ho contempla).

SELECT 
    a.Nombre,a.DNI_Alumne,
    e.Nombre,
    e.CIF_NIF_Empresa,
    a.Fecha_Inicio,
    a.Tutor_Empresa
FROM Alumno a 
JOIN Empresa e ON a.CIF_NIF_Empresa_Alumno = e.CIF_NIF_Empresa
WHERE Estado_Practica = 'proposada'OR a.Estado_Practica IS NULL
;

--Datos del alumno, empresa y fechas de prácticas.
--Filtra alumnos que están en el estado (propuesta) o que directamente no tienen ningún estado.

--Alumnes actius amb puntuació global superior a 70%, mostrant també la mitjana global.

SELECT 
    a.DNI_Alumne, 
    a.Nombre, 
    (e.Trabajo_Equipo + e.Comunicacion + e.Puntualidad + e.Actitud + e.Nivel_Tecnico + e.Autonomia) AS Puntuacion_Global, 
    (e.Trabajo_Equipo + e.Comunicacion + e.Puntualidad + e.Actitud + e.Nivel_Tecnico + e.Autonomia) / 6.0 AS Mitjana_Alumno
FROM Alumno a
JOIN Evaluacion_interna e ON a.DNI_Alumne = e.DNI_Alumne_Evaluacion_interna
WHERE a.Estado_Alumne = 'actiu'
GROUP BY 
    a.DNI_Alumne, 
    a.Nombre, 
    e.Trabajo_Equipo, 
    e.Comunicacion, 
    e.Puntualidad, 
    e.Actitud, 
    e.Nivel_Tecnico, 
    e.Autonomia
HAVING (e.Trabajo_Equipo + e.Comunicacion + e.Puntualidad + e.Actitud + e.Nivel_Tecnico + e.Autonomia) > 42;

-- Muestra DNI, Nombre y la suma de las notas del alumno.
--cálcula la nota y la media de cada alumno.
--Solo muestra alumnos "activos" que superan los 42 puntos.

--Empreses d’un sector concret (per exemple, ‘Tecnologia’ o ‘Educació’) que no han rebut cap enviament.

SELECT 
    emp.CIF_NIF_Empresa,
    emp.Nombre
FROM Empresa emp
LEFT JOIN Recibir r ON emp.CIF_NIF_Empresa = r.CIF_NIF_Empresa_Recibir
WHERE emp.Sector = 'Tecnología' AND r.ID_Curriculum_Recibir IS NULL;

--Muestra CIF y Nombre de la empresa.
--Selecciona las que nunca han recibido un CV.