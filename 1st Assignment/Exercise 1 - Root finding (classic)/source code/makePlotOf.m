#{
A simple script-function that makes a 2D plot of a given one-variable function.
Takes as parameters a function and a string description of it.
Plots the given function in [-2, 2] x [-2, 2] and adds its string description as a legend.
#}


function makePlotOf(aFunction, theFunctionToString)
    fplot(aFunction, [-2, 2, -2, 2], 'g');
    xlabel("x");
    ylabel("f(x)");
    legend(theFunctionToString, "location", "southwest");
    %title({"Graph of", " ", strtrim(theFunctionToString)," ", "plotted in [-2,2] x [-2,2]"});
endfunction