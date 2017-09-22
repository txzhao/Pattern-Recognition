function para = testCasePara(test_name)

switch test_name
    case 'regular HMM'
        f1 = 'q';   q = [0.75; 0.25];
        f2 = 'A';   A = [0.99 0.01; 0.03 0.97];
        f3 = 'b1';  b1 = GaussD('Mean', 0, 'StDev', 1);
        f4 = 'b2';  b2 = GaussD('Mean', 3, 'StDev', 2);
    case 'same-mean HMM'
        f1 = 'q';   q = [0.75; 0.25];
        f2 = 'A';   A = [0.99 0.01; 0.03 0.97];
        f3 = 'b1';  b1 = GaussD('Mean', 0, 'StDev', 1);
        f4 = 'b2';  b2 = GaussD('Mean', 0, 'StDev', 2);
    case 'finite-duration HMM'
        f1 = 'q';   q = [0.75; 0.25];
        f2 = 'A';   A = [0.99 0.01 0.005; 0.03 0.97 0.002];
        f3 = 'b1';  b1 = GaussD('Mean', 0, 'StDev', 1);
        f4 = 'b2';  b2 = GaussD('Mean', 3, 'StDev', 2);
    case 'vector-output HMM'
        f1 = 'q';   q = [0.75; 0.25];
        f2 = 'A';   A = [0.99 0.01; 0.03 0.97];
        f3 = 'b1';  b1 = GaussD('Mean', [0; 0], 'Covariance', [2 1; 1 4]);
        f4 = 'b2';  b2 = GaussD('Mean', [3; 3], 'Covariance', [2 0; 0 4]);
    otherwise
        warning('Wrong test case name!')
end

para = struct(f1, q, f2, A, f3, b1, f4, b2);
