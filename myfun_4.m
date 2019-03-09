%               13/5/2008

clc

syms a b x y z t rho D;
% syms t;

% a=4;
% b=2;
% x=0;
% y=0;
% z=5;

% dl=[-sin(t), cos(t), 0];
dl=[-a*sin(t), b*cos(t), 0];

vector_r=[x-a*cos(t), y-b*sin(t), z-D];
r=sqrt(vector_r(1)^2+vector_r(2)^2+vector_r(3)^2); 
% fasor_r=vector_r/r; % vector unitario
% prod_vect=cross(dl,fasor_r);  %   certo
prod_vect=cross(dl,vector_r);  %   certo
parte_rho=sqrt(prod_vect(1)^2+prod_vect(2)^2);

f_1=parte_rho/(r^3)

f_2=prod_vect(3)/(r^3)
