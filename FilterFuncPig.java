package com.function.pig;

import java.io.IOException;

import org.apache.pig.FilterFunc;
import org.apache.pig.data.Tuple;

public class FilterFuncPig extends FilterFunc {

	public Boolean exec(Tuple tuple) throws IOException {
		if (tuple == null || tuple.size() == 0)
			return Boolean.FALSE;
		Object value = tuple.get(0);
		if (value == null)
			return Boolean.FALSE;
		Integer rest = (Integer) value;
		if (rest.intValue() > 1000)
			return Boolean.TRUE;
		else
			return Boolean.FALSE;
	}
}
