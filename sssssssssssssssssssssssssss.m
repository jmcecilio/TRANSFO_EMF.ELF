clc

gama_i=0;
gama=0.07;
gama_f=0.50;

y_aux=gama_i:gama:gama_f;
y=y_aux;
[a,b]=size(y_aux);
x=zeros(1,b);
x_aux=x;
z=x;
z_aux=z;

for j=1:1:b-1
    for i=1:1:b
        x_aux(1,i)=gama*j;
    end
%     x_aux
    x=[x;x_aux];
    y=[y;y_aux];
    z=[z;z_aux];
end

x=[x;x'];
y=[y;y'];
z=[z;z'];
%__________________________desenha bobine________________
t=0:1e-3:2*pi;
braco_x=0.15;
braco_y=0.10;
x_bob=braco_x*cos(t);
y_bob=braco_y*sin(t);
[a,b]=size(x_bob);
z_bob=zeros(a,b);
%_______________________________________________________

x=[x;x_bob'];
y=[y;y_bob'];
z=[z;z_bob'];

plot3(x',y',z','-ko','LineWidth',1,'MarkerFaceColor','r','MarkerSize',2);
% grid on
axis ([-0.1,0.6,-0.1,0.6,-0.05,0.05])
xlabel('X');
ylabel('Y');
zlabel('Z');
