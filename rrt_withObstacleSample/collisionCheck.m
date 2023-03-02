function pathCollisionFlag = collisionCheck(map, nearPoint, newPoint)
%{
函数名称：collisionCheck
函数功能：检查树中最近点 pNearest 到 pNew 的路径是否无碰撞
函数参数：
    map：        地图矩阵 黑色（障碍物）为0 白色（自由空间）255
    nearPoint：  树中的最近点
    newPoint：   根据pNearest 和 pRand 生长的新点
    
%}

    pathCollisionFlag = false;
    growthAngle = atan2( newPoint(2)-nearPoint(2), newPoint(1)-nearPoint(1) );
    distCheck = sqrt( ( newPoint(2)-nearPoint(2) )^2 + ( newPoint(1)-nearPoint(1) )^2 );
    
    %首先判断pNew是否在障碍物上，如果在障碍物上，函数直接返回false
    if( ~(pointCheck(map, newPoint)) )
        pathCollisionFlag = false;
        return;
    else    
        pathCollisionFlag = true;
    end
    
    %以一定的间隔，判断pNearest 到 pNew连线上的各个点是否在障碍物上，如果在障碍物上则退出循环 返回false
    for step=0:0.5:distCheck
        tempPose = nearPoint + step * [cos(growthAngle), sin(growthAngle)];
        if( ~(pointCheck(map, tempPose)) )
            pathCollisionFlag = false;
            break;
            
        end
    end
    
end