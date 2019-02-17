package com.calculator.eventprocessor.model;

import java.io.Serializable;

public class ExpressionPair  implements Serializable {
	private static final long serialVersionUID = 1L;
	
    private String identifier;
    private String expression;
    
    public ExpressionPair() {
    }
    
	public ExpressionPair(String identifier, String expression) {
		super();
		
		this.identifier = identifier;
		this.expression = expression;
	}

	public String getIdentifier() {
		return identifier;
	}
	
	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}
	
	public String getExpression() {
		return expression;
	}
	
	public void setExpression(String expression) {
		this.expression = expression;
	}

	@Override
	public String toString() {
		return "ExpressionPair [identifier=" + identifier + ", expression=" + expression + "]";
	}
}