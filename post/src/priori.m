% Values for epsilon and mesh-sizes
epsilon = [0.1 0.01 0.005];
h = [0.1 0.05 0.025 0.0125];

% Approximation
for i = 1 : length(h)
  for j = 1 : length(epsilon)
  
    % Variable x
    x = 0:h(i):1;
    
    % Variable y
    y_sol = fem_sol(0:1e-4:1, epsilon(j));
    y_app = fem(h(i), epsilon(j));
    
    % Plot
    f = figure
    title(strcat('h=', num2str(h(i)), ' epsilon=', num2str(epsilon(j))))
    xlabel('x')
    ylabel('u')
    hold on
    plot(x, [0; y_app; 0], 'b')
    plot(0:1e-4:1, y_sol, 'r')
    hold off
    legend('FEM approximation', 'Real solution', 'Location','northwest')
    saveas(f, strcat('../img/', num2str(f), '.png'))
  end
end

for i=1:12
  close(i);
end
