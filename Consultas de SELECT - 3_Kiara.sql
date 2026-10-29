-- Consultas:
-- 1.	Muestra la película que se llama Spider-Man.
SELECT * 
    FROM peliculas
	WHERE titulo= 'Spider-Man';
	
-- 2.	Muestra todas las películas de Harry Potter.
SELECT * 
    FROM peliculas
	WHERE titulo LIKE 'Harry Potter%';
	
-- 3.	Muestra las películas que empiezan por el artículo el.
SELECT * 
    FROM peliculas
	WHERE titulo LIKE 'El%';
	
-- 4.	Muestra las películas que empiezan por los artículos el, 
-- la, los, o las.
SELECT * 
    FROM peliculas
	WHERE titulo LIKE 'El %' OR titulo LIKE 'La %' OR titulo LIKE 
	'Los %' OR titulo LIKE 'Las %';
	
-- 5.	Muestra las películas con una calificación de al menos 7.6.
SELECT * 
    FROM peliculas
	WHERE puntuacion >= 7.6;
	
-- 6.	Muestra las películas con una calificación inferior a 7.6.
SELECT * 
    FROM peliculas
	WHERE puntuacion < 7.6;
	
-- 7.	Muestra las películas con una calificación de al menos 8.
SELECT * 
    FROM peliculas
	WHERE puntuacion >= 8;
	
-- 8.	Muestra las películas con una calificación inferior a 8.
SELECT * 
    FROM peliculas
	WHERE puntuacion < 8;
	
-- 9.	Muestra las películas con una calificación entre 7 y 8, 
-- ambos inclusive.
SELECT * 
    FROM peliculas
	WHERE puntuacion BETWEEN 7 AND 8;
	
SELECT * 
    FROM peliculas
	WHERE puntuacion >= 7 AND <= 8;
	
-- 10.	Muestra las películas con una calificación entre 6 y 7, 
-- ambos inclusive.
SELECT * 
    FROM peliculas
	WHERE puntuacion BETWEEN 6 AND 7;
	
-- 11.	Muestra las películas que se estrenaron en la década de los 90 
--(entre el año 1990 y el 1999) y que tienen una puntuación de al menos 8.
SELECT * 
    FROM peliculas
	WHERE YEAR (estreno) BETWEEN 1990 AND 1999 AND puntuacion >= 8;
	
-- 12.	Muestra las películas que se estrenaron en la década de los 2000 
--(entre el año 2000 y el 2009) que no son ni de animación ni de fantasía.
SELECT * 
    FROM peliculas
	WHERE YEAR (estreno) BETWEEN 2000 AND 2009 AND NOT genero
 IN ('animacion' , 'fantasia');
 
 SELECT * 
    FROM peliculas
	WHERE YEAR (estreno) >= 2000 AND YEAR (estreno) <= 2009 AND NOT genero = 
	'animacion'AND NOt genero = 'fantasia';

-- 13.	Muestra las películas que se estrenaron a partir del año 2010, 
-- inclusive, cuya puntuación es inferior a 7 o superior a 8.4.
SELECT * 
    FROM peliculas
	WHERE YEAR (estreno) >= 2010 AND (puntuacion < 7 OR puntuacion > 8.4);
	
-- 14.	Muestra las películas cuya descripción comienza por la palabra
-- mujer o por la palabra hombre y que tienen una puntuación superior 
-- a 7.5.
SELECT * 
    FROM peliculas
	WHERE (descripcion LIKE 'mujer%' OR descripcion LIKE 'hombre%') AND 
	puntuacion > 7.5;
	
-- 15.	Muestra las películas con una puntuación inferior a 7 cuya 
-- descripción no comienza por ningún artículo (el, la, los, las, 
-- un, una).
SELECT * 
    FROM peliculas
    WHERE puntuacion < 7 AND NOT descripcion  LIKE 'El %' AND NOT
	descripcion  LIKE 'La %' AND NOT descripcion  LIKE 'Los %'
	AND NOT descripcion LIKE 'Las %' AND NOT descripcion  LIKE 'Un %' 
	AND NOT descripcion  LIKE 'Una %';
	
SELECT * 
    FROM peliculas
    WHERE puntuacion < 7 AND NOT (
	descripcion  LIKE 'El %' 
	OR descripcion  LIKE 'La %' 
	OR descripcion  LIKE 'Los %'
	OR descripcion  LIKE 'Un %' 
	OR descripcion  LIKE 'Una %'
	);
	
-- 16.	Muestra las películas en cuya descripción se menciona la 
-- palabra familia y que no son de animación.
SELECT * 
    FROM peliculas
	WHERE descripcion LIKE '%familia%' AND NOT genero = 'Animacion';
	
SELECT * 
    FROM peliculas
	WHERE descripcion LIKE '%familia%' AND  genero != 'Animacion';
	
-- 17.	Muestra las películas en cuya descripción se menciona la 
-- palabra joven y cuyo título tiene más de 20 caracteres.
SELECT *
     FROM peliculas
     WHERE descripcion LIKE '%joven%' AND CHAR_LENGTH (titulo) >= 20;
	 
-- 18.	Muestra las películas en cuya descripción se menciona la 
-- palabra hombre o la palabra mujer, pero no ambas a la vez.
SELECT * 
    FROM peliculas
    WHERE (descripcion LIKE '%hombre%' AND NOT descripcion LIKE '%mujer%')
	OR(descripcion LIKE '%hombre%' AND descripcion LIKE '%mujer%');
	

	
-- 19.	Muestra las películas estrenadas antes del año 2000 cuya 
-- puntuación no está entre 7 y 8 y en cuya descripción se menciona 
-- alguna de estas palabras: padre, madre, hijo o familia.
SELECT * 
    FROM peliculas
	WHERE YEAR(estreno) < 2000 AND puntuacion NOT BETWEEN 7 AND 8 
	AND descripcion LIKE '%padre%' OR descripcion LIKE '%madre%' 
	OR descripcion
	LIKE '%hijo%' OR descripcion LIKE '%familia%';
	
-- 20.	Muestra las películas cuyo título y descripción empiezan por la 
-- misma letra, que no son de animación y que tienen una puntuación 
-- superior a 8 o se estrenaron antes de 1990.
SELECT * 
    FROM peliculas
	WHERE LEFT(titulo, 1) = LEFT(descripcion, 1) AND genero <> 'Animación'
	AND puntuacion > 8 OR YEAR(estreno) < 1990;