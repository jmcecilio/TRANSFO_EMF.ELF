%   grelha 7x7cm

clear all
clc

format long

braco_x=0.10;
braco_y=0.10;
corrente=0.5;
N_espiras=16;
seccao_cabo=1.5e-6;   %   1,5mm^2;
raio_cabo=sqrt(seccao_cabo/pi);

% P_centro=[0.1 0.2 0.3];
P_centro=[0.245 0.245 -N_espiras*raio_cabo]; % para a bobine ficar � face do plano!
plano_paralelo=1;

gama=0.07; % gama de 7cm
g_inicial=0.07;
g_final=0.42;
  
x_vec=g_inicial:gama:g_final;
y_vec=x_vec;
z_vec=y_vec;

corte_em_x=P_centro(1);
corte_em_y=P_centro(2);
corte_em_z=0.045; % altura a que queremos colocar o plano horizontal

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
% plano_paralelo=1;
if plano_paralelo==1    %   espira paralela ao plano xy
        
    %-----------------Plano de visualizacao yz-----------x=const-----------
    %PLANO VERTICAL
    x=corte_em_x;
    [Y,Z]=meshgrid(y_vec,z_vec);
    [m,n]=size(Y);
    B=zeros(m,n);
    resultados_yz=zeros(m*n,7);
    k=1;
    for i=1:1:m
        for j=1:1:n
            y=Y(i,j);
            z=Z(i,j);
            if y==0
                y=0.00000001;
            end
            if z==0
                z=0.00000001;
            end
            res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,raio_cabo*2);
            resultados_yz(k,1)=x;
            resultados_yz(k,2)=y;
            resultados_yz(k,3)=z;
            resultados_yz(k,4)=res(1);
            resultados_yz(k,5)=res(2);            
            resultados_yz(k,6)=res(3);
            resultados_yz(k,7)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);           
            B(i,j)=resultados_yz(k,7);
            k=k+1;
        end
    end
%     figure
%     axis on;
%     title('Campo magn�tico')
%     surf(Y,Z,B)
%     xlabel('Y');
%     ylabel('Z');
%     zlabel('Campo magn�tico [Tesla]');
    %------------------------------------
    figure
    axis on;
    plot(resultados_yz(:,7)*1E6,'bx-');
    title('Campo magn�tico nos diversos pontos - plano yz')
    xlabel('Indice do ponto');
    ylabel('Campo magn�tico [microTesla]');
    
    %--------------------------------------------------------------------------
    %-----------------Plano de visualizacao xy ---------z=const----------------
    %PLANO HORIZONTAL
    z=corte_em_z;    %   distancia a qual pretendemos visualizar o corte
    [X,Y]=meshgrid(x_vec,y_vec);
    [m,n]=size(Y);
    B=zeros(m,n);
    resultados_xy=zeros(m*n,7);
    k=1;
    for i=1:1:m
        for j=1:1:n
            x=X(i,j);
            y=Y(i,j);
            if x==0
                x=0.00000001;
            end
            if y==0
                y=0.00000001;
            end            
            res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,raio_cabo*2);
            resultados_xy(k,1)=x;
            resultados_xy(k,2)=y;
            resultados_xy(k,3)=z;
            resultados_xy(k,4)=res(1);
            resultados_xy(k,5)=res(2);            
            resultados_xy(k,6)=res(3);
            resultados_xy(k,7)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);           
            B(i,j)=resultados_xy(k,7);
            k=k+1;
        end
    end

%     figure
%     title('Campo magn�tico')
%     axis on;
%     surf(X,Y,B)
%     xlabel('X');
%     ylabel('Y');
%     zlabel('Campo magn�tico [Tesla]');
    %------------------------------------
    figure
    axis on;
    plot(resultados_xy(:,7)*1E6,'gx-');
    title('Campo magn�tico nos diversos pontos - plano xy')
    xlabel('Indice do ponto');
    ylabel('Campo magn�tico [microTesla]');

    %--------------------------------------------------------------------------
    %--------------------------------------------------------------------------
% 
% % plano_paralelo=2;
% elseif plano_paralelo==2    %   espira paralela ao plano xz
%     
%     %-----------------Plano de visualizacao xy -------------z=const------------
%     x=g_inicial_x:gama:g_final_x;
%     y=g_inicial_y:gama:g_final_y;
%     z=P_centro(3);
%     [X,Y]=meshgrid(x,y);
%     [m,n]=size(X);
%     B=zeros(m,n);
% 
%     for i=1:1:m
%         for j=1:1:n
%             x=X(i,j);
%             y=Y(i,j);
%             res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,raio_cabo*2);%espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
%             B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
%         end
%     end
%     figure
%     axis on;
%     title('Campo magn�tico')
%     surf(X,Y,B)
%     xlabel('X');
%     ylabel('Y');
%     zlabel('Campo magn�tico [Tesla]');
%     %--------------------------------------------------------------------------
%     %-----------------Plano de visualizacao xz ---------y=const----------------
%     x=g_inicial_x:gama:g_final_x;
%     y=P_centro(2)+0.1;    %   distancia a qual pretendemos visualizar o corte
%     z=g_inicial_z:gama:g_final_z;
%     [X,Z]=meshgrid(x,z);
%     [m,n]=size(X);
%     B=zeros(m,n);
% 
%     for i=1:1:m
%         for j=1:1:n
%             x=X(i,j);
%             z=Z(i,j);
%             res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,raio_cabo*2);%espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
%             B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
%         end
%     end
% 
%     figure
%     title('Campo magn�tico')
%     axis on;
%     surf(X,Z,B)
%     xlabel('X');
%     ylabel('Z');
%     zlabel('Campo magn�tico [Tesla]');
%     %--------------------------------------------------------------------------
%     %--------------------------------------------------------------------------
% 
% % plano_paralelo=3;
% elseif plano_paralelo==3
% 
%     %-----------------Plano de visualizacao xy -------------z=const-----------
% 
%     x=g_inicial_x:gama:g_final_x;
%     y=g_inicial_y:gama:g_final_y;
%     z=P_centro(3);
%     [X,Y]=meshgrid(x,y);
%     [m,n]=size(X);
%     B=zeros(m,n);
% 
%     for i=1:1:m
%         for j=1:1:n
%             x=X(i,j);
%             y=Y(i,j);
%             res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,raio_cabo*2);%espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
%             B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
%         end
%     end
%     figure
%     axis on;
%     title('Campo magn�tico')
%     surf(X,Y,B)
%     xlabel('X');
%     ylabel('Y');
%     zlabel('Campo magn�tico [Tesla]');
%     %-------------------------------------------------------------------------
% 
%     % %-----------------Plano de visualizacao yz ---------x=const---------------
%     x=P_centro(1)+0.1;
%     y=g_inicial_y:gama:g_final_y;    %   distancia a qual pretendemos visualizar o corte
%     z=g_inicial_z:gama:g_final_z;
%     [Y,Z]=meshgrid(y,z);
%     [m,n]=size(Y);
%     B=zeros(m,n);
% 
%     for i=1:1:m
%         for j=1:1:n
%             y=Y(i,j);
%             z=Z(i,j);
%             res=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,raio_cabo*2);%espiras_rodado(braco_x,braco_y,corrente,[x y z],P_centro,plano_paralelo);
%             B(i,j)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);
%         end
%     end
% 
%     figure
%     title('Campo magn�tico')
%     axis on;
%     surf(Y,Z,B)
%     xlabel('Y');
%     ylabel('Z');
%     zlabel('Campo magn�tico [Tesla]');
% %--------------------------------------------------------------------------
% 
end
