clc
clear
close all

silverbox_nx4_np3_test
silverbox_nx4_np3_test_real
silverbox_nx4_np3_val
silverbox_nx4_np3_val_real

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p1 = subplot(211); hold on; box on
plot(y_test);
plot(y_test - hy_test);
grid on;
%set(gca, 'xticklabel', []);
%yticks([-1, -0.5, 0, 0.5, 1])
%ylim([-1, 1] * 0.6)
xlim([0, max(size(y_test))])
ylabel('$\tilde y_{\mathrm{test}}(k)$', ...
    'interpreter', 'latex', 'fontsize', fsize);
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);

p2 = subplot(212); hold on; box on
plot(y_val);
plot(y_val - hy_val);
grid on;
%yticks([-1, -0.5, 0, 0.5, 1])
%ylim([-1, 1] * 0.6)
xlim([0, max(size(y_val))])
ylabel('$\tilde y_{\mathrm{val}}(k)$', ...
    'interpreter', 'latex', 'fontsize', fsize);
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);

set(p2, 'position', [.1 .1 .8 .3])
set(p1, 'position', [.1 .6 .8 .3])

print('silverbox_nx4.eps', '-depsc')
