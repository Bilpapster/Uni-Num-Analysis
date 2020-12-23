function compareNewtonRaphsonMethodVersions(f, f_derivative, f_second_derivative, startingPoint)
  sumIterationsClassic = 0;
  sumIterationsModified = 0;

  sumTimeElapsedClassic = 0;
  sumTimeElapsedModified = 0;

  n = 1000;
  for i=1:n
    tic();
    [root, iterations] = newtonRaphsonMethod(f, f_derivative, startingPoint, 5);
    timeElapsed = toc();
    sumIterationsClassic += iterations;
    sumTimeElapsedClassic += timeElapsed;
  
    tic();
    [root, iterations] = newtonRaphsonMethodModified(f, f_derivative, f_second_derivative, startingPoint, 5);
    timeElapsed = toc();
    sumIterationsModified += iterations;
    sumTimeElapsedModified += timeElapsed;
  endfor
  
  meanIterationsClassic = sumIterationsClassic/n;
  meanIterationsModified = sumIterationsModified/n;
  meanTimeElapsedClassic = sumTimeElapsedClassic/n;
  meanTimeElapsedModified = sumTimeElapsedModified/n;
  printf("Quest for the root %.5f starting from x0 = %f. Script executed %d times, with the following results:\n", root, startingPoint, n);
  printf("Newton-Raphson Method Classic:  %.2f iterations and %.2f millis needed (on average)\n", meanIterationsClassic, meanTimeElapsedClassic*1000);
  printf("Newton-Raphson Method Modified: %.2f iterations and %.2f millis needed (on average)\n", meanIterationsModified, meanTimeElapsedModified*1000);
  printf("\n\n");

endfunction