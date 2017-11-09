clear;

%% finite-duration test
q = [1; 0];
A = [0.9 0.1 0; 0 0.9 0.1];
x = [-0.2 2.6 1.3];
B1 = GaussD('Mean', 0, 'StDev', 1);
B2 = GaussD('Mean', 3, 'StDev', 2);
pX = prob([B1 B2], x);

% compute scaled factors with forward algorithm
mc = MarkovChain(q, A);
disp('--------- finite-duration test ----------');
[alfaHat, c] = forward(mc, pX)

%% infinite-duration test
q = [1; 0];
A = [0.9 0.1; 0.1 0.9];
x = [-0.2 2.6 1.3];
B1 = GaussD('Mean', 0, 'StDev', 1);
B2 = GaussD('Mean', 3, 'StDev', 2);
pX = prob([B1 B2], x);

% compute scaled factors with forward algorithm
mc = MarkovChain(q, A);
disp('--------- infinite-duration test ----------');
[alfaHat, c] = forward(mc, pX)

%% verify log-prob
q = [1; 0];
A = [0.9 0.1 0; 0 0.9 0.1];
x = [-0.2 2.6 1.3];
B1 = GaussD('Mean', 0, 'StDev', 1);
B2 = GaussD('Mean', 3, 'StDev', 2);
pX = prob([B1 B2], x);

% create a HMM
mc = MarkovChain(q, A);
hmm = HMM(mc, [B1 B2]);

% print out log-prob
disp('--------- log-probability of X ----------');
logP = logprob(hmm, x)
