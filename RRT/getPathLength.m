function pathLength = getPathLength( path, growStep )
%{
�������ƣ�pathLength
�������ܣ���������·�����ܳ���
����������
    path��·���ṹ�壬��������·�������нڵ�
    stepSize���趨����������
%}
    totalPathNode = size(path.position, 2);                            %��ȡ·���ṹ���е����нڵ����� totalPathNode      
    distTemp = sqrt( ( path.position(1).x - path.position(2).x )^2 + ( path.position(1).y - path.position(2).y )^2 );    %��������·���е㵽��ǰһ���ڵ�ľ���
    pathLength = distTemp + (totalPathNode-1-1)*growStep;              %totalPathNode���ڵ�֮����У�totalPathNode-1����·���������յ㵽�յ�ǰһ���ڵ��·���ǵ�����������Ի�Ҫ�ټ�ȥ1             
    
end