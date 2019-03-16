function [status] = IsSegmentCollisonFree(params, q1, q2)
% Usage: [status] = IsSegmentCollisionFree(params, q1, q2)
%
% Checks if the straight line segment between q1 and q2 is in collision with the 
% obstacles defined in params.
%
% Input       q1      : a 2D column vector q1 = [x y]' specifying the robot's configuration
%                       at one endpoint of the line segment
%             q2      : a 2D column vector q2 = [x y]' specifying the robot's configuration
%                       at the other endpoint of the line segment
%             params  : a structure containing the x,y coordinates of the obstacles
%
% Output      status  : boolian flag equal to 1 if configuration the segment is collision free
%                       equal to 0 otherwise (if there is a collision)
  n = length(params.obstacles);
  bufferDist = 0.1;
  for k = 1 : 3 : n
     ox = params.obstacles(k);
     oy = params.obstacles(k + 1);
     [xmin, ymin, dmin] = PointSegmentDistanceSquare(ox, oy, q1(1), q1(2), q2(1), q2(2));
     if ( dmin <= params.obstacles(k + 2)^2 + bufferDist )
      status = 0;
      return;
     end 
  end
  status = 1;
  return;
end 