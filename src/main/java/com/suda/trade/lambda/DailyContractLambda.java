package com.suda.trade.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.ScheduledEvent;

public class DailyContractLambda implements RequestHandler<ScheduledEvent, String> {

	@Override
	public String handleRequest(ScheduledEvent event, Context context) {
		LambdaLogger logger = context.getLogger();
		logger.log("Service starting..");
		return "Successfully Stored Contract Information";
	}
}
