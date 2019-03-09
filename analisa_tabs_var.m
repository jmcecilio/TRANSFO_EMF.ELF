clc

matriz_var_x_const=calcula_variancia(B_x_const);
matriz_var_z_const=calcula_variancia(B_z_const);

[matriz_erro_x_const contagem_x_const]=calcula_erro_absoluto(B_x_const);
[matriz_erro_z_const contagem_z_const]=calcula_erro_absoluto(B_z_const);

% 
% aux_1=-2;
% aux_2=5;
% aux_3=4;
% n=3;
%         sum_1=aux_1+aux_2+aux_3;
%         sum_2=aux_1^2+aux_2^2+aux_3^2;
%         t=(sum_2-sum_1^2/n)/(n-1)
%         var([aux_1 aux_2 aux_3])
