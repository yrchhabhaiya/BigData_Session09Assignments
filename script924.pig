A = LOAD '/home/acadgild/pig/student/student_dataset.txt' USING PigStorage(',') AS (name:chararray, college:chararray, dob:chararray, faculty: chararray, grade:float, state:chararray, city:chararray);

B = FOREACH A GENERATE name,faculty,state;

C = FILTER B BY state=='oregon' AND faculty=='BE';

DUMP C;

