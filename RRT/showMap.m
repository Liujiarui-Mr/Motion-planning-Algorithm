function map = showMap( mapName, start, goal )
%{
函数名称：showMap
函数功能：显示地图，注意地图格式必须是.png格式
函数参数：
    mapName：地图路径
    start：起始点位置
    goal：终止点位置
%}
    ret = strcmp(mapName( end-3:end ), '.png');
    if(~ret)
        disp('图片读取错误，需要读取.png格式的图片');
        return;
    end
    mapLoad = imread(mapName);
    [~, ~, dim] = size(mapLoad);
    if( dim == 3 )              %rgb地图
       map = rgb2gray(mapLoad);
    elseif( dim == 1 )          %自己做的地图
        whitePart = find(mapLoad == 0);
        blackPart = find(mapLoad == 1);
        mapLoad(whitePart) = 255;
        mapLoad(blackPart) = 0;
        map = mapLoad;
    end
    figure(1)
    imshow(map);
    hold on;
    plot(start(1), start(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    plot(goal(1), goal(2), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
end