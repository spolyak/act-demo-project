package org.act.abg.controller;

import org.act.abg.service.StandardsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class StandardsEditController {

	@Autowired
	private StandardsService standardsService;

	@RequestMapping("/edit")
	public String viewStandards(Map<String, Object> map) {
		map.put("standardsList", standardsService.findAll().iterator());
		return "edit";
	}

}