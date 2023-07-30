%   ---- Train and test kNN ---
%   with three groups and for various k. 

k = [1, 3, 5, 10,40,70,110, 150, 250];

addpath(genpath(pwd))

%   ---- Normalize and Cat ----

script2

%   ---- kNN ----

disp('Setting up kNN for group 1...');
[pred_1, rate_1, score_1] = kNN(k, gr_1_train, gr_1_label, gr_1_test, gr_1_flag);
disp('Setting up kNN for group 2...');
[pred_2, rate_2, score_2] = kNN(k, gr_2_train, gr_2_label, gr_2_test, gr_2_flag);
disp('Setting up kNN for group 3...');
[pred_3, rate_3, score_3] = kNN(k, gr_3_train, gr_3_label, gr_3_test, gr_3_flag);


%       ---- Uncomment to save data ----

%path = strcat(pwd, '\data\results\analyzed_dataset_xxms');

%save(path, 'pred_1', 'rate_1', 'score_1', 'pred_2', 'rate_2', 'score_2', 'pred_3', 'rate_3', 'score_3');
