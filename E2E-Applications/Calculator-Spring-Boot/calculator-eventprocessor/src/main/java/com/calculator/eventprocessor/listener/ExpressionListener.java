package com.calculator.eventprocessor.listener;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

import com.calculator.eventprocessor.model.ExpressionPair;
import com.calculator.eventprocessor.model.ExpressionSet;
import com.calculator.eventprocessor.stream.ExpressionStreams;
import com.calculator.eventprocessor.proxy.CompositeOpProxy;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class ExpressionListener {
	@Autowired
	private CompositeOpProxy compositeOpProxy;

	/*@StreamListener(ExpressionStreams.INPUT)
	@SendTo(ExpressionStreams.OUTPUT)
	public HashMap<String, Object> receiveExpression(@Payload ExpressionPair expressionpair) {
		String identifier = expressionpair.getIdentifier();
		String expression = expressionpair.getExpression();
		
		HashMap<String, Object> results = compositeOpProxy.eval(expression);
		results.put("identifier", identifier);
		
		return results;
	}*/
	
	@StreamListener(ExpressionStreams.INPUT)
	@SendTo(ExpressionStreams.OUTPUT)
	public HashMap<String, Object> receiveExpression(@Payload String expressionSet) {		
		ExpressionSet expressions = new ExpressionSet(expressionSet);
		
		HashMap<String, Object> results = new HashMap <String, Object> ();
		for (ExpressionPair expr : expressions.getExpressions()) {
			HashMap <String, Object> eachexprResult = compositeOpProxy.eval(expr.getExpression());			
			results.put(expr.getIdentifier(), eachexprResult);
		}
		
		return results;
	}	
}