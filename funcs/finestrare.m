function [M, nf] = finestrare(x, winlen, hoplen)

nf = floor(length(x)/hoplen);

M = repmat(zeros(floor(winlen),nf),1);
start  = 1;
%se andasse fino a nf-1?
for i = 1:nf-1
    M(:,i) = x(start:start+winlen-1);
    start = start + hoplen;
end
