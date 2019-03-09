%--------------------------------------------------------------------------
% para verificar qual dos algoritmos de integraçao tem melhores resultados
%           quad, quadl e quadv
%--------------------------------------------------------------------------


clear all
clc

format long

braco_x=0.25;
braco_y=0.15;
corrente=1;

g_inicial_x=-0.4;
g_final_x=0.4;

g_inicial_y=-0.4;
g_final_y=0.4;

g_inicial_z=0.01;
g_final_z=0.4;

gama=0.01;


%-----------------Plano de visualizacao yz -------------x=const-----------
        x=0;  
        y=g_inicial_y:gama:g_final_y;
        z=g_inicial_z:gama:g_final_z;
        [w,m]=size(y);
        [w,n]=size(z);
        B_x_const=zeros(m,n,3);
        for i=1:1:m
            for j=1:1:n
                res=calcula_magnetico_quad(braco_x,braco_y,x,y(i),z(j),corrente);
                B_x_const(i,j,1)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
                res=calcula_magnetico_quadl(braco_x,braco_y,x,y(i),z(j),corrente);
                B_x_const(i,j,2)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
                res=calcula_magnetico_quadv(braco_x,braco_y,x,y(i),z(j),corrente);
                B_x_const(i,j,3)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
                
            end
        end
%         figure
%         axis on;
%         title('Campo magnético')
%         surf(Y,Z,B)
%         xlabel('Y');
%         ylabel('Z');
%         zlabel('Campo magnético');
%-------------------------------------------------------------------------

%-----------------Plano de visualizacao xy ---------z=const---------------  
        x=g_inicial_x:gama:g_final_x;
        y=g_inicial_y:gama:g_final_y;
        z=0.1;    %   distancia a qual pretendemos visualizar o corte
        [w,m]=size(x);
        [w,n]=size(y);
        B_z_const=zeros(m,n,3);
        for i=1:1:m
            for j=1:1:n
                res=calcula_magnetico_quad(braco_x,braco_y,x(i),y(j),z,corrente);
                B_z_const(i,j,1)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
                res=calcula_magnetico_quadl(braco_x,braco_y,x(i),y(j),z,corrente);
                B_z_const(i,j,2)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
                res=calcula_magnetico_quadv(braco_x,braco_y,x(i),y(j),z,corrente);
                B_z_const(i,j,3)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
                
            end
        end

        
%         figure
%         title('Campo magnético')
%         axis on;
%         surf(X,Y,B)
%         xlabel('X');
%         ylabel('Y');
%         zlabel('Campo magnético');
%-------------------------------------------------------------------------
