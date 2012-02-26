f = @(x) normcdf(x);
s = @(x) normpdf(x);
s2 = @(x) -x ./ sqrt(2 .* pi) .* exp(-0.5 .* x .* x);

LoadBases;

num = 10000;
Fe = zeros(5,num+1);
Dv1e = zeros(5,num+1);
Dv2e = zeros(5,num+1);
t_all = 0:sqrt(3)./num:sqrt(3);
errormax = zeros(5,1);

F = f(t_all);
Dv1 = s(t_all);
Dv2 = s2(t_all);

for i = 1:5
    N = pow2(i);
    %N = 10;
    X = [0:(sqrt(3) ./ N):sqrt(3)];
    Y = f(X);
    %S = s(X);
    %Y = normcdf(X);
    %S = Deriv1(X);
    S = zeros(1,size(X,2)-1);
    M = zeros(1,size(X,2)-1);
    H = zeros(1,size(X,2)-1);
    for j = 1:size(X,2)-1
        H(j) = X(j+1) - X(j);
        M(j) = f((X(j+1) + X(j))./2);
        S(j) = s((X(j+1) + X(j))./2);
    end
    
    m = 0;
    for t = 0:sqrt(3)./num:sqrt(3)
        m = m+1;
        Fe(i,m) = fcdf( t, X, Y, H, S, M );
        Dv1e(i,m) = derive1(t, X, Y, H, S, M );
        Dv2e(i,m) = derive2(t, X, Y, H, S, M );
    end
    
    err = F - Fe(i,:);
    errormax(i) = max(abs(err));
    fprintf('When N = %d, the max error = %.4e.\n',N,errormax(i));
 
    %draw error figure
    gray = 0.2 * (i - 1);
    semilogy(t_all, err, 'Color', [gray gray gray]);
    hold on;
end


figure(1);
legend('N = 2', 'N = 4', 'N = 8', 'N = 16', 'N = 32');

figure(2);
plot(t_all, F, 'r-');
hold on;
plot(t_all, Fe(2,:), 'g-');
plot(t_all, Fe(5,:), 'b-');
legend('Origin', 'N = 2', 'N = 32');

figure(3);
plot(t_all(1:end-1), Dv1(1:end-1), 'r-');
hold on;
plot(t_all(1:end-1), Dv1e(2,1:end-1), 'g-');
plot(t_all(1:end-1), Dv1e(5,1:end-1), 'b-');
legend('Origin', 'N = 2', 'N = 32');

figure(4);
plot(t_all(1:end-1), Dv2(1:end-1), 'r-');
hold on;
plot(t_all(1:end-1), Dv2e(2,1:end-1), 'g-');
plot(t_all(1:end-1), Dv2e(5,1:end-1), 'b-');
legend('Origin', 'N = 2', 'N = 32');

figure(5);
bar(errormax);
set(gca, 'XTick', [1:5]);
set(gca, 'XTickLabel', {'N = 2', 'N = 4', 'N = 8', 'N = 16', 'N = 32'});
ylabel('Maximum Error');




