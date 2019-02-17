package com.calculator.eventprocessor.config;

import org.springframework.cloud.stream.annotation.EnableBinding;
import com.calculator.eventprocessor.stream.ExpressionStreams;

@EnableBinding(ExpressionStreams.class)
public class StreamsConfig {

}
