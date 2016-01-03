DEFINE groupAndFilter(filtered, year,rest) returns results
{
    grouped = group $filtered by $year;
    $results = foreach grouped generate group,MIN($filtered.$rest);
}
recs = load 'input/pig/data_with_tab' as (year:int, rest:int);
filtered = filter recs by rest == 10000;
results = groupAndFilter(filtered,year,rest);
dump results;
