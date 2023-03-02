function [nearPoint, index] = findNearPoint(tree, point)
%{
�������ƣ�findRandomPoifindNearPointnt
�������ܣ��������ṹ���ҵ����о���point����ĵ�
����������
    tree��  RRT��
    point�� ��ͼ�ռ��е������
    
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