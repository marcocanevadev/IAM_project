%   ---- Test kNN on noisy and recovered files ----

winlen = 0.025;
stp = winlen/3 *2;
rates_best = zeros(1,2);

%   ---- Noisy ----

[A_best_dirty, ~] = chroma_mfcc_from_path('\data\noise_files\A\','wav',winlen,stp);
[B_best_dirty, ~] = chroma_mfcc_from_path('\data\noise_files\B\','wav',winlen,stp);
[C_best_dirty, ~] = chroma_mfcc_from_path('\data\noise_files\C\','wav',winlen,stp);

A_best_dirty_flag = zeros(1,length(A_best_dirty));
B_best_dirty_flag = ones(1, length(B_best_dirty));
C_best_dirty_flag = repmat(2,1,length(C_best_dirty));

best_dirty_truth = [A_best_dirty_flag B_best_dirty_flag C_best_dirty_flag];
best_dirty_test = [A_best_dirty B_best_dirty C_best_dirty];
best_dirty_test = normalize(best_dirty_test);
best_dirty_test = best_dirty_test';

predicted_label_best_1 = predict(bestMd, best_dirty_test);

correct = 0;
for i = 1:length(predicted_label_best_1)
    if predicted_label_best_1(i) == best_dirty_truth(i)
        correct = correct+1;
    end
end
rates_best(1) = correct/length(predicted_label_best_1)*100;



%   ---- Reconstructed ---- 

[A_best_rec, ~] = chroma_mfcc_from_path('\data\noise_spec_files\A\','wav',winlen,stp);
[B_best_rec, ~] = chroma_mfcc_from_path('\data\noise_spec_files\B\','wav',winlen,stp);
[C_best_rec, ~] = chroma_mfcc_from_path('\data\noise_spec_files\C\','wav',winlen,stp);

A_best_rec_flag = zeros(1,length(A_best_rec));
B_best_rec_flag = ones(1, length(B_best_rec));
C_best_rec_flag = repmat(2,1,length(C_best_rec));

best_rec_truth = [A_best_rec_flag B_best_rec_flag C_best_rec_flag];
best_rec_test = [A_best_rec B_best_rec C_best_rec];
best_rec_test = normalize(best_rec_test);
best_rec_test = best_rec_test';

predicted_label_best_2 = predict(bestMd, best_rec_test);

correcto = 0;
for i = 1:length(predicted_label_best_2)
    if predicted_label_best_2(i) == best_rec_truth(i)
        correcto = correcto+1;
    end
end
rates_best(2) = correcto/length(predicted_label_best_2)*100;

