// ===== Exercise 5 : vi du xu ly anh =====
// atomsInstall("IPCV"); atomsLoad("IPCV");   // chay 1 lan
clc; clear;

// hien thi anh xam (gia tri 0..255)
function showgray(I, ttl)
    J = uint8(max(0, min(255, round(I))));
    Matplot(cat(3, J, J, J));            // anh RGB uint8, khong phu thuoc color_map
    a = gca(); a.isoview = "on";
    a.axes_visible = ["off", "off", "off"];
    xtitle(ttl);
endfunction

// histogram 256 muc xam
function h = histo256(I)
    h = zeros(1, 256);
    for k = 0:255
        h(k+1) = sum(I == k);
    end
endfunction

// ---------- doc anh, chuyen sang anh xam ----------
img = imread("C:\Users\Admin\OneDrive\Pictures\Screenshots\Screenshot 2026-11-04 133246.png");
if size(img, 3) == 3 then
    I = 0.299*double(img(:,:,1)) + 0.587*double(img(:,:,2)) ..
      + 0.114*double(img(:,:,3));
else
    I = double(img);
end
I = round(I);
[M, N] = size(I);

// ---------- histogram va can bang histogram ----------
h   = histo256(I);
cdf = cumsum(h) / (M*N);
map = round(255 * cdf);
Ieq = matrix(map(I(:) + 1), M, N);
heq = histo256(Ieq);

// ---------- lam mo bang loc trung binh 5x5 ----------
Ib = conv2(I, ones(5,5)/25, "same");

// ---------- thuy van an LSB ----------
[c, r] = meshgrid(1:N, 1:M);
W  = bool2s(modulo(floor(r/32) + floor(c/32), 2) == 0);  // logo ban co
Iw = I - modulo(I, 2) + W;
We = modulo(Iw, 2);                                       // trich xuat
mse  = mean((I - Iw).^2);
psnr = 10*log10(255^2 / mse);
mprintf("Trich xuat dung thuy van: %s, PSNR = %.2f dB\n", ..
        string(isequal(We, W)), psnr);

// ---------- thuy van hien thi (tron alpha) ----------
alpha = 0.25;
Iv = (1 - alpha)*I + alpha*255*W;

// ---------- hien thi ----------
scf(0); clf();
subplot(2,2,1); showgray(I,   "Anh goc");
subplot(2,2,2); plot2d3(0:255, h);   xtitle("Histogram anh goc", "Muc xam", "So diem anh");
subplot(2,2,3); showgray(Ieq, "Anh sau can bang histogram");
subplot(2,2,4); plot2d3(0:255, heq); xtitle("Histogram sau can bang", "Muc xam", "So diem anh");

scf(1); clf();
subplot(2,2,1); showgray(Ib,      "Lam mo (trung binh 5x5)");
subplot(2,2,2); showgray(Iw,      "Thuy van an LSB");
subplot(2,2,3); showgray(255*We,  "Thuy van trich xuat");
subplot(2,2,4); showgray(Iv,      "Thuy van hien thi (alpha = 0.25)");
