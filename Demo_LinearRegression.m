%% LinearRegression Script that demostrates linear regression
% Fit a linear model to linear or quadratic data

%% Generate the data and perform the regression
%input

x = linspace(0,1,500)';
n = length(x);

%% Model a polynomial, y = ax^2+mx+b
a = 1.0;
m = 1.0;
b = 1.0;
sigma = 0.1;    % standard deviation of the noise
y0 = a*x.^2+m*x+b;
y=y0+sigma*randn(n,1);

% Perform the linear regression using pinv
aa = [x ones(n,1)];
c = pinv(aa)*y;
yR = c(1)*x+c(2); %the fitted line


%%Generate plots
h = figure('name','Linear Regression');
h.Name = 'Linear Regression';
plot(x,y);hold on;
plot(x,yR,'linewidth',2);
grid on;
xlabel('x');
ylabel('y');
title('Linear Regression');
legend('Data','Fit')
figure('Name','Regression Error');
plot(x,yR-y0);
grid on;