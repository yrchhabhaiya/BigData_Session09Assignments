A = LOAD '/home/acadgild/pig/student/student_dataset.txt' USING PigStorage(',') AS (name:chararray, college:chararray, dob:chararray, stream: chararray, grade:float, state:chararray, city:chararray);

B = FILTER A BY state=='alabama' AND college=='goverenment';

C = FOREACH B GENERATE name,college,state;

D = GROUP C all;

E = FOREACH D GENERATE COUNT(C.name);

DUMP E;

