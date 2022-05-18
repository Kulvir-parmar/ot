format short
%f = @(x) (x<1/2).*((1-x)./2)...
 %   +(x>=0.5).*(x.^2);
 f = @(x) x.^2-sin(3*x)
L = 0
R = 1;
n = 7;
t = linspace(L,R,100);
plot(t,f(t))
% compute fibonacci series
fib = ones(1,n);
for i = 3:n+1
    fib(i) = fib(i-1)+fib(i-2);
end
for k = 1:n
    ratio = fib(n+1-k)./fib(n+2-k)
    x2 = L+ratio.*(R-L);
    x1 = L+R-x2
    fx1 =f(x1)
    fx2 = f(x2)
    rs1(k,:)= [L R x1 x2 fx1 fx2];
    if fx1<fx2
        R = x2;
    elseif fx1>fx2
        L = x1;
    elseif fx1==fx2
        if min(abs(x1),abs(L))==abs(L)
            R = x2;
        else
            L = x1;
        end
    end
end
rs1(k,:)=[L R x1 x2 fx1 fx2];
Variables = {'L','R','x1','x2','fx1','fx2'}
Res1 = array2table(rs1);
Res1.Properties.VariableNames(1:size(Res1,2))=Variables
xpot = (L+R)/2
fopt = f(xpot);
fprintf('optimal value of x = %f \n',xpot);
fprintf('optimal value of f(x) = %f \n',fopt);
