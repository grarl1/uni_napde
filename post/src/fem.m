% Finite element method for the equation: 
%   -epsilon * u''(x) + u'(x) = 1
% with:
%   - x in (0,1).
%   - Boundary values: u(0) = u(1) = 0.
%
% Parameters:
%   - h: mesh size.
%   - epsilon: value for epsilon.
% Return:
%   - U: numerical approximation using finite elements.
function [U] = fem(h, epsilon)
  % Number of nodes
  N = 1/h;
  % Auxiliar variables for the matrix A.
  A1 = spdiags([repmat(-1/h, N-1, 1) ...
                repmat( 2/h, N-1, 1) ...
                repmat(-1/h, N-1, 1)], ...
               -1:1, N-1, N-1);
  A2 = spdiags([repmat(-1/2, N-1, 1) ...
                repmat( 1/2, N-1, 1)], ...
               [-1,1], N-1, N-1);
  % A matrix
  A = epsilon*A1 + A2;
  % F matrix
  F = repmat(h, N-1, 1);
  % Linear equation
  U = A \ F;
end
