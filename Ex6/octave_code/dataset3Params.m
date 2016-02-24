function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% initial parameters
% range or C and sigma and an empty set of results

rangeVals = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
results = [];

fprintf('\nEvaluating the best C and sigma ...\n');
fprintf('\n  C \t\t sigma \t\t error \n');


for i = 1:length(rangeVals),
    for j = 1:length(rangeVals),
        
        % itaretional 
        loopC = rangeVals(i);
        loopSigma = rangeVals(j);
        
        % Gaussian kernel
        model = svmTrain(X, y, loopC, @(x1, x2) gaussianKernel(x1, x2, loopSigma));
        
        % predict for validation set
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions ~= yval));
        
        % append new values to results and print out
        results = [results; loopC, loopSigma, err];
        fprintf("%f\t%f\t%f",loopC, loopSigma, err);
        
    end
end

% evaluate index with minimal error (3rd column)
[minErr, minIndex] = min(results(:,3));

% final results
C = results(minIndex,1);
sigma = results(minIndex,2);

% =========================================================================

end
