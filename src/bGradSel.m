%*************************************************************************%
% The BGRADSEL function performs gradient-like selection                                      %
%                                                                                                                                %
% function newpop= bGradSel(pop,popsize,npara,lsubstr,x,fitness,xbest,...             %
%                                                                  fitbest,xlb,xub,etha)                               %
% Input:                                                                                                                      %
%    pop- population of chromosomes, matrix                                                            %
%    popsize- population size                                                                                     %
%    npara- number of variables to be decoded                                                         %
%    lsubstr- length of the substrings, vector                                                              %
%    x- variables, matrix                                                                                              %
%    fitness- fitness, vector                                                                                         %
%    xbest- variables of the best chromesome, vector                                                %
%    fitbest- fitness of the best chromesome                                                               %
%    xlb- lower bound for variables, vector                                                                  %
%    xub- upper bound for variables, vector                                                                %
%    etha- parameter of the selection operator                                                            %
% Output:                                                                                                                    %
%    newpop- mating pool, matrix                                                                                %
%                                                                                                                                %
% Copyright (c) 2000 by Prof. Gang-Gyoo Jin, Korea Maritime University                    % 
%*************************************************************************%
function newpop= bGradSel(pop,popsize,npara,lsubstr,x,fitness,xbest,fitbest,xlb,...
                                                                                     xub,etha)
if(fitbest > 0)
  for i= 1:popsize
    normfit= etha*(1-fitness(i)/fitbest);
    pass= 0;
    while(pass == 0)
       pass= 1;
       for j= 1:npara
          xnew(i,j)= x(i,j)+normfit*(xbest(j)-x(i,j));
          if(xnew(i,j) < xlb(j) | xnew(i,j) > xub(j))
            normfit= normfit*0.8;
	pass= 0;
	break;
          end
       end
    end
  end
  coarse= (xub-xlb)./((2.^lsubstr)-1);
  temp = (xnew-ones(popsize,1)*xlb)./(ones(popsize,1)*coarse);
  b10 = round(temp);
  newpop= b10to2(b10,lsubstr);
else
  for i= 1:popsize
    k= Pickup(popsize);
    newpop(i,:)= pop(k,:);
  end
end
