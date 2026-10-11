function [yn, yorigin] = delay (xn, xorigin, k)
yn = xn;
yorigin = xorigin - k;

if yorigin < 1 then
    yn = [zeros(1, 1 - yorigin), yn];
    yorigin = 1;
end

nx = (1:length(xn)) - xorigin;
ny = (1:length(yn)) - yorigin;

subplot(2, 1, 1);
plot2d3(nx, xn);
plot(nx, xn, 'ro');
title('Signal x(n)');
xlabel('n'); 
ylabel('Amplitude');
a1 = gca();
a1.data_bounds = [min(min(nx), min(ny))-1, min(xn)-1; max(max(nx), max(ny))+1, max(xn)+1];

subplot(2, 1, 2);
plot2d3(ny, yn);
plot(ny, yn, 'bo');
title('Delayed Signal y(n) = x(n - ' + string(k) + ')');
xlabel('n'); 
ylabel('Amplitude');
a2 = gca();
a2.data_bounds = a1.data_bounds;

endfunction
