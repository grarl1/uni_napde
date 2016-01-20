% Solution for the linear advection equation with:
%   - Initial value:  u(x,0) = 1  if  0.2 <= x <= 0.4
%                     u(x,0) = 0  otherwise.
%   - Boundary value: u(0,t) = 0  t > 0.
% 
% Parameters:
%   - x: vector of nodes. (J+1 x 1)
%   - T: time value. (1 x 1)
%
% Return:
%   - Usol: vector of solution values. (J+1 x 1)
%
function [Usol] = adveq_sol(x, T)

  % Along the characteristics, the solution is constant
  x_s = x - (T ./ (1 + x.^2));
  
  % Apply initial value over x_s
  Usol = double((0.2 <= x_s) & (x_s <= 0.4));
  Usol = Usol(:);
end
