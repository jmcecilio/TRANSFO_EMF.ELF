%-----------------------------------------------------------------------
%         Esta versao ja inclui a contribuição do cabo da alimentação
%-----------------------------------------------------------------------


%   grelha 7x7cm

clear all
clc

format long

gama=0.07; % gama de 7cm
g_inicial=0.07;
g_final=0.42;
  
x_vec=g_inicial:gama:g_final;
y_vec=x_vec;
% z_vec=y_vec;


%-------------Cabo1---------------
a=0.45;  % posicao x do cabo
b=0.08;  % posicao z do cabo
y_min1=-0.245;% posicao y inicial do cabo
y_max1=0.245; % posicao y final do cabo
%---------------------------------

%-------------Cabo2---------------
e=0.245; % posicao y do cabo
f=b;     % posicao z do cabo
x_min2=0.395; % posicao x inicial do cabo
x_max2=0.45;  % posicao x final do cabo
%---------------------------------

braco_x=0.15;
braco_y=0.10;

corrente=0.64;  %0.651843;  %  O valor medido foi de I=0.64A
seccao_cabo=1.5e-6;   %   1,5mm^2;
raio_cabo=sqrt(seccao_cabo/pi);
%   Considerou-se o centro do referencial no canto superior esquerdo da grelha
%de medida (mas no chao)!!!
P_centro=[0.245 0.245 0];%-(N_espiras-1)*raio_cabo];  %raio_cabo];% % para a bobine ficar à face do plano!

x_vec=g_inicial:gama:g_final;
y_vec=x_vec;
z_vec=y_vec;

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

%---------cabo1-----em zz------
%             aux1=campo_cabo(x,y,z,-corrente,a,b,y_min1,y_max1,e,f,x_min2,x_max2,1);
%             aux2=campo_cabo(x,y,z,corrente,a,b-0.003,y_min1,y_max1,e,f,x_min2,x_max2,1);
%---------cabo1-----em yy------
            aux1=campo_cabo(x,y,z,-corrente,a,b,y_min1,y_max1,e,f,x_min2,x_max2,1);
            aux2=campo_cabo(x,y,z,corrente,a+0.003,b,y_min1,y_max1,e,f,x_min2,x_max2,1);


%---------cabo2----em zz-------
%             aux3=campo_cabo(x,y,z,-corrente,a,b,y_min1,y_max1,e,f,x_min2,x_max2,2);
%             aux4=campo_cabo(x,y,z,corrente,a,b,y_min1,y_max1,e,f-0.003,x_min2,x_max2,2);
%---------cabo2----em yy-------
%             aux3=campo_cabo(x,y,z,-corrente,a,b,y_min1,y_max1,e-0.0015,f,x_min2,x_max2,2);
%             aux4=campo_cabo(x,y,z,corrente,a,b,y_min1,y_max1,e+0.0015,f,x_min2,x_max2,2);




%             res=aux1+aux2;%+aux3+aux4;
            res=aux1+aux2;
%             res=aux3+aux4;
            resultados_xy(k,1)=x;
            resultados_xy(k,2)=y;
            resultados_xy(k,3)=z;
            resultados_xy(k,4)=res(1);  
            resultados_xy(k,5)=res(2);            
            resultados_xy(k,6)=res(3);
            resultados_xy(k,7)=sqrt((res(1)^2+res(2)^2+res(3)^2)/2);           
            B(i,j)=resultados_xy(k,7);
            Bx(i,j)=resultados_xy(k,4);
            By(i,j)=resultados_xy(k,5);
            Bz(i,j)=resultados_xy(k,6);
            k=k+1;
        end
    end
  
    
    %----------------------------------------------------------------------    
    %----------------------------------------------------------------------
    
    index=1:1:k-1;
    figure
    axis on;
%     plot(index,resultados_xy(:,7)*1e6,'gx-');  %   Atenção esta em microTesla
%     plot(index,medicoes1(:,7)/10,'bx-',index,resultados_xy(:,7)*1e6/1.3,'gx-');  %   Atenção esta em microTesla
    plot(index,resultados_xy(:,7)*1e6,'bx-');  %   Atenção esta em microTesla
    grid on;
    title('Campo magnético emanado por um cabo rectilíneo - plano xy')
    xlabel('Indice do ponto');
    ylabel('Campo magnético [microTesla]');
    
  
% desenha_grelha(braco_x,braco_y,P_centro,g_inicial,gama,g_final)


    figure
    axis on;
    surf(X,Y,Bx*1e6)
    title('Componente Bx emanada por um cabo rectilíneo')
    xlabel('X');
    ylabel('Y');
    zlabel('Campo magnético [microTesla]');


    figure
    axis on;
    surf(X,Y,By*1e6)
    title('Componente By emanada por um cabo rectilíneo')
    xlabel('X');
    ylabel('Y');
    zlabel('Campo magnético [microTesla]');

    figure
    axis on;
    surf(X,Y,Bz*1e6)
    title('Componente Bz emanada por um cabo rectilíneo')
    xlabel('X');
    ylabel('Y');
    zlabel('Campo magnético [microTesla]');

    figure
    axis on;
    surf(X,Y,B*1e6)
    title('Campo magnético emanado por um cabo rectilíneo')
    xlabel('X');
    ylabel('Y');
    zlabel('Campo magnético [microTesla]');



