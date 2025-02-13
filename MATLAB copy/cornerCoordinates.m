% SID: 862480118
% Kincade-Bennett, Elijah
% ME18A Assignment 4
% Feb 7, 2025

function [x_output, y_output] = cornerCoordinates(coordA, coordB, cornerIndices)

     if length(coordA) < 3 || length(coordB) < 3 || length(coordA) ~= length(coordB) || length(cornerIndices) < 2
        fprintf(2, 'Error: Invalid input in cornerCoordinates function.\n');
        x_output = [];
        y_output = [];
        return;
     end
     for i=1:length(cornerIndices)
         if cornerIndices(i) < 1 || cornerIndices(i) > length(coordA)
            fprintf(2, 'Error: cornerIndex out of bounds in cornerCoordinates function.\n');
             x_output = [];
             y_output = [];
            return;
         end
     end

    x_output = zeros(1, length(cornerIndices));
    y_output = zeros(1, length(cornerIndices));

    
    for i = 1:length(cornerIndices)
        x_output(i) = coordA(cornerIndices(i));
        y_output(i) = coordB(cornerIndices(i));
    end
end