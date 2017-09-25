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
        f2 = 'A';   A = [0.2 0.5 0.3; 0.4 0.4 0.2];
        f3 = 'b1';  b1 = GaussD('Mean', 0, 'StDev', 1);
        f4 = 'b2';  b2 = GaussD('Mean', 3, 'StDev', 2);
    case 'vector-output HMM'
        f1 = 'q';   q = [0.75; 0.25];
        f2 = 'A';   A = [0.99 0.01; 0.03 0.97];
        f3 = 'b1';  b1 = GaussD('Mean', [0; 20], 'Covariance', [2 1; 1 4]);
        f4 = 'b2';  b2 = GaussD('Mean', [10; 40], 'Covariance', [1 0; 0 2]);
    otherwise
        warning('Wrong test case name!')
end

para = struct(f1, q, f2, A, f3, b1, f4, b2);
