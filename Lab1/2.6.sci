n = -2:4;
x1 = [ 0,  0, 0, 1, 3, -2, 0];
x2 = [ 0,  0, 1, 2, 3,  0, 0];
y = x1 + x2;

subplot(3, 1, 1);
plot2d3(n, x1);
title("Signal x_1(n)"); 
xlabel("n"); ylabel("Amplitude");

subplot(3, 1, 2);
plot2d3(n, x2);
title("Signal x_2(n)"); 
xlabel("n"); ylabel("Amplitude");

subplot(3, 1, 3);
plot2d3(n, y);
title("Signal y(n) = x_1(n) + x_2(n)"); 
xlabel("n"); ylabel("Amplitude");
