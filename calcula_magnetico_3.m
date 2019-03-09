function B=calcula_magnetico_3(a,b,x,y,z,I)

% a=4;
% b=2;
% x=0;
% y=0;
% z=5;

format long

% syms t

miu_0= 4*pi*1e-7;
D=0;
% erro=0.01;
% rho=sqrt(x^2+y^2);
% R=sqrt((a*cos(t))^2+(b*sin(t))^2);


% funcoes obtidas atraves do myfun_2.m  !!!

F_1 = @(t) (cos(t).^2.*(z-D).^2+sin(t).^2.*(z-D).^2).^(1./2)./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2).^(3./2);
B_rho = quadl(F_1,0,2*pi);
% B_rho_1 = quadl(F_1,erro,pi/2-erro);
% B_rho_2 = quadl(F_1,pi/2+erro,pi-erro);
% B_rho_3 = quadl(F_1,pi+erro,3*pi/2-erro);
% B_rho_4 = quadl(F_1,3*pi/2+erro,2*pi-erro);
% B_rho=B_rho_1+B_rho_2+B_rho_3+B_rho_4;


F_2 = @(t) (-sin(t).*(y-b.*sin(t))-cos(t).*(x-a.*cos(t)))./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2).^(3./2);
B_z = quadl(F_2,0,2*pi);
% B_z_1 = quadl(F_2,erro,pi/2-erro);
% B_z_2 = quadl(F_2,pi/2+erro,pi-erro);
% B_z_3 = quadl(F_2,pi+erro,3*pi/2-erro);
% B_z_4 = quadl(F_2,3*pi/2+erro,2*pi-erro);
% B_z=B_z_1+B_z_2+B_z_3+B_z_4;


c_a=x/(sqrt(x^2+y^2));
s_a=y/(sqrt(x^2+y^2));

B_x=B_rho*c_a;
B_y=B_rho*s_a;


B=[B_x B_y B_z]*(miu_0*I/(4*pi));

end






