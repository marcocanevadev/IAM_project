% ---- Plot results ----
% 
k = [1, 3, 5, 10,40,70,110, 150, 250];

figure(3)
plot(k,rate_1,'Color','red')
hold on
stem(k,rate_1,'--diamondr')

plot(k,rate_2,'Color','green')
hold on
stem(k,rate_2,'--diamondg')

plot(k,rate_3,'Color','blue')
hold on
stem(k,rate_3,'--diamondb')

xlabel('k')
xticks(k)
ylim([30,50])
ylabel('recognition rate')
legend('chroma','','mfccs','','all')
title('kNN recog rate comparison')


figure(4)
s = sum(score_1);
score_1(1)= (score_1(1)*100)/s;
score_1(2)= (score_1(2)*100)/s;
score_1(3)= (score_1(3)*100)/s;
s = sum(score_2);
score_2(1)= (score_2(1)*100)/s;
score_2(2)= (score_2(2)*100)/s;
score_2(3)= (score_2(3)*100)/s;
s = sum(score_3);
score_3(1)= (score_3(1)*100)/s;
score_3(2)= (score_3(2)*100)/s;
score_3(3)= (score_3(3)*100)/s;


subplot(3, 1, 1)
bar1 = bar(score_1, 'FaceColor','flat');
bar1.CData(1,:)=[0.4940 0.1840 0.5560];
bar1.CData(2,:)=[0.4660 0.6740 0.1880];
bar1.CData(3,:)=[0.9290 0.6940 0.1250];


bxtips1 = bar1(1).XEndPoints;
bytips1 = bar1(1).YEndPoints;
blabels1 = string(bar1(1).YData);
text(bxtips1,bytips1,blabels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
xlim([0,4])
xticks([1,2,3])
subtitle('Chroma')
ylabel('percentage')
ylim([0,65])
xticklabels({'mysongs','electronic','rap'})
title('Overall recognition rate by category')

subplot(3, 1, 2)
bar2 = bar(score_2,'FaceColor','flat');

bar2.CData(1,:)=[0.4940 0.1840 0.5560];
bar2.CData(2,:)=[0.4660 0.6740 0.1880];
bar2.CData(3,:)=[0.9290 0.6940 0.1250];
bxtips2 = bar2(1).XEndPoints;
bytips2 = bar2(1).YEndPoints;
blabels2 = string(bar2(1).YData);
text(bxtips2,bytips2,blabels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
xlim([0,4])
xticks([1,2,3])
subtitle('MFCCs')
ylabel('percentage')
ylim([0,65])
xticklabels({'mysongs','electronic','rap'})

subplot(3, 1, 3)
bar3 = bar(score_3,'FaceColor','flat');

bar3.CData(1,:)=[0.4940 0.1840 0.5560];
bar3.CData(2,:)=[0.4660 0.6740 0.1880];
bar3.CData(3,:)=[0.9290 0.6940 0.1250];
bxtips3 = bar3(1).XEndPoints;
bytips3 = bar3(1).YEndPoints;
blabels3 = string(bar3(1).YData);
text(bxtips3,bytips3,blabels3,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
xlim([0,4])
xticks([1,2,3])
subtitle('All')
ylabel('percentage')
ylim([0,65])
xticklabels({'mysongs','electronic','rap'})


