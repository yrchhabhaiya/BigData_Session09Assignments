A = LOAD '/home/acadgild/pig/petrol/petrol_dataset.txt' USING PigStorage(',') AS (distID:chararray, distName:chararray, buyRate:chararray, sellRate:chararray, volIn:int, volOut:int, year:int);

B = FOREACH A GENERATE distID, distName, volOut;

C = GROUP B BY (distID,distName);

D = FOREACH C GENERATE group, SUM(B.volOut);

E = ORDER D BY $1 DESC;

F = LIMIT E 10;

DUMP F;

