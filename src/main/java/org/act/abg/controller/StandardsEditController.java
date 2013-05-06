package org.act.abg.controller;

import org.act.abg.model.LearningObjective;
import org.act.abg.service.StandardsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.Person;

import java.util.Iterator;
import java.util.Map;

@Controller
public class StandardsEditController {

	@Autowired
	private StandardsService standardsService;

	@RequestMapping("/edit")
	public String viewStandards(Map<String, Object> map) {
		map.put("objective", new LearningObjective());
		
		Iterator<LearningObjective> i = standardsService.findAll().iterator();
		while(i.hasNext()){
			LearningObjective lo = i.next();
			System.out.println(lo.getId());
		}
		
		map.put("standardsList", standardsService.findAll().iterator());
		return "edit";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
    @Transactional
    public String addObjective(@ModelAttribute("objective") LearningObjective objective) {
		standardsService.save(objective);
        return "redirect:/web/edit";
    }
 
    @RequestMapping("/delete/{objectiveId}")
    @Transactional
    public String deleteObjective(@PathVariable("objectiveId") Long objectiveId) {
    	standardsService.delete(objectiveId);
        return "redirect:/web/edit";
    }
}