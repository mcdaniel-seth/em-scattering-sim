function [freq, Einc] = readfromcsv(filename)

    data = readcell(filename);
    % assuming top row is freq ?
    freq = cell2mat(data(1,1:end-1)); % place top row into an array

    wavedata = data(2:end,1:end-1);  % ignore top row and last column
    Einc = zeros(size(wavedata));

    for i = 1:size(wavedata,1)
        for j = 1:size(wavedata,2)
            Einc(i,j) = str2num(wavedata{i,j}); 
        end
    end