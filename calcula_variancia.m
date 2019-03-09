function matriz_var1=calcula_variancia(matriz_a)%,matriz_b)
clc
format long

[a,b,c]=size(matriz_a);

matriz_var1=zeros(a,b);

% [c,d]=size(matriz_b);
% matriz_var2=zeros(c,d);

for i=1:1:a
    for j=1:1:b
        n=3;
        aux_1=matriz_a(i,j,1);
        aux_2=matriz_a(i,j,2);
        aux_3=matriz_a(i,j,3);
%         sum_1=aux_1+aux_2+aux_3;
%         sum_2=aux_1^2+aux_2^2+aux_3^2;
%         matriz_var1(i,j)=(sum_2-sum_1^2/n)/(n-1);         
%         t=(sum_2-sum_1^2/n)/(n-1)

        matriz_var1(i,j)=var([aux_1 aux_2 aux_3]);        
    end
end
        
        
        
        
        
        
        
        
        
        