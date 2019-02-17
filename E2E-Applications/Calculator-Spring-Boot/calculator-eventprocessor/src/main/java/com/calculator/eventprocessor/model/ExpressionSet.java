package com.calculator.eventprocessor.model;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import com.calculator.eventprocessor.model.ExpressionPair;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ExpressionSet  implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private List <ExpressionPair> expressions;
	public ExpressionSet(List <ExpressionPair> expressions) {
		super();
		this.expressions = expressions;
	}
	
	public ExpressionSet(String expressionSet) {
		super();
		
		ObjectMapper mapper = new ObjectMapper();
        try {
            expressions = mapper.readValue(expressionSet, mapper.getTypeFactory().constructCollectionType(List.class, ExpressionPair.class));
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

	public List <ExpressionPair> getExpressions() {
		return expressions;
	}

	public void setExpressions(List <ExpressionPair> expressions) {
		this.expressions = expressions;
	}

	@Override
	public String toString() {
		return "ExpressionSet [expressions=" + expressions + "]";
	}
}