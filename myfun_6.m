clc
syms a b x y z t rho D;
%-------------versao3---------------------------------------------
P_bob=[a*cos(t) b*sin(t) D];
P_calcular=[x y z];

vector_r=P_calcular-P_bob;
% vector_r=[a*cos(t)-x, b*sin(t)-y, D-z];

dl=diff([a*cos(t) b*sin(t) 0])
% dl=[-a*sin(t), b*cos(t), 0];
% dl=[-b*sin(t), a*cos(t), 0];

r=sqrt(vector_r(1)^2+vector_r(2)^2+vector_r(3)^2); 
prod_vect=cross(dl,vector_r);  %   certo
f_x=(prod_vect(1)/(r^3))
f_y=(prod_vect(2)/(r^3))
f_z=(prod_vect(3)/(r^3))

