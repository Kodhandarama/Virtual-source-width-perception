function a = fn_pos()

Pos = [10 10 1000 750];
h = gcf; 
set(h,'Position',Pos)
grid on
%set(gca,'FontSize',42)  
set(findall(gcf,'-property','FontSize'),'FontSize',30)
lines = findobj(gcf,'Type','Line');
for i = 1:numel(lines)
  lines(i).LineWidth = 2.0;
end

a=1;