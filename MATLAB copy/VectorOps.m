function [status,result] = VectorOps(op,a1,a2)
%VECTOROPS performs various vector operations using loops
%   status: 1 if successful, 0 if unsuccessful

status = 0;
result = 0;

%Check if inputs are row vectors using size
if size(a1,1) ~= 1 || size(a2,1) ~= 1
    return;
end

%Check if dimensions are compatible
if length(a1) ~= length(a2) && op ~=4
    return;
end

switch op
    case 1 % a1 + a2
        result = zeros(1,length(a1));
        for i = 1:length(a1)
            result(i) = a1(i) + a2(i);
        end
        status = 1;
    case 2 % a1 - a2
         result = zeros(1,length(a1));
            for i = 1:length(a1)
                result(i) = a1(i) - a2(i);
            end
            status = 1;
     case 3 % dot product of a1 and a2
         result = 0;
            for i = 1:length(a1)
                result = result + a1(i) * a2(i);
            end
            status = 1;
    case 4 % cross product of a1 and a2 (only for vectors of length 3)
         if length(a1) ~= 3
            return
         end
         result = zeros(1,3);
         result(1) = a1(2) * a2(3) - a1(3) * a2(2);
         result(2) = a1(3) * a2(1) - a1(1) * a2(3);  
         result(3) = a1(1) * a2(2) - a1(2) * a2(1);
         status = 1;
     otherwise
        return;
end
end
