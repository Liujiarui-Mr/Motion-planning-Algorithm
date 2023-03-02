function pointCheckFlag = pointCheck(map, point)
%{
�������ƣ�pointCheck
�������ܣ����������Ƿ����ϰ�����
����������
    point��      �����������
    map��        ��ͼ���� ��ɫ���ϰ��Ϊ0�� ��ɫ�����ɿռ䣩255
    
%}

    pointCheckFlag = false;
    [mapHeight, mapWidth] = size(map);
    %���������Ƿ񳬳��߽�,point��x����( point(1) )��Ӧ��ͼ�Ŀ�ȣ�point��y����(point(2)����Ӧ��ͼ�ĸ߶ȣ�ͬʱ��������Ƿ����ϰ�����
    if( point(1)>=1 && point(1)<=mapWidth && point(2)>=1 && point(2)<=mapHeight &&...
        map( ceil(point(2)), ceil(point(1)) )==255 && map( floor(point(2)), floor(point(1)) )==255 && map( ceil(point(2)), floor(point(1)) )==255 && map( floor(point(2)), ceil(point(1)) )==255 )
        pointCheckFlag = true;
    end
    
end