<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="header.jsp"%>
<link href="../static/css/tree.css" rel="stylesheet">
<link href="../static/css/d3-graph.css" rel="stylesheet">
<script type="text/javascript" src="../static/js/d3.js"></script>
<script type="text/javascript" src="../static/js/d3.layout.js"></script>
</head>

<%@include file="view-style.jsp"%>
<script>
	$(function() {
		$('#infoTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});
		$("#slider-range-max1").slider({
			range : "max",
			min : 1,
			max : 10,
			value : 3,
			slide : function(event, ui) {
				$("#amount1").val(ui.value);
			}
		});
		$("#amount1").val($("#slider-range-max1").slider("value"));
		$("#slider-range-max2").slider({
			range : "max",
			min : 1,
			max : 10,
			value : 7,
			slide : function(event, ui) {
				$("#amount2").val(ui.value);
			}
		});
		$("#amount2").val($("#slider-range-max2").slider("value"));
		$("#slider-range-max3").slider({
			range : "max",
			min : 1,
			max : 10,
			value : 5,
			slide : function(event, ui) {
				$("#amount3").val(ui.value);
			}
		});
		$("#amount3").val($("#slider-range-max3").slider("value"));
		$("#slider-range-max4").slider({
			range : "max",
			min : 1,
			max : 10,
			value : 9,
			slide : function(event, ui) {
				$("#amount4").val(ui.value);
			}
		});
		$("#amount4").val($("#slider-range-max4").slider("value"));
	});
</script>
</head>
<body>
	<div id="wrap">
		<%@include file="nav.jsp"%>
		<div class="container">
			<div class="row-fluid">
				<div class="span3">

					<div class="css-treeview well">
						<ul>
							<li><input type="checkbox" id="item-0" checked="checked" /><label
								for="item-0">ACT Core Standards</label>
								<ul>
									<li><a href="." data-selected="true">ACT Core Math</a></li>
									<li><a href=".">ACT Core ELA</a></li>
									<li><a href=".">ACT Core Writing</a>
								</ul></li>
							<li><input type="checkbox" id="item-1" /><label
								for="item-1">CCSS</label>
								<ul>
									<li><input type="checkbox" id="item-1-0" /><label
										for="item-1-0">CCSS - Math</label></li>
								</ul></li>
							<li><input type="checkbox" id="item-2" /><label
								for="item-2">CCRS</label>
								<ul>
									<li><input type="checkbox" id="item-2-0" /><label
										for="item-2-0">CCRS - Math</label>
									<li><input type="checkbox" id="item-2-1" /><label
										for="item-2-1">CCRS - Science</label>
								</ul></li>
						</ul>
					</div>
					<div class="well">
						<form class="form-search">
							<input type="text" class="input-small search-query">
							<button type="submit" class="btn">Search</button>
						</form>
					</div>

					<div class="well pull-left">
						<div class="tabbable">
							<ul id="infoTab" class="nav nav-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab">Info
								</a></li>
								<li><a href="#tab2" data-toggle="tab">Reqs</a></li>
								<li><a href="#tab3" data-toggle="tab">Prop</a></li>
								<li><a href="#tab4" data-toggle="tab">Ref</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab1">
									<small> <a href="./">ACT Core Math</a> | <a href="./">Algebra</a>
										| <a href="./">Pre Algebra</a> | <a data-selected="true"
										href="./">Estimate Sums</a>
									</small>
									<div class="row-fluid">
										<strong>Skill:</strong> Estimate Sums
									</div>
									<div class="row-fluid">
										<div class="span6">
											<strong>Description:</strong>
											<textarea rows="9" class="input-small">Some text that makes sense to the right people. As elaborate or brief as deemed necessary. May be something to lift into materials automatically...</textarea>
										</div>
										<div class="span6">
											<strong>Characteristics:</strong>
											<p>
												Comp: <input class="input-mini noborderd" id="amount1"></input>
											</p>
											<div id="slider-range-max1"></div>
											<p>
												Rigor: <input class="input-mini noborderd" id="amount2"></input>
											</p>
											<div id="slider-range-max2"></div>
											<p>
												Relev.: <input class="input-mini noborderd" id="amount3"></input>
											</p>
											<div id="slider-range-max3"></div>
											<p>
												Cred.: <input class="input-mini noborderd"
													id="amount4"></input>
											</p>
											<div id="slider-range-max4"></div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tab2">
									<div class="row-fluid">
										<div class="span5">
											<strong>Pre-requisites:</strong>
											<ul class="standard">
												<li>Skill X, 22%</li>
												<li>Skill Y, 39%</li>
												<li>Skill Z, 26%</li>
											</ul>

										</div>
						               <div class="span1">
						               </div>
										<div class="span6">
											<strong>Pre-requisites for:</strong>
											<ul class="standard1">
												<li>Skill AA, 84%</li>
												<li>Skill AB, 15%</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tab3">
									<div class="row-fluid">
										<div class="span12">
											<strong>Standards:</strong>
											<ul class="standard1">
												<li>Common Core: 3.4.2a</li>
												<li>Another Standard: #.#.#</li>
												<li>Another Standard: #.#.#</li>
											</ul>
										</div>
									</div>
									<div class="row-fluid">
										<div class="span6">
											<strong>Benchmarks:</strong>
											<ul>
												<li><span style="text-decoration: underline;">Exposure:</span>
													G5</li>
												<li><span style="text-decoration: underline;">50%:</span>
													G7</li>
												<li><span style="text-decoration: underline;">85%:</span>
													G8</li>
											</ul>

										</div>
										
										<div class="span6">
											<strong>Require Mastery:</strong>
											<ul>
												<li>H.S. Grad</li>
												<li>Tech Tracks</li>
												<li>Med. Tracks</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tab4">
									<div class="row-fluid">
										<div class="span6">
											<strong>Tags:</strong>
											<ul>
												<li>Slope</li>
												<li>Coordinate</li>
												<li>Fraction</li>
											</ul>

										</div>
										<div class="span6">
											<strong>References:</strong>
											<ul>
												<li>Reference A</li>
												<li>Reference B</li>
												<li>Reference C</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="span9 well">
					<div class="row-fluid">
						<div class="navbar">
							<a class="brand" href="#">Options</a>
							<ul class="nav">
								<li class="active"><a href="#">Citations</a></li>
								<li><a href="#">Highlight Current</a></li>
								<li class="active"><a href="#">Benchmarks</a></li>
								<li><a href="#">Strands</a></li>
							</ul>
						</div>
						<div class="span12 well"
							style="overflow-x: scroll; overflow-y: scroll; width: 800px; height: 400px">
							<!--Body content-->
							<div id="body" class="width:5000px;height:5000px"></div>
							<script type="text/javascript">
								var m = [ 20, 120, 20, 120 ], w = 5000 - m[1]
										- m[3], h = 800 - m[0] - m[2], i = 0, root;

								var tree = d3.layout.tree().size([ h, w ]);

								var diagonal = d3.svg.diagonal().projection(
										function(d) {
											return [ d.y, d.x ];
										});

								var vis = d3.select("#body").append("svg:svg")
										.attr("width", w + m[1] + m[3]).attr(
												"height", h + m[0] + m[2])
										.append("svg:g").attr(
												"transform",
												"translate(" + m[3] + ","
														+ m[0] + ")");

								d3.json("../static/flare.json", function(json) {
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
									toggle(root.children[1]);
									toggle(root.children[1].children[2]);
									//toggle(root.children[9]);
									//toggle(root.children[9].children[0]);

									update(root);
								});

								function update(source) {
									var duration = d3.event && d3.event.altKey ? 5000
											: 500;

									// Compute the new tree layout.
									var nodes = tree.nodes(root).reverse();

									// Normalize for fixed-depth.
									nodes.forEach(function(d) {
										d.y = d.depth * 180;
									});

									// Update the nodes…
									var node = vis.selectAll("g.node").data(
											nodes, function(d) {
												return d.id || (d.id = ++i);
											});

									// Enter any new nodes at the parent's previous position.
									var nodeEnter = node.enter()
											.append("svg:g").attr("class",
													"node").attr(
													"transform",
													function(d) {
														return "translate("
																+ source.y0
																+ ","
																+ source.x0
																+ ")";
													}).on("click", function(d) {
												toggle(d);
												update(d);
											});

									nodeEnter
											.append("svg:circle")
											.attr("r", 1e-6)
											.style(
													"fill",
													function(d) {
														return d._children ? "lightsteelblue"
																: "#fff";
													});

									nodeEnter.append("svg:text").attr(
											"x",
											function(d) {
												return d.children
														|| d._children ? -10
														: 10;
											}).attr("dy", ".35em").attr(
											"text-anchor",
											function(d) {
												return d.children
														|| d._children ? "end"
														: "start";
											}).text(function(d) {
										return d.name;
									}).style("fill-opacity", 1e-6);

									// Transition nodes to their new position.
									var nodeUpdate = node.transition()
											.duration(duration).attr(
													"transform",
													function(d) {
														return "translate("
																+ d.y + ","
																+ d.x + ")";
													});

									nodeUpdate
											.select("circle")
											.attr("r", 4.5)
											.style(
													"fill",
													function(d) {
														return d._children ? "lightsteelblue"
																: "#fff";
													});

									nodeUpdate.select("text").style(
											"fill-opacity", 1);

									// Transition exiting nodes to the parent's new position.
									var nodeExit = node.exit().transition()
											.duration(duration).attr(
													"transform",
													function(d) {
														return "translate("
																+ source.y
																+ ","
																+ source.x
																+ ")";
													}).remove();

									nodeExit.select("circle").attr("r", 1e-6);

									nodeExit.select("text").style(
											"fill-opacity", 1e-6);

									// Update the links…
									var link = vis.selectAll("path.link").data(
											tree.links(nodes), function(d) {
												return d.target.id;
											});

									// Enter any new links at the parent's previous position.
									link.enter().insert("svg:path", "g").attr(
											"class", "link").attr("d",
											function(d) {
												var o = {
													x : source.x0,
													y : source.y0
												};
												return diagonal({
													source : o,
													target : o
												});
											}).transition().duration(duration)
											.attr("d", diagonal);

									// Transition links to their new position.
									link.transition().duration(duration).attr(
											"d", diagonal);

									// Transition exiting nodes to the parent's new position.
									link.exit().transition().duration(duration)
											.attr("d", function(d) {
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
					<div class="row-fluid">
						<div class="css-treeview span6 well">
							<ul>
								<li><input type="checkbox" id="item-0" checked="checked" /><label
									for="item-0">Math</label>
									<ul>
										<li><input type="checkbox" id="item-0-1" /><label
											for="item-0-1">Numbers</label></li>
										<li><input type="checkbox" id="item-0-2" /><label
											for="item-0-2">Measurement</label></li>
										<li><input type="checkbox" id="item-0-3" /><label
											for="item-0-3">Geometry</label></li>
										<li><input type="checkbox" id="item-0-4"
											checked="checked" /><label for="item-0-4">Algebra</label>
											<ul>
												<li><input type="checkbox" id="item-0-4-1"
													checked="checked" /><label for="item-0-4-1">Pre
														Algebra</label>
													<ul>
														<li><a href=".">skilla</a></li>
														<li><a href="." data-selected="true">estimate
																sums</a></li>
														<li><a href=".">skillc</a></li>
														<li><a href=".">skilld</a></li>
													</ul></li>
											</ul></li>
									</ul>
								<li><input type="checkbox" id="item-0-5" /><label
									for="item-0-5">Trigonometry</label></li>
								<li><input type="checkbox" id="item-0-6" /><label
									for="item-0-6">Statistics</label></li>
								<li><input type="checkbox" id="item-0-7" /><label
									for="item-0-7">Calculus</label></li>

							</ul>
						</div>
						<div class="span6 well">TODO</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>