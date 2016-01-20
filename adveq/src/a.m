% a function for the linear advection equation with
%   - Initial value:  u(x,0) = 1  if  0.2 <= x <= 0.4
%                     u(x,0) = 0  otherwise.
%   - Boundary value: u(0,t) = 0  t > 0.
%   - Note: a is always positive.
%
% Parameters:
%   - x: x value. (1 x J+1)
%   - t: t value. (1 x 1)
%
% Return:
%   - a_val: a value. (1 x J+1)
function [a_val] = a(x, t)
   a_val = (1 + x.^2) ./ (1 + 2*x*t + 2*x.^2 + x.^4);
   a_val = a_val(:);
end