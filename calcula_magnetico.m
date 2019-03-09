function B=calcula_magnetico(a,b,x,y,z,I)

% a=4;
% b=2;
% x=0;
% y=0;
% z=5;

format long

miu_0= 4*pi*1e-7;

% funcoes obtidas atraves do myfun.m  !!!

F_1 = @(t) b.*cos(t)./(a.^2.*sin(t).^2+b.^2.*cos(t).^2).^(1/2).*z./((x-a.*cos(t)).^2+b.^2.*sin(t).^2+z.^2).^(3/2);
B_x = quadl(F_1,0,2*pi);

F_2 = @(t) a.*sin(t)./(a.^2.*sin(t).^2+b.^2.*cos(t).^2).^(1/2).*z./((x-a.*cos(t)).^2+b.^2.*sin(t).^2+z.^2).^(3/2);
B_y = quadl(F_2,0,2*pi);

F_3 = @(t) -(a.*sin(t).*y-a.*b+b.*cos(t).*x)./(a.^2-a.^2.*cos(t).^2+b.^2.*cos(t).^2).^(1/2)./(x.^2-2.*x.*a.*cos(t)+a.^2.*cos(t).^2+b.^2-b.^2.*cos(t).^2+z.^2).^(3/2);
B_z = quadl(F_3,0,2*pi);

B=[B_x B_y B_z]*(miu_0*I/(4*pi));

end






