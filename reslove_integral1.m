function B=calcula_magnetico(a,b,x,y,z)

% a=4;
% b=2;
% x=0;
% y=0;
% z=5;

F_1 = @(t) b*cos(t)./(a.^2*sin(t).^2+b.^2*cos(t).^2).^(1/2)*z./((x-a*cos(t)).^2+b.^2*sin(t).^2+z.^2).^(3/2);
B_x = quadl(F_1,0,2*pi);

F_2 = @(t) a*sin(t)./(a.^2*sin(t).^2+b.^2*cos(t).^2).^(1/2)*z./((x-a*cos(t)).^2+b.^2*sin(t).^2+z.^2).^(3/2);
B_x = quadl(F_2,0,2*pi);

F_3 = @(t) (-a*sin(t)./(a.^2*sin(t).^2+b.^2*cos(t).^2).^(1/2)*(y-b*sin(t))./((x-a*cos(t)).^2+b.^2*sin(t).^2+z.^2).^(1/2)-b*cos(t)./(a.^2*sin(t).^2+b.^2*cos(t).^2).^(1/2)*(x-a*cos(t))./((x-a*cos(t)).^2+b.^2*sin(t).^2+z.^2).^(1/2))./((x-a*cos(t)).^2+b.^2*sin(t).^2+z.^2);
B_x = quadl(F_3,0,2*pi);

B=[B_x B_y B_z]*(1);
end






