% Lax-Wendroff method function for the linear advection 
% equation with:
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
function [U] = lw(T, J)

  % Initialize variables
  x = 0:(1/J):1;  % Mesh for variable x.
  t = 0:(1/J):T;  % Mesh for variable t.
  U = double((0.2 <= x) & (x <= 0.4)); % Initial value for U.
  U = U(:);
  
  % Shortened forms for x.
  x_jm1 = x(1:end-2);  % x_{j-1}
  x_j   = x(2:end-1);  % x_{j}
  x_jp1 = x(3:end);    % x_{j+1}
  x_jmh = mean([x_jm1; x_j]); % x_{j - 1/2}
  x_jph = mean([x_j; x_jp1]); % x_{j + 1/2}
 
  % Lax-Wendroff method
  for n = 1:(length(t)-1)
    t_nph = mean([t(n); t(n+1)]); % t_{n + 1/2}
    U(2:end-1) = ...
         1/2 * (a(x_j,t_nph) + a(x_j, t(n)).*a(x_jmh, t(n))) ...
         .* U(1:end-2) ...
       + (1-1/2*(a(x_j, t(n)).*(a(x_jph, t(n))+a(x_jmh, t(n))))) ...
         .* U(2:end-1) ...
       + 1/2 * (-a(x_j, t_nph) + a(x_j, t(n)) .* a(x_jph, t(n))) ...
         .* U(3:end);    
  end  
end