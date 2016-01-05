package com.function.pig;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.pig.EvalFunc;
import org.apache.pig.FuncSpec;
import org.apache.pig.data.DataType;
import org.apache.pig.data.Tuple;
import org.apache.pig.impl.logicalLayer.schema.Schema;

public class FormatFunc extends EvalFunc<String> {

	public String exec(Tuple tuple) throws IOException {
		if (tuple == null || tuple.size() == 0)
			return "";
		Object value = tuple.get(0);
		if (value == null)
			return "";
		String rest = (String) value;
			return "<<"+rest+">>";
	}

	@Override
	public List<FuncSpec> getArgToFuncMapping() {
		List<FuncSpec> listSpecs = new ArrayList<FuncSpec>();
		listSpecs.add(new FuncSpec(this.getClass().getName(), new Schema(
				new Schema.FieldSchema(null, DataType.LONG))));
		return listSpecs;
	}
}
