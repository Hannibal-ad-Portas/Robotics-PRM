function [params] = SetupFromFile(fname, params)

% read obstacles (skip other info in the file)
in = fopen(fname, 'r');
for k = 1 : 1 : 5
    s = lower(fscanf(in, '%s', 1));
%    if strcmp(s, 'initialstate')
%        params.robot(1) = fscanf(in, '%lf', 1);
%        params.robot(2) = fscanf(in, '%lf', 1);
%        params.robot(3) = fscanf(in, '%lf', 1);
%    elseif strcmp(s, 'goal')
%        params.goal(1) = fscanf(in, '%lf', 1);
%        params.goal(2) = fscanf(in, '%lf', 1);
%        params.goal(3) = fscanf(in, '%lf', 1);
%    elseif strcmp(s, 'bbox')
%        params.xmin = fscanf(in, '%lf', 1);
%        params.ymin = fscanf(in, '%lf', 1);
%        params.xmax = fscanf(in, '%lf', 1);
%        params.ymax = fscanf(in, '%lf', 1);
%    elseif strcmp(s, 'distonestep')
%        params.distOneStep = fscanf(in, '%lf', 1);
    if strcmp(s, 'obstacles')
        n = fscanf(in, '%d', 1);
        params.obstacles = zeros(1, 3 * n);
        for i = 1 : 1 : 3 * n
            params.obstacles(i) = fscanf(in, '%lf', 1);
        end
    end
end
fclose(in);
end

