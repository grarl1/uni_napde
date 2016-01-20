% Solution for the following problem:
%   -epsilon*u''(x) + u'(x) = 1
% Boundary values: u(0) = u(1) = 0
% 
% Parameters:
%   - x: vector of nodes.
%   - epsilon: value of epsilon.
%
% Return:
%   - sol: vector of solution values.
function [sol] = fem_sol(x, epsilon)
  sol = x - (1-exp(x ./ epsilon)) ./ (1-exp(1 / epsilon));
end