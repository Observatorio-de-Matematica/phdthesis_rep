%COMPARISON GRADIENTS
[phi, x0, lambda] = get_sys_info(zeros(3));

xtotg1 = load('res/grad_xtot1.mat'); xtotg1 = xtotg1.xtot1;
t1g1 = load('res/grad_t1.mat'); t1g1 = t1g1.t1;

xtotg2 = load('res/grad_xtot1_2.mat'); xtotg2 = xtotg2.xtot1;
t1g2 = load('res/grad_t1_2.mat'); t1g2 = t1g2.t1;

xtotg3 = load('res/grad_mod_xtot1.mat'); xtotg3 = xtotg3.xtot1;
t1g3 = load('res/grad_mod_t1.mat'); t1g3 = t1g3.t1;

figure(1)
fsize = 14;
p1 = subplot(321);
    plot(t1g1, xtotg1(:, 1:3) - xtotg1(:, 4:6))
    set(gca, 'xticklabel', []);
    yticks([-100, 0, 100]);
    grid on;
    ylabel('$\tilde x_{g1}$', 'interpreter', 'latex', 'fontsize', fsize);
p2 = subplot(322);
    plot(t1g1, xtotg1(:, 10:end) - lambda');
    set(gca, 'xticklabel', []);
    yticks([-2, 0, 2, 4]);
    grid on;
    ylabel('$\tilde\lambda_{g1}$', 'interpreter', 'latex', 'fontsize', fsize);
p3 = subplot(323);
    plot(t1g2, xtotg2(:, 1:3) - xtotg2(:, 4:6))
    set(gca, 'xticklabel', []);
    yticks([-100, 0, 100]);
    grid on;
    ylabel('$\tilde x_{g2}$', 'interpreter', 'latex', 'fontsize', fsize);
p4 = subplot(324);
    plot(t1g2, xtotg2(:, 10:end) - lambda');
    set(gca, 'xticklabel', []);
    yticks([0, 2, 4]);
    grid on;
    ylabel('$\tilde\lambda_{g2}$', 'interpreter', 'latex', 'fontsize', fsize);
p5 = subplot(325);
    plot(t1g3, xtotg3(:, 1:3) - xtotg3(:, 4:6))
    yticks([-100, 0, 100]);
    grid on;
    ylabel('$\tilde x_{g3}$', 'interpreter', 'latex', 'fontsize', fsize);
    xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
p6 = subplot(326);
    plot(t1g3, xtotg3(:, 10:end) - lambda');
    yticks([-2, 0, 2, 4]);
    grid on;
    ylabel('$\tilde\lambda_{g3}$', 'interpreter', 'latex', 'fontsize', fsize);
    xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
set(p1, 'position', [.1 .6 .35 .25])
set(p2, 'position', [.55 .6 .35 .25])
set(p3, 'position', [.1 .35 .35 .25])
set(p4, 'position', [.55 .35 .35 .25])
set(p5, 'position', [.1 .1 .35 .25])
set(p6, 'position', [.55 .1 .35 .25])
print('comparison_grad.eps', '-depsc')

%LEAST SQUARES
[phi, x0, lambda] = get_sys_info(zeros(3));

xtotl1 = load('res/forg_xtot1.mat'); xtotl1 = xtotl1.xtot1;
t1l1 = load('res/forg_t1.mat'); t1l1 = t1l1.t1;

xtotl2 = load('res/least_xtot1.mat'); xtotl2 = xtotl2.xtot1;
t1l2 = load('res/least_t1.mat'); t1l2 = t1l2.t1;

figure(1)
fsize = 14;
p1 = subplot(221);
    plot(t1l1, xtotl1(:, 1:3) - xtotl1(:, 4:6))
    set(gca, 'xticklabel', []);
    yticks([-10, 0, 10, 20]);
    grid on;
    ylabel('$\tilde x_{l1}$', 'interpreter', 'latex', 'fontsize', fsize);
p2 = subplot(222);
    plot(t1l1, xtotl1(:, (10+length(lambda)^2):end) - lambda');
    set(gca, 'xticklabel', []);
    yticks([-2, -1, 0, 1, 2, 3]);
    grid on;
    ylabel('$\tilde\lambda_{l1}$', 'interpreter', 'latex', 'fontsize', fsize);
p3 = subplot(223);
    plot(t1l2, xtotl2(:, 1:3) - xtotl2(:, 4:6))
    yticks([-40, -20, 0, 20, 40, 60]);
    grid on;
    ylabel('$\tilde x_{l2}$', 'interpreter', 'latex', 'fontsize', fsize);
    xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
p4 = subplot(224);
    plot(t1l2, xtotl2(:, (10+length(lambda)^2):end) - lambda');
    yticks([-2, 0, 2, 4]);
    grid on;
    ylabel('$\tilde\lambda_{l2}$', 'interpreter', 'latex', 'fontsize', fsize);
    xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
set(p1, 'position', [.1 .5 .35 .4])
set(p2, 'position', [.55 .5 .35 .4])
set(p3, 'position', [.1 .1 .35 .4])
set(p4, 'position', [.55 .1 .35 .4])
print('least_squares.eps', '-depsc')

%LINEAR IN PARAM NETS
[phi, x0, lambda] = get_sys_info(zeros(3));
L = 3;

xtotg1 = load('res/grad_xtot2.mat'); xtotg1 = xtotg1.xtot2;
t1g1 = load('res/grad_t2.mat'); t1g1 = t1g1.t2;

xtotg2 = load('res/grad_mod_xtot2.mat'); xtotg2 = xtotg2.xtot2;
t1g2 = load('res/grad_mod_t2.mat'); t1g2 = t1g2.t2;

xtotl1 = load('res/forg_xtot2.mat'); xtotl1 = xtotl1.xtot2;
t1l1 = load('res/forg_t2.mat'); t1l1 = t1l1.t2;

xtotl2 = load('res/least_xtot2.mat'); xtotl2 = xtotl2.xtot1;
t1l2 = load('res/least_t2.mat'); t1l2 = t1l2.t1;

figure(1)
fsize = 14;
p1 = subplot(411);
    plot(t1g1, xtotg1(:, 10:end));
    set(gca, 'xticklabel', []);
    %yticks([-10, 0, 10, 20]);
    grid on;
    ylabel('$\lambda_{g1}$', 'interpreter', 'latex', 'fontsize', fsize);
p2 = subplot(412);
    plot(t1g2, xtotg2(:, 10:end));
    set(gca, 'xticklabel', []);
    %yticks([0, 2, 4]);
    grid on;
    ylabel('$\lambda_{g2}$', 'interpreter', 'latex', 'fontsize', fsize);
p3 = subplot(413);
    plot(t1l1, xtotl1(:, (10+L^2):end));
    set(gca, 'xticklabel', []);
    %yticks([-10, 0, 10, 20]);
    grid on;
    ylabel('$\lambda_{l1}$', 'interpreter', 'latex', 'fontsize', fsize);
    ylim([-25, 25]);
p4 = subplot(414);
    plot(t1l2, xtotl2(:, (10+L^2):end));
    %set(gca, 'xticklabel', []);
    %yticks([0, 2, 4]);
    grid on;
    ylabel('$\lambda_{l2}$', 'interpreter', 'latex', 'fontsize', fsize)
    xlabel('$t$', 'interpreter', 'latex', 'fontsize', fsize);
    ylim([-27, 25]);
set(p1, 'position', [.1 .7 .75 .2])
set(p2, 'position', [.1 .5 .75 .2])
set(p3, 'position', [.1 .3 .75 .2])
set(p4, 'position', [.1 .1 .75 .2])
print('linear_nn.eps', '-depsc')
