package org.act.abg.model;

import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.neo4j.graphdb.Direction;
import org.springframework.data.neo4j.annotation.Fetch;
import org.springframework.data.neo4j.annotation.GraphId;
import org.springframework.data.neo4j.annotation.Indexed;
import org.springframework.data.neo4j.annotation.NodeEntity;
import org.springframework.data.neo4j.annotation.RelatedTo;

/**
 * From Ed-Fi 1.1
 * (http://www.ed-fi.org/assets/Public-Ed-Fi-Logical-Database-Model
 * -1.1-2013-01-14.pdf) Learning Standards that drive the curriculum and the
 * assessments. The Common Core State Standards Initiative
 * (www.corestandards.org) is a national initiative for standards in this area.
 * For states that use the Common Core, or have their own standards, the
 * assessment model has entities for LearningStandard, which represents the
 * lowest level of skills, and LearningObjective, which represents higher level
 * aggregation of skills, as shown below. The model supports a hierarchical
 * taxonomy of learning skills using multiple levels of LearningObjectives.
 * 
 * @author polyaks
 * 
 */

@NodeEntity
public class LearningObjective {

	@GraphId
	private Long id;
	
	@Indexed
	private String objective;

	//@Fetch
	//private LearningObjective parent;
	
	@Fetch
	@RelatedTo(direction = Direction.INCOMING, type = "CHILD")
	private LearningObjective parent;

    @Fetch
	@RelatedTo(direction = Direction.OUTGOING, type = "CHILD")
	private
    Set<LearningObjective> children;
    
	
	private String parentLearningObjectiveString;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getObjective() {
		return objective;
	}

	public String getName() {
		return objective;
	}
	
	public void setObjective(String objective) {
		this.objective = objective;
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

	public Set<LearningObjective> getChildren() {
		return children;
	}

	public void setChildren(Set<LearningObjective> children) {
		this.children = children;
	}

}
