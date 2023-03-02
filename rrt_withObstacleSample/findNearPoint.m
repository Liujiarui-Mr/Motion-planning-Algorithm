function [nearPoint, index] = findNearPoint(tree, point)
%{
函数名称：findRandomPoifindNearPointnt
函数功能：遍历树结构，找到树中距离point最近的点
函数参数：
    tree：  RRT树
    point： 地图空间中的任意点
    
%}
    minDist = sqrt( ( tree.v(1).x - point(1) )^2 + ( tree.v(1).y-point(2) )^2 );
    for i = 1:size(tree.v, 2)
        tempDist = sqrt( (tree.v(i).x - point(1))^2 + (tree.v(i).y-point(2))^2 );
        if(tempDist <= minDist )
           minDist = tempDist;
           index =i;
        end
    end
    nearPoint(1) = tree.v(index).x;
    nearPoint(2) = tree.v(index).y;
    
end