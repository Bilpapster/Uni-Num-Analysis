function compareBisectionMethodVersions(f, leftLimit, rightLimit)
  sumIterationsClassic = 0;
  sumIterationsModified = 0;

  sumTimeElapsedClassic = 0;
  sumTimeElapsedModified = 0;

  n = 1000;
  for i=1:n
    tic();
    [root, iterations] = bisectionMethod(f, leftLimit, rightLimit, 5);
    timeElapsed = toc();
    sumIterationsClassic += iterations;
    sumTimeElapsedClassic += timeElapsed;
  
    tic();
    [root, iterations] = bisectionMethodModified(f, leftLimit, rightLimit, 5);
    timeElapsed = toc();
    sumIterationsModified += iterations;
    sumTimeElapsedModified += timeElapsed;
  endfor
  
  meanIterationsClassic = sumIterationsClassic/n;
  meanIterationsModified = sumIterationsModified/n;
  meanTimeElapsedClassic = sumTimeElapsedClassic/n;
  meanTimeElapsedModified = sumTimeElapsedModified/n;
  printf("Quest for the root %.5f starting from the interval (%f, %f). Script executed %d times, with the following results:\n", root, leftLimit, rightLimit, n);
  printf("Bisection Method Classic:  %.2f iterations and %.2f millis needed (on average)\n", meanIterationsClassic, meanTimeElapsedClassic*1000);
  printf("Bisection Method Modified: %.2f iterations and %.2f millis needed (on average)\n", meanIterationsModified, meanTimeElapsedModified*1000);
  printf("\n\n");

endfunction