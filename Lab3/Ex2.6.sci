clc; clear; clf();
 
// ham ve tin hieu roi rac dang stem
function stemplot(n, y, ttl)
    plot2d3(n, y, style=2);
    plot2d(n, y, style=-9);
    xtitle(ttl, "n", "");
    a = gca();
    a.x_location = "origin";
    a.data_bounds = [min(n)-1, min([y 0])-0.5; max(n)+1, max([y 0])+0.5];
    xgrid(color("grey"));
endfunction
 
// tin hieu vao: x(n)=1 voi 0<=n<=3
function y = pulse(n)
    y = bool2s(n >= 0 & n <= 3);
endfunction
 
// ve 6 tin hieu cua cau (b)
function show6(n, x, y, yd, x2, y2, fig)
    scf(fig); clf();
    subplot(3,2,1); stemplot(n, x,  "(1) x(n)");
    subplot(3,2,2); stemplot(n, y,  "(2) y(n)");
    subplot(3,2,3); stemplot(n, yd, "(3) y(n-2)");
    subplot(3,2,4); stemplot(n, x2, "(4) x2(n)=x(n-2)");
    subplot(3,2,5); stemplot(n, y2, "(5) y2(n)=T[x2(n)]");
    subplot(3,2,6); stemplot(n, abs(y2-yd), "(6) |y2(n)-y(n-2)|");
endfunction
 
n = -6:8;
 
// ---------- He 1 : y(n) = x(n^2)  ----------
x   = pulse(n);
y   = pulse(n.^2);              // y(n)   = x(n^2)
yd  = pulse((n-2).^2);          // y(n-2) = x((n-2)^2)
x2  = pulse(n-2);               // x2(n)  = x(n-2)
y2  = pulse(n.^2 - 2);          // T[x2]  = x2(n^2) = x(n^2-2)
show6(n, x, y, yd, x2, y2, 0);
disp("He x(n^2): y2 = y(n-2)? "); disp(isequal(y2, yd));      // %f
 
// ---------- He 2 : y(n) = x(n) - x(n-1) ----------
y   = pulse(n)   - pulse(n-1);
yd  = pulse(n-2) - pulse(n-3);          // y(n-2)
x2  = pulse(n-2);
y2  = x2 - pulse(n-3);                  // x2(n) - x2(n-1)
show6(n, x, y, yd, x2, y2, 1);
disp("He x(n)-x(n-1): y2 = y(n-2)? "); disp(isequal(y2, yd));   // %t
 
// ---------- He 3 : y(n) = n x(n) ----------
y   = n .* pulse(n);
yd  = (n-2) .* pulse(n-2);              // y(n-2)
x2  = pulse(n-2);
y2  = n .* x2;                          // T[x2]
show6(n, x, y, yd, x2, y2, 2);
disp("He n*x(n): y2 = y(n-2)? "); disp(isequal(y2, yd));      // %f
