function  showPath(pathFind, lineColor, lineWidth)
%{
函数名称：showPath
函数功能：显示路径
函数参数：
    pathFind：找到的最终路径
    lineColor：路径颜色
    lineWidth：路径宽度
%}
    for i=1:(size(pathFind.position, 2)-1)
        
        plot( [pathFind.position(i).x, pathFind.position(i+1).x], [pathFind.position(i).y, pathFind.position(i+1).y], lineColor, 'LineWidth', lineWidth );
    
    end
    
    
end