clc
clear
close all

figure('Renderer', 'painters')

wh_test_y
wh_train_y
wh_test_u
wh_train_u

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p11 = subplot(411); hold on; box on
plot(train_y);
grid on;
xlim([0, max(size(train_y))])
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);
ylabel('$y$', 'interpreter', 'latex', 'fontsize', fsize);

p12 = subplot(412); hold on; box on
plot(train_u);
grid on;
xlim([0, max(size(train_u))])
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);
ylabel('$u$', 'interpreter', 'latex', 'fontsize', fsize);

p21 = subplot(413); hold on; box on
plot(test_y);
grid on;
xlim([0, max(size(test_y))])
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);
ylabel('$y$', 'interpreter', 'latex', 'fontsize', fsize);

p22 = subplot(414); hold on; box on
plot(test_u);
grid on;
xlim([0, max(size(test_u))])
xlabel('$k$', 'interpreter', 'latex', 'fontsize', fsize);
ylabel('$u$', 'interpreter', 'latex', 'fontsize', fsize);

set(p11, 'position', [.1  .5 .35 .3])
set(p12, 'position', [.55 .5 .35 .3])
set(p21, 'position', [.1  .1 .35 .3])
set(p22, 'position', [.55 .1 .35 .3])

print('wh_datasets.eps', '-depsc')
