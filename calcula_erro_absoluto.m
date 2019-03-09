function [matriz_erro contagem]=calcula_erro_absoluto(matriz)
clc
format long

[a,b,c]=size(matriz);

matriz_erro=zeros(a,b,3);
mtd1_count=0;
mtd2_count=0;
mtd3_count=0;

for i=1:1:a
    for j=1:1:b
        n=3;
        aux_1=matriz(i,j,1);
        aux_2=matriz(i,j,2);
        aux_3=matriz(i,j,3);
        med=mean([aux_1 aux_2 aux_3]);

        erro_1=abs(aux_1-med);
        erro_2=abs(aux_2-med);
        erro_3=abs(aux_3-med);
        
        matriz_erro(i,j,1)=erro_1;        
        matriz_erro(i,j,2)=erro_2;
        matriz_erro(i,j,3)=erro_3;
        
        [menor_erro f]=min([erro_1 erro_2 erro_3]);
        
        if f==1
            mtd1_count=mtd1_count+1;
        elseif f==2
            mtd2_count=mtd2_count+1;
        elseif f==3
            mtd3_count=mtd3_count+1;
        end
   
        contagem=[mtd1_count mtd2_count mtd3_count];
    end
end



        
        
        
        
        
        
        
        
        
        