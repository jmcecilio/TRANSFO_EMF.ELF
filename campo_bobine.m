function B_res=campo_bobine(braco_x,braco_y,corrente,P_desejado,P_c_bobine,N_espiras,plano_paralelo,d_cabo)

%   plano_paralelo=1 para espiras paralelas ao plano XY
%   plano_paralelo=2 para espiras paralelas ao plano XZ
%   plano_paralelo=3 para espiras paralelas ao plano YZ

%   considerando o ponto do centro da bobine, mm no centro, vem

format long

% tab_B=zeros(N_espiras,3);

    if (rem(N_espiras,2)==0)    %   numero de espiras par        
        variavel=-(N_espiras-1)*d_cabo/2:d_cabo:(N_espiras-1)*d_cabo/2;
        
    else                        %   numero de espiras impar        
        variavel=-fix(N_espiras/2)*d_cabo:d_cabo:fix(N_espiras/2)*d_cabo;
    end

    
    if plano_paralelo==1
        B_res=[0 0 0];
        for i=1:1:N_espiras
            P_c_espira=[P_c_bobine(1) P_c_bobine(2) P_c_bobine(3)+variavel(i)];
            B_espira=espiras_rodado(braco_x,braco_y,corrente,P_desejado,P_c_espira,plano_paralelo);
%             tab_B(i,:)=B_espira;
            B_res=B_res+B_espira;
        end
        
    elseif plano_paralelo==2
        B_res=[0 0 0];
        for i=1:1:N_espiras
            P_c_espira=[P_c_bobine(1) P_c_bobine(2)+variavel(i) P_c_bobine(3)];
            B_espira=espiras_rodado(braco_x,braco_y,corrente,P_desejado,P_c_espira,plano_paralelo);
%             tab_B(i,:)=B_espira;
            B_res=B_res+B_espira;
        end
        
    elseif plano_paralelo==3
         B_res=[0 0 0];
        for i=1:1:N_espiras
            P_c_espira=[P_c_bobine(1)+variavel(i) P_c_bobine(2) P_c_bobine(3)];
            B_espira=espiras_rodado(braco_x,braco_y,corrente,P_desejado,P_c_espira,plano_paralelo);
%             tab_B(i,:)=B_espira;
            B_res=B_res+B_espira;
        end
    end
    
end