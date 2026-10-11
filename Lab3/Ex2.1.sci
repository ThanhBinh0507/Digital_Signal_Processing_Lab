n = -4:4;
x = [0, 0, 1/3, 2/3, 1, 1, 1, 1, 0];
n1 = 0:8;
y1 = [0, 1, 1, 1, 1, 2/3, 1/3, 0, 0];
n2 = -8:0;
y2 = [0, 1, 1, 1, 1, 2/3, 1/3, 0, 0];

scf(0); clf();
subplot(3,1,1); plot2d3(n, x, style=2); xtitle("x(n)", "n", "Amplitude");
subplot(3,1,2); plot2d3(n1, y1, style=2); xtitle("x(4-n): fold, then delay", "n", "Amplitude");
subplot(3,1,3); plot2d3(n2, y2, style=2); xtitle("x(-n-4): delay, then fold", "n", "Amplitude");
xgrid();
