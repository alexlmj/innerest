package com.innerest.survey.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/survey")
public class SurveyController {
		
	/** The usual Logger.*/
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);
	
	@RequestMapping("")
	public String index(){ 
		return "survey/survey_index";
	}
}
