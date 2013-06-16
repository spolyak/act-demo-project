package org.act.abg.model;

import java.util.Set;

public interface GraphNode {
	String getName();
	Set<GraphNode> getChildren();
}
