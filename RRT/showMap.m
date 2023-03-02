function map = showMap( mapName, start, goal )
%{
�������ƣ�showMap
�������ܣ���ʾ��ͼ��ע���ͼ��ʽ������.png��ʽ
����������
    mapName����ͼ·��
    start����ʼ��λ��
    goal����ֹ��λ��
%}
    ret = strcmp(mapName( end-3:end ), '.png');
    if(~ret)
        disp('ͼƬ��ȡ������Ҫ��ȡ.png��ʽ��ͼƬ');
        return;
    end
    mapLoad = imread(mapName);
    [~, ~, dim] = size(mapLoad);
    if( dim == 3 )              %rgb��ͼ
       map = rgb2gray(mapLoad);
    elseif( dim == 1 )          %�Լ����ĵ�ͼ
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