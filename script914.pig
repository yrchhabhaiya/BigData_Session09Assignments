A = LOAD '/home/acadgild/pig/petrol/petrol_dataset.txt' USING PigStorage(',') AS (distID:chararray, distName:chararray, buyRate:chararray, sellRate:chararray, volIn:int, volOut:int, year:int);

B = FOREACH A GENERATE distID, distName, sellRate;

C = GROUP B BY (distID,distName);

D = FOREACH C GENERATE group, MIN(B.sellRate);

E = ORDER D BY $1 ASC;

F = LIMIT E 1;

DUMP F;

