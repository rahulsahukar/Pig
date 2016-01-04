set debug on;
REGISTER FilterFunc.jar

records = LOAD 'input/pig/data' USING PigStorage(',') AS (year:int, rest:int);
filtered_records = FILTER records BY com.function.pig.FilterFuncPig(rest);
grouped = GROUP filtered_records BY year;
final_recs = FOREACH grouped GENERATE group,MIN(filtered_records.rest);
dump final_recs;
--STORE final_recs INTO 'result';
dump result;
