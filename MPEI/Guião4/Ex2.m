N = 1e4;

n = 1e6;
count = zeros(1, n);
hCodes = zeros(1, N);

for i = 1:N
    key = keysA(i);
    hCode = mod(string2hash(key),n) + 1;
    hCodes(key) = hCode;
    count(hCode) = count(hCode) + 1;
end

fig(1);
histogram(hCodes);