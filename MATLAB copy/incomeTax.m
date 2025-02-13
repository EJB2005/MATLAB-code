% SID: 862480118
% Kincade-Bennett, Elijah

% ME18A Assignment 1
% Jan 13, 2025

function [incomeTax] = incomeTax(x)
if x<0
    incomeTax=-1;

elseif x<=9950
    incomeTax=x*.10;

elseif x<=40525
    incomeTax=995+(x-9950)*.12;

elseif x<=86375
    incomeTax=4664+(x-40525)*.22;

elseif x<=164925
    incomeTax=14751+.24*(x-86375);

elseif x<=209425
    incomeTax=33603+.32*(x-164925);

elseif x<=523600
    incomeTax=47843+.35*(x-209425);

else
    incomeTax=157804.25+.37*(x-523600);

end