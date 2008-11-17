%*************************************************************************%
% The BUNXOVER function performs uniform crossover                                            %
%                                                                                                                                %
% function [pop,nxover]= bUnXover(pop,popsize,lchrom,pcross)                            %
% Input:                                                                                                                      %
%    pop- population of chromosomes, matrix                                                            %
%    popsize- population size                                                                                     %
%    lchrom- chromosome length                                                                               %
%    pcross- crossover probability                                                                             %
% Output:                                                                                                                    %
%    pop- mated population, matrix                                                                             %
%    nxover- number of times crossover was performed                                            %
%                                                                                                                                %
% Copyright (c) 2002 by Prof. Gang-Gyoo Jin, Korea Maritime University                    % 
%*************************************************************************%
function [pop,nxover]= bUnXover(pop,popsize,lchrom,pcross)

nxover= 0;
halfpop= floor(popsize/2);
for i= 1:halfpop
  if (rand <= pcross)
    nxover= nxover+1;
    mate1= 2*i-1;
    mate2= 2*i;
    template= round(rand(1,lchrom));
    for j= 1:lchrom
      if(template(j) == 1)
        temp= pop(mate1,j);
        pop(mate1,j)= pop(mate2,j);
        pop(mate2,j)= temp;
      end
    end
  end
end
