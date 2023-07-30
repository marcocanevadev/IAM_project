function [chroma, mfccs,list] = chroma_mfcc_from_path(path, extension, winlen, steplen)
addpath(genpath(pwd))

list = dir([pwd,path,'*.',extension]);

disp(['extracting: ',path,'...'])
chroma = [];
mfccs = [];

for i = 1:length(list)
    [chr,mf] = extract_chroma_mfccs(list(i).name, winlen, steplen);
    chroma = [chroma chr];
    mfccs = [mfccs mf];
end
