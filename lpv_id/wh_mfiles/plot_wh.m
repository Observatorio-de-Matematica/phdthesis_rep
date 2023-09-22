clc
clear
close

wh_out
wh_real_out

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

hold on; box on
plot(yr);
plot(yr - y);
grid on;
%set(gca, 'xticklabel', []);
%yticks([-1, -0.5, 0, 0.5, 1])
%ylim([-1, 1] * 0.6)
xlim([0, max(size(y))])
ylabel('$\tilde y(k)$', ...
    'interpreter', 'latex', 'fontsize', fsize);
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);

print('wh_outerr.eps', '-depsc')
