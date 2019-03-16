function status  = IsCollisionFree(params, q)
% Usage: [status] = IsCollisionFree(params, q)
%
% Checks if the configuration specified by q = [x y]' (a 2D column vector) is in collision with the 
% obstacles defined in params.obstacles. 
%
% Input       q       : a 2D column vector q = [x y]' specifying the robot's configuration 
%             params  : a structure containing the x,y coordinates of the obstacles
%
% Output      status  : 1 if configuration q is collision free, 0 if in collision 
  rx = q(1);
  ry = q(2);
  status = rx >= params.xmin && rx <= params.xmax && ...
           ry >= params.ymin && ry <= params.ymax;
   if status == 1
       n = length(params.obstacles);
       for k = 1 : 3 : n
           ox = params.obstacles(k);
           oy = params.obstacles(k + 1);
           if ((rx - ox) * (rx - ox) + (ry  - oy) * (ry - oy)) < (params.rr + params.obstacles(k + 2))^2
               status = 0;
               return;
           end
       end
   end
end

