package org.act.abg.model;

import org.springframework.data.neo4j.annotation.EndNode;
import org.springframework.data.neo4j.annotation.RelationshipEntity;
import org.springframework.data.neo4j.annotation.StartNode;

@RelationshipEntity
public class ParentObjective {
	@StartNode
	private
	LearningObjective parent;
	@EndNode
	private
	LearningObjective child;

	public ParentObjective(LearningObjective parent, LearningObjective child) {
		this.setParent(parent);
		this.setChild(child);
	}

	public LearningObjective getParent() {
		return parent;
	}

	public void setParent(LearningObjective parent) {
		this.parent = parent;
	}

	public LearningObjective getChild() {
		return child;
	}

	public void setChild(LearningObjective child) {
		this.child = child;
	}
}