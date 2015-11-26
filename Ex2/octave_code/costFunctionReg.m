function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

n = size(theta)(1); % number of parameters

sum1 = 0;          % sums of each terms in J(theta) expression
sum2 = 0;

Diff_sum = 0;      % used for gradient sum

for i = 1:m,
      hypothesis = sigmoid(theta'*X(i,:)');
      sum1 = sum1 -(y(i)*log(hypothesis)+(1 - y(i))*log(1 - hypothesis));
      Diff_sum = Diff_sum + (hypothesis - y(i))*X(i,1);  % zero term 
end
sum1 = sum1/m;              % first term (no regularization)
grad(1) = Diff_sum/m;       % gradient for theta_zero 

sum2 = sumsq(theta) * lambda/(2*m); % second term (regularization)

J = sum1 + sum2;            % final value of cost function

for j = 2:n,
    
    Diff_sum = 0; 
    
    for i = 1:m,
         hypothesis = sigmoid(theta'*X(i,:)');
         Diff_sum = Diff_sum + (hypothesis - y(i))*X(i,j);
    end
    
    grad(j) = Diff_sum/m + theta(j,1) * lambda/m; % grad. w. regularization

end

% =============================================================

end