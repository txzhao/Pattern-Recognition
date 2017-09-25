clear;

%% build up HMM sources
para = testCasePara('same-mean HMM');
mc = MarkovChain(para.q, para.A);
h = HMM(mc, [para.b1; para.b2]);

%% verify MarkovChain rand method
T = 10000; 
n_trial = 3;
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
n_trial = 5;
Mu = zeros(length(para.b1.Mean), 1);
Var = zeros(length(para.b1.Mean), 1);

% run repeatedly and average mean and variance
for n = 1 : n_trial
    [X, ~] = rand(h, nSamples);
    mu = mean(X, 2);
    va = var(X, 0, 2);
    Mu = Mu + mu;
    Var = Var + va;
end

% output results
disp(['------- verify HMM rand method with ' num2str(n_trial) ' trials-------']);
disp(['Average mean of Xt: ', num2str(mu')]);
disp(['Average var of Xt: ', num2str(va')]);
fprintf('\r');


%% HMM impression
nSamples = 500;
[X, S] = rand(h, nSamples);

% view results
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

%% verify finite HMM
nSamples = 500;
n_trial = 2000;
max_steps = 10;
S_len_prob = zeros(1, nSamples);

% calculate exiting probabilities after different steps
for n = 1 : n_trial
    [X, S] = rand(h, nSamples);
    S_len_prob(length(S)) = S_len_prob(length(S)) + 1;
end
S_len_prob = S_len_prob/n_trial; 

% output results
disp('------- verify finite HMM -------');
for i = 1 : max_steps
    disp(['Prob of sequence length = ' num2str(i) ': ' num2str(S_len_prob(i))]);
end

