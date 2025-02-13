% SID: 862480118
% Kincade-Bennett, Elijah
% ME18A Assignment 4
% Feb 7, 2025

function corners = findCorners(u)

if length(u) < 3
       fprintf(2, 'Error: Input array must contain at least 3 points in findCorners function.\n');
        corners = [];
        return;
    end

    corners = [];

    corners = [corners, 1];

    for i = 2:length(u)-1
        if (u(i) < u(i-1)) && (u(i) < u(i+1)) && (u(i) < 0.02)
            corners = [corners, i];
        end
    end

    corners = [corners, length(u)];
end