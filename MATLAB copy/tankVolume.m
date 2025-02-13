% SID: 862480118
% Kincade-Bennett, Elijah

% ME18A Assignment 1
% Jan 13, 2025

function [tankVolume] = tankVolume(ra,ha,rb,hb,h)
if ra < 0||ha<0||rb<0||hb<0||h<0
       tankVolume = -1; 
    
    elseif h<=ha && h>0
        tankVolume = pi*ra^2*h;

    elseif h>ha && h<=ha+hb
        rw=ra+(h-ha)*(rb-ra)/hb;
        tankVolume=(pi*(ra^2)*ha)+(1/3)*pi*(h-ha)*(ra^2+ra*rw+rw^2);

end