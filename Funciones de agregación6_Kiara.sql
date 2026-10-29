-- Consultas:
-- 1.Cuenta las películas que se estrenaron en la década de los
-- 2000 (entre 2000 y 2009).
SELECT COUNT(*) AS total_peliculas
  from peliculas
  WHERE YEAR (estreno) BETWEEN 2000 AND 2009;
 
-- 2.Cuenta las películas con una puntuación entre 7.0 y 8.0.
SELECT COUNT(*) AS total_peliculas
  from peliculas
  WHERE puntuacion  >= 7 AND <= 8.0;
  
-- 3.Cuenta las películas de Harry Potter.
SELECT COUNT(*) AS total_peliculas
  from peliculas
  WHERE titulo LIKE 'Harry Potter%';
  
-- 4.Obtén la puntuación media de las películas que se estrenaron en la 
-- década de los 90 (entre 1990 y 1999).
SELECT AVG(puntuacion), AS total_peliculas
  from peliculas
  WHERE YEAR (estreno) BETWEEN 1990 AND 1999;

-- 5.Obtén la puntuación media de las películas que se estrenaron
-- a partir del año 2010.
SELECT AVG(puntuacion),AS total_peliculas
  from peliculas
  WHERE YEAR (estreno) >= 2010;
  
-- 6.Cuenta las películas que no se estrenaron en la década de los 
-- 2000 (entre 2000 y 2009).
SELECT AVG(puntuacion), AS total_peliculas
  from peliculas
  WHERE YEAR (estreno)NOT BETWEEN 2000 AND 2009;
  
-- 7.Cuenta las películas que no tienen una puntuación media entre
--  7.0 y 8.0.
SELECT AVG(puntuacion), AS total_peliculas
  from peliculas
  WHERE puntuacion NOT BETWEEN 7.0 AND 8.0;

-- 8.Cuenta las películas que se estrenaron antes del año 2010 y no
-- son de Star Wars.
SELECT COUNT(*)
FROM peliculas
WHERE YEAR(fecha_estreno) < 2010
AND titulo NOT LIKE '%Star Wars%';

-- 9.Cuenta las películas que se estrenaron en la década de los 80 (entre 1980 y 1989) y tienen una puntación media entre 7.0 y 8.0.
SELECT COUNT(*)
FROM peliculas
WHERE YEAR(fecha_estreno) BETWEEN 1980 AND 1989
AND puntuacion BETWEEN 7.0 AND 8.0;

-- 10.Cuenta y obtén la puntuación media de las películas estrenadas a partir del año 2000 y que no sean de Harry Potter.
SELECT COUNT(*) AS cantidad,
   AVG(puntuacion) AS media
FROM peliculas
WHERE YEAR(fecha_estreno) >= 2000
AND titulo NOT LIKE '%Harry Potter%';

-- 11.Obtén la puntuación máxima entre las películas de terror o de suspense estrenadas antes del año 2000.
SELECT MAX(puntuacion)
FROM peliculas
WHERE genero IN ('Terror', 'Suspense')
AND YEAR(fecha_estreno) < 2000;

-- 12.Obtén la puntuación mínima entre las películas de animación cuyo título no contiene la palabra película.
SELECT MIN(puntuacion)
FROM peliculas
WHERE genero = 'Animación'
AND titulo NOT LIKE '%película%';

-- 13.Obtén el primer año de estreno (solo el año) entre las películas de fantasía o de aventura.
SELECT MIN(YEAR(fecha_estreno))
FROM peliculas
WHERE genero IN ('Fantasía', 'Aventura');

-- 14.	Obtén el último año de estreno entre las películas de acción con una puntuación de al menos 8 y, en la misma consulta, cuenta cuántas son.
SELECT MAX(YEAR(fecha_estreno)) AS ultimo_estreno,
 COUNT(*) AS cantidad
FROM peliculas
WHERE genero = 'Acción'
AND puntuacion >= 8;

-- 15.Obtén la puntuación mínima entre las películas que no son de terror cuyo título está formado por una sola palabra.
SELECT MIN(puntuacion)
FROM peliculas
WHERE genero != 'Terror'
AND titulo NOT LIKE '% %';

-- 16.	Obtén la puntuación mínima y la puntuación media, redondeada a un decimal, de las películas que no son ni de superhéroes ni de suspense y que se estrenaron en un año par.
SELECT MIN(puntuacion) AS minima,
 ROUND(AVG(puntuacion), 1) AS media
FROM peliculas
WHERE genero NOT IN ('Superhéroes', 'Suspense')
AND MOD(YEAR(fecha_estreno), 2) = 0;

-- 17.	Obtén la puntuación máxima entre las películas estrenadas en la década de los 70 o de los 80 (entre 1970 y 1989, ambos inclusive) que no son de ciencia ficción.
SELECT MAX(puntuacion)
FROM peliculas
WHERE YEAR(fecha_estreno) BETWEEN 1970 AND 1989
AND genero !='Ciencia ficción';

-- 18.	Obtén la puntuación mínima y la máxima entre las películas de ciencia ficción estrenadas a partir de 1990, inclusive, cuyo título contiene dos puntos o una coma.
SELECT MIN(puntuacion) AS minima,
       MAX(puntuacion) AS maxima
FROM peliculas
WHERE genero = 'Ciencia ficción'
AND YEAR(fecha_estreno) >= 1990
AND (titulo LIKE '%:%' OR titulo LIKE '%,%');

-- 19.	Obtén la diferencia entre la puntuación máxima y la mínima de las películas de animación estrenadas antes del año 2000 o después del 2010 y, en la misma consulta, cuántos años de estreno distintos hay entre ellas.
SELECT MAX(puntuacion) - MIN(puntuacion) AS diferencia,
COUNT(DISTINCT YEAR(fecha_estreno)) AS anios_distintos
FROM peliculas
WHERE genero = 'Animación'
AND (YEAR(fecha_estreno) < 2000 OR YEAR(fecha_estreno) > 2010);

-- 20.	Obtén las puntuaciones máxima, mínima y media (redondeada a dos decimales) de las películas estrenadas antes del 2000 que no son de La Guerra de las Galaxias, que no son ni de animación ni de comedia y cuya descripción tiene menos de 80 caracteres. Obtén también cuántos géneros distintos hay entre ellas.
SELECT MAX(puntuacion) AS maxima,
       MIN(puntuacion) AS minima,
       ROUND(AVG(puntuacion), 2) AS media,
       COUNT(DISTINCT genero) AS generos_distintos
FROM peliculas
WHERE YEAR(fecha_estreno) < 2000
AND titulo NOT LIKE '%La Guerra de las Galaxias%'
AND genero NOT IN ('Animación', 'Comedia')
AND LENGTH(descripcion) < 80;

