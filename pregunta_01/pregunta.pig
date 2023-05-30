/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, valor:INT);
grouped_data = GROUP data BY letter;
result = FOREACH grouped_data GENERATE group AS letter, COUNT(data) AS count;

STORE result INTO 'output/' using PigStorage(',');