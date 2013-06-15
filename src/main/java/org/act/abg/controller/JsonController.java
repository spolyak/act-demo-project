package org.act.abg.controller;

import org.act.abg.model.LearningObjective;
import org.act.abg.service.StandardsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/json")
public class JsonController {

	@Autowired
	private StandardsService standardsService;
	
	@RequestMapping(value = "{name}", method = RequestMethod.GET)
	public @ResponseBody
	LearningObjective getStandardInJSON(@PathVariable String name) {

		LearningObjective lo = standardsService.findByPropertyValue("objective", name);
		return lo;

	}
}