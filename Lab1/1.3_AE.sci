// (a) xa(t) = 3*cos(5*t + %pi/6) - Liên tục, tuần hoàn
t = 0:0.01:4*%pi/5; 
xa = 3 * cos(5*t + %pi/6);
subplot(3,2,1);
plot(t, xa);
title("1.3(a) x_a(t) = 3 cos(5t + \pi/6) (Tuần hoàn)");

// (b) x(n) = 3*cos(5*n + %pi/6) - Rời rạc, không tuần hoàn
n_b = 0:50;
xb = 3 * cos(5*n_b + %pi/6);
subplot(3,2,2);
plot2d3(n_b, xb); plot(n_b, xb, 'ro');
title("1.3(b) x(n) = 3 cos(5n + \pi/6) (Không tuần hoàn)");

// (c) x(n) = 2*exp(j*(n/6 - %pi)) - Rời rạc, không tuần hoàn (vẽ phần thực)
n_c = 0:50;
xc = 2 * exp(%i * (n_c/6 - %pi));
subplot(3,2,3);
plot2d3(n_c, real(xc)); plot(n_c, real(xc), 'ro');
title("1.3(c) Re{x(n)} (Không tuần hoàn)");

// (d) x(n) = cos(n/8)*cos(%pi*n/8) - Rời rạc, không tuần hoàn
n_d = 0:100;
xd = cos(n_d/8) .* cos(%pi*n_d/8);
subplot(3,2,4);
plot2d3(n_d, xd); plot(n_d, xd, 'ro');
title("1.3(d) x(n) (Không tuần hoàn)");

// (e) x(n) tổng hợp - Rời rạc, tuần hoàn với chu kỳ N = 16
n_e = 0:48; // Vẽ 3 chu kỳ (16 * 3 = 48)
xe = cos(%pi*n_e/2) - sin(%pi*n_e/8) + 3*cos(%pi*n_e/4 + %pi/3);
subplot(3,2,5);
plot2d3(n_e, xe); plot(n_e, xe, 'ro');
title("1.3(e) x(n) tổng hợp (Tuần hoàn, N=16)");
