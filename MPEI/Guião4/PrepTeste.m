%% 
clc; clear;

T = [ 0.7   0.8 
      0.3   0.2];
V0 = [ 1 0 ]';

V2 = T^2 * V0;
Pa = V2(1)

V0 = [ 0 1 ]';
V2 = T^2 * V0;
Pb = V2(1)

V0 = [ 1 0 ]';
V29 = T^29 * V0;
Pc = V29(1)

V0 = [ 0.85 0.15 ]';
n = 30;
P = zeros(n, 1);
P(1) = V0(2);

for k = 1:n-1
    V = T^k * V0;
    P(k+1) = V(2);
end

plot((1:30), P);

%% 
clc; clear;

