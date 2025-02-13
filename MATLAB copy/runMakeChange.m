% runMakeChange.m
% This Script calls the makeChange function to compute the number of US
% coins needed to make change for ever whole number of cents between 0 and
% 99. It then graphs the number of coins vs. the amount of change, saves
% the graph as a png ifle, and calss the ArrayStats function to determine
% the maximum, minimum, mean, median, and standard deviation of the coins
% needed. Finally, it prints these results to the console

%Initialize variables
num_coins = zeros(1,100);
coins_denominaitons = [1,5,10];

%Compute the number of coins needed for each amount of change
for amount = 0:99
    num_coins(amount + 1) = makeChange(amount, coins_denominaitons);
end

%Graph the number of coins vs. the amount of change
figure;
plot(0:99,num_coins);
title('Number of US Coins Needed for Change')
xlabel('Amount of Change')
ylabel('Number of Coins');

%Determine the maximum, minimum, mean, median, and standard deviation of
%the coins needed
[maxval,minval,meanval,medianval,stdval] = ArrayStats(num_coins);

%Print the results to the console
fprintf('Statistics for the number of coins needed:\n');
fprintf('Maximum: %.2f\n', maxval);
fprintf('Minimum: %.2f\n', minval);
fprintf('Mean: %.2f\n', meanval);
fprintf('Median: %.2f\n', medianval);
fprintf('Standard Deviation: %.2f\n', stdval);