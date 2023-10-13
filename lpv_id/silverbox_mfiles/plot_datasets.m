clc
clear
close all

figure('Renderer', 'painters')

silverbox_test_y
silverbox_train_y
silverbox_val_y

f = figure(1);
f.Position = [1800 200 800 500];
fsize = 17;

p1 = plot(train_y);
grid on;
xlabel("$k$", 'interpreter', 'latex', 'fontsize', fsize);
ylabel('$y(k)$', ...
    'interpreter', 'latex', 'fontsize', fsize);
xlim([0, max(size(train_y))])

print('silverbox_training_set.eps', '-depsc')

p2 = plot(val_y);
grid on;
xlabel("$k$", 'interpreter', 'latex', 'fontsize', fsize);
ylabel('$y(k)$', ...
    'interpreter', 'latex', 'fontsize', fsize);
xlim([0, max(size(val_y))])

print('silverbox_validation_set.eps', '-depsc')

p3 = plot(test_y);
grid on;
xlabel("$k$", 'interpreter', 'latex', 'fontsize', fsize);
ylabel('$y(k)$', ...
    'interpreter', 'latex', 'fontsize', fsize);
xlim([0, max(size(test_y))])

print('silverbox_test_set.eps', '-depsc')
