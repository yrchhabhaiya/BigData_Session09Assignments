A = LOAD '/home/acadgild/pig/student/student_dataset.txt' USING PigStorage(',') AS (name:chararray, college:chararray, dob:chararray, stream: chararray, grade:float, state:chararray, city:chararray);

B = FOREACH A GENERATE grade;

C = FILTER B BY grade < 5;

D = GROUP C all;

E = FOREACH D GENERATE COUNT(C.grade);

DUMP E;

