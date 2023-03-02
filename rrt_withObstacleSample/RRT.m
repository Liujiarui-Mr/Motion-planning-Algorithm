function RRT(pStart, pGoal, maxIteration, stepSize, thr, goalBias )
    tic
    %%% 算法初始化
%{
    %测试参数
    stepSize = 20;               %树生长步长
    thr      = 20;               %目标点阈值半径
    maxIteration = 3000;         %最大迭代次数
    pStart = [1, 1];             %起始点坐标
    pGoal  = [600, 600];         %目标点坐标

%}    
    %将初始点添加到树中，对树结构进行初始化
    T.v(1).x = pStart(1);        %创建树结构，树的起点x
    T.v(1).y = pStart(2);        %树的起点y
    T.v(1).xPre = pStart(1);     %起始点父节点x
    T.v(1).yPre = pStart(2);     %起始点父节点y
    T.v(1).dist = 0;             %父节点到当前点的代价值  
    T.v(1).preIndex = 0;         %当前点的父节点索引
    nodeNum = 1;                 %树中节点的数量
    pathFindFlag = false;        %最终路径找到标志位

%{
    注意：
        1. matlab显示地图时，地图原点在图片左上角，从左到右为x轴(表示列)，从上到下为y轴(表示行)
        2. 所以，在地图矩阵中的坐标如map(1,2)  表示第1行，第2列，即x=2 y=1时的像素值
        3. 本程序中，点的坐标用1*2的向量表示，第一个表示x坐标值，第二个表示y坐标值，如pRand，Prand(1)为x坐标值(列方向)，pRand(2)为y坐标值(行方向)
%}
    %显示地图
    map = showMap('..\map3.png', pStart, pGoal);

    %循环进行搜索树生长，通过最大迭代次数来限制循环的次数，由于RRT没有对路径进行优化，所以找到一条可行路径就退出循环
    for iter = 1:maxIteration

        %在地图中随即采样一个点 pRand
        pRand = findRandomPoint(map, pGoal, goalBias);
        plot(pRand(1), pRand(2), 'bo', 'MarkerSize', 4, 'MarkerFaceColor', 'b');

        %找到树中距离pRand最近的点
        [pNearest, minIndex] = findNearPoint(T, pRand);

        %沿着pNearest 到 pRand 生长一个新点
        pNew = findSteerPoint(pRand, pNearest, stepSize);

        %检查路径是否发生碰撞，若没有碰撞则将pNew加入到树结构中
        if( ~collisionCheck(map, pNearest, pNew) )
            continue;
        end
        %路径无碰撞则把，生成的新点pNew添加到树中
        nodeNum = nodeNum + 1;
        T.v(nodeNum).x = pNew(1);
        T.v(nodeNum).y = pNew(2);
        T.v(nodeNum).xPre = pNearest(1);
        T.v(nodeNum).yPre = pNearest(2);
        T.v(nodeNum).dist = stepSize;
        T.v(nodeNum).preIndex = minIndex;
        plot( [pNearest(1), pNew(1)], [pNearest(2), pNew(2)], 'k' , 'LineWidth',2 );
        plot(pNew(1), pNew(2), 'mo', 'MarkerSize', 7, 'MarkerFaceColor', 'm');

        %检查是否到达目标点附近
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

    %路径找到后进行路径回溯并画出最终路线图
    path = struct;
    if(pathFindFlag)
        %路径节点回溯
        path = findPath(T, pGoal);
        %根据回溯节点，在图中画出最终的路径线
        showPath(path, 'g', 3);
    else
        disp('path not find!!!');
    end
    %计算路径总长度
    pathLength = getPathLength(path,stepSize);
    text = sprintf('路径总长度为：%f', pathLength);
    disp(text);
    toc
end





