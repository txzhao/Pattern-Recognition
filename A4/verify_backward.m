clear;

% finite-duration test
q = [1; 0];
A = [0.9 0.1 0; 0 0.9 0.1];
x = [-0.2 2.6 1.3];
B1 = GaussD('Mean', 0, 'StDev', 1);
B2 = GaussD('Mean', 3, 'StDev', 2);

mc = MarkovChain(q, A);
pX = prob([B1 B2], x);
c = [1 0.1625 0.8266 0.0581];

disp('--------- finite-duration test ----------');
betaHat = backward(mc, pX, c)


% infinite-duration test
q = [1; 0];
A = [0.9 0.1; 0.1 0.9];
x = [-0.2 2.6 1.3];
B1 = GaussD('Mean', 0, 'StDev', 1);
B2 = GaussD('Mean', 3, 'StDev', 2);
pX = prob([B1 B2], x);

% compute scaled factors with forward algorithm
mc = MarkovChain(q, A);
[~, c] = forward(mc, pX);

disp('--------- infinite-duration test ----------');
betaHat = backward(mc, pX, c)