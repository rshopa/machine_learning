function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% non-regularized and regularization terms of cost function J:
unreg_term = sum((X * theta - y).^2) / (2 * m);
reg_term = sumsq(theta(2:end)) * lambda / (2 * m);

J = unreg_term + reg_term; % final cost

% zero partial derivative (non-regularized)
grad(1) = sum((X * theta - y).* X(:,1)) / m;

% the rest partial derivatives
for j = 2:size(theta),
    grad(j) = sum((X * theta - y).* X(:,j)) / m + theta(j) * lambda / m;
end

% =========================================================================

grad = grad(:);

end
