%   ---- Add Noise and perform Spectral Subtraction----



[nn, nfs] = audioread('\data\babble.wav');

la = noise('\data\A_mysongs\test\', 'wav' , nn, 5, [pwd '\data\noise_files\A\'] );
lb = noise('\data\B_electronic\test\', 'mp3' , nn, 5, [pwd '\data\noise_files\B\'] );
lc = noise('\data\C_rap\test\', 'mp3' , nn, 5, [pwd '\data\noise_files\C\']);

for i = 1: length(la)
    fname = la(i).name(1:end-4);
    specname =  [ [pwd '\data\noise_spec_files\A\'], 'reconstructed_', fname, '.wav' ];
    infile = [ [pwd '\data\noise_files\A\'],'noisy_', fname, '_5SNR.wav'];
    specsub(infile,[pwd '\data\noise_spec_files\A\reconstructed_', fname,'_.wav'])
end

for i = 1: length(lb)
    fname = lb(i).name(1:end-4);
    specname =  [ [pwd '\data\noise_spec_files\B\'], 'reconstructed_', fname, '.wav' ];
    infile = [ [pwd '\data\noise_files\B\'],'noisy_', fname, '_5SNR.wav'];
    specsub(infile,[pwd '\data\noise_spec_files\B\reconstructed_', fname,'_.wav'])
end
for i = 1: length(lc)
    fname = lc(i).name(1:end-4);
    specname =  [ [pwd '\data\noise_spec_files\C\'], 'reconstructed_', fname, '.wav' ];
    infile = [ [pwd '\data\noise_files\C\'],'noisy_', fname, '_5SNR.wav'];
    specsub(infile,[pwd '\data\noise_spec_files\C\reconstructed_', fname,'_.wav'])
end
