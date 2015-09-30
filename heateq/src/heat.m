% Data
theta = [0 0 1/2 1/2 1 1];
J = 10 : 5 : 100;
tF = 0.6;
nu = [1/2 1/6 1/2 0 5 0];
mu = [0 0 0 1/40 0 1/4];

% Initialization
t_cpu = zeros(length(theta), length(J));
err = zeros(length(theta), length(J));

for i = 1 : length(theta)
  for j = 1 : length(J)
    % theta-method
    [x, U, t_cpu(i,j)] = thetamet(theta(i), J(j), tF, nu(i), mu(i));
    % Solution
    Usol = heat_sol(x, tF, 100);
    % Compute errors
    err(i,j) = max(abs(Usol - U))/max(abs(Usol));
  end
end

% Plots each row of the 'err' matrix with logarithsmic scales.
for i = 1 : size(err,1)
  loglog(J, err(i,:), 'DisplayName', strcat('theta=',num2str(theta(i)), ', nu=', num2str(nu(i)), ', mu=', num2str(mu(i))))
  hold on
  xlabel('J')
  ylabel('Error')
end
title('Error versus J (number of nodes)')
legend(gca, 'show')

% Plots each row of the 'err' matrix with logarithsmic scales.
figure
for i = 1 : size(t_cpu,1)
  loglog(t_cpu(i,:), err(i,:), 'DisplayName', strcat('theta=',num2str(theta(i)), ', nu=', num2str(nu(i)), ', mu=', num2str(mu(i))))
  hold on
  xlabel('CPU time')
  ylabel('Error')
end
title('Error versus CPU time')
legend(gca, 'show')
