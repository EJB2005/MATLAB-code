% SID: 862480118
% Kincade-Bennett, Elijah
% ME18A Assignment 4
% Feb 7, 2025

function u = smooth(v)


    if length(v) < 3
        fprintf(2, 'Error: Input array must contain at least 3 points in smooth function.\n');
        u = [];
        return;
    end
   
    n = length(v);
    u = zeros(1,n);
    u(1) = v(1);
    u(n) = v(n);

    for i = 2:n-1
        u(i) = 0.2 * v(i-1) + 0.6 * v(i) + 0.2 * v(i+1);
    end
end
