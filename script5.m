%   ---- best kNN for each group ----
k = [1, 3, 5, 10,40,70,110, 150, 250];

%   ---- gr 1 ----
[~, b1] = max(rate_1);
disp('Setting up best kNN for group 1...');
Md1 = fitcknn(gr_1_train,gr_1_label,'NumNeighbors',k(b1));
predicted_label_1 = predict(Md1, gr_1_test);

%   ---- gr 2 ----
[~, b2] = max(rate_2);
disp('Setting up best kNN for group 2...');
Md2 = fitcknn(gr_2_train,gr_2_label,'NumNeighbors',k(b2));
predicted_label_2 = predict(Md2, gr_2_test);

%   ---- gr 3 ----
[~, b3] = max(rate_3);
disp('Setting up best kNN for group 3...');
Md3 = fitcknn(gr_3_train,gr_3_label,'NumNeighbors',k(b3));
predicted_label_3 = predict(Md3, gr_3_test);



rates= zeros(1,3);
correct= 0;
for i = 1:length(predicted_label_1)
    waitbar(i/length(predicted_label_1))
    if predicted_label_1(i) == gr_1_flag(i)
        correct = correct +1;
    end
end
rates(1) = correct/length(predicted_label_1)*100;
correct= 0;
for i = 1:length(predicted_label_2)
    waitbar(i/length(predicted_label_2))
    if predicted_label_2(i) == gr_2_flag(i)
        correct = correct +1;
    end
end
rates(2) = correct/length(predicted_label_2)*100;

correct= 0;
for i = 1:length(predicted_label_3)
    waitbar(i/length(predicted_label_3))
    if predicted_label_3(i) == gr_3_flag(i)
        correct = correct +1;
    end
end
rates(3) = correct/length(predicted_label_3)*100;


[~, M] = max(rates);
if M == 1
    disp('1 is best')
    bestMd = Md1;
    bestlab = predicted_label_1;
end
if M == 2
    disp('2 is best')
    bestMd = Md2;
    bestlab = predicted_label_2;
end
if M == 3
    disp('3 is best')
    bestMd = Md3;
    bestlab = predicted_label_3;
end

save([pwd '\data\bestMd'],'bestMd')

%{
[corr_my_1, err_my_1] = recrate(length(A_train_chroma),1,predicted_label_1);
[corr_el_1, err_el_1] = recrate(length(B_train_chroma),2,predicted_label_1);
[corr_ra_1, err_ra_1] = recrate(length(C_train_chroma),3,predicted_label_1);
confusion_matrix(1, 1) = corr_my_1;
confusion_matrix(1, 2) = err_my_1;
confusion_matrix(2, 1) = corr_el_1;
confusion_matrix(2, 2) = err_el_1;
confusion_matrix(3, 1) = corr_ra_1;
confusion_matrix(3, 3) = err_ra_1;
confusion_matrix
%}
