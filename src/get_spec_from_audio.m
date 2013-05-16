function [ spec ] = get_spec_from_audio( file_path,prep)
%GET_SPEC_FROM_AUDIO Returns a spectrogram with normalized columns from an
%audio file at the location given as parameter.
%   Detailed explanation goes here
% @paran: prep = one of 'log' or 'norm', default norm

    %% Read in the sound data
    fprintf('Processing file %s \n',file_path);
    [Y,Fs,BITS] = auread(file_path);
    %%Compute spectrum
    windowSize = 1024;
    overlap = windowSize/2;
    %(x,window,noverlap,nfft,fs)
    [S,F,T,P] = spectrogram(Y,hann(windowSize), overlap, windowSize, Fs);
    
    
    if(prep = 'log')
    %create the log spectrogram.
        P = log(P);
    else 
    %normalize columns to l2-norm <= 1
        P = normc(P);
    end
    
   
    spec = P;

end

