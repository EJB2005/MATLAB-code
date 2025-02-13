%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ME018A -- Test Stub
% V2
% Run this script to test the cornerCoordinates.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

function_name = "cornerCoordinates.m";
nInArgs = 3;
nOutArgs = 2;

if not(isfile(function_name))
    fprintf("The function does not exist\n");
    fprintf("Make sure that the file name is: %s\n", function_name)
    error("File does not exist.");
end

if nargin(function_name) ~= nInArgs
    fprintf("Your function has %d input arguments but %d are expected\n", nargin(function_name), nInArgs)
    error("Wrong number of input arguments")
end

if nargout(function_name) ~= nOutArgs
    fprintf("Your function has %d output arguments but %d are expected\n", nargout(function_name), nOutArgs)
    error("Wrong number of output arguments")
end


x = 0:2:100;
y = 22*x;
c = [1 3 30 51];
cx(1) = x(1); cx(2) = x(3); cx(3) = x(30); cx(4) = x(51); 
cy(1) = y(1); cy(2) = y(3); cy(3) = y(30); cy(4) = y(51); 

runCase(function_name, 1, [1 2 3 4 5], [10 20 30 40 50], [1 3 5], [1 3 5], [10 30 50]) 
runCase(function_name, 2, [0.5, 1, 3.5, 3.75, 4, 5, 6, 7], ...
    [10, 11, 12, 13, 12, 11, 10, 9], [1, 4, 8], [0.5, 3.75, 7], [10, 13, 9]);
runCase(function_name, 3, x, y, c, cx, cy);
runCase(function_name, 4, [1 2 3 4 5], [1 2 3 4], [1 2], [], []);
runCase(function_name, 5, [1 2 3 4 5], [1 2 3 4 5], [1], [], []);
runCase(function_name, 6, [1 2 3], [1 2 3], [1 10], [], []);

function runCase(function_name, exnum, x_array, y_array, c_array, true_cx, true_cy)
    fprintf("\n\n===================================================\n");
    fprintf("\nTest Case %d\n", exnum);
    fprintf("Length of x-array: %d\n",length(x_array));
    fprintf("Length of y-array: %d\n",length(y_array));
    if length(x_array) < 10
        disp("x-array:");
        disp(x_array);
        disp("y-array:");
        disp(y_array);
        disp("corner array:");
        disp(c_array);
    end

    try
        [cx, cy] = cornerCoordinates(x_array, y_array, c_array);
    catch
        fprintf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        fprintf("Your function <%s> failed to run.\n", function_name)
        fprintf("Look at the following messages to see what is wrong with it.\n")
        fprintf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        % after printing the error message, let the function crash
        [cx, cy] = cornerCoordinates(x_array, y_array, c_array);
    end
 
    checkArray("x-output", cx, true_cx);
    checkArray("y-output", cy, true_cy);
end

function  checkArray(name, a, true_a)
    if isempty(true_a) 
        if ~isempty(a) 
            fprintf("***Error: %s array should be empty but is not.\n", name);
            return;
        else 
            fprintf("%s array is empty which is correct.\n", name);
            return;
        end
    end


    
    if not(isvector(a))
        [ar, ac] = size(a);
        fprintf("***Error: %s array should be a vector but is a matrix of size %dx%d.\n", name, ar, ac);
        return;
    end

    if iscolumn(a) 
        fprintf("***Error: %s array should be a a row vector but is a column vector.\n", name);
        a = a';  % compute transpose
    end

    if length(a) ~= length(true_a) 
        fprintf("***Error: %s array has length %d but should have length %d\n", name, length(a), length(true_a));
    elseif mean(abs(a - true_a)) / mean(true_a) > 0.005
        fprintf("***Error: %s array has average error of %0.3f%%.\n", name, 100.0*mean(abs(a - true_a))/mean(true_a) );
    else
        fprintf("%s array is correct.\n", name)
    end

end


