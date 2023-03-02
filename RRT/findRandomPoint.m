function randomPoint = findRandomPoint(map, goalPoint , golaProb)
%{
函数名称：findRandomPoint
函数功能：在地图空间随机采样一个点
函数参数：
    map：       输入的地图矩阵
    goalPoint： 目标点坐标1*2
    goalProb：  目标点偏置概率 1%-10%
    
%}
    [mapHeight, mapWidth] = size(map);                      %获取地图的 高度（y方向）和宽度（x方向）
    randomNum = rand();
    if(randomNum <= golaProb)
        randomPoint = goalPoint;
    else
        randomPoint = rand(1,2).* [mapWidth, mapHeight];    %这列如前面所说，mapWidth是地图宽度（表示x），mapHeight是地图高度(表示y)
        
    end
    
end