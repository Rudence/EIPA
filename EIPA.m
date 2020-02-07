% Rudi Hidvary
% 101037815 

clear
clc
close all

% Simulation Parameters 
L = 50; % Length of the spatial region
W = 50; % Width or height ofthe spatial region
V0 = 10; % Initial Voltage applied 
gnd = -10; % Ground voltage for easier reading of code 

% Matrix Definitions and sizing 
G = sparse(W*L,W*L);
B = zeros(W*L,1);
space = zeros(W,L);

% Loop used to initialize the matrix G and B to find V vector 
for x = 1:L
    for y = 1:W
        n = (x-1)*W+y;
        nxm = (x-2)*W+y;
        nxp = (x)*W+y;
        nym = (x-1)*W+(y-1);
        nyp = (x-1)*W+(y+1);         
        G(n,n) = 1;
        if(x == 1)
            B(n,1) = gnd;
            space(y,x) = gnd;
        elseif(x == L)
            B(n,1) = gnd;
            space(y,x) = gnd;
        elseif(y == 1)
            B(n,1) = gnd;
            space(y,x) = gnd;
        elseif(y == W)
            B(n,1) = gnd;
            space(y,x) = gnd;
        elseif(x >= 10 && x <=20 && y >= 10 && y <= 20)
            G(n,n) = -2;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
            B(n,1) = 0;
        else
            G(n,n) = -4;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
            B(n,1) = 0;
        end
    end
end

figure(1)
spy(G)
[E, D] = eigs(G,9,'SM')


% A = diag(D)
% figure(2)
% plot(9,A)

map1 = zeros(W,L);
map2 = zeros(W,L);
map3 = zeros(W,L);
map4 = zeros(W,L);
map5 = zeros(W,L);
map6 = zeros(W,L);
map7 = zeros(W,L);
map8 = zeros(W,L);
map9 = zeros(W,L);

for x = 1:L
    for y = 1:W
        n = (x-1)*W+y;
        map1(y,x) = E(n,1);
        map2(y,x) = E(n,2);
        map3(y,x) = E(n,3);
        map4(y,x) = E(n,4);
        map5(y,x) = E(n,5);
        map6(y,x) = E(n,6);
        map7(y,x) = E(n,7);
        map8(y,x) = E(n,8);
        map9(y,x) = E(n,9);
    end
end

figure(2)
subplot(3,3,1)
surf(map1)
subplot(3,3,2)
surf(map2)
subplot(3,3,3)
surf(map3)
subplot(3,3,4)
surf(map4)
subplot(3,3,5)
surf(map5)
subplot(3,3,6)
surf(map6)
subplot(3,3,7)
surf(map7)
subplot(3,3,8)
surf(map8)
subplot(3,3,9)
surf(map9)

% figure(3)
% surf(E)