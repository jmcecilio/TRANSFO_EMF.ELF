function B_0=espiras_rodado(braco_x,braco_y,i,P_d,P_c,P_paralel)

% B   -> vector campo_magnetico 3componentes [x y z]
% i   -> corrente que passa na espira
% a   -> raio da espira
% y   -> coordenada y do ponto onde se deseja calcular o campo
% z   -> coordenada z do ponto onde se deseja calcular o campo

% P_c -> coordenadas do centro da espira no referencial global
% P_d -> coordenadas do ponto onde se deseja calcular o campo referenciado ao eixo global
% P_paralel -> plano paralelo à espira      se 1->xy     se 2->xz     se 3->yz

% modo=1 se for pra fazer planos paralelos a xy; e modo=0 se for pra fazer
% planos normais;

format long;

%----------------------------------------------------------------------
if P_paralel==1         % espira paralela ao plano xy

    x=P_d(1)-P_c(1);
    y=P_d(2)-P_c(2);

    P_campo=[x y P_d(3)];
    B_0=calcula_magnetico_rodar(braco_x,braco_y,P_c(3),P_campo,i);
    %----------------------------------------------------------------------


elseif P_paralel==2     % espira paralela ao plano xz

    R0_1=[1 0 0; 0 0 -1; 0 1 0];    %   referencial 1 em funcao do referencial global-> ref 0

    Pd_t0_1=(R0_1*P_d')';   %   transformacao do ponto P_d para o referencial da espira-> ref 1
    Pc_t0_1=(R0_1*P_c')';   %   transformacao do ponto P_c para o referencial da espira-> ref 1

    x=Pd_t0_1(1)-Pc_t0_1(1);
    y=Pd_t0_1(2)-Pc_t0_1(2);

    P_campo=[x y Pd_t0_1(3)];

    B=calcula_magnetico_rodar(braco_x,braco_y,Pc_t0_1(3),P_campo,i);
    B_0=B*R0_1;
    %----------------------------------------------------------------------


elseif P_paralel==3     % espira paralela ao plano yz

    R0_1=[0 0 -1; 0 1 0;1 0 0];    %   referencial 1 em funcao do referencial global-> ref 0

    Pd_t0_1=(R0_1*P_d')';   %   transformacao do ponto P_d para o referencial da espira-> ref 1
    Pc_t0_1=(R0_1*P_c')';   %   transformacao do ponto P_c para o referencial da espira-> ref 1

    x=Pd_t0_1(1)-Pc_t0_1(1);
    y=Pd_t0_1(2)-Pc_t0_1(2);

    P_campo=[x y Pd_t0_1(3)];

    B=calcula_magnetico_rodar(braco_x,braco_y,Pc_t0_1(3),P_campo,i);
    B_0=B*R0_1;
    %----------------------------------------------------------------------

else
    disp('Digite o plano paralelo correcto!');
end

end