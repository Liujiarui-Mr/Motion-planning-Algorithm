function pathCollisionFlag = collisionCheck(map, nearPoint, newPoint)
%{
�������ƣ�collisionCheck
�������ܣ������������� pNearest �� pNew ��·���Ƿ�����ײ
����������
    map��        ��ͼ���� ��ɫ���ϰ��Ϊ0 ��ɫ�����ɿռ䣩255
    nearPoint��  ���е������
    newPoint��   ����pNearest �� pRand �������µ�
    
%}

    pathCollisionFlag = false;
    growthAngle = atan2( newPoint(2)-nearPoint(2), newPoint(1)-nearPoint(1) );
    distCheck = sqrt( ( newPoint(2)-nearPoint(2) )^2 + ( newPoint(1)-nearPoint(1) )^2 );
    
    %�����ж�pNew�Ƿ����ϰ����ϣ�������ϰ����ϣ�����ֱ�ӷ���false
    if( ~(pointCheck(map, newPoint)) )
        pathCollisionFlag = false;
        return;
    else    
        pathCollisionFlag = true;
    end
    
    %��һ���ļ�����ж�pNearest �� pNew�����ϵĸ������Ƿ����ϰ����ϣ�������ϰ��������˳�ѭ�� ����false
    for step=0:0.5:distCheck
        tempPose = nearPoint + step * [cos(growthAngle), sin(growthAngle)];
        if( ~(pointCheck(map, tempPose)) )
            pathCollisionFlag = false;
            break;
            
        end
    end
    
end