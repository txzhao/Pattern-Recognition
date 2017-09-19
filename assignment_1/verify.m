clear all;

% build up HMM sources
q = [0.75; 0.25];
A = [0.99 0.01; 0.03 0.97];
mc = MarkovChain(q, A);
b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2); 
h = HMM(mc, [b1; b2]);

% generate an output sequence of observation
[X, S] = rand(h, 10000); 
f_S = zeros(1, length(q));

% calculate relative frequency of occurrences
for i = 1 : length(q)
    f_S(i) = sum(S == i)/length(S);
    disp(['Freq of St = ', num2str(i), ': ', num2str(f_S(i))]);
end
