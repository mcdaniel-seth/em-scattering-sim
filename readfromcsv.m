function [freq, Einc] = readfromcsv(filename)

    data = readcell(filename);
    % assuming top row is freq ?
    freq = cell2mat(data(1,1:end-1)); % place top row into an array

    wavedata = data(2:end,1:end-1);  % ignore top row and last column
    middlerow = ceil(size(wavedata,1)/2);

    Einc = zeros(1,size(wavedata,2));

    
    for j = 1:size(wavedata,2)
        Einc(1,j) = str2num(wavedata{middlerow,j}); 
    end
