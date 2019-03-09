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
z_vec=y_vec;

    %PLANO HORIZONTAL
    z=0.45;
    [X,Y]=meshgrid(x_vec,y_vec);
    [m,n]=size(Y);
    B=zeros(m,n);
    resultados_xy=zeros(m*n,7);
    k=1;
    for i=1:1:m
        for j=1:1:n
            x=X(i,j);
            y=Y(i,j);
            B(i,j)=medicoes1(k,7)/10;  % esta em microTesla
            resultados_xy(k,1)=x;
            resultados_xy(k,2)=y;
            resultados_xy(k,3)=z;
            resultados_xy(k,4)=medicoes1(k,4);
            resultados_xy(k,5)=medicoes1(k,5);            
            resultados_xy(k,6)=medicoes1(k,6);
            resultados_xy(k,7)=medicoes1(k,7)/10;   % esta em microTesla
            k=k+1;
        end
    end

    figure
    axis on;
    surf(X,Y,B)
    title('Campo magnético - Plano XY ')
    xlabel('X');
    ylabel('Y');
    zlabel('Campo magnético [microTesla]');
    %------------------------------------
    
    figure
    axis on;
    plot(resultados_xy(:,7),'bx-');   
    grid on;
    title('Campo magnético nos diversos pontos - plano xy')
    xlabel('Indice do ponto');
    ylabel('Campo magnético [microTesla]');
    
