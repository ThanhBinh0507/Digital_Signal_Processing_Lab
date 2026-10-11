clc; clear; clf();

// ham ve tin hieu roi rac dang stem
function stemplot(n, y, ttl)
    plot2d3(n, y, style=2);          // cot (stem)
    plot2d(n, y, style=-9);          // dau tron
    xtitle(ttl, "n", "");
    a = gca();
    a.x_location = "origin";
    a.data_bounds = [min(n)-1, min([y 0])-0.5; max(n)+1, max([y 0])+0.5];
    xgrid(color("grey"));
endfunction

// tin hieu goc x(n) (Hinh P2.2); n co the la vector bat ky
function y = x_fun(n)
    y = zeros(n);
    y(n >= -1 & n <= 2) = 1;
    y(n >= 3 & n <= 4)  = 0.5;
endfunction

n = -8:8;                            // luoi doi xung de tinh x(-n)

scf(0); clf();
subplot(3,3,1); stemplot(n, x_fun(n),                       "x(n)");
subplot(3,3,2); stemplot(n, x_fun(n-2),                     "(a) x(n-2)");
subplot(3,3,3); stemplot(n, x_fun(4-n),                     "(b) x(4-n)");
subplot(3,3,4); stemplot(n, x_fun(n+2),                     "(c) x(n+2)");
subplot(3,3,5); stemplot(n, x_fun(n).*bool2s(2-n >= 0),     "(d) x(n)u(2-n)");
subplot(3,3,6); stemplot(n, x_fun(n-1).*bool2s(n == 3),     "(e) x(n-1)delta(n-3)");
subplot(3,3,7); stemplot(n, x_fun(n.^2),                    "(f) x(n^2)");

xe = (x_fun(n) + x_fun(-n)) / 2;     // phan chan
xo = (x_fun(n) - x_fun(-n)) / 2;     // phan le
subplot(3,3,8); stemplot(n, xe, "(g) even part");
subplot(3,3,9); stemplot(n, xo, "(h) odd part");

disp("xe + xo = x ?  "); disp(isequal(xe + xo, x_fun(n)));
