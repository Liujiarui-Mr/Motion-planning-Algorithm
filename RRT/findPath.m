function pathFind = findPath(tree, goalPoint)
%{
�������ƣ�findPath
�������ܣ��ҵ�����·��
����������
    tree��       ����ĵ�ͼ����
    goalPoint�� Ŀ�������1*2
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