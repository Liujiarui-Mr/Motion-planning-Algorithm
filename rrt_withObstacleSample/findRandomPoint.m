function randomPoint = findRandomPoint(map, goalPoint , golaProb)
%{
�������ƣ�findRandomPoint
�������ܣ��ڵ�ͼ�ռ��������һ����
����������
    map��       ����ĵ�ͼ����
    goalPoint�� Ŀ�������1*2
    goalProb��  Ŀ���ƫ�ø��� 1%-10%
    
%}
    [mapHeight, mapWidth] = size(map);                      %��ȡ��ͼ�� �߶ȣ�y���򣩺Ϳ�ȣ�x����
    randomNum = rand();
    if(randomNum <= golaProb)
        randomPoint = goalPoint;
    else
        randomPoint = rand(1,2).* [mapWidth, mapHeight];    %������ǰ����˵��mapWidth�ǵ�ͼ��ȣ���ʾx����mapHeight�ǵ�ͼ�߶�(��ʾy)
        
    end
    
end