/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD './data.tsv' AS (letter:chararray, setTuplesLetters:bag{}, arrayLetters:map[]);
data1 = FOREACH data GENERATE letter, (int)COUNT(setTuplesLetters) AS totalC2 , (int) SIZE(arrayLetters) AS totalC3;
data2 = ORDER data1 BY letter, totalC2, totalC3;
DUMP data2;

STORE data2 INTO 'output/' using PigStorage(',');