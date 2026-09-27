F1_9 = 240; F2_9 = 360; 
Fs_9 = 600;
Fmax_9 = max(F1_9, F2_9);

disp("(a) Tốc độ Nyquist (Hz): " + string(2 * Fmax_9));
disp("(b) Tần số gấp (Hz): " + string(Fs_9 / 2));

w1_9 = (2 * %pi * F1_9) / Fs_9;
w2_9 = (2 * %pi * F2_9) / Fs_9;
// Tính tần số alias cho w2_9 (vì w2_9 > pi)
w2_alias = w2_9 - 2*%pi; 

disp("(c) Tần số rời rạc w1 (rad): " + string(w1_9) + " (tương đương 4pi/5)");
disp("(c) Tần số rời rạc w2 bị chồng phổ thành (rad): " + string(w2_alias) + " (tương đương -4pi/5)");
