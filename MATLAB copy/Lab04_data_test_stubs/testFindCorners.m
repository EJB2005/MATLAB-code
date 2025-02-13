%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ME018A -- Test Stub
% V2
% Run this script to test the findCorners.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

try
    load star_data.mat
catch
    disp("Could not find star_dat.mat");
    disp("Place a copy of that file in this directory and try again.")
    error("Missing File: star_data.mat")
end


function_name = "findCorners.m";
nInArgs = 1;
nOutArgs = 1;

if not(isfile(function_name))
    fprintf("The function does not exist\n");
    fprintf("Make sure that the file name is: %s\n", function_name)
    error("File does not exist.")
end

if nargin(function_name) ~= nInArgs
    fprintf("Your function has %d input arguments but %d are expected\n", nargin(function_name), nInArgs)
    error("Wrong number of input arguments")
end

if nargout(function_name) ~= nOutArgs
    fprintf("Your function has %d output arguments but %d are expected\n", nargout(function_name), nOutArgs)
    error("Wrong number of output arguments")
end

runCase(function_name, 1, ref_vs, ref_c);
runCase(function_name, 2, [1 2], []);

function runCase(function_name, exnum, vs, true_c)
    fprintf("\nTest Case %d\n", exnum);
    fprintf("Length of velocity array: %d\n",length(vs));

    try
        [c] = findCorners(vs);
    catch
        fprintf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        fprintf("Your function <%s> failed to run.\n", function_name)
        fprintf("Look at the following messages to see what is wrong with it.\n")
        fprintf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        % after printing the error message, let the function crash
        [c] = findCorners(vs);
    end


    name = "corner";
    if isempty(true_c) 
        if ~isempty(c) 
            fprintf("***Error: %s array should be empty but is not.\n", name);
            return;
        else 
            fprintf("%s array is empty which is correct.\n", name);
            return;
        end
    end

    if not(isvector(c))
        [ar, ac] = size(c);
        fprintf("***Error: %s array should be a vector but is a matrix of size %dx%d.\n", name, ar, ac);
        return;
    end

    if iscolumn(c) 
        fprintf("***Error: %s array should be a a row vector but is a column vector.\n", name);
        c = c';  % compute transpose
    end

    
    diff1 = setdiff(c, true_c);
    diff2 = setdiff(true_c, c);
    fprintf("Your corners:    ");
    printA(c);
    fprintf("Correct corners: ");
    printA(true_c);
    if length(diff1) == 0 && length(diff2) == 0
        fprintf("Answer is correct.\n");
    else
        if length(diff1) > 0
            fprintf("Your answer erroneously includes: ");
            printA(diff1);
        end
        if length(diff2) > 0
            fprintf("Your answer is missing: ");
            printA(diff2);
        end
    end

end

function printA(aa)
    for a = aa 
        fprintf("%d\t", a)
    end
    fprintf("\n");
end



