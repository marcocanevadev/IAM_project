function [corr, err]  = recrate(len, fynd, label )
correct = find(label(1:len)==fynd);
corr = length(correct) / length(label) *100;
err =  (length(label) - length(correct)) / length(label) * 100;