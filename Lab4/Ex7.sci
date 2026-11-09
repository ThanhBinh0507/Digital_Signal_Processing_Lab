// ===== Exercise 7 : tich chap vong =====
clc; clear;

// ---------- ham ve tin hieu roi rac dang stem ----------
function stemplot(n, y, ttl)
    plot2d3(n, y, style=2);
    plot2d(n, y, style=-9);
    xtitle(ttl, "n", "");
    a = gca();
    a.x_location = "origin";
    ymin = min([y 0]) - 0.5;
    ymax = max([y 0]) + 0.5;
    a.data_bounds = [min(n)-1, ymin; max(n)+1, ymax];
    xgrid(color("grey"));
endfunction

// ---------- phuong phap lat - dich vong ----------
// y(n) = sum_{k=0}^{M-1} h(k) x((n-k) mod N)
function y = cconv_fold(x, h, N)
    xp = [x, zeros(1, N - length(x))];
    M  = length(h);
    y  = zeros(1, N);
    for n = 0:N-1
        s = 0;
        for k = 0:M-1
            idx = pmodulo(n - k, N) + 1;
            s = s + h(k+1) * xp(idx);
        end
        y(n+1) = s;
    end
endfunction

// ---------- phuong phap ma tran tuan hoan ----------
// C(n,k) = x((n-k) mod N),  y = C * h
function [y, C] = cconv_matrix(x, h, N)
    xp = [x, zeros(1, N - length(x))];
    hp = [h, zeros(1, N - length(h))];
    C  = zeros(N, N);
    for n = 0:N-1
        for k = 0:N-1
            C(n+1, k+1) = xp(pmodulo(n - k, N) + 1);
        end
    end
    y = (C * hp(:))';
endfunction

// ---------- du lieu ----------
x = [1 2 -3 2 1];        // x(n), goc tai n = 0
h = [1 0 -1 -1 1];       // h(n), goc tai n = 0
N = 5;                   // chu ky

// ---------- lat - dich vong ----------
y_fold = cconv_fold(x, h, N);
disp("y (lat - dich vong) = ");
disp(y_fold);

// ---------- ma tran ----------
[y_mat, C] = cconv_matrix(x, h, N);
disp("Ma tran tuan hoan C = ");
disp(C);
disp("y (ma tran) = ");
disp(y_mat);
disp("Hai phuong phap trung nhau? ");
disp(isequal(y_fold, y_mat));

// ---------- kiem chung bang DFT ----------
y_dft = round(real(ifft(fft(x) .* fft(h))));
disp("y (DFT) = ");
disp(y_dft);
disp("Khop voi DFT? ");
disp(isequal(y_fold, y_dft));

// ---------- nang luong tren mot chu ky ----------
Ex = sum(x.^2);
Ey = sum(y_mat.^2);
mprintf("Ex = %g, Ey = %g (tren mot chu ky)\n", Ex, Ey);

// ---------- ve x(n), y(n) va nang luong ----------
n3 = -N:2*N-1;                     // ve 3 chu ky
x3 = x(pmodulo(n3, N) + 1);
y3 = y_mat(pmodulo(n3, N) + 1);
n1 = 0:N-1;

scf(0); clf();
subplot(3,1,1);
stemplot(n3, x3, "x(n) tuan hoan, N = 5");
subplot(3,1,2);
stemplot(n3, y3, "y(n): tich chap vong 5 diem");
subplot(3,1,3);
plot(n1, cumsum(x.^2), "b-o", n1, cumsum(y_mat.^2), "r-s");
legend(["Nang luong tich luy x(n)", "Nang luong tich luy y(n)"], 2);
ttl = msprintf("Nang luong mot chu ky: Ex = %g, Ey = %g", Ex, Ey);
xtitle(ttl, "n", "E");
xgrid(color("grey"));

// xs2png(0, "D:\lab4\Lab4_Ex7.png");   // bo comment de luu hinh
