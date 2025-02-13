% SID: 862480118
% Kincade-Bennett, Elijah
% ME18A Assignment 4
% Feb 7, 2025

function [s, v] = penMotion(penX, penY)
  
    if length(penX) ~= length(penY) || length(penX) < 3
       s = [];
       v = [];
       return;
    end

    n = length(penX);
    s = zeros(1, n);
    s(1) = 0; 
    for i = 2:n 
        s(i) = s(i-1) + sqrt((penX(i) - penX(i-1))^2 + (penY(i) - penY(i-1))^2);
    end

 
    v = zeros(1, n);
    v(1) = 0;  
    for i = 2:n 
        v(i) = s(i) - s(i-1);
    end
end
