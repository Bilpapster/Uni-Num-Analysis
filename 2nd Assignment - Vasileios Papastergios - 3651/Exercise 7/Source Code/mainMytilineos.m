## MYTILINEOS S.A., listed on the main market of the Athens Exchange, holds a leading position in the sectors of Metallurgy, 
## EPC, Electric Power and Gas Trading in Greece and has significant operations abroad.
## Source: https://www.mytilineos.gr/en-us/home/mytilineos-holdings-corporate-website

## The following table shows the stock information for the company, concerning the market of the Athens  
## Exchange for the period 30/07/2020 - 20/08/2020. The data corresponding to the first 10 days are
## considered as known data. We are going to use them in order to train a model and approach the 
## closing price of the company's stock, using least squares polynomials. The approximating polynomials
## will have degree 2, 3 & 4.
## Based on that models, we will try to forecast the closing price of the stock for a short period, after 
## the described training interval. In particular, we are going to forecast the price for days
## 12 and 16, as indexed in the following table. During this procedure, we are going to conceive as 
## unknown all data presented for days 11 to 16.
## Table Source: https://www.capital.gr/finance/historycloses/%CE%9C%CE%A5%CE%A4%CE%99%CE%9B

# Index*     Date      *   Closing  * Percentage *   Opening  *    High  *    Low     *    Volume   *    Turnover    * Status considered *
# -------------------------------------------------------------------------------------------------------------------------------------------
#   1  *   30/7/2020   *   7,8450   *   -2,36%   *	7,9700   *	8,0250	*   7,8000   *	236.069    *  1.859.908,05  *      Known        *
#   2  *   31/7/2020   *   7,8400   *   -0,06%   *	7,8450   *	7,9800	*   7,7000   *	294.523    *  2.289.252,84  *      Known        *
#   3  *   03/8/2020   *   7,8200   *   -0,26%   *	7,8400   *	7,8650	*   7,7650   *	146.320    *  1.143.904,45  *      Known        *
#   4  *   04/8/2020   *   7,9550   *	1,73%   *	7,8100   *	7,9550	*   7,8100   *	210.518    *  1.656.536,30  *      Known        *
#   5  *   05/8/2020   *   8,0800   *	1,57%   *	8,0000   *	8,0900	*   7,9550   *	263.465    *  2.118.770,64  *      Known        *
#   6  *   06/8/2020   *   8,1500   *	0,87%   *	8,0750   *	8,1500	*   8,0100   *	201.635    *  1.630.786,24  *      Known        *
#   7  *   07/8/2020   *   8,0900   *   -0,74%   *	8,1500   *	8,1800	*   7,9900   *	179.056    *  1.447.567,69  *      Known        *
#   8  *   10/8/2020   *   7,7000   *   -4,82%   *	7,8300   *	7,8450	*   7,6100   *	218.192    *  1.684.379,58  *      Known        *
#   9  *   11/8/2020   *   7,8350   *	1,75%   *	7,7000   *	7,8400	*   7,7000   *	 88.374    *    689.082,46  *      Known        *
#  10  *   12/8/2020   *   8,1000   *	3,38%   *	7,8700   *	8,1000	*   7,8350   *	201.976    *  1.615.988,43  *      Known        *

#  11  *   13/8/2020   *   7,9000   *   -2,47%   *	8,0100   *	8,0150	*   7,8950   *	152.413    *  1.208.438,83  *     Unknown       *  BIRTHDAY

#  12  *   14/8/2020   *   7,7550   *   -1,84%   *	7,8950   *	7,9200	*   7,7400   *	122.169    *    954.536,91  *     Unknown       *  FORECAST #1
#  13  *   17/8/2020   *   7,8200   *	0,84%   *	7,7900   *	7,8800	*   7,7100   *	130.576    *  1.017.819,02  *     Unknown       *
#  14  *   18/8/2020   *   7,8200   *	0,00%   *	7,8200   *	7,8400	*   7,7300   *	221.014    *  1.717.542,23  *     Unknown       *
#  15  *   19/8/2020   *   7,7400   *   -1,02%   *	7,7650   *	7,8500	*   7,7400   *	203.972    *  1.584.168,31  *     Unknown       *
#  16  *   20/8/2020   *   7,7200   *   -0,26%   *	7,7400   *	7,8050	*   7,7100   *	140.535    *  1.089.003,77  *     Unknown       *  FORECAST #2

daysOfTraining = 10;
daysInTotal = 16;

forecastDay1 = 12;
forecastDay2 = 16;

dayCoordinate = 1:daysInTotal;
closingPriceCoordinate = [7.845 7.84 7.82 7.955 8.08 8.15 8.09 7.7 7.835 8.1 7.9 7.755 7.82 7.82 7.74 7.72];

% plot(dayCoordinate(1:daysOfTraining), closingPriceCoordinate(1:daysOfTraining), "linewidth", 1, "linestyle", '-', '.', "color", 'k');
plot(dayCoordinate(1:daysOfTraining), closingPriceCoordinate(1:daysOfTraining), "linewidth", 1, '.', "color", 'k');
hold on;
% plot(dayCoordinate(daysOfTraining:daysInTotal), closingPriceCoordinate(daysOfTraining:daysInTotal), "linewidth", 1, "linestyle", '-', "marker", 'p', "color", 'k');
plot(dayCoordinate(daysOfTraining:daysInTotal), closingPriceCoordinate(daysOfTraining:daysInTotal), "linewidth", 1,"linestyle", 'none', "marker", 'p', "color", 'k');
hold on;

colors = ['g', 'b', 'm', 'r'];

for polynomialDegree = 2:4
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

    % initializes the y coordinates of the test points, used for plotting
    % for each one of the testing points, we evaluate the actual y coordinate and the 
    % coordinate given by the least squares polynomial
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
       "polynomial of degree 2",
       "polynomial of degree 3",
       "polynomial of degree 4");
       
title("Stock forecast: MYTILINEOS", "fontsize", 14);
xlabel("days the Athens Exchnage is in operation");
ylabel("closing price of MYTLINEOS stock");