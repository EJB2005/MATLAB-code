function [maxval, minval, meanval, medianval, stdval] = ArrayStats(a)
%ARRAYSTATS computes various descriptive statistics from an array of
%numbers using loops. 
%   maxval = the maximum in the array
%   minval = the minimum value in the array
%   meanval = the mean value of the array
%   medianval = the median value of the array
%   stdval = the statndard deviation of the array

% Initialize variables
maxval = a(1);
minval = a(1);
sumval = 0;
n = length(a);

%Calculate maxvel, minval, and sumval using loops
for i = 1:n
    if a(i) > maxval
        maxval = a(i);
    end
    if a(i) < minval
        minval = a(i);
    end
    sumval = sumval + a(i);
end

%Calculate meanval
meanval = sumval/n;

%Calculate medianval
sorted_a = sort(a);
if mod(n,2) == 0
    medianval = (sorted_a(n/2) + sorted_a(n/2 + 1))/2;
else
    medianval = sorted_a((n+1)/2);
end

%Calculate stdval
sum_sq_diff = 0;
for i = 1:n
    sum_sq_diff = sum_sq_diff + (a(i) - meanval)^2;
end
variance = sum_sq_diff/(n-1);
stdval = sqrt(variance);
end

