records = LOAD 'input/pig/data' USING PigStorage(',') AS (year:int, rest:int);
filtered_records = FILTER records BY rest>100;
grouped = GROUP filtered_records BY year;
final_recs = FOREACH grouped GENERATE group,MAX(filtered_records.rest);
--dump final_recs;
STORE final_recs INTO 'result';
dump result;
