% Tom Stahovich
% ME18A


function [x,y] = loadData(fn)
% loadData: Function to read pen stroke data from file
% input: name of csv file containing x and y-coordinates
% output array of x-coordinates adn array of y-coordinates

    x = [];
    y = [];
    
    try
        stroke = csvread(fn);
    catch
        error("loadData: Could not open file");
    end
    x = stroke(:,1);
    y = stroke(:,2);
end

    
    
    