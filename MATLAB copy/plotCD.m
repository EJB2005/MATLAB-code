% SID: 862480118
% Kincade-Bennett, Elijah

% ME18A Assignment Lab 1
% January 16, 2025

close all;

Re = logspace(-2,6,200);

Cd = arrayfun(@coef_drag, Re);

loglog(Re,Cd);