function datanorm = normalize(data)

mn = mean(data);
stdev = std(data);
datanorm = (data - repmat(mn,size(data,1),1))./repmat(stdev,size(data,1),1);
  