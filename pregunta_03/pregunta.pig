/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD './data.tsv' USING PigStorage('\t') AS (letra:CHARARRAY, fecha:CHARARRAY, valor:INT);

sorted_data = ORDER data BY valor;

top_5_val = LIMIT sorted_data 5;

resultado = FOREACH top_5_val GENERATE valor;

STORE resultado INTO 'output/' using PigStorage(',');