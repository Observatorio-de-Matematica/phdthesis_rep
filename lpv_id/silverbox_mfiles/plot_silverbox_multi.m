clc
clear
close all

multi_silverbox_nx4_np3_test
multi_silverbox_nx4_np3_test_real
multi_silverbox_nx4_np3_val
multi_silverbox_nx4_np3_val_real

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
legend('$y(k)$', '$y(k)-y_{\mathrm{t}}(k)$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);

p2 = subplot(212); hold on; box on
plot(y_val);
plot(y_val - hy_val);
grid on;
%yticks([-1, -0.5, 0, 0.5, 1])
%ylim([-1, 1] * 0.6)
xlim([0, max(size(y_val))])
legend('$y(k)$', '$y(k)-y_{\mathrm{v}}(k)$', ...
    'interpreter', 'latex', 'fontsize', fsize - 5, 'location', 'eastoutside');
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);

set(p2, 'position', [.075 .1 .7 .3])
set(p1, 'position', [.075 .6 .7 .3])

print('silverbox_multi.eps', '-depsc')
