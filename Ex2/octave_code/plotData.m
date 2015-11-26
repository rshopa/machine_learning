function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% ALTERNATIVE solution:

%passed = zeros(0,2);
%not_passed = zeros(0,2);
%
%for i = 1:(length(y))
%  if y(i) == 1,
%      passed = [passed; X(i,:)];
%  else
%      not_passed = [not_passed; X(i,:)];
%  end
%end     

passed = X(find(y == 1),:);
not_passed = X(find(y == 0),:);

plot(passed(:,1),passed(:,2),'k+','markersize',8);
plot(not_passed(:,1),not_passed(:,2),'ko','markerfacecolor','y','markersize',8);


% =========================================================================

hold off;

end
