package org.act.abg.service;

import org.act.abg.model.LearningObjective;
import org.springframework.data.neo4j.repository.GraphRepository;

public interface StandardsService extends GraphRepository<LearningObjective>  {

}
