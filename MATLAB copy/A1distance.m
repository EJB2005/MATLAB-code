%SID:862480118
%Kincade-Bennett,Elijah

%ME18A Assignment Lab 1
%January 16, 2025

clear;
clc;

x1 = input("What is x1? ");
x2 = input("What is x2? ");
y1 = input("What is y1? ");
y2 = input("What is y2? ");
z1 = input("What is z1? ");
z2 = input("What is z2? ");

d = (sqrt(x1-x2)^2+(y1-y2)^2+(z1-z2)^2) ;

fprintf("The distance between x1=%f,x2=%f,y1=%f,y2=%f,z1=%f,z2=%f in a three dimensional coordinate system is d=%f", x1,y1,x2,y2,z1,z2,d);