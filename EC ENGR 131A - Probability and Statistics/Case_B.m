function Pe = Case_B(S)
    M = 100;
    rand('seed',2002);
    %Generate uniform random vector with 100 elements
    U = rand(1,M);
    %{
    To generate Laplacian noise vector we use inverse cdf function
    F(U) = -(1/(2^0.5))sgn(U-0.5)ln(1-2|U-0.5|)
    where U is the uniform random vector
    %}
    N = -(1/(2^0.5)) * sign(U-0.5) .* log(1-2.*abs(U-0.5));
    rand('seed',2003);
    %Generate uniform random vector with 100 elements
    S1 = rand(1,M);
    %Convert uniform vector to binary vector
    S2 = S1 >= 0.5;
    %Convert binary vector to signal vector
    SS = S*(2*S2-1);
    %Sum to simulate transmission
    X = SS + N;
    %Only record when H1 was sent
    XX = X .* S2;
    X1 = XX < 0;
    M1 = sum(S2);
    X11 = sum(X1);
    %Compute proportion of error
    Pe = X11/M1;
end
