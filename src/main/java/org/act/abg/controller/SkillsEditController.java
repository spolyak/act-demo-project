package org.act.abg.controller;

import org.act.abg.model.LearningObjective;
import org.act.abg.model.Skill;
import org.act.abg.service.SkillsService;
import org.act.abg.service.StandardsService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class SkillsEditController {

	@Autowired
	private SkillsService skillsService;
	@Autowired
	private StandardsService standardsService;
	
	@RequestMapping("/editSkills")
	public String viewSkills(Map<String, Object> map) {
		map.put("skill", new Skill());
		
		map.put("skillsList", skillsService.findAll().iterator());
		map.put("parentList", standardsService.findAll().iterator());
		return "editSkills";
	}

	@RequestMapping(value = "/addSkill", method = RequestMethod.POST)
    @Transactional
    public String addSkill(@ModelAttribute("skill") Skill skill) {
		if (StringUtils.isNotEmpty(skill.getParentLearningObjectiveString())) {
		  LearningObjective parent = standardsService.findOne(Long.valueOf(skill.getParentLearningObjectiveString()));
		  skill.setParent(parent);
		}
		skillsService.save(skill);
        return "redirect:/web/editSkills";
    }
 
    @RequestMapping("/deleteSkill/{skillId}")
    @Transactional
    public String deleteSkill(@PathVariable("skillId") Long skillId) {
    	skillsService.delete(skillId);
        return "redirect:/web/editSkills";
    }
}