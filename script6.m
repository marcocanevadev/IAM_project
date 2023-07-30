%   ---- Plot confusion matrix ----

%   ---- kNN 1, 2 and 3 ----
figure(1)
sgtitle('kNN 1, 2 and 3')
subplot(2, 2, 1)
C1 = confusionmat(gr_1_flag, predicted_label_1);
cm1 = confusionchart(C1, {'MySongs'  'Electronic' 'Rap'},'OffDiagonalColor', "#7E2F8E", 'Title', ['Chroma    k = ',mat2str(k(b1))],'Normalization','column-normalized');
subplot(2,2,2)
C2 = confusionmat(gr_2_flag, predicted_label_2);
cm2 = confusionchart(C2, {'MySongs'  'Electronic' 'Rap'},'OffDiagonalColor', "#7E2F8E", 'Title', ['MFCCs     k = ' mat2str(k(b2))],'Normalization', 'column-normalized');
subplot(2,2,3)
C3 = confusionmat(gr_3_flag, predicted_label_3);
cm3 = confusionchart(C3, {'MySongs'  'Electronic' 'Rap'}, 'OffDiagonalColor', "#7E2F8E",'Title', ['All       k = ' mat2str(k(b3))],'Normalization','column-normalized');
subplot(2,2,4)

X = categorical({'CHROMA','MFCCS','ALL'});
c = bar(X, rates,'FaceColor','flat');
[~,indexbest] = max(rates);
c.CData(indexbest+1,:)=[0.4940 0.1840 0.5560];
xtips1 = c(1).XEndPoints;
ytips1 = c(1).YEndPoints;
labels1 = string(c(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
title('Rates')
ylim([0,65])
%   ---- Best kNN on noisy and reconstructed ----

figure(2)
sgtitle(['BEST kNN: Chroma (k = ', mat2str(k(b1)),')'])
subplot(2,2,1)
cm4 = confusionchart(C1, {'MySongs'  'Electronic' 'Rap'},'OffDiagonalColor', "#7E2F8E", 'Title', 'Clean','Normalization','column-normalized');

subplot(2,2,2)
C5 = confusionmat(best_dirty_truth, predicted_label_best_1);
cm5 = confusionchart(C5, {'MySongs'  'Electronic' 'Rap'},'OffDiagonalColor', "#7E2F8E", 'Title', 'Noisy' ,'Normalization','column-normalized');

subplot(2,2,3)

C6 = confusionmat(best_rec_truth, predicted_label_best_2);
cm6 = confusionchart(C6, {'MySongs'  'Electronic' 'Rap'},'OffDiagonalColor', "#7E2F8E",'Title', 'Reconstructed' ,'Normalization','column-normalized');

subplot(2, 2, 4)
X2 = categorical({'Clean' 'Noisy' 'Reconstructed'});
ratescat = [max(rates) rates_best];

[~, indexbest2] = max(ratescat);

c2 = bar(X2, ratescat, 'FaceColor','flat');
ylim([0,65])
xtips2 = c2(1).XEndPoints;
ytips2 = c2(1).YEndPoints;
labels2 = string(c2(1).YData);
c2.CData(indexbest2,:)=[0.4940 0.1840 0.5560];
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
title('Rates')
