%   grelha 7x7cm

clear all
clc

format long

load medicoes1;

gama=0.07; % gama de 7cm
g_inicial=0.07;
g_final=0.42;
  
x_vec=g_inicial:gama:g_final;
y_vec=x_vec;
% z_vec=y_vec;

%--------------------------------------------------------------------------
%   PARTE DE MEDIDA
%--------------------------------------------------------------------------

%     [X,Y]=meshgrid(x_vec,y_vec);
%     [m,n]=size(Y);
%     B=zeros(m,n);
% %     resultados_xy=zeros(m*n,7);
%     k=1;
%     for i=1:1:m
%         for j=1:1:n
%             x=X(i,j);
%             y=Y(i,j);
%             B(i,j)=medicoes1(k,7)/10;  % esta em microTesla
%             k=k+1;
%         end
%     end

%     figure
%     axis on;
%     surf(X,Y,B)
%     title('Campo magnético - Plano XY - Valores Medidos')
%     xlabel('X');
%     ylabel('Y');
%     zlabel('Campo magnético [microTesla]');
    %------------------------------------
    
    
    
%----------------------------------------------------------------------
%   PARTE SIMULADA
%----------------------------------------------------------------------
    
corrente=0.64;  %0.651843;  %  O valor medido foi de I=0.64A
N_espiras=16;
seccao_cabo=1.5e-6;   %   1,5mm^2;
raio_cabo=sqrt(seccao_cabo/pi);
%   Considerou-se o centro do referencial no canto superior esquerdo da grelha
%de medida (mas no chao)!!!
P_centro=[0.245 0.245 0];%-(N_espiras-1)*raio_cabo];  %raio_cabo];% % para a bobine ficar à face do plano!
plano_paralelo=1;

x_vec=g_inicial:gama:g_final;
y_vec=x_vec;
z_vec=y_vec;

braco_x=0.15;
braco_y=0.10;
    %-----------------Plano de visualizacao xy ---------z=const----------------
    z=0.085;    %   distancia a qual pretendemos visualizar o corte
    [X,Y]=meshgrid(x_vec,y_vec);
    [m,n]=size(Y);
    B=zeros(m,n);
    resultados_xy=zeros(m*n,7);
    k=1;
    for i=1:1:m
        for j=1:1:n
            x=X(i,j);
            y=Y(i,j);
%             if x==0
%                 x=0.00000001;
%             end
%             if y==0
%                 y=0.00000001;
%             end            
            res=campo_bobine_teste1(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,plano_paralelo,raio_cabo*2);
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
%     axis on;
%     surf(X,Y,B*1e6)
%     title('Campo magnético - Plano XY - Valores simulados')
%     xlabel('X');
%     ylabel('Y');
%     zlabel('Campo magnético [microTesla]');
%     
    
    
    %----------------------------------------------------------------------    
    %----------------------------------------------------------------------
    
    index=1:1:k-1;
    figure
    axis on;
%     plot(index,resultados_xy(:,7)*1e6,'gx-');  %   Atenção esta em microTesla
%     plot(index,medicoes1(:,7)/10,'bx-',index,resultados_xy(:,7)*1e6/1.3,'gx-');  %   Atenção esta em microTesla
    plot(index,medicoes1(:,7)/10,'bx-',index,resultados_xy(:,7)*1e6,'gx-');  %   Atenção esta em microTesla
    grid on;
    title('Campo magnético nos diversos pontos - plano xy')
    legend('Campo magnético medido','Campo magnético simulado','Location','Best')
    xlabel('Indice do ponto');
    ylabel('Campo magnético [microTesla]');
    
    
%-------------grafico de erro-------------------------------------------    
    figure
    axis on;
    plot(index,abs(resultados_xy(:,7)*1e6-medicoes1(:,7)/10),'rx-');  %   Atenção esta em microTesla
%     plot(index,abs(resultados_xy(:,7)*1e6/1.3-medicoes1(:,7)/10),'rx-');  %   Atenção esta em microTesla
    grid on;
    title('Erro entre valores simulados e valores medidos - plano xy')
    xlabel('Indice do ponto');
    ylabel('Modulo do erro [microTesla]');
    
    
    %-------------grafico de erro relativo-------------------------------------------    
    figure
    axis on;
    erro_rel=abs((resultados_xy(:,7)*1e6-medicoes1(:,7)/10))/max(medicoes1(:,7)/10);
    plot(index,erro_rel,'rx-');  %   Atenção esta em microTesla
%     plot(index,abs(resultados_xy(:,7)*1e6/1.3-medicoes1(:,7)/10),'rx-');  %   Atenção esta em microTesla
    grid on;
    title('Erro entre valores simulados e valores medidos / valor máximo medido - plano xy')
    xlabel('Indice do ponto');
    ylabel('Modulo do erro relativo [microTesla]');

desenha_grelha(braco_x,braco_y,P_centro,g_inicial,gama,g_final)




