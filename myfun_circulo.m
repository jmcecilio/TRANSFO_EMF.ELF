clc

syms a b x y z t rho D R;
% syms t;

% a=4;
% b=2;
% x=0;
% y=0;
% z=5;

dl=[-sin(t), cos(t), 0];

fasor_r=[x-R*cos(t), y-R*sin(t), z-D];

prod_vect_1=cross(dl,fasor_r);  %   certo

r_2=fasor_r(1)^2+fasor_r(2)^2+fasor_r(3)^2; % segunda hipotese com r_2 correcto

parte_rho=sqrt(prod_vect_1(1)^2+prod_vect_1(2)^2);

f_1=(parte_rho/r_2)

f_2=(prod_vect_1(3)/r_2)

