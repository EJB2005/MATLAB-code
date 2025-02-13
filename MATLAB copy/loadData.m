function [penX,penY] = loadData(filename)
%LOADDATA reads pen stroke data from a file
%The fule is assumed to contain x an y coordinates,
%with each coordinate pair on a separate line

try
    fileID = fopen(filename, 'r');

    if fileID == -1
        error('Could not open the file.');
    end

    penX = [];
    penY = [];

    while ~feof(fileID)
        line = fgetl(fileID);
        if isempty(line)
            continue;
        end

        values = strsplit(line);
    if length(values) == 2
            penX = [penX, str2double(values{1})];
            penY = [penY, str2double(values{2})];
        else
            fclose(fileID);
            error('Invalid data format in file. Each line should contain two numbers.');
    end
    
    end

    fclose(fileID);
   
    catch ME
        disp(['Error loading data: ', ME.message]);
        penX = [];
        penY = [];
end
