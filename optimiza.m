% function optimiza(n_bobines)
% 
% % n_bobines=3;
% 
% min_eixo_menor=0.1; max_eixo_maior=0.5;
% min_eixo_menor=0.1; max_eixo_maior=0.5;
% min_corrente=0.1; max_corrente=4;
% 
% % min_xdes=-1; max_xdes=1;
% % min_ydes=-1; max_ydes=1;
% % min_zdes=-1; max_zdes=1;
% 
% min_xcentro=-1; max_xcentro=1;
% min_ycentro=-1; max_ycentro=1;
% min_zcentro=-1; max_zcentro=1;
% 
% min_Nespiras=1;max_Nespiras=50;
% min_seccao=0.01;min_seccao=0.04;
% 
% LB=[];
% UB=[];
% 
% options = gaoptimset('PopulationSize',30,'MutationFcn',@mutationadaptfeasible,'Generations',10,'FitnessLimit',1e-3);
% 
% fitnessfcn = @ calcula_erro_max(var);
% [x, fval, exitflag]= ga(fitnessfcn,9*n_bobines,[],[],[],[],LB,UB,nonlcon,options);
% 
% 
% 
% 
% end

function [x fval exitflag]=optimiza(n_bobines)
 
% n_bobines=3;
 
erro_desejado=0.2;
 
min_eixo_menor=0.1; max_eixo_menor=0.5;
min_eixo_maior=0.1; max_eixo_maior=0.5;
min_corrente=0.1; max_corrente=4;
 
% min_xdes=-1; max_xdes=1;
% min_ydes=-1; max_ydes=1;
% min_zdes=-1; max_zdes=1;
 
min_xcentro=-1; max_xcentro=1;
min_ycentro=-1; max_ycentro=1;
min_zcentro=-1; max_zcentro=1;
 
min_Nespiras=1;max_Nespiras=5;
min_seccao=0.01;max_seccao=0.04;
 % atencao, so esta a fazer para 3 bobines!!!
LB=[min_eixo_menor, min_eixo_maior, min_corrente, min_xcentro, min_ycentro, min_zcentro, min_Nespiras, min_seccao, min_eixo_menor, min_eixo_menor, min_corrente, min_xcentro, min_ycentro, min_zcentro, min_Nespiras, min_seccao, min_eixo_menor, min_eixo_menor, min_corrente, min_xcentro, min_ycentro, min_zcentro, min_Nespiras, min_seccao];
UB=[max_eixo_menor, max_eixo_maior, max_corrente, max_xcentro, max_ycentro, max_zcentro, max_Nespiras, max_seccao, max_eixo_maior, max_eixo_maior, max_corrente, max_xcentro, max_ycentro, max_zcentro, max_Nespiras, max_seccao, max_eixo_maior, max_eixo_maior, max_corrente, max_xcentro, max_ycentro, max_zcentro, max_Nespiras, max_seccao];
 
options = gaoptimset('TimeLimit',Inf,'Display','iter','PopulationSize',24,'MutationFcn',@mutationadaptfeasible,'Generations',10,'FitnessLimit',erro_desejado);
 
fitnessfcn = @calcula_erro_max;
[x, fval, exitflag]= ga(fitnessfcn,8*n_bobines,[],[],[],[],LB,UB,[],options);
 
 
end
