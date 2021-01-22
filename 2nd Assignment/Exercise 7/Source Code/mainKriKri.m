## Kri Kri, listed on the main market of the Athens Exchange, is a well-known greek company  
## specializing in pastry products and tranditional greek yogurt, offering products not only 
## in Greece but also in more than 10 countries abroad.
## Source: https://international.krikri.gr

## The following table shows the stock information for the company, concerning the market of the Athens  
## Exchange for the period 30/07/2020 - 20/08/2020. The data corresponding to the first 10 days are
## considered as known data. We are going to use them in order to train a model and approach the 
## closing price of the company's stock, using least squares polynomials. The approximating polynomials
## will have degree 2, 3 & 4.
## Based on that models, we will try to forecast the closing price of the stock for a short period, after 
## the described training interval. In particular, we are going to forecast the price for days
## 12 and 16, as indexed in the following table. During this procedure, we are going to conceive as 
## unknown all data presented for days 11 to 16.
## Table Source: https://www.capital.gr/finance/el/allstocks

#  Index  *     Date      *   Closing  * Percentage *   Opening  *    High  *    Low     *    Volume   *    Turnover    * Status considered *
# -------------------------------------------------------------------------------------------------------------------------------------------
#    1    *   30/7/2020   *   5,7400   *    0,00%  *   5,8000    *	5,8000  *	5,7000   *    5.870	   *     33.716,80  *      Known        *
#    2    *   31/7/2020   *   5,7400   *    0,00%  *   5,8400    *	5,8400  *	5,7000   *   20.322	   *    117.039,36  *      Known        * 
#    3    *   03/8/2020   *   5,7600   *    0,35%  *   5,8000    *	5,8000  *	5,7400   *    7.199	   *     41.446,46  *      Known        *
#    4    *   04/8/2020   *   5,9800   *    3,82%  *   5,8600    *	5,9800  *	5,7800   *    6.888	   *     40.161,92  *      Known        *
#    5    *   05/8/2020   *   6,1000   *    2,01%  *   6,0000    *	6,1000  *	5,9800   *   18.242	   *    110.315,74  *      Known        * 
#    6    *   06/8/2020   *   6,1600   *    0,98%  *   6,1000    *	6,1600  *	6,1000   *    6.450	   *     39.524,52  *      Known        *
#    7    *   07/8/2020   *   6,2400   *    1,30%  *   6,1800    *	6,2400  *	6,1600   *   11.601	   *     71.769,94  *      Known        *
#    8    *   10/8/2020   *   6,0000   *   -3,85%  *   6,2600    *	6,2600  *	5,9400   *   20.964	   *    128.690,14  *      Known        * 
#    9    *   11/8/2020   *   5,9200   *   -1,33%  *   6,0000    *	6,0400  *	5,9200   *    8.394	   *     50.199,82  *      Known        *
#   10    *   12/8/2020   *   5,9400   *    0,34%  *   6,0000    *	6,0000  *	5,9400   *    9.340	   *     55.993,00  *      Known        *

#   11    *   13/8/2020   *   5,9800   *    0,67%  *   6,0000    *	6,0000  *	5,7200   *    5.162	   *     30.403,18  *     Unknown       *  BIRTHDAY

#   12    *   14/8/2020   *   5,9000   *   -1,34%  *   5,9600    *	5,9600  *	5,8000   *    5.048	   *     29.621,98  *     Unknown       *  FORECAST #1
#   13    *   17/8/2020   *   5,8600   *   -0,68%  *   5,9600    *	5,9600  *	5,8400   *    6.100	   *     35.834,12  *     Unknown       *
#   14    *   18/8/2020   *   5,9600   *    1,71%  *   5,9600    *	6,0000  *	5,9000   *    5.727	   *     34.102,12  *     Unknown       *
#   15    *   19/8/2020   *   6,0600   *    1,68%  *   5,9600    *	6,0800  *	5,9400   *    3.838	   *     23.030,30  *     Unknown       *
#   16    *   20/8/2020   *   5,9600   *   -1,65%  *   5,9200    *	6,0400  *	5,9000   *    4.844	   *     28.918,88  *     Unknown       *  FORECAST #2

daysOfTraining = 10;
daysInTotal = 16;

forecastDay1 = 12;
forecastDay2 = 16;

dayCoordinate = 1:daysInTotal;
closingPriceCoordinate = [5.74 5.74 5.76 5.98 6.10 6.16 6.24 6.00 5.92 5.94 5.98 5.90 5.86 5.96 6.06 5.96];

plot(dayCoordinate(1:daysOfTraining), closingPriceCoordinate(1:daysOfTraining), "linewidth", 1, "linestyle", '-', '.', "color", 'k');
hold on;
plot(dayCoordinate(daysOfTraining:daysInTotal), closingPriceCoordinate(daysOfTraining:daysInTotal), "linewidth", 1, "linestyle", '-', "marker", 'p', "color", 'k');
hold on;

colors = ['g', 'b', 'm', 'r'];

for polynomialDegree = 1:4
    coefficients = leastSquares(dayCoordinate(1:daysOfTraining), closingPriceCoordinate(1:daysOfTraining), polynomialDegree);

    % calculates and prints the forecasted and actual closing price for the two forecast days
    forecastedPriceForDay1 = forecastedPriceForDay2 = coefficients(1);
    for unknown = 2:length(coefficients)
        forecastedPriceForDay1 += coefficients(unknown)*forecastDay1^(unknown - 1);
        forecastedPriceForDay2 += coefficients(unknown)*forecastDay2^(unknown - 1);
    endfor
    printf("(degree %d - Forecast day 1) Forecasted: %.2f || %.2f :Actual\n", polynomialDegree, forecastedPriceForDay1, closingPriceCoordinate(forecastDay1));
    printf("(degree %d - Forecast day 2) Forecasted: %.2f || %.2f :Actual\n\n", polynomialDegree, forecastedPriceForDay2, closingPriceCoordinate(forecastDay2));

    % initializes the x coordinate of test points, in order to plot the found polynomial
    % in the same figure, we are going to plot the actual curve of sin(x), as well
    numberOfTestPoints = 1000;
    xValues = linspace(1, daysInTotal, numberOfTestPoints);

    for i=1:numberOfTestPoints
        % constructs the y coordinates for the approximating polynomial
        yValues(i) = coefficients(1);
        for unknown = 2:length(coefficients)
            yValues(i) += coefficients(unknown)*xValues(i)^(unknown - 1);
        endfor
    endfor
    plot(xValues, yValues, "color", colors(polynomialDegree), "linestyle", '--', "linewidth", 0.8);
    hold on;
endfor

% places appropriate legend and title to the common figure
legend("actual data curve (training data)", 
       "actual data curve (data to forecast)", 
       "polynomial of degree 1", 
       "polynomial of degree 2",
       "polynomial of degree 3",
       "polynomial of degree 4",
       "location", "southeast");
title("Stock forecast: KRI-KRI", "fontsize", 14);
