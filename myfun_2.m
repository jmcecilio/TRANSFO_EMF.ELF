clc

syms a b x y z t rho D;
% syms t;

% a=4;
% b=2;
% x=0;
% y=0;
% z=5;

dl=[-sin(t), cos(t), 0];

vector_r=[x-a*cos(t), y-b*sin(t), z-D];

prod_vect_1=cross(dl,vector_r);  %   certo

r=sqrt(vector_r(1)^2+vector_r(2)^2+vector_r(3)^2); 

parte_rho=sqrt(prod_vect_1(1)^2+prod_vect_1(2)^2);

f_1=(parte_rho/(r^3))

f_2=(prod_vect_1(3)/(r^3))

