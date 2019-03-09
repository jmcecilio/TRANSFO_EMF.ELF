function f_t = myfun(t) 

a=4;
b=2;
x=0;
y=0;
z=5;

r=sqrt((x-a*cos(t))^2+(b*sin(t))^2+z^2);

u_r=[x-a*cos(t), y-b*sin(t), z]/r;

u_t=[-a*sin(t), b*cos(t) 0]/(sqrt((-a*sin(t))^2+(b*cos(t))^2));

prod_vect_1=cross(u_t,u_r); % devolve o produto escalar do vector u_r com o u_t

f_t=(prod_vect_1/(r^2));

% integral_1=int(f(1),t,-pi,pi)

% fun=f(1);
% integral_2=quadl(fun,-pi,pi);

end








