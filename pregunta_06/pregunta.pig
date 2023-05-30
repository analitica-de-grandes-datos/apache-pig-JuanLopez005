/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD './data.tsv' AS (letter:chararray, bagArray:chararray, M:map [] );
data1 = FOREACH data GENERATE M;
data2 = FOREACH data1 GENERATE FLATTEN(M);  
data3 = GROUP data2 BY $0;
data4 = FOREACH data3 GENERATE group, COUNT($1);

STORE data4 INTO 'output/' using PigStorage(',');
