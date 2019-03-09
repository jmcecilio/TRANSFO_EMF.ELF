function B=campo_cabo(x2,y2,z2,I)

% clc
% clear all

% % I=20*exp(complex(0,deg2rad(-120)));
% % comp=1000;  % comprimento do cabo!!!  em metros!!!
% 
% 
% %--------------------------------------------------------------------------
% % Simula campo magnético de um cabo situado ao longo de yy para x=49cm e z=0
% %--------------------------------------------------------------------------
% 
% syms dx dy dz x x2 y y2 z z2 t
% 
% x=0.49; y=t; z=0;
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
% 
% 

%--------------------------------------------------------------
%                            TESTE
% x2=0.245;
% y2=0.1;
% z2=0.04;
% I=1;


F_1= @(t)  1000000.*z2./(10000.*x2.^2-9800.*x2+2401+10000.*y2.^2-20000.*y2.*t+10000.*t.^2+10000.*z2.^2).^(3/2);
B_x=1e-7*I*quadl(F_1,0,0.245) 
% B_x=0;

% F_2= @(t) (-z2./(x2.^2-2.*x2.*t+t.^2+y2.^2+z2.^2).^(3/2));
% B_y=1e-7*I*quadl(F_2,0,0.245);
B_y=0;

F_3= @(t) 1000000*(49/100-x2)./(10000.*x2.^2-9800.*x2+2401+10000.*y2.^2-20000.*y2.*t+10000.*t.^2+10000.*z2.^2).^(3/2);
B_z=1e-7*I*quadl(F_3,0,0.245);

B=[B_x B_y B_z];
%--------------------------- FIM DE TESTE ---------------------------------
end