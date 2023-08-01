
addpath(genpath(pwd))
data = dir([pwd,'\data\data_analyzed\','*.','mat' ]);

for i = 5:length(data)
    

    load(data(i).name)

    %---- Matrix Concatenation ----

    gr_1_train = [A_train_chroma B_train_chroma C_train_chroma];
    gr_2_train = [A_train_mfccs B_train_mfccs C_train_mfccs];

    zz_1 = [A_train_chroma;A_train_mfccs];
    zz_2 = [B_train_chroma;B_train_mfccs];
    zz_3 = [C_train_chroma;C_train_mfccs];
    gr_3_train = [zz_1 zz_2 zz_3];


    gr_1_test = [A_test_chroma B_test_chroma C_test_chroma];
    gr_2_test = [A_test_mfccs B_test_mfccs C_test_mfccs];

    zzz_1 = [A_test_chroma;A_test_mfccs];
    zzz_2 = [B_test_chroma;B_test_mfccs];
    zzz_3 = [C_test_chroma;C_test_mfccs];
    gr_3_test = [zzz_1 zzz_2 zzz_3];

    %---- Ground Truth Flags ----

    za_1 = zeros(1,length(A_test_chroma));
    zb_1 = ones(1,length(B_test_chroma));
    zc_1 = repmat(2,1,length(C_test_chroma));

    gr_1_flag = [za_1 zb_1 zc_1];
    gr_2_flag = gr_1_flag;
    gr_3_flag = gr_1_flag;

    %---- Train Labels ----

    za_2 = zeros(1,length(A_train_chroma));
    zb_2 = ones(1,length(B_train_chroma));
    zc_2 = repmat(2,1,length(C_train_chroma));

    gr_1_label = [za_2 zb_2 zc_2];
    gr_2_label = gr_1_label;
    gr_3_label = gr_1_label;

    %---- kNN classification ----
    gr_1_test = normalize(gr_1_test);
    gr_2_test = normalize(gr_2_test);
    gr_3_test = normalize(gr_3_test);

    gr_1_train = normalize(gr_1_train);
    gr_2_train = normalize(gr_2_train);
    gr_3_train = normalize(gr_3_train);

    gr_1_train = gr_1_train';
    gr_2_train = gr_2_train';
    gr_3_train = gr_3_train';

    gr_1_test = gr_1_test';
    gr_2_test = gr_2_test';
    gr_3_test = gr_3_test';

    k = [1, 3, 5, 10,40,70,110, 150, 250];
    disp('Setting up kNN for group 1');
    [pred_1, rate_1, score_1] = kNN(k, gr_1_train, gr_1_label, gr_1_test, gr_1_flag);
    disp('Setting up kNN for group 2');
    [pred_2, rate_2, score_2] = kNN(k, gr_2_train, gr_2_label, gr_2_test, gr_2_flag);
    disp('Setting up kNN for group 3');
    [pred_3, rate_3, score_3] = kNN(k, gr_3_train, gr_3_label, gr_3_test, gr_3_flag);
    path = strcat(pwd, '\data\results\', data(i).name);
    save(path, 'pred_1', 'rate_1', 'score_1', 'pred_2', 'rate_2', 'score_2', 'pred_3', 'rate_3', 'score_3')
    
end
