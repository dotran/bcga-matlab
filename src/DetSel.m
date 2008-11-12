%*************************************************************************%
% The DETSEL  function performs deterministic sampling                                          %
%                                                                                                                                %
% function newpop= DetSel(pop,popsize,fitness)                                                       %
% Input:                                                                                                                      %
%    pop- population of chromosomes, matrix                                                            %
%    popsize- population size                                                                                     %
%    fitness- fitness of chromesomes, vector                                                              %
% Output:                                                                                                                    %
%    newpop- mating pool, matrix                                                                                %
%                                                                                                                                %
% Copyright (c) 2000 by Prof. Gang-Gyoo Jin, Korea Maritime University                    % 
%*************************************************************************%
function newpop= DetSel(pop,popsize,fitness)

fitsum= sum(fitness);
if(fitsum ~= 0)
  expect= popsize*fitness/fitsum;
  nassign= floor(expect);
  nsel=0;
  for i= 1:popsize
    na= nassign(i);
    while(na > 0)
      na= na-1;
      nsel= nsel+1;
      idxchrom(nsel)= i;
    end
  end
  if(nsel < popsize)
    fract= expect-nassign;
    [sfract,idx]= sort(fract);

    k= 0;
    while(nsel < popsize)
      k= k+1;
      nsel= nsel+1;
      idxchrom(nsel)= idx(popsize-k+1);
    end
  end
else
  idxchrom= [1:popsize];
end
newpop= Select(pop,popsize,idxchrom);
