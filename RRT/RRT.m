function RRT(pStart, pGoal, maxIteration, stepSize, thr, goalBias )
    tic
    %%% �㷨��ʼ��
%{
    %���Բ���
    stepSize = 20;               %����������
    thr      = 20;               %Ŀ�����ֵ�뾶
    maxIteration = 3000;         %����������
    pStart = [1, 1];             %��ʼ������
    pGoal  = [600, 600];         %Ŀ�������

%}    
    %����ʼ����ӵ����У������ṹ���г�ʼ��
    T.v(1).x = pStart(1);        %�������ṹ���������x
    T.v(1).y = pStart(2);        %�������y
    T.v(1).xPre = pStart(1);     %��ʼ�㸸�ڵ�x
    T.v(1).yPre = pStart(2);     %��ʼ�㸸�ڵ�y
    T.v(1).dist = 0;             %���ڵ㵽��ǰ��Ĵ���ֵ  
    T.v(1).preIndex = 0;         %��ǰ��ĸ��ڵ�����
    nodeNum = 1;                 %���нڵ������
    pathFindFlag = false;        %����·���ҵ���־λ

%{
    ע�⣺
        1. matlab��ʾ��ͼʱ����ͼԭ����ͼƬ���Ͻǣ�������Ϊx��(��ʾ��)�����ϵ���Ϊy��(��ʾ��)
        2. ���ԣ��ڵ�ͼ�����е�������map(1,2)  ��ʾ��1�У���2�У���x=2 y=1ʱ������ֵ
        3. �������У����������1*2��������ʾ����һ����ʾx����ֵ���ڶ�����ʾy����ֵ����pRand��Prand(1)Ϊx����ֵ(�з���)��pRand(2)Ϊy����ֵ(�з���)
%}
    %��ʾ��ͼ
    map = showMap('..\map3.png', pStart, pGoal);

    %ѭ������������������ͨ������������������ѭ���Ĵ���������RRTû�ж�·�������Ż��������ҵ�һ������·�����˳�ѭ��
    for iter = 1:maxIteration

        %�ڵ�ͼ���漴����һ���� pRand
        pRand = findRandomPoint(map, pGoal, goalBias);
        plot(pRand(1), pRand(2), 'bo', 'MarkerSize', 4, 'MarkerFaceColor', 'b');

        %�ҵ����о���pRand����ĵ�
        [pNearest, minIndex] = findNearPoint(T, pRand);

        %����pNearest �� pRand ����һ���µ�
        pNew = findSteerPoint(pRand, pNearest, stepSize);

        %���·���Ƿ�����ײ����û����ײ��pNew���뵽���ṹ��
        if( ~collisionCheck(map, pNearest, pNew) )
            continue;
        end
        %·������ײ��ѣ����ɵ��µ�pNew��ӵ�����
        nodeNum = nodeNum + 1;
        T.v(nodeNum).x = pNew(1);
        T.v(nodeNum).y = pNew(2);
        T.v(nodeNum).xPre = pNearest(1);
        T.v(nodeNum).yPre = pNearest(2);
        T.v(nodeNum).dist = stepSize;
        T.v(nodeNum).preIndex = minIndex;
        plot( [pNearest(1), pNew(1)], [pNearest(2), pNew(2)], 'k' , 'LineWidth',2 );
        plot(pNew(1), pNew(2), 'mo', 'MarkerSize', 7, 'MarkerFaceColor', 'm');

        %����Ƿ񵽴�Ŀ��㸽��
        dist = sqrt( (pNew(1)-pGoal(1))^2 + (pNew(2)-pGoal(2))^2 );
        if( (dist < thr) && collisionCheck(map, pNew, pGoal) )
            pathFindFlag = true;
            goalPreIndex = nodeNum;
            nodeNum = nodeNum + 1;
            T.v(nodeNum).x = pGoal(1);
            T.v(nodeNum).y = pGoal(2);
            T.v(nodeNum).xPre = pNew(1);
            T.v(nodeNum).yPre = pNew(2);
            T.v(nodeNum).preIndex = goalPreIndex;
            T.v(nodeNum).dist = dist;
            plot( [pNew(1), pGoal(1)], [pNew(2), pGoal(2)], 'k' , 'LineWidth',2 );
           break; 
        end

        pause(0.02);
    end

    %·���ҵ������·�����ݲ���������·��ͼ
    path = struct;
    if(pathFindFlag)
        %·���ڵ����
        path = findPath(T, pGoal);
        %���ݻ��ݽڵ㣬��ͼ�л������յ�·����
        showPath(path, 'g', 3);
    else
        disp('path not find!!!');
    end
    %����·���ܳ���
    pathLength = getPathLength(path,stepSize);
    text = sprintf('·���ܳ���Ϊ��%f', pathLength);
    disp(text);
    toc
end





