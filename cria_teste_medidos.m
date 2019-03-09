function matriz_medidas=cria_teste_medidos()

limite=0.5;
gama=0.2;

x=-limite:gama:limite;
y=x;
z=x;

[X Y Z]=meshgrid(x,y,z);
[a b c]=size(X);

valor_medido=0.23;

matriz_medidas=zeros(a*b*c,4);
l=1;

for i=1:1:a
    for j=1:1:b
        for k=1:1:c
            
            matriz_medidas(l,1)=X(i,j,k);
            matriz_medidas(l,2)=Y(i,j,k);
            matriz_medidas(l,3)=Z(i,j,k);            
            matriz_medidas(l,4)=valor_medido;
            
            l=l+1;
        end
    end
end

save valores_medidos_teste matriz_medidas;

end