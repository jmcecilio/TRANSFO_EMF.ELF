clc
clear all

I=20*exp(complex(0,deg2rad(-120)));
comp=1000;  % comprimento do cabo!!!  em metros!!!


%--------------------------------------------------------------------------
% Simula campo magnético de um cabo situado ao longo de xx para y=0 e z=0
%--------------------------------------------------------------------------

syms dx dy dz x x2 y y2 z z2 t
A=1;
B=0;

x=t; y=0; z=0;
dx=diff(x,t);  dy=diff(y,t);  dz=diff(z,t);
dl=[dx dy dz];


vec_r=[x2-x y2-y z2-z];
norm_r=sqrt(vec_r(1)^2+vec_r(2)^2+vec_r(3)^2);

prod_vec=cross(dl,vec_r);

F=prod_vec/norm_r^3;



%--------------------------------------------------------------
%                            TESTE
x2=2;
y2=1;
z2=1;

% F_1= @(t) ;
% B_x=1e-7*I*quadl(F_1,0,1) 
B_x=0;

F_2= @(t) (-z2./(x2.^2-2.*x2.*t+t.^2+y2.^2+z2.^2).^(3/2));
B_y=1e-7*I*quadl(F_2,-comp,comp);

F_3= @(t) (y2./(x2.^2-2.*x2.*t+t.^2+y2.^2+z2.^2).^(3/2));
B_z=1e-7*I*quadl(F_3,-comp,comp);

B=[B_x B_y B_z]
%--------------------------- FIM DE TESTE ---------------------------------
