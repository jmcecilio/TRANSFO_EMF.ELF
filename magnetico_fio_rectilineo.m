clc
clear all

% I=20*exp(complex(0,deg2rad(-120)));
% comp=1000;  % comprimento do cabo!!!  em metros!!!

%--------------------------------------------------------------------------
% Simula campo magnético de um cabo situado ao longo de yy para x=a e z=b
%--------------------------------------------------------------------------

% syms dx dy dz x x2 y y2 z z2 t a b
% 
% x=a; y=t; z=b;
% dx=diff(x,t);  dy=diff(y,t);  dz=diff(z,t);
% dl=[dx dy dz];
% 
% 
% vec_r=[x2-x y2-y z2-z];
% norm_r=sqrt(vec_r(1)^2+vec_r(2)^2+vec_r(3)^2);
% 
% prod_vec=cross(dl,vec_r);
% 
% F=prod_vec/norm_r^3


%--------------------------------------------------------------------------
% Simula campo magnético de um cabo situado ao longo de xx para y=e e z=f
%--------------------------------------------------------------------------

syms dx dy dz x x2 y y2 z z2 t e f

x=t; y=e; z=f;
dx=diff(x,t);  dy=diff(y,t);  dz=diff(z,t);
dl=[dx dy dz];


vec_r=[x2-x y2-y z2-z];
norm_r=sqrt(vec_r(1)^2+vec_r(2)^2+vec_r(3)^2);

prod_vec=cross(dl,vec_r)

F=prod_vec/norm_r^3

int(F(t))






%-----------------------------------------------------------------------
% clc
% syms comp a b x1 y1 z1 x2 y2 z2 t rho D;
% %miu_zero=4*pi*1e-7;
% P1=[x1 y1 z1];
% P2=[x2 y2 z2];  % ponto onde queremos medir o campo magnetico
% 
% vector_r=P2-P1;
% 
% dl=[0 comp 0];
% 
% prod_vect=cross(dl,vector_r);  %   certo
% r=sqrt(vector_r(1)^2+vector_r(2)^2+vector_r(3)^2); 
% 
% 
% B_x=(prod_vect(1)/(r^3))*1e-7
% % B_y=(prod_vect(2)/(r^3))*1e-7
% B_z=(prod_vect(3)/(r^3))*1e-7
% 
