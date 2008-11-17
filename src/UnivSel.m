%*************************************************************************%
% The UNIVSEL function performs stochastic universal sampling                              %
%                                                                                                                                %
% function newpop= UnivSel(pop,popsize,fitness)                                                     %
% Input:                                                                                                                      %
%    pop- population of chromosomes, matrix                                                            %
%    popsize- population size                                                                                     %
%    fitness- fitness of chromesomes, vector                                                              %
% Output:                                                                                                                    %
%    newpop- mating pool, matrix                                                                                %
%                                                                                                                                %
% Copyright (c) 2002 by Prof. Gang-Gyoo Jin, Korea Maritime University                    % 
%*************************************************************************%
function newpop= UnivSel(pop,popsize,fitness)

fitsum= sum(fitness);
if(fitsum ~= 0)
  expect= popsize*fitness/fitsum;
  cumexp= cumsum(expect);
  pt= rand;
  for i= 1:popsize
    for nsel= 1:popsize
      if(pt < cumexp(nsel))
        idxchrom(i)= nsel;
        break;
      end
    end
    pt= pt+1;
  end

else
  idxchrom= [1:popsize];
end
newpop= Select(pop,popsize,idxchrom);
