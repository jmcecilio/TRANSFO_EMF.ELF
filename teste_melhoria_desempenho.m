%--------------------------------------------------------------------------
% resultado obtido com o primeiro script
% >> calcula_magnetico_3(0.25,0.15,1,3,3,3)
% 
% ans =
% 
%   1.0e-007 *
% 
%    0.21578935845396   0.64736807536189   0.01676819485440
%--------------------------------------------------------------------------

format long

miu_0= 4*pi*1e-7;
D=0;
a=0.25;
b=0.15;
I=1;

x=3;
y=3;
z=3;

t=0;
B_rho_1=2*(cos(t)^2*(z-D)^2+sin(t)^2*(z-D)^2)^(1/2)*(2*x-2*a*cos(t))/(4*y^2-8*y*b*sin(t)+4*b^2*sin(t)^2+4*z^2-8*z*D+4*D^2)/(x^2-2*x*a*cos(t)+a^2*cos(t)^2+y^2-2*y*b*sin(t)+b^2*sin(t)^2+z^2-2*z*D+D^2)^(1/2);
B_z_1=(-sin(t)*y*x+sin(t)*y*a*cos(t)+b*x-b*x*cos(t)^2-b*a*cos(t)+b*a*cos(t)^3+cos(t)*b^2-cos(t)^3*b^2+cos(t)*z^2+cos(t)*y^2-2*cos(t)*y*b*sin(t)-2*cos(t)*z*D+cos(t)*D^2)/(-2*y*b*sin(t)+b^2-b^2*cos(t)^2+y^2+D^2+z^2-2*z*D)/(x^2-2*x*a*cos(t)+a^2*cos(t)^2+y^2-2*y*b*sin(t)+b^2-b^2*cos(t)^2+z^2-2*z*D+D^2)^(1/2);

t=2*pi;
B_rho_2=2*(cos(t)^2*(z-D)^2+sin(t)^2*(z-D)^2)^(1/2)*(2*x-2*a*cos(t))/(4*y^2-8*y*b*sin(t)+4*b^2*sin(t)^2+4*z^2-8*z*D+4*D^2)/(x^2-2*x*a*cos(t)+a^2*cos(t)^2+y^2-2*y*b*sin(t)+b^2*sin(t)^2+z^2-2*z*D+D^2)^(1/2);
B_z_2=(-sin(t)*y*x+sin(t)*y*a*cos(t)+b*x-b*x*cos(t)^2-b*a*cos(t)+b*a*cos(t)^3+cos(t)*b^2-cos(t)^3*b^2+cos(t)*z^2+cos(t)*y^2-2*cos(t)*y*b*sin(t)-2*cos(t)*z*D+cos(t)*D^2)/(-2*y*b*sin(t)+b^2-b^2*cos(t)^2+y^2+D^2+z^2-2*z*D)/(x^2-2*x*a*cos(t)+a^2*cos(t)^2+y^2-2*y*b*sin(t)+b^2-b^2*cos(t)^2+z^2-2*z*D+D^2)^(1/2);


B_rho=B_rho_2-B_rho_1;
B_z=B_z_2-B_z_1;

c_a=x/(sqrt(x^2+y^2));
s_a=y/(sqrt(x^2+y^2));

B_x=B_rho*c_a;
B_y=B_rho*s_a;


B=[B_x B_y B_z]*(miu_0*I/(4*pi))



