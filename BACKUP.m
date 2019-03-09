%%%%%%%%%%%%%%%%------------------BACKUP
function B=calcula_magnetico_rodar(a,b,D,P_des,I)

%   D -> distancia em z existente entre o centro da espira e a origem do
%                                                            referencial
format long

miu_0= 4*pi*1e-7;
x=P_des(1);
y=P_des(2);
z=P_des(3);

% funcoes obtidas atraves do myfun_2.m  !!!

F_1 = @(t) (cos(t).^2.*(z-D).^2+sin(t).^2.*(z-D).^2).^(1./2)./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2).^(3./2);
B_rho = quad(F_1,0,2*pi);

F_2 = @(t) (-sin(t).*(y-b.*sin(t))-cos(t).*(x-a.*cos(t)))./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2).^(3./2);
B_z = quad(F_2,0,2*pi);

c_a=x/(sqrt(x^2+y^2));
s_a=y/(sqrt(x^2+y^2));

B_x=B_rho*c_a;
B_y=B_rho*s_a;

B=[B_x B_y B_z]*(miu_0*I/(4*pi));

end






