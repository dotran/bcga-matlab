 stats=[gen objbest xbest];
 h= plot(stats(:,1), stats(:,2),'g','EraseMode','xor');
 axis([0 maxgen 0 5])
 
 for gen= 2:maxgen
   stats=[stats;gen objbest xbest];
  set(h(1),'XData',stats(:,1),'YData',stats(:,2))
  drawnow 
end