package org.act.abg.model;

import org.springframework.data.neo4j.annotation.Fetch;
import org.springframework.data.neo4j.annotation.GraphId;
import org.springframework.data.neo4j.annotation.NodeEntity;

@NodeEntity
public class Skill {

	@GraphId
	private Long id;
	
	private String skill;

	@Fetch
	private LearningObjective parent;
	
	private String parentLearningObjectiveString;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getParentLearningObjectiveString() {
		return parentLearningObjectiveString;
	}

	public void setParentLearningObjectiveString(
			String parentLearningObjectiveString) {
		this.parentLearningObjectiveString = parentLearningObjectiveString;
	}

	public LearningObjective getParent() {
		return parent;
	}

	public void setParent(LearningObjective parent) {
		this.parent = parent;
	}

}
