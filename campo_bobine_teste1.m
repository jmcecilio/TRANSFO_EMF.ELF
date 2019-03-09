function B_res=campo_bobine_teste1(braco_x,braco_y,corrente,P_desejado,P_c_bobine,N_espiras,plano_paralelo,d_cabo)

%   plano_paralelo=1 para espiras paralelas ao plano XY
%   plano_paralelo=2 para espiras paralelas ao plano XZ
%   plano_paralelo=3 para espiras paralelas ao plano YZ

%   considerando o ponto do centro da bobine, mm no centro, vem

format long

%     if (rem(N_espiras,2)==0)    %   numero de espiras par        
%         variavel=-(N_espiras-1)*d_cabo/2:d_cabo:(N_espiras-1)*d_cabo/2;
%         
%     else                        %   numero de espiras impar        
%         variavel=-fix(N_espiras/2)*d_cabo:d_cabo:fix(N_espiras/2)*d_cabo;
%     end



%------------------------------TESTES--------------------------------------
%     if (rem(N_espiras,2)==0)    %   numero de espiras par        
%         variavel=-(N_espiras-1)*d_cabo:d_cabo:0;
%         
%     else                        %   numero de espiras impar        
%         variavel=-fix(N_espiras/2)*d_cabo*2:d_cabo:0;
%     end

%     if (rem(N_espiras,2)==0)    %   numero de espiras par        
%         variavel=0:d_cabo:(N_espiras-1)*d_cabo;
%         
%     else                        %   numero de espiras impar        
%         variavel=0:d_cabo:fix(N_espiras/2)*d_cabo*2;
%     end

alt_bob=0.04;
variavel=alt_bob/(N_espiras*2):alt_bob/N_espiras:alt_bob;

% variavel=-0.042:0.042/16:0;
%--------------------------------------------------------------------------




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