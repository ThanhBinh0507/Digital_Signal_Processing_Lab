// 1. Tin hieu tuong tu xa(t) trong 5 chu ky
t = 0 : 0.0001 : 0.1;
xa = 3 * sin (100 * %pi * t);
// 2. Tin hieu roi rac x(n) trong 5 chu ky (30 mau)
Fs = 300;
n = 0 : 29;
xn = 3 * sin (100 * %pi * n / Fs);
// 3. Tin hieu luong tu hoa xq(n) bang phuong phap cat cut
delta = 0.1;
xq = floor(xn / delta) * delta;
// 4. Khoi tao cua so ve va phan bo 3 do thi
clf ();
subplot (3, 1, 1);
plot(t, xa);
title (" Tin hieu tuong tu xa(t)");
subplot (3, 1, 2);
plot2d3(n, xn); // Ham plot2d3 ve do thi dang cot (stem)
plot(n, xn , 'ro');
title (" Tin hieu roi rac x(n)");
subplot (3, 1, 3);
plot2d3(n, xq);
plot(n, xq , 'bo');
title (" Tin hieu luong tu hoa xq(n)");
