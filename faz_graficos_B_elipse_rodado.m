
clear all
clc

braco_x=0.25;
braco_y=0.15;
corrente=1;

P_centro=[0.1 0.2 0.3];
% P_centro=[0 0 0];
plano_paralelo=1;

g_inicial_x=P_centro(1)-0.4;
g_final_x=P_centro(1)+0.4;

g_inicial_y=P_centro(2)-0.4;
g_final_y=P_centro(2)+0.4;

g_inicial_z=P_centro(3)+0.01;
g_final_z=P_centro(3)+0.4;

gama=0.01;


%-----------------Plano de visualizacao yz -------------x=const-----------
        x=0;  
        y=g_inicial_y:gama:g_final_y;
        z=g_inicial_z:gama:g_final_z;
        [Y,Z]=meshgrid(y,z);
        [m,n]=size(Y);
        B=zeros(m,n);

        for i=1:1:m
            for j=1:1:n
                y=Y(i,j);
                z=Z(i,j);
                res=espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
                B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
            end
        end
        figure
        axis on;
        title('Campo magnético')
        surf(Y,Z,B)
        xlabel('Y');
        ylabel('Z');
        zlabel('Campo magnético');
%-------------------------------------------------------------------------

% %-----------------Plano de visualizacao xy ---------z=const---------------  
        x=g_inicial_x:gama:g_final_x;
        y=g_inicial_y:gama:g_final_y;
        z=0.1;    %   distancia a qual pretendemos visualizar o corte
        [X,Y]=meshgrid(x,y);
        [m,n]=size(Y);
        B=zeros(m,n);

        for i=1:1:m
            for j=1:1:n
                x=X(i,j);
                y=Y(i,j);
                res=espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
                B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
            end
        end
        
        figure
        title('Campo magnético')
        axis on;
        surf(X,Y,B)
        xlabel('X');
        ylabel('Y');
        zlabel('Campo magnético');
% %-------------------------------------------------------------------------
