function B=campo_cabo(x2,y2,z2,I,a,b,c,d,e,f,g,h,eixo)

% x2=0.245;
% y2=0.1;
% z2=0.04;
% I=1;

% expressoes obtidas atraves da funcao magnetico_fio_rectilineo

if eixo==1  %eixo do cabo paralelo a yy

    % a=0.49;  % posicao x do cabo
    % b=0;     % posicao z do cabo
    % c=0;     % posicao y inicial do cabo
    % d=0.245; % posicao y final do cabo

    F_1= @(t)  (z2-b)./(x2^2-2*x2*a+a^2+y2^2-2*y2.*t+t.^2+z2^2-2*z2*b+b^2).^(3/2);
    B_x=1e-7*I*quadl(F_1,c,d);
    % B_x=0;

    % F_2= @(t) (-z2./(x2.^2-2.*x2.*t+t.^2+y2.^2+z2.^2).^(3/2));
    % B_y=1e-7*I*quadl(F_2,0,0.245);
    B_y=0;

    F_3= @(t) (-x2+a)./(x2^2-2*x2*a+a^2+y2^2-2*y2.*t+t.^2+z2^2-2*z2*b+b^2).^(3/2);
    B_z=1e-7*I*quadl(F_3,c,d);

    B=[B_x B_y B_z];

    % B_mod1=sqrt(B_x^2+B_y^2+B_z^2)
    % B_mod2=1e-7*I/(2*pi*sqrt((x2-a)^2+(z2-b)^2))

elseif eixo==2  %eixo do cabo paralelo a xx
    
%     F_1= @(t)  (z2-b)./(x2^2-2*x2*a+a^2+y2^2-2*y2.*t+t.^2+z2^2-2*z2*b+b^2).^(3/2);
%     B_x=1e-7*I*quadl(F_1,e,f);
    B_x=0;

    F_2= @(t) (-z2+f)./(x2^2-2*x2.*t+t.^2+y2^2-2*y2*e+e^2+z2^2-2*z2*f+f^2).^(3/2);
    B_y=1e-7*I*quadl(F_2,g,h);
%     B_y=0;

    F_3= @(t) (y2-e)./(x2^2-2*x2.*t+t.^2+y2^2-2*y2*e+e^2+z2^2-2*z2*f+f^2).^(3/2);
    B_z=1e-7*I*quadl(F_3,g,h);

    B=[B_x B_y B_z];

end

%--------------------------- FIM DE TESTE ---------------------------------
end