clear;

%% build up HMM sources
para = testCasePara('regular HMM');
mc = MarkovChain(para.q, para.A);
h = HMM(mc, [para.b1; para.b2]);

%% verify MarkovChain rand method
T = 10000; 
n_trial = 10;
f_S = zeros(n_trial, length(para.q));

% calculate relative frequency of occurrences
for n = 1 : n_trial
    S = rand(mc, T);
    for i = 1 : length(para.q)
        f_S(n, i) = sum(S == i)/length(S);
    end
end

% output and view results
disp(['------- verify MarkovChain rand method with ' num2str(n_trial) ' trials -------']);
figure;
for i = 1 : length(para.q)
    disp(['Average freq of St = ', num2str(i), ': ', num2str(sum(f_S(:, i))/n_trial)]);
    subplot(2, 1, i)
    scatter(1 : n_trial, f_S(:, i));
    title(['Relative frequency of S = ' num2str(i) ' with respect to index of trials'])
    xlabel('Index of trials')
    ylabel('Relative frequency')
end

fprintf('\r');

%% verify HMM rand method 
nSamples = 10000;
[X, ~] = rand(h, nSamples);
mu = mean(X, 2);
va = var(X, 0, 2);
disp('------- verify HMM rand method -------');
disp(['Mean of Xt: ', num2str(mu')]);
disp(['Var of Xt: ', num2str(va')]);
fprintf('\r');


%% HMM impression
nSamples = 500;
[X, S] = rand(h, nSamples);
figure;
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

