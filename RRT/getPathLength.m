function pathLength = getPathLength( path, growStep )
%{
函数名称：pathLength
函数功能：计算最终路径的总长度
函数参数：
    path：路径结构体，包含最终路径的所有节点
    stepSize：设定的生长步长
%}
    totalPathNode = size(path.position, 2);                            %获取路径结构体中的所有节点数量 totalPathNode      
    distTemp = sqrt( ( path.position(1).x - path.position(2).x )^2 + ( path.position(1).y - path.position(2).y )^2 );    %单独计算路径中点到其前一个节点的距离
    pathLength = distTemp + (totalPathNode-1-1)*growStep;              %totalPathNode个节点之间会有（totalPathNode-1）条路径，由于终点到终点前一个节点的路径是单独计算的所以还要再减去1             
    
end