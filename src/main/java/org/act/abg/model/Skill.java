package org.act.abg.model;

import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.neo4j.graphdb.Direction;
import org.springframework.data.neo4j.annotation.Fetch;
import org.springframework.data.neo4j.annotation.GraphId;
import org.springframework.data.neo4j.annotation.NodeEntity;
import org.springframework.data.neo4j.annotation.RelatedTo;

@NodeEntity
public class Skill implements GraphNode {

	@GraphId
	private Long id;
	
	private String skill;
	
	private String description;

	@Fetch
	@RelatedTo(direction = Direction.INCOMING, type = "CHILD_SKILL")
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

	@Override
	public String getName() {
		return skill;
	}
	
	@Override
	public Set<GraphNode> getChildren() {
		return new HashSet<GraphNode>();
	}
	
	public String getParentLearningObjectiveString() {
		return parentLearningObjectiveString;
	}

	public void setParentLearningObjectiveString(
			String parentLearningObjectiveString) {
		this.parentLearningObjectiveString = parentLearningObjectiveString;
	}

	@JsonIgnore
	public LearningObjective getParent() {
		return parent;
	}

	public void setParent(LearningObjective parent) {
		this.parent = parent;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
