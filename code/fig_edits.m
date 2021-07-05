close all 

addpath '/home/arthi/matlab/Functions/Figures/' 

file = './plots/l3_w5.fig'
file_new = './plots/l3_w5_new.fig'
file_eps = './plots/l3_w5_new.eps'

h= open(file) ;

ylim([0 130])
xlim([0 9800])

xlabel('Freq (Hz)')
ylabel('Perceptual Score ')
%yticks([ 5000 10000])
%yticklabels({'5k', '10k'})
xticks([ 500 1000 2000 4000 9600])
xticklabels({ '500','1k','2k','4k','9.6k'})
%colorbar
%caxis([-100 100]/fs)
fn_pos()
lines = findobj(gcf,'Type','Line');
mark = {'*','>','<','o','d','^'};
for i = 1:numel(lines)
  lines(i).Marker = mark{i};
end

% atan(3/2*20e-2/4)*180/pi*2 d = 20e-2
l1 = legend({'2-OB','1-OB','1/3 OB','1/6 OB','1/12 OB','1/24 OB'},'Fontsize',18,'orientation','horizontal'); 
%,'orientation','horizontal')
% legend('Localised')
savefig(file_new)
saveas(h,file_eps,'epsc')
close all 

a=1