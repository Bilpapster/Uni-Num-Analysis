function compareSecantMethodVersions(f, startingPoint1, startingPoint2, startingPoint3)
  sumIterationsClassic = 0;
  sumIterationsModified = 0;

  sumTimeElapsedClassic = 0;
  sumTimeElapsedModified = 0;

  n = 1000;
  for i=1:n
    tic();
    [root, iterations] = secantMethod(f, startingPoint1, startingPoint2, 5);
    timeElapsed = toc();
    sumIterationsClassic += iterations;
    sumTimeElapsedClassic += timeElapsed;
  
    tic();
    [root, iterations] = secantMethodModified(f, startingPoint1, startingPoint2, startingPoint3, 5);
    timeElapsed = toc();
    sumIterationsModified += iterations;
    sumTimeElapsedModified += timeElapsed;
  endfor
  
  meanIterationsClassic = sumIterationsClassic/n;
  meanIterationsModified = sumIterationsModified/n;
  meanTimeElapsedClassic = sumTimeElapsedClassic/n;
  meanTimeElapsedModified = sumTimeElapsedModified/n;
  printf("Quest for the root %.5f starting from initial guesses (%f, %f, %f). Script executed %d times, with the following results:\n", root, startingPoint1, startingPoint2, startingPoint3, n);
  printf("Secant Method Classic:  %.2f iterations and %.2f millis needed (on average)\n", meanIterationsClassic, meanTimeElapsedClassic*1000);
  printf("Secant Method Modified: %.2f iterations and %.2f millis needed (on average)\n", meanIterationsModified, meanTimeElapsedModified*1000);
  printf("\n\n");

endfunction