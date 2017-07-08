REGISTER '/home/acadgild/pig/pokemon/piggybank.jar';

DEFINE CSVExcelStorage org.apache.pig.piggybank.storage.CSVExcelStorage;

A = LOAD '/user/acadgild/pig/pokemon/Pokemon.csv' USING CSVExcelStorage(',','NO_MULTILINE','UNIX','SKIP_INPUT_HEADER');

B = FOREACH A GENERATE (chararray)$1 AS name, (chararray)$2 AS type1, (chararray)$3 AS type2, (int)$4 AS total, (int)$5 AS hp, (int)$6 AS attack, (int)$7 AS defense, (int)$8 AS spAttack, (int)$9 AS spDefense, (int)$10 AS speed;

C = FILTER B BY defense>55;

list1 = FOREACH C GENERATE RANDOM(),name,type1,type2,total,hp,attack,defense,spAttack,spDefense,speed;

list1_desc = ORDER list1 BY $0 DESC;

limit_list1 = LIMIT list1_desc 5;

final_list1 = FOREACH limit_list1  GENERATE name,hp;

list2 = FOREACH C GENERATE RANDOM(),name,type1,type2,total,hp,attack,defense,spAttack,spDefense,speed;

list2_desc = ORDER list1 BY $0 DESC;

limit_list2 = LIMIT list2_desc 5;

final_list2 = FOREACH limit_list2  GENERATE name,hp;

STORE final_list1 INTO '/user/acadgild/pig/pokemon/list1';

STORE final_list2 INTO '/user/acadgild/pig/pokemon/list2';

