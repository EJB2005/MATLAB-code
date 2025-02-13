% SID: 862480118
% Kincade-Bennett, Elijah

% ME18A Assignment 1
% Jan 13, 2025

function [Cd] = coef_drag(Re)
    % insert your code betweem the "=" and the ";" on the line below
    Cd = (24/Re) + ((2.6*(Re/5.0))/(1+((Re/5.0)^1.52)))+((0.411*((Re/2.63e5)^-7.94))/(1+((Re/2.63e5)^-8.00)))+((0.25*(Re/10^6)))/(1+(Re/10^6));