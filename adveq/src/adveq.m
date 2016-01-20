% Variables x and t
dx = [0.02 0.02 0.02 0.01 0.01 0.01];
J = 1 ./ dx;
T = [0.1 0.5 1 0.1 0.5 1];

% Upwind
for i = 1 : length(dx)
    f = figure
    title(strcat('Upwind approximation (dx=',num2str(dx(i)), ', T=', num2str(T(i)), ')'));
    hold all
    xlabel('x')
    ylabel('u(x)')
    x = 0:dx(i):1;
    plot(x, adveq_sol(x, T(i)), 'DisplayName', 'Real solution')
    plot(x, upwind(T(i), J(i)), 'DisplayName', 'Upwind solution')
    legend('show')
    saveas(f, strcat('../img/upwind_', num2str(i)), 'png')
    close(f)
end


% Lax–Wendroff
for i = 1 : length(dx)
    f = figure
    title(strcat('Lax-Wendroff approximation (dx=',num2str(dx(i)), ', T=', num2str(T(i)), ')'));
    hold all
    xlabel('x')
    ylabel('u(x)')
    x = 0:dx(i):1;
    plot(x, adveq_sol(x, T(i)), 'DisplayName', 'Real solution')
    plot(x, lw(T(i), J(i)), 'DisplayName', 'Lax-Wendroff solution')
    legend('show')
    saveas(f, strcat('../img/lw_', num2str(i)), 'png')
    close(f)
end
