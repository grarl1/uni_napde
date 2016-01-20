% Posteriori bound on the global error for the
% approximation using finite elements of the following problem
% Equation: 
%   -epsilon * u''(x) + u'(x) = 1
% with:
%   - x in (0,1).
%   - Boundary values: u(0) = u(1) = 0.
%
% Parameters:
%   - u_h: vector of numerical approximation.
%   - h: mesh size.
%   - epsilon: value for epsilon.
% Return:
%   - B: computed posteriori bound
function [B] = post_bound(u_h, h, epsilon)
  % Number of nodes
  N = 1/h;
  % Calculation of the sum of ||R(u_h)||^2
  A = spdiags([repmat(-1/h, N-1, 1) ...
               repmat( 2/h, N-1, 1) ...
               repmat(-1/h, N-1, 1)], ...
               -1:1, N-1, N-1);
  Z = u_h(:)' * A * u_h(:);
  % Sum of ||R(u_h)||^2
  R = 1/(epsilon^2)*(1+Z);
  % Bound
  B = ((h^2)/(pi^2)) * (1+1/(epsilon*sqrt(2)))*sqrt(R);
end
