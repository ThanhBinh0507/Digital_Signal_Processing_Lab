clc; clear; clf();

function stemplot(n, y, ttl)
    plot2d3(n, y, style=2);          // cot (stem)
    plot2d(n, y, style=-9);          // dau tron
    xtitle(ttl, "n", "");
    a = gca();
    a.x_location = "origin";
    a.data_bounds = [min(n)-1, min([y 0])-0.5; max(n)+1, max([y 0])+0.5];
    xgrid(color("grey"));
endfunction

n  = -2:2;                  // mau x(0)=4 o giua
x  = [2 3 4 5 6];
xr = x($:-1:1);             // x(-n): dao nguoc vector (n doi xung)

xe = (x + xr) / 2;          // thanh phan chan
xo = (x - xr) / 2;          // thanh phan le

disp("xe = "); disp(xe);
disp("xo = "); disp(xo);
disp("xe + xo = x            : "); disp(isequal(xe + xo, x));
disp("xe chan (xe(-n)=xe(n)) : "); disp(isequal(xe, xe($:-1:1)));
disp("xo le  (xo(-n)=-xo(n)) : "); disp(isequal(xo, -xo($:-1:1)));

scf(0); clf();
subplot(3,1,1); stemplot(n, x,  "x(n)");
subplot(3,1,2); stemplot(n, xe, "x_e(n)");
subplot(3,1,3); stemplot(n, xo, "x_o(n)");
