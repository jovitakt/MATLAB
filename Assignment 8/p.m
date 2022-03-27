function Lp = p(n,x)
% Finding the Legendre polynomials, 
% solutions to Legendre's differential equation

Lp(1) = 1; % p(0,x) = 1
Lp(2) = x; % p(1,x) = x

for i = 3:n+1 % For the 3rd polynomial and onwards
j = i-1; 
Lp(i) = 1/j*((2*j-1)*x*Lp(i-1)-(j-1)*Lp(i-2)); % Legendre recurrence formula
end

Lp = Lp(n+1); % Final answer after loop ends

end