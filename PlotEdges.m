function PlotEdges( G, vid )
% Usage: PlotEdges( G, vid )
%
% Plots in the current figure window the location of the vertex/node specified by G.V{vid}
% Also plots straight line segments indicated all edges of vid given by G.E{vid}. This function can 
% be called everytime a new vertex and set of edges is added to the graph to show how
% the graph is growing with time.
%
% Input     G   :   the graph data structured with vertices G.V and edges G.E
%           vid :   the index indicating the vertex whose edges are to be plotted
%
% Output    (none) the current figure window is updated with the desired plot 

plot( G.V{vid}(1) , G.V{vid}(2) ,'bo','linewidth',2); % plot location of vertexID 
hold on;
% draw a straight line for each edge 
for j = 1:1:length(G.E{vid})
  plot([G.V{vid}(1) G.V{ G.E{vid}(j) }(1)],[G.V{vid}(2) G.V{ G.E{vid}(j) }(2)],'b','linewidth',1);
  drawnow;
end 
hold on;   
end