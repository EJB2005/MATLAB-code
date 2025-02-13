%SID:862480118
%Kincade-Bennett,Elijah

%ME18A AssignmentLab 1
%January 16, 2025

clear;
clc;

h = input("What is the height of the cone? ");
r = input("What is the radius of the cone? ");

v = (1/3)*(pi*(r^2))* h;

fprintf("A right circular triangular cone with a radius=%.2f cm and height=%.2f cm, has a volume=%.2f cc.",r,h,v)
