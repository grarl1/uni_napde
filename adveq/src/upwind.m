% upwind scheme for the linear advection equation with:
%   - Initial value:  u(x,0) = 1  if  0.2 <= x <= 0.4
%                     u(x,0) = 0  otherwise.
%   - Boundary value: u(0,t) = 0  t > 0.
%
% Parameters:
%   - T: time value. (1 x 1)
%   - J: number of nodes for the variable x. (1 x 1)
%
% Return:
%   - U: numerical approximation at time tF. (1 x J+1)
function [U] = upwind(T, J)

  % Initialize variables as Delta x = Delta t.
  x = 0:(1/J):1;  % Mesh for variable x.
  t = 0:(1/J):T;  % Mesh for variable t.
  N = length(t) - 1; % Number of nodes for t.
  U = double((0.2 <= x) & (x <= 0.4)); % Initial value for U.
  U = U(:);
 
  % Upwind scheme
  for n = 1 : N
    U(2:end) = U(2:end) - a(x(2:end),t(n)).*(U(2:end)-U(1:end-1));
  end
end
