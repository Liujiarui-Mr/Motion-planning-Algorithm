function pointCheckFlag = pointCheck(map, point)
%{
函数名称：pointCheck
函数功能：检查坐标点是否在障碍物上
函数参数：
    point：      待检查的坐标点
    map：        地图矩阵 黑色（障碍物）为0， 白色（自由空间）255
    
%}

    pointCheckFlag = false;
    [mapHeight, mapWidth] = size(map);
    %检查坐标点是否超出边界,point的x坐标( point(1) )对应地图的宽度，point的y坐标(point(2)）对应地图的高度，同时检查坐标是否在障碍物上
    if( point(1)>=1 && point(1)<=mapWidth && point(2)>=1 && point(2)<=mapHeight &&...
        map( ceil(point(2)), ceil(point(1)) )==255 && map( floor(point(2)), floor(point(1)) )==255 && map( ceil(point(2)), floor(point(1)) )==255 && map( floor(point(2)), ceil(point(1)) )==255 )
        pointCheckFlag = true;
    end
    
end