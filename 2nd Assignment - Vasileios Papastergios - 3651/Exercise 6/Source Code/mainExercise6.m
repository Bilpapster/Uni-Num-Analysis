approximateIntegralValue = trapezoidMethod(@sin, 0, pi/2, 10)
actualError = 1 - approximateIntegralValue

approximateIntegralValue = simpsonMethod(@sin, 0, pi/2, 10)
actualError =1 - approximateIntegralValue