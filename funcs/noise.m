function list = noise(path, extension, noise, SNR, dest)
addpath(genpath(pwd))

list = dir([pwd,path,'*.',extension]);

disp(['extracting: ',path, mat2str(length(list))])

for i = 1:length(list)
    nn = noise;
    fname = list(i).name
    [y, fs] = audioread(fname);
    if size(y,2) ==2
        for i = 1: length(y)
            y(i,1)= (y(i,1)+y(i,2))/2;
        end
    end
    disp([length(y), length(nn)])
    index = floor(length(y) / length(nn));
    
    for i = 1:index
        nn = [nn;nn];
    end
    disp([length(y), length(nn)])

    noisy = sigmerge(y(:,1), nn(1:length(y)),SNR);
    
    name = [ dest, 'noisy_', fname(1:end-4), '_',mat2str(SNR) ,'SNR.wav' ];
 
    disp(['writing...' name])
    audiowrite(name,noisy, fs);
 
end
