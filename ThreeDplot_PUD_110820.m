%0-start recording running time
tic

%0.1-read and store test case 12
clear;clc;close all;

% 110820-generate P range 7.00:0.01:28.00
P= zeros(2101,1);% since 2101 elements in range 7.00:0.01:28.00
k=1;
for j=7.00:0.01:28.00
    P(k)=j;
    k=k+1;
end

% 110820-generate U range lambda=27
U=zeros(2101,1);
lambda=27;
k=1;
for j=7.00:0.01:28.00
    U(k)=poissrnd(lambda);
    k=k+1;
end

% calculate D_SAV for each P,U pair
c=20;
d=100;
w_c=1.3;
q=2.62;
k=0.053;
w_W=39;
w_P=1.3;

D_SAV=zeros(2101,1);
s=1;
for j=7.00:0.01:28.00
    D_SAV(s)= (c*d*w_c*q-k*w_W*U(s))/(k*w_P*P(s)+c*w_c*q) ;
    s=s+1;
end

scatter3(P,U,D_SAV,'filled')
% scatter3(P,U,D_SAV,'.')
xlabel('Pijt');ylabel('Uijt');zlabel('D_{SAV}')

T = delaunay(P,U)
hold on
trimesh(T,P,U,D_SAV,"FaceAlpha",0)

% 3d plot
% [Pi,Ui]=meshgrid(P,U); 
% D_SAV= (c*d*w_c*q-k*w_W.*Ui)/(k*w_P.*Pi+c*w_c*q) ;
% D_SAV
% mesh(Pi,Ui,D_SAV)
% surf(Pi,Ui,D_SAV)
% grid on
% hold on



%0-end recording running time
toc