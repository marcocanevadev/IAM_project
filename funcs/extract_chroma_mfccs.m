function [chroma, mfccs] = extract_chroma_mfccs(filename, winlen, steplen)

[y, fs] = audioread(filename);

if size(y,2)==2
    y = sum(y,2)/2; 
end

[M,nf] = finestrare(y, floor(winlen*fs), floor(steplen*fs));


h = hamming(floor(winlen*fs));

chroma = zeros(12, nf);
mfccs = zeros(13, nf);

params = feature_mfccs_init(winlen*fs, fs);


for i = 1:nf
    frame = M(:,i);
    frame = frame .* h;
    frameFFT = getDFT(frame, fs);
    mfccs(1:13,i) = feature_mfccs(frameFFT, params);
    chroma(1:12,i) = feature_chroma_vector(frameFFT, fs);
end
