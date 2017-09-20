clear;

%% build up HMM sources
para = testCasePara('regular HMM');
mc = MarkovChain(para.q, para.A);
h = HMM(mc, [para.b1; para.b2]);

%% verify MarkovChain rand method
T = 10000;
S = rand(mc, T); 
f_S = zeros(1, length(para.q));

% calculate relative frequency of occurrences
disp('------- verify MarkovChain rand method -------');
for i = 1 : length(para.q)
    f_S(i) = sum(S == i)/length(S);
    disp(['Freq of St = ', num2str(i), ': ', num2str(f_S(i))]);
end
fprintf('\r');

%% verify HMM rand method 
nSamples = 10000;
[X, ~] = rand(h, nSamples);
mu = mean(X);
va = var(X);
disp('------- verify HMM rand method -------');
disp(['Mean of Xt: ', num2str(mu)]);
disp(['Var of Xt: ', num2str(va)]);
fprintf('\r');

%% HMM impression
nSamples = 500;
[X, S] = rand(h, nSamples);
subplot(2, 1, 1);
plot(1:length(S), S);
title('Plot of state St with respect to time step t')
xlabel('t')
ylabel('St')
subplot(2, 1, 2);
plot(1:length(X), X);
title('Plot of contiguous samples Xt with respect to time step t')
xlabel('t')
ylabel('Xt')




