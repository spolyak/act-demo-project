<!doctype html>

<html>
<head>
<meta charset="utf-8">
<title>Spring MVC and Hibernate Template</title>

<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="static/css/tree.css" rel="stylesheet">
<link href="static/css/d3-graph.css" rel="stylesheet">
<script type="text/javascript" src="static/js/d3.js"></script>
<script type="text/javascript" src="static/js/d3.layout.js"></script>
<style type="text/css">
.node circle {
	cursor: pointer;
	fill: #fff;
	stroke: steelblue;
	stroke-width: 1.5px;
}

.node text {
	font-size: 11px;
}

path.link {
	fill: none;
	stroke: #ccc;
	stroke-width: 1.5px;
}
.standardDiv {
    height: 600px;
    float: left;
    overflow: auto;
    overflow-x:hidden;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="well">
					<img src="static/img/logo-blue.png" /> Standards Editor, v.0.0.1
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span3 well">
				<div class="css-treeview">
					<ul>
						<li><input type="checkbox" id="item-0" /><label for="item-0">ACT
								Core Standards</label>
							<ul>
								<li><input type="checkbox" id="item-0-0" /><label
									for="item-0-0">ACT Core Math</label>
									<ul>
										<li><input type="checkbox" id="item-0-0-0" /><label
											for="item-0-0-0">K</label>
											<ul>
												<li><a href="./">Counting to 20</a></li>
												<li><a href="./">Write numbers to 10</a></li>
											</ul></li>
									</ul></li>
								<li><input type="checkbox" id="item-0-1" /><label
									for="item-0-1">ACT Core English</label>
								<li><input type="checkbox" id="item-0-2"
									disabled="disabled" /><label for="item-0-2">ACT Core
										Writing</label>
							</ul></li>
						<li><input type="checkbox" id="item-1" checked="checked" /><label
							for="item-1">CCSS</label>
							<ul>
								<li><input type="checkbox" id="item-1-0" /><label
									for="item-1-0">CCSS - Math</label>
									<ul>
										<li><a href="./">K</a></li>
										<li><a href="./">Grade 1</a></li>
										<li><a href="./">Grade 2</a></li>
									</ul></li>
								<li><a href="./">Mapping 1</a></li>
							</ul></li>
						<li><input type="checkbox" id="item-2" /><label for="item-2">CCRS</label>
							<ul>
								<li><input type="checkbox" id="item-2-0" /><label
									for="item-2-0">CCRS - Math</label>
								<li><input type="checkbox" id="item-2-1" /><label
									for="item-2-1">CCRS - Science</label>
							</ul></li>
					</ul>
				</div>

			</div>
			<div class="span9" style="overflow-x:scroll;overflow-y:scroll;width:800px;height:600px">
				<!--Body content-->
				<div id="body" class="width:5000px;height:5000px">
				</div>
				<script type="text/javascript">
					var m = [ 20, 120, 20, 120 ], w = 5000 - m[1] - m[3], h = 800
							- m[0] - m[2], i = 0, root;

					var tree = d3.layout.tree().size([ h, w ]);

					var diagonal = d3.svg.diagonal().projection(function(d) {
						return [ d.y, d.x ];
					});

					var vis = d3.select("#body").append("svg:svg").attr(
							"width", w + m[1] + m[3]).attr("height",
							h + m[0] + m[2]).append("svg:g").attr("transform",
							"translate(" + m[3] + "," + m[0] + ")");

					d3.json("static/flare.json", function(json) {
						root = json;
						root.x0 = h / 2;
						root.y0 = 0;

						function toggleAll(d) {
							if (d.children) {
								d.children.forEach(toggleAll);
								toggle(d);
							}
						}

						// Initialize the display to show a few nodes.
						root.children.forEach(toggleAll);
						//toggle(root.children[1]);
						//toggle(root.children[1].children[2]);
						//toggle(root.children[9]);
						//toggle(root.children[9].children[0]);

						update(root);
					});

					function update(source) {
						var duration = d3.event && d3.event.altKey ? 5000 : 500;

						// Compute the new tree layout.
						var nodes = tree.nodes(root).reverse();

						// Normalize for fixed-depth.
						nodes.forEach(function(d) {
							d.y = d.depth * 180;
						});

						// Update the nodes…
						var node = vis.selectAll("g.node").data(nodes,
								function(d) {
									return d.id || (d.id = ++i);
								});

						// Enter any new nodes at the parent's previous position.
						var nodeEnter = node.enter().append("svg:g").attr(
								"class", "node").attr(
								"transform",
								function(d) {
									return "translate(" + source.y0 + ","
											+ source.x0 + ")";
								}).on("click", function(d) {
							toggle(d);
							update(d);
						});

						nodeEnter.append("svg:circle").attr("r", 1e-6).style(
								"fill",
								function(d) {
									return d._children ? "lightsteelblue"
											: "#fff";
								});

						nodeEnter.append("svg:text").attr("x", function(d) {
							return d.children || d._children ? -10 : 10;
						}).attr("dy", ".35em").attr("text-anchor", function(d) {
							return d.children || d._children ? "end" : "start";
						}).text(function(d) {
							return d.name;
						}).style("fill-opacity", 1e-6);

						// Transition nodes to their new position.
						var nodeUpdate = node.transition().duration(duration)
								.attr(
										"transform",
										function(d) {
											return "translate(" + d.y + ","
													+ d.x + ")";
										});

						nodeUpdate.select("circle").attr("r", 4.5).style(
								"fill",
								function(d) {
									return d._children ? "lightsteelblue"
											: "#fff";
								});

						nodeUpdate.select("text").style("fill-opacity", 1);

						// Transition exiting nodes to the parent's new position.
						var nodeExit = node.exit().transition().duration(
								duration).attr(
								"transform",
								function(d) {
									return "translate(" + source.y + ","
											+ source.x + ")";
								}).remove();

						nodeExit.select("circle").attr("r", 1e-6);

						nodeExit.select("text").style("fill-opacity", 1e-6);

						// Update the links…
						var link = vis.selectAll("path.link").data(
								tree.links(nodes), function(d) {
									return d.target.id;
								});

						// Enter any new links at the parent's previous position.
						link.enter().insert("svg:path", "g").attr("class",
								"link").attr("d", function(d) {
							var o = {
								x : source.x0,
								y : source.y0
							};
							return diagonal({
								source : o,
								target : o
							});
						}).transition().duration(duration).attr("d", diagonal);

						// Transition links to their new position.
						link.transition().duration(duration)
								.attr("d", diagonal);

						// Transition exiting nodes to the parent's new position.
						link.exit().transition().duration(duration).attr("d",
								function(d) {
									var o = {
										x : source.x,
										y : source.y
									};
									return diagonal({
										source : o,
										target : o
									});
								}).remove();

						// Stash the old positions for transition.
						nodes.forEach(function(d) {
							d.x0 = d.x;
							d.y0 = d.y;
						});
					}

					// Toggle children.
					function toggle(d) {
						if (d.children) {
							d._children = d.children;
							d.children = null;
						} else {
							d.children = d._children;
							d._children = null;
						}
					}
				</script>
			</div>
		</div>
	</div>
</body>