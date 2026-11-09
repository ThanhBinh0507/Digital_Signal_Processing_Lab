// ===== Exercise 6 : tich chap tuyen tinh =====
clc; clear;

// ---------- ham ve tin hieu roi rac dang stem ----------
function stemplot(n, y, ttl)
    plot2d3(n, y, style=2);
    plot2d(n, y, style=-9);
    xtitle(ttl, "n", "");
    a = gca();
    a.x_location = "origin";
    a.data_bounds = [min(n)-1, min([y 0])-0.5; max(n)+1, max([y 0])+0.5];
    xgrid(color("grey"));
endfunction

// ---------- phuong phap lat - dich ----------
// y(n) = sum_k h(k) x(n-k), x va h bat dau tai n = 0
function y = conv_fold(x, h)
    Nx = length(x); Nh = length(h); Ny = Nx + Nh - 1;
    y = zeros(1, Ny);
    for n = 0:Ny-1                     // dich x(-k) di n mau
        s = 0;
        for k = 0:Nh-1
            m = n - k;                 // chi so cua x(n-k)
            if m >= 0 & m < Nx then
                s = s + h(k+1) * x(m+1);
            end
        end
        y(n+1) = s;
    end
endfunction

// ---------- phuong phap ma tran ----------
function [y, X] = conv_matrix(x, h)
    Nx = length(x); Nh = length(h); Ny = Nx + Nh - 1;
    X = zeros(Ny, Nh);                 // ma tran Toeplitz X(n,k) = x(n-k)
    for n = 0:Ny-1
        for k = 0:Nh-1
            m = n - k;
            if m >= 0 & m < Nx then
                X(n+1, k+1) = x(m+1);
            end
        end
    end
    y = (X * h(:))';
endfunction

// ---------- du lieu ----------
x = [1 2 -3 2 1];        // x(n), goc tai n = 0
h = [1 0 -1];            // h(n), goc tai n = 0

// ---------- tinh toan ----------
y_fold = conv_fold(x, h);
disp("y (lat - dich) = "); disp(y_fold);

[y_mat, X] = conv_matrix(x, h);
disp("Ma tran X = "); disp(X);
disp("y (ma tran) = "); disp(y_mat);

disp("Hai phuong phap trung nhau? "); disp(isequal(y_fold, y_mat));
disp("Khop voi convol? ");            disp(isequal(y_fold, convol(h, x)));

// ---------- nang luong ----------
nx = 0:length(x)-1;
ny = 0:length(y_mat)-1;
Ex = sum(x.^2);
Ey = sum(y_mat.^2);
mprintf("Ex = %g, Ey = %g\n", Ex, Ey);

// ---------- ve x(n), y(n) va nang luong ----------
scf(0); clf();
subplot(3,1,1); stemplot(nx, x,     "x(n)");
subplot(3,1,2); stemplot(ny, y_mat, "y(n) = x(n) * h(n)");
subplot(3,1,3);
plot(nx, cumsum(x.^2), "b-o", ny, cumsum(y_mat.^2), "r-s");
legend(["Nang luong tich luy cua x(n)", "Nang luong tich luy cua y(n)"], 4);
xtitle(msprintf("Nang luong: Ex = %g, Ey = %g", Ex, Ey), "n", "E");
xgrid(color("grey"));
