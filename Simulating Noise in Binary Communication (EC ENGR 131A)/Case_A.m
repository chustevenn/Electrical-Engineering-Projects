function Pe = Case_A(S)
    M = 100;
    randn('seed',2000);
    %Generate Gaussian noise vector with 100 elements
    N = randn(1,M);
    %Generate uniform random vector with 100 elements
    rand('seed',2001);
    S1 = rand(1,M);
    %Convert uniform vector to binary vector
    S2 = S1 >= 0.5;
    %Convert binary vector to signal vector
    SS = S*(2*S2-1);
    %Sum to simulate transmission
    X = SS + N;
    %Only record when H1 was sent
    XX = X .* S2;
    X1 = XX <0;
    M1 = sum(S2);
    X11 = sum(X1);
    %Compute proportion of error
    Pe = X11/M1;
end