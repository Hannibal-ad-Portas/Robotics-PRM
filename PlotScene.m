function PlotScene(params)
  figure(1);
  % plot the boundary box ands et up figure 
  params.viewScaleFactor = 1.3;
  xlim = [params.xmin params.xmax];
  ylim = [params.ymin params.ymax];
  plot([xlim(1) xlim(1) xlim(2) xlim(2) xlim(1)],[ylim(1) ylim(2) ylim(2) ylim(1) ylim(1)],'k-','linewidth',3)
  set(gca, 'xlim', xlim*params.viewScaleFactor ); 
  set(gca, 'ylim', ylim*params.viewScaleFactor );
  grid on;
  hold on;
  axis equal;
      
  %% draw obstacles 
  dthetas    = 0 : 2 * pi / 15 : 2 * pi;
  xptsCircle = cos(dthetas);
  yptsCircle = sin(dthetas);
  n = length(params.obstacles);
  for i = 1 : 3 : n
      fill(params.obstacles(i)        + params.obstacles(i + 2) * xptsCircle, ...
          params.obstacles(i + 1)  + params.obstacles(i + 2) * yptsCircle,  [0 0 1]);
  end
end