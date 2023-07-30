%   ---- Extract Features ---- 

win = [0.010, 0.030, 0.040];
for i = 1: length(win)
    addpath(genpath(pwd))
    winlen = win(i);
    stplen = winlen/3*2;

    %---- Extraction Train data ----
    [A_train_chroma, A_train_mfccs] = chroma_mfcc_from_path('\data\A_mysongs\train\','wav',winlen,stplen);
    [B_train_chroma, B_train_mfccs] = chroma_mfcc_from_path('\data\B_electronic\train\','mp3',winlen,stplen);
    [C_train_chroma, C_train_mfccs] = chroma_mfcc_from_path('\data\C_rap\train\','mp3',winlen,stplen);

    %---- Extraction Test data ----
    [A_test_chroma, A_test_mfccs] = chroma_mfcc_from_path('\data\A_mysongs\test\','wav',winlen,stplen);
    [B_test_chroma, B_test_mfccs] = chroma_mfcc_from_path('\data\B_electronic\test\','mp3',winlen,stplen);
    [C_test_chroma, C_test_mfccs] = chroma_mfcc_from_path('\data\C_rap\test\','mp3',winlen,stplen);
    
    path = strcat(pwd, '\data\analyzed\analyzed_dataset_',mat2str(winlen*1000),'ms');
    save( path,'A_train_mfccs','A_train_chroma','B_train_mfccs','B_train_chroma','C_train_mfccs','C_train_chroma','A_test_mfccs','A_test_chroma','B_test_mfccs','B_test_chroma','C_test_mfccs','C_test_chroma');
end