function [xmin, ymin, dmin] = PointSegmentDistanceSquare(px, py, s0x, s0y, s1x, s1y)
    vx = s1x - s0x;
    vy = s1y - s0y;
    wx = px  - s0x;
    wy = py  - s0y;
    a  = vx * wx + vy * wy;
    b  = vx * vx + vy * vy;
    
    if (a <= 0) 
        xmin = s0x;
        ymin = s0y;
        dmin = wx * wx + wy * wy;
        return;
    end
	
    if (b <= a)
        xmin = s1x;
        ymin = s1y;
        dmin = (px - s1x) * (px - s1x) + (py - s1y) * (py - s1y);
        return;
    end
    
    a = a ./ b;
    vx= s0x + a * vx;
    vy= s0y + a * vy;
    
    xmin = vx;
    ymin = vy;
    dmin = (px - vx) * (px - vx) + (py - vy) * (py - vy);    
end
