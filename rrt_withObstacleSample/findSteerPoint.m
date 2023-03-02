function newPoint = findSteerPoint(randomPoint, nearPoint, stepSize)
    
    growthAngle = atan2( randomPoint(2)-nearPoint(2), randomPoint(1)-nearPoint(1) );               %这是个斜率计算，之后进行反正切处理
    newPoint = [nearPoint(1)+stepSize*cos(growthAngle), nearPoint(2)+stepSize*sin(growthAngle)];   %根据角度和步长，得到一个在nearPoint到stepSize连线上的新点
    
end