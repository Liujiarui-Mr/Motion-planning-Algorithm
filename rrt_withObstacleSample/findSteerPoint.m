function newPoint = findSteerPoint(randomPoint, nearPoint, stepSize)
    
    growthAngle = atan2( randomPoint(2)-nearPoint(2), randomPoint(1)-nearPoint(1) );               %���Ǹ�б�ʼ��㣬֮����з����д���
    newPoint = [nearPoint(1)+stepSize*cos(growthAngle), nearPoint(2)+stepSize*sin(growthAngle)];   %���ݽǶȺͲ������õ�һ����nearPoint��stepSize�����ϵ��µ�
    
end