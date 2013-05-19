package org.act.abg.service;

import org.act.abg.model.Skill;
import org.springframework.data.neo4j.repository.GraphRepository;

public interface SkillsService extends GraphRepository<Skill>  {

}
