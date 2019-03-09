function B=calcula_magnetico_rodar(a,b,D,P_des,I)

%   D -> distancia em z existente entre o centro da espira e a origem do
%                                                            referencial
format long
symvar t;
% miu_0= 4*pi*1e-7;
x=P_des(1);
y=P_des(2);
z=P_des(3);
B_x=0;
B_y=0;
B_z=0;

%-------------------1ªalternativa------------------------------------------
% % funcoes obtidas atraves do myfun_5.m  !!!
% F_1 = @(t) (b.^2.*cos(t).^2.*(z-D).^2+a.^2.*sin(t).^2.*(z-D).^2).^(1/2)./((x-a*cos(t)).^2+(y-b*sin(t)).^2+(z-D)^2).^(3/2);
% % F_1 = @(t) (b.^2.*cos(t).^2.*(z-D).^2./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2)+a.^2.*sin(t).^2.*(z-D).^2./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2)).^(1./2)./((x-a.*cos(t)).^2+(y-b*sin(t)).^2+(z-D).^2);
% B_rho = quad(F_1,0,2.*pi);
% 
% F_2 = @(t) (-a*sin(t).*(y-b*sin(t))-b*cos(t).*(x-a*cos(t)))./((x-a*cos(t)).^2+(y-b*sin(t)).^2+(z-D)^2).^(3/2);
% % F_2 = @(t) (-a.*sin(t).*(y-b.*sin(t))./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2).^(1./2)-b.*cos(t).*(x-a.*cos(t))./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2).^(1./2))./((x-a.*cos(t)).^2+(y-b.*sin(t)).^2+(z-D).^2);
% B_z = quad(F_2,0,2*pi)*I*1e-7;
% 
% c_a=x/(sqrt(x^2+y^2));
% s_a=y/(sqrt(x^2+y^2));
% 
% B_x=B_rho*c_a*I*1e-7;
% B_y=B_rho*s_a*I*1e-7;% ver melhor!!!!!!!!!!!!!


%-------------------2ªalternativa-----------------------------------------

F_x = @(t) b*cos(t).*(z-D)./((x-a*cos(t)).^2+(y-b*sin(t)).^2+(z-D)^2).^(3/2);
B_x = quad(F_x,0,2*pi,1e-8);
% B_x = quad(F_x,0,pi,1e-8);
% B_x =B_x + quad(F_x,pi,2*pi,1e-8);

F_y = @(t) a*sin(t).*(z-D)./((x-a*cos(t)).^2+(y-b*sin(t)).^2+(z-D)^2).^(3/2);
B_y = quad(F_y,0,2*pi,1e-8);
% B_y = quad(F_y,0,pi,1e-8);
% B_y =B_y + quad(F_y,pi,2*pi,1e-8);

F_z = @(t) (-a*sin(t).*(y-b*sin(t))-b*cos(t).*(x-a*cos(t)))./((x-a*cos(t)).^2+(y-b*sin(t)).^2+(z-D)^2).^(3/2);
B_z = quad(F_z,0,2*pi,1e-8);
% B_z = quad(F_z,0,pi,1e-8);
% B_z =B_z + quad(F_z,pi,2*pi,1e-8);

%-------------------3ªalternativa------------------------------------------
% F_x = @(t) a*cos(t).*(D-z)./((-x+a*cos(t)).^2+(b*sin(t)-y).^2+(D-z)^2).^(3/2);
% B_x = quad(F_x,0,2*pi,1e-8);
% 
% F_y = @(t) b*sin(t).*(D-z)./((-x+a*cos(t)).^2+(b*sin(t)-y).^2+(D-z)^2).^(3/2);
% B_y = quad(F_y,0,2*pi,1e-8);
% 
% F_z = @(t) (-b*sin(t).*(b*sin(t)-y)-a*cos(t).*(-x+a*cos(t)))./((-x+a*cos(t)).^2+(b*sin(t)-y).^2+(D-z)^2).^(3/2);
% B_z = quad(F_z,0,2*pi,1e-8);
%-------------------------------------------------------------------------

B=[B_x B_y B_z]*I*1e-7;

end