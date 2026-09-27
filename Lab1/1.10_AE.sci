F1_10 = 300; F2_10 = 900;
bit_rate = 10000; // 10,000 bits/s
levels = 1024;    // 1024 mức lượng tử
Fmax_10 = max(F1_10, F2_10);

bits_per_sample = log2(levels);
Fs_10 = bit_rate / bits_per_sample;
F_fold_10 = Fs_10 / 2;

disp("(a) Tần số lấy mẫu Fs (Hz): " + string(Fs_10));
disp("(a) Tần số gấp F_fold (Hz): " + string(F_fold_10));
disp("(b) Tốc độ Nyquist (Hz): " + string(2 * Fmax_10));

w1_10 = (2 * %pi * F1_10) / Fs_10;
w2_10 = (2 * %pi * F2_10) / Fs_10;
w2_10_alias = w2_10 - 2*%pi; // Tính alias vì > pi

disp("(c) Tần số rời rạc w1 (rad): " + string(w1_10) + " (tương đương 3pi/5)");
disp("(c) Tần số rời rạc w2 bị chồng phổ thành (rad): " + string(w2_10_alias) + " (tương đương -pi/5)");

// Tính độ phân giải Delta
X_max = 3 + 2;
X_min = -3 - 2;
dynamic_range = X_max - X_min;
delta = dynamic_range / levels;
disp("(d) Độ phân giải Delta (V): " + string(delta));
