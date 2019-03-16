function [status] = ArePointsNear(q1, q2)
% Usage: [status] = ArePointsNear(q1, q2)
%
% Checks if the points q1 and q2 are near to each other. 
%
% Input     q1      : a 2D vector giving the configuration q1 = [x y]' of the robot
%           q2      : a 2D vector giving the configuration q2 = [x y]' of the robot
%
% Output    status  : a boolean flag equal to 1 if the points are `near' 
%                     (i.e., their distance is less than 15 units) or  
%                     a status of 0 if they are not near 

    status = norm(q1 - q2) < 15.0;
end
