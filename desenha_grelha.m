function desenha_grelha(braco_x,braco_y,P_centro,gama_i,gama,gama_f)

% clc

% braco_x=0.15;
% braco_y=0.10;
% P_centro=[0.245 0.245 -0.1];
% gama_i=0;
% gama=0.07;
% gama_f=0.50;


%----Centro do referencial-> canto superior esquerdo
%----Centro da grelha-> [24.5 24.5 0]cm pq grelha = 49x49cm e nao 50x50cm
 
y_aux=gama_i:gama:gama_f;
y=y_aux;
[a,b]=size(y_aux);
x=zeros(1,b)+gama_i;
x_aux=x;
z=x-gama_i;
z_aux=z;

for j=2:1:b
    for i=1:1:b
        x_aux(1,i)=gama*j;
    end
%     x_aux
    x=[x;x_aux];
    y=[y;y_aux];
    z=[z;z_aux];
end

x=[x;x'];
% size(x)
y=[y;y'];
z=[z;z'];
%__________________________desenha bobine________________
t=0:1e-2:2*pi;
x_bob=braco_x*cos(t)+P_centro(1);
y_bob=braco_y*sin(t)+P_centro(2);
[a,b]=size(x_bob);
z_bob=zeros(a,b)+P_centro(3);
%_______________________________________________________

figure
plot3(x_bob,y_bob,z_bob,'-b',x',y',z','-ko','LineWidth',1,'MarkerFaceColor','r','MarkerSize',2);
title('Prespectiva X-Y');
% grid on
% axis ([-0.1,0.6,-0.1,0.6,-1,1])
xlabel('X');
ylabel('Y');
zlabel('Z');
campos([0.25 0.25 17.321]);

end
