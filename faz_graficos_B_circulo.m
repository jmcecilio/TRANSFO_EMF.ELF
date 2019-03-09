
clear all
clc

braco_x=0.25;
braco_y=0.25;
corrente=1;

g_inicial_x=-0.4;
g_final_x=0.4;

g_inicial_y=-0.4;
g_final_y=0.4;

g_inicial_z=0.001;
g_final_z=0.4;

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
                res=calcula_magnetico_circulo(braco_x,braco_y,x,y,z,corrente);
                B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
            end
        end
        figure
        axis on;
        title('Campo magn�tico')
        surf(Y,Z,B)
        xlabel('Y');
        ylabel('Z');
        zlabel('Campo magn�tico');
% %-------------------------------------------------------------------------

%-----------------Plano de visualizacao xy ---------z=const---------------  
        x=g_inicial_x:gama:g_final_x;
        y=g_inicial_y:gama:g_final_y;
        z=0.3;    %   distancia a qual pretendemos visualizar o corte
        [X,Y]=meshgrid(x,y);
        [m,n]=size(Y);
        B=zeros(m,n);

        for i=1:1:m
            for j=1:1:n
                x=X(i,j);
                y=Y(i,j);
                res=calcula_magnetico_3_circulo(braco_x,braco_y,x,y,z,corrente);
                B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
            end
        end
        
        figure
        title('Campo magn�tico')
        axis on;
        surf(X,Y,B)
        xlabel('X');
        ylabel('Y');
        zlabel('Campo magn�tico');
%-------------------------------------------------------------------------
