%*************************************************************************%
% BCGA for finding the solution of a test function                        %
% Coded by Prof. Gang-Gyoo Jin, Korea Maritime University                 %  %*************************************************************************%
clear;
gen= 1;
[rseed,maxmin,maxgen,popsize,npara,pcross,pmutat,lsubstr,xlb,xub,dmax,...
      lchrom]= bInitPa1;
pop= bInitPop(rseed,popsize,lchrom);
x= bDecode(pop,popsize,npara,lsubstr,xub,xlb,dmax);
objfunc= EvalObj1(x,npara,popsize);
fitness= EvalFit1(objfunc,popsize);
[chrombest,xbest,objbest,fitbest,objave,gam]= bStatPop(pop,x,objfunc,fitness,maxmin);

% builds a matrix storage for plotting line graphs
 stats=[gen objbest xbest];
 subplot(2,1,1)
 h1= plot(stats(:,1), stats(:,2),'g','EraseMode','xor');
 axis([0 maxgen 0 5])
 subplot(2,1,2)
 h2= plot(stats(:,1), stats(:,3),'r',stats(:,1), stats(:,3),'y','EraseMode','xor');
 axis([0 maxgen -5 5])

for gen= 2:maxgen
 pop= RemSel(pop,popsize,fitness); % remainder stochastic sample with replacement
 [pop,nxover]= bOpXover(pop,popsize,lchrom,pcross); % one-point crossover
 [pop,nmutat]= bSimpMut(pop,popsize,lchrom,pmutat); % simple mutation
 x= bDecode(pop,popsize,npara,lsubstr,xub,xlb,dmax);
 objfunc= EvalObj1(x,npara,popsize);
 [pop,x,objfunc]= bElitism(pop,x,objfunc,chrombest,xbest,objbest,maxmin);
 fitness= EvalFit1(objfunc,popsize);
 [chrombest,xbest,objbest,fitbest,objave,gam]= bStatPop(pop,x,objfunc,fitness,maxmin);

% builds a matrix storage for plotting line graphs
  stats=[stats;gen objbest xbest];
  set(h1(1),'XData',stats(:,1),'YData',stats(:,2))
  set(h2(1),'XData',stats(:,1),'Ydata',stats(:,3))
  set(h2(2),'XData',stats(:,1),'Ydata',stats(:,4))
  drawnow 
end
fprintf('objbest= %f xbest= %f %f\n',objbest, xbest);

% pop= RankSel(pop,popsize,fitness,2); % rank-based selection with factor of 2
% pop= RwSel(pop,popsize,fitness); % roulette-wheel selection
% pop=TournSel(pop,popsize,fitness,2); % tournament selection with size of 2
% pop= UnivSel(pop,popsize,fitness); % stochastic universal sampling
% pop= DetSel(pop,popsize,fitness); % deterministic sampling
% [pop,nxover]= bTpXover(pop,popsize,lchrom,pcross); % two-point crossover
% [pop,nxover]= bUnXover(pop,popsize,lchrom,pcross); % uniform crossover 
%bRepPop(gen,pop,popsize,npara,lsubstr,x,objfunc,fitness,3);

