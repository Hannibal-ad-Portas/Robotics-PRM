% prepare the workspace
clear all;
close all;        
clc;
more off;

% user inputs
fname = 'Scene.txt'; % name of text file containing scene information 
numRoadmapPts = 80; % number of points used to construct roadmap 
plotFlag = 1; % flag: 0 - no plot, 1 - plot roadmap as it is being constructed 

% initialize params structure 
params = struct;
params.xmin  = -30; % boundary of the environment
params.ymin  = -22.5;
params.xmax = 30;
params.ymax = 22.5;
params.step = 1.5;
params.rr = 0.05; % radius of the point robot (used for collision checking)
params = SetupFromFile(fname,params); % parse text file to load scene data into params 
PlotScene(params); % setup figure environment

% Start and Goal:
params.robotCenter = [-25 15]';
params.goalCenter = [25 -18]';
% plot start and goal 
plot(params.robotCenter(1), params.robotCenter(2), 'ko', 'LineWidth', 3);
plot(params.goalCenter(1), params.goalCenter(2), 'go', 'LineWidth', 10);

% initialize graph structure
% start 
G.V{1} = params.robotCenter;
G.E{1} = [];
% goal 
G.V{2} = params.goalCenter;
G.E{2} = [];

% ==========================
% Start of student code
% ==========================

i = 3;

tic % start timer 

% creates the needed vertexes  
while ( i <= numRoadmapPts)
  x = params.xmin + (params.xmax + params.xmax) * rand;
  y = params.ymin + (params.ymax + params.xmax) * rand;
  
  G.V{i} = [x y]';
  
  % if the vertex is collision free incriment, otherwise find a new vertex
  if (IsCollisionFree(params, G.V{i}) == 1)
    % defines an empty edge for the new vertex
    G.E{i} = [];
    i = i + 1;
  end
end

% this loop adds edges to the map.
% the code first cheks to see if the point are agacent and then if the path between them is collision free
% the algorythim operates in O(n^2) time
for i = 1:numRoadmapPts
  for j = 1:numRoadmapPts
      % make sure that vertexies don't add themselves as an edge
    if ( i == j )
      break
    end
    if (ArePointsNear(G.V{i}, G.V{j}) == 1)
        if (IsSegmentCollisonFree(params, G.V{i}, G.V{j}) == 1)
          % add the edge to each vertex
            G.E{i} = [G.E{i}; j];
            G.E{j} = [G.E{j}; i];
        end
    end
  end
  if (plotFlag == 1)
    PlotEdges(G, i);
  end
end

% ==========================
% End of student code
% ==========================

toc % end of timer, this function prints the elapsed time 

% Search the graph defined by the mp object and plot the shortest path
if ( length(G.V) == numRoadmapPts )
  Dijikstra(G,1,2);
else
  fprintf('Your graph has not been constructed correctly and contains %d/%d vertices \n',length(G.V), numRoadmapPts)
end 
