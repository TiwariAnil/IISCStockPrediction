function J = computeCostMulti(X, y, theta)
m = length(y); % number of training examples
J = 0;
% Formula:  x(i) * theta - y(i);
hypothisis = X*theta;

cost_matrix = ( hypothisis - y );

square_deviation = cost_matrix.^2; % each element ^2
%ero = sum(square_deviation)
J = 1/ (2*m) * sum(square_deviation);

% =================================================
end