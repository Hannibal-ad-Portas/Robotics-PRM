function Dijikstra(G, startID, goalID)
% Usage Dijikstra()
% Plots the minimum-length path for a graph G and computes the corresponding length. 

for i = 1:1:length(G.V)
  G.dist(i) = Inf;
  G.prev(i) = -1; 
  D(i) = Inf;
  G.xpts(i) = G.V{i}(1);
  G.ypts(i) = G.V{i}(2);
end 
Q = [1:1:length(G.V)];

G.dist(startID) = 0;
while length(Q) > 0
  D = [];
  for i = 1:1:length(Q)
    D(i) = G.dist(Q(i));
  end 
  [minD,minInd] = min(D);
  u = Q(minInd);
  Q(minInd) = [];
  EInQ = [];
  for i = 1:1:length(G.E{u})
    if ismember(G.E{u}(i),Q)==1 
      EInQ = [EInQ G.E{u}(i)];
    end 
  end 
  for i = 1:1:length(EInQ)
    v = EInQ(i);
    cost = norm([G.xpts(u) G.ypts(u)] - [G.xpts(v) G.ypts(v)]);
    alt = G.dist(u) + cost;
    if alt < G.dist(v)
      G.dist(v) = alt;
      G.prev(v) = u;
    end 
  end 
end 

cur = goalID;
while cur ~= 1
  prev = G.prev(cur);
    if prev == -1
    disp('No path found!')
    break;
  end 
  plot([G.xpts(cur) G.xpts(prev)],[G.ypts(cur) G.ypts(prev)],'r','linewidth',2)
  hold on;
  cur = prev;
end 
fprintf('Path length is %3.3f\n', G.dist(goalID));

end 