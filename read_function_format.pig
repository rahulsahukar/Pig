REGISTER FilterFunc.jar
REGISTER FormatFunc.jar

records = LOAD 'input/pig/data' USING PigStorage(',') AS (year:int, rest);
filtered_records = FILTER records BY com.function.pig.FilterFuncPig(rest);
grouped = GROUP filtered_records BY year;
final_recs = FOREACH grouped GENERATE com.function.pig.FormatFunc(group),MIN(filtered_records.rest);
dump final_recs;
--STORE final_recs INTO 'result';
--dump result;
