%train kNN
function [pred_label, rate, score] = kNN(k, train, trainlab, test, testlab)
tic
rate = zeros(1, length(k));
score = zeros(1, 3);
for ks = 1:length(k)

    Md1 = fitcknn(train, trainlab,'NumNeighbors',k(ks));
    pred_label = predict(Md1,test);
    toc
    correct = 0;
    w = waitbar(length(pred_label));
    for i = 1:length(pred_label)
        waitbar(i/length(pred_label))
        if pred_label(i) == testlab(i)
            correct = correct +1;
            score(testlab(i)+1) = score(testlab(i)+1)+1;
        end
    end
    toc
    disp(['rec rate at ', mat2str(k(ks)),' nn:'])
    rate(ks) = correct/length(pred_label)*100;
    disp(rate(ks))


end
[maxrate, ind]= max(rate);

disp(['maxrate: ',mat2str(maxrate)])
disp(['with ',mat2str(k(ind)),' nearest neighrbors.'])