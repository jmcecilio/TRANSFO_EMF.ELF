
clear all
clc

braco_x=0.15;
braco_y=0.10;
corrente=1;
N_espiras=6;
seccao_cabo=0.0015;

% P_centro=[0.1 0.2 0.3];
P_centro=[0 0 0];
plano_paralelo=1;

gama=0.01;

    g_inicial_x=-0.3;
    g_final_x=0.3;
    
    g_inicial_y=-0.3;
    g_final_y=0.3;
    
    g_inicial_z=-0.3;
    g_final_z=0.3;
    

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% plano_paralelo=1;
if plano_paralelo==1    %   espira paralela ao plano xy
    
    
    %-----------------Plano de visualizacao yz -------------x=const-----------
    x=P_centro(1);
    y=g_inicial_y:gama:g_final_y;
    z=g_inicial_z:gama:g_final_z;
    [Y,Z]=meshgrid(y,z);
    [m,n]=size(Y);
    B=zeros(m,n);

    for i=1:1:m
        for j=1:1:n
            y=Y(i,j);
            z=Z(i,j);
            res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,seccao_cabo);
            B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
        end
    end
    figure
    axis on;
    title('Campo magnético')
    surf(Y,Z,B)
    xlabel('Y');
    ylabel('Z');
    zlabel('Campo magnético [Tesla]');
    %--------------------------------------------------------------------------
    %-----------------Plano de visualizacao xy ---------z=const----------------
    x=g_inicial_x:gama:g_final_x;
    y=g_inicial_y:gama:g_final_y;
    z=P_centro(3)+0.1;    %   distancia a qual pretendemos visualizar o corte
    [X,Y]=meshgrid(x,y);
    [m,n]=size(Y);
    B=zeros(m,n);

    for i=1:1:m
        for j=1:1:n
            x=X(i,j);
            y=Y(i,j);
            res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,seccao_cabo);
            B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
        end
    end

    figure
    title('Campo magnético')
    axis on;
    surf(X,Y,B)
    xlabel('X');
    ylabel('Y');
    zlabel('Campo magnético [Tesla]');
    %--------------------------------------------------------------------------
    %--------------------------------------------------------------------------

% plano_paralelo=2;
elseif plano_paralelo==2    %   espira paralela ao plano xz
    
    %-----------------Plano de visualizacao xy -------------z=const------------
    x=g_inicial_x:gama:g_final_x;
    y=g_inicial_y:gama:g_final_y;
    z=P_centro(3);
    [X,Y]=meshgrid(x,y);
    [m,n]=size(X);
    B=zeros(m,n);

    for i=1:1:m
        for j=1:1:n
            x=X(i,j);
            y=Y(i,j);
            res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,seccao_cabo);%espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
            B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
        end
    end
    figure
    axis on;
    title('Campo magnético')
    surf(X,Y,B)
    xlabel('X');
    ylabel('Y');
    zlabel('Campo magnético [Tesla]');
    %--------------------------------------------------------------------------
    %-----------------Plano de visualizacao xz ---------y=const----------------
    x=g_inicial_x:gama:g_final_x;
    y=P_centro(2)+0.1;    %   distancia a qual pretendemos visualizar o corte
    z=g_inicial_z:gama:g_final_z;
    [X,Z]=meshgrid(x,z);
    [m,n]=size(X);
    B=zeros(m,n);

    for i=1:1:m
        for j=1:1:n
            x=X(i,j);
            z=Z(i,j);
            res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,seccao_cabo);%espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
            B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
        end
    end

    figure
    title('Campo magnético')
    axis on;
    surf(X,Z,B)
    xlabel('X');
    ylabel('Z');
    zlabel('Campo magnético [Tesla]');
    %--------------------------------------------------------------------------
    %--------------------------------------------------------------------------

% plano_paralelo=3;
elseif plano_paralelo==3

    %-----------------Plano de visualizacao xy -------------z=const-----------

    x=g_inicial_x:gama:g_final_x;
    y=g_inicial_y:gama:g_final_y;
    z=P_centro(3);
    [X,Y]=meshgrid(x,y);
    [m,n]=size(X);
    B=zeros(m,n);

    for i=1:1:m
        for j=1:1:n
            x=X(i,j);
            y=Y(i,j);
            res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,seccao_cabo);%espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
            B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
        end
    end
    figure
    axis on;
    title('Campo magnético')
    surf(X,Y,B)
    xlabel('X');
    ylabel('Y');
    zlabel('Campo magnético [Tesla]');
    %-------------------------------------------------------------------------

    % %-----------------Plano de visualizacao yz ---------x=const---------------
    x=P_centro(1)+0.1;
    y=g_inicial_y:gama:g_final_y;    %   distancia a qual pretendemos visualizar o corte
    z=g_inicial_z:gama:g_final_z;
    [Y,Z]=meshgrid(y,z);
    [m,n]=size(Y);
    B=zeros(m,n);

    for i=1:1:m
        for j=1:1:n
            y=Y(i,j);
            z=Z(i,j);
            res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,seccao_cabo);%espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
            B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
        end
    end

    figure
    title('Campo magnético')
    axis on;
    surf(Y,Z,B)
    xlabel('Y');
    ylabel('Z');
    zlabel('Campo magnético [Tesla]');
%--------------------------------------------------------------------------

end
