%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ME018A -- LAB02 -- Test Stub
%
% Run this script to test the tankVolume.m function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;

function_name = "tankVolume.m";
nInArgs = 5;
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

runCase(function_name, 1, 1,1,2,2,1, 3.1416);
runCase(function_name, 2, 1,1,2,2,3.1, -1);
runCase(function_name, 3, 1,1,2,2,3, 17.8024);
runCase(function_name, 4, 1,1,2,2,2.5, 12.2718);
runCase(function_name, 5, 1,1,2,2,1.5, 5.1378);
runCase(function_name, 6, 1,1,2,2,-1, -1);
runCase(function_name, 7, 1,-1,2,2,1.5, -1);



function runCase(function_name, exnum, ra,ha,rb,hb,h, trueV)
    fprintf("\nTest Case %d\n", exnum);
    fprintf("Cylinder Radius = %.2f \nCylinder Height = %.2f\nFrustrum Max Radius" + ...
        " = %.2f\nFrustrum Height = %.2f\nWater Height = %.2f\n",ra,ha,rb,hb,h);
    try
        V = tankVolume(ra,ha,rb,hb,h);
    catch
        error(function_name + " failed to run")
    end
    
    fprintf("Your answer: %f\n", V);
    fprintf("Correct answer: %f\n", trueV)
    
    if tsEqual(V, trueV)
        fprintf("Your answer is correct\n");
    else
        fprintf("*** Your answer is INCORRECT ***\n");
    end

end

function res = tsEqual(a, b)
    res = (abs(a - b) < 1e-4);
end