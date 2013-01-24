clear all

%Add library paths
addpath ./lib/cqt_toolbox
addpath ./data/
folders = {'blues'; 'classical'; 'country'; 'disco'; 'hiphop'; 'jazz'; 'metal'; 'pop'; 'reggae'; 'rock'};

for i=1:10
    dat = [];
    folderName = char(folders(i));
    for j=1:10
        path = strcat('data/genres/',folderName ,'/',folderName ,'.',sprintf('%05d',i), '.au');
        %% Read in the sound data
        [Y,Fs,BITS] = auread(path);
        %%Compute spectrum
        windowSize = 1024;
        overlap = windowSize/2;
        %(x,window,noverlap,nfft,fs)
        [S,F,T,P] = spectrogram(Y,hann(windowSize), overlap, windowSize, Fs);
        dat = vertcat(dat, P);
    end
    %write genre data to file
    filename = strcat('./data/genres/',folderName ,'_data');
    save(filename, 'dat');
    
end