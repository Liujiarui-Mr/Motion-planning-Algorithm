function pathFind = findPath(tree, goalPoint)
%{
函数名称：findPath
函数功能：找到最终路径
函数参数：
    tree：       输入的地图矩阵
    goalPoint： 目标点坐标1*2
%}

    pathFind.position(1).x = goalPoint(1);
    pathFind.position(1).y = goalPoint(2);
    pathPointNo = size(pathFind.position, 2);
    nodeIndex = tree.v(end).preIndex;
    while( nodeIndex ~= 0 )
        pathFind.position( pathPointNo+1 ).x = tree.v(nodeIndex).x;
        pathFind.position( pathPointNo+1 ).y = tree.v(nodeIndex).y;
        pathPointNo = pathPointNo + 1;
        nodeIndex = tree.v(nodeIndex).preIndex;
    end
    
    
end