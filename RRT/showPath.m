function  showPath(pathFind, lineColor, lineWidth)
%{
�������ƣ�showPath
�������ܣ���ʾ·��
����������
    pathFind���ҵ�������·��
    lineColor��·����ɫ
    lineWidth��·�����
%}
    for i=1:(size(pathFind.position, 2)-1)
        
        plot( [pathFind.position(i).x, pathFind.position(i+1).x], [pathFind.position(i).y, pathFind.position(i+1).y], lineColor, 'LineWidth', lineWidth );
    
    end
    
    
end