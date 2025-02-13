% SID: 862480118
% Kincade-Bennett, Elijah

% ME18A Assignment 1
% Jan 13, 2025

function [getNeighbors]=getNeighbors(m,n,r)
    getNeighbors=[];

if ceil(m)~=floor(m)|| m<2
    getNeighbors=[];
    return
end


if ceil(n)~=floor(n)|| n<2
    getNeighbors=[];
    return
end

if ceil(r)~=floor(r)|| r<1 || r>=m*n
    getNeighbors=[];
    return
end

top_left = r-n-1;
top_middle = r-n;
top_right = r-n+1;
middle_left = r-1;
middle_right = r+1;
bottom_left = r+n-1;
bottom_middle = r+n;
bottom_right = r+n+1;

if r<=n
    top_left=0;
    top_middle=0;
    top_right=0; 
end


if mod(r,n)==1
    top_left=0;
    middle_left=0;
    bottom_left=0; 
end


if mod(r,n)==0
    top_right=0;
    middle_right=0;
    bottom_right=0; 
end


if r>=(m-1)*n
    bottom_left=0;
    bottom_middle=0;
    bottom_right=0; 
end

getNeighbors=[];

if top_left~=0
    getNeighbors(end+1)=top_left;
end

if top_middle~=0
    getNeighbors(end+1)=top_middle;
end

if top_right~=0
    getNeighbors(end+1)=top_right;
end

if middle_left~=0
    getNeighbors(end+1)=middle_left;
end

if middle_right~=0
    getNeighbors(end+1)=middle_right;
end

if bottom_left~=0
    getNeighbors(end+1)=bottom_left;
end

if bottom_middle~=0
    getNeighbors(end+1)=bottom_middle;
end

if bottom_right~=0
    getNeighbors(end+1)=bottom_right;
end
