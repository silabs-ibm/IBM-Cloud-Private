package com.calculator.eventprocessor.stream;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;

public interface OperationStreams {
	
	String INPUT = "compositeop-in";
    String OUTPUT = "compositeop-out";
    
    @Input(INPUT)
    SubscribableChannel subscribe();
    
    @Output(OUTPUT)
    MessageChannel notifyTo();

}