%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ME018A -- Test Stub
% V2
% Run this script to test the smooth.m function
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


function_name = "smooth.m";
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

runCase(function_name, 1, ref_v, ref_u);
runCase(function_name, 2, ref_u, ref_vs);
runCase(function_name, 3, [1 2], []);

function runCase(function_name, exnum, v, true_vs)
    fprintf("\nTest Case %d\n", exnum);
    fprintf("Length of input array: %d\n",length(v));
 
    try
        [vs] = smooth(v);
    catch
        fprintf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        fprintf("Your function <%s> failed to run.\n", function_name)
        fprintf("Look at the following messages to see what is wrong with it.\n")
        fprintf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n");
        % after printing the error message, let the function crash
        [vs] = smooth(v);
    end
 
    checkArray("Vsmoothed", vs, true_vs);
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


