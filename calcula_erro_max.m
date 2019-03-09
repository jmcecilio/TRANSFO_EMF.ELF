% function erro_max=calcula_erro_max(24variaveis)
% 
% 
% %tabela com as medidas e com as coordenadas respetivas
% 
%     [Bx_1 By_1 Bz_1]=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,1,seccao_cabo);
%     [Bx_2 By_2 Bz_2]=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,2,seccao_cabo);
%     [Bx_3 By_3 Bz_3]=campo_bobine(braco_x,braco_y,corrente,[x y z],P_centro,N_espiras,3,seccao_cabo);    
%     B_res=[Bx_1+Bx_2+Bx_3 By_1+By_2+By_3 Bz_1+Bz_2+Bz_3];
%     
%     B_ef=sqrt((B_res(1)^2+B_res(2)^2+B_res(3)^2)/2);
% 
%     
%     erro_max=
% end

function erro_max=calcula_erro_max(var)
 
braco_x1=var(1); braco_y1=var(2); corrente1=var(3); P_centro1=var(4:6); N_espiras1=var(7); seccao1=var(8);
braco_x2=var(9); braco_y2=var(10); corrente2=var(11); P_centro2=var(12:14); N_espiras2=var(15); seccao2=var(16);
braco_x3=var(17); braco_y3=var(18); corrente3=var(19); P_centro3=var(20:22); N_espiras3=var(23); seccao3=var(24);
 
%tabela com as medidas e com as coordenadas respetivas
dados_medidos=cria_teste_medidos();
% load dados_medidos;
[a b]=size(dados_medidos);  % vector a*4 -> x,y,z,Bef_medido
matriz_erro=zeros(1,a);
 
 
for i=1:1:a
    B_1=campo_bobine(braco_x1,braco_y1,corrente1,dados_medidos(a,1:3),P_centro1,N_espiras1,1,seccao1);
    B_2=campo_bobine(braco_x2,braco_y2,corrente2,dados_medidos(a,1:3),P_centro2,N_espiras2,2,seccao2);
    B_3=campo_bobine(braco_x3,braco_y3,corrente3,dados_medidos(a,1:3),P_centro3,N_espiras3,3,seccao3);
    
    B_res=[B_1(1)+B_2(1)+B_3(1) B_1(2)+B_2(2)+B_3(2) B_1(3)+B_2(3)+B_3(3)];
    
    B_ef=sqrt((B_res(1)^2+B_res(2)^2+B_res(3)^2)/2);
 
    matriz_erro(1,i)=B_ef-dados_medidos(a,4);
end
 
    erro_max=max(matriz_erro);
%     save matriz matriz_erro;
 
% erro_max=1;
 
end
