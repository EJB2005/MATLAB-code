% SID: 862480118
% Kincade-Bennett, Elijah
% ME18A Assignment 4
% Feb 7, 2025

% Main script

filename = input("Enter the date file name: ", "s");

try
   [penX, penY] = loadData(filename);
catch
   disp("Error: Could not read the data file.");
   return;
end

[s, v] = penMotion(penX,penY);
if isempty(s) || isempty(v)
   disp("Error: penMotion returned an empty array.");
   return;
end

u = smooth(v);
if isempty(u)
    disp("Error: smooth returned an empty array.");
   return;
end

u2 = smooth(u);
if isempty(u2)
    disp("Error: smooth returned an empty array.");
   return;
end

cornerIndices = findCorners(u2);
if isempty(cornerIndices)
    disp("Error: findCorners returned an empty array.");
   return;
end

[cx, cy] = cornerCoordinates(penX,penY,cornerIndices);
if isempty(cx) || isempty(cy)
    disp("Error: cornerCoordinates returned an empty array.");
   return;
end
[cs, cuu] = cornerCoordinates(s,u2,cornerIndices);
if isempty(cs) || isempty(cuu)
    disp("Error: cornerCoordinates returned an empty array.");
   return;
end


figure(1);
plot(penX, penY);
hold on;
axis([0, 1, 0, 1]);
plot(cx,cy,'o');
title('Pen Stroke Shape');
xlabel("X-coordinate");
ylabel('Y-coordinate');
legend('Pen Stroke', 'Corners');
hold off;

figure(2);
plot(s, u2);
hold on;
plot(cs,cuu,'o');
title('Velocity Along Pen Stroke');
xlabel("Arc Length");
ylabel('Doubly Smoothed Speed');
legend('Smoothed Speed", "Corners');
hold off;

