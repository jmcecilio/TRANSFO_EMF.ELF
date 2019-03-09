load medidas_transformador.mat
%  
%  a=0.10;
%  b=0.15;
%  
%  k=((a-b)/(2*(a+b)))^2;
%  
%  perimetro_elipse=pi*((a+b)/4)*(3*(1+k)+1/(1-k))
 
plot(medidas_transformador(:,4));
grid on;
