function [theta] = trainLinearReg(X, y, lambda)
%TRAINLINEARREG Trains linear regression given a dataset (X, y) and a
%regularization parameter lambda
%   [theta] = TRAINLINEARREG (X, y, lambda) trains linear regression using
%   the dataset (X, y) and regularization parameter lambda. Returns the
%   trained parameters theta.
%

% Initialize Theta
initial_theta = zeros(size(X, 2), 1); 

% Create "short hand" for the cost function to be minimized
costFunction = @(t) linearRegCostFunction(X, y, t, lambda);

% Now, costFunction is a function that takes in only one argument
options = optimset('MaxIter', 200, 'GradObj', 'on');

% ========== MY CODE HERE ================================
% suppress warning: Matlab-style short-circuit operation
% performed for operator | and & (GNU Octave 4.0.0)
warning('off', 'Octave:possible-matlab-short-circuit-operator'); 

% Minimize using fmincg
theta = fmincg(costFunction, initial_theta, options);

% ========== MY CODE HERE ================================
% turn back all warnings to 'on'
warning('on','Octave:possible-matlab-short-circuit-operator');

end
