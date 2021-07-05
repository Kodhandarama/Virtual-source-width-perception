% arjun_expt2 = [
% 
%             21 40 56 72;  
%             -10 -10 -10 72 ;  
%             10 24 52 80;
%             -10 -10 -10 -10;
%             64 22 68 85;
%             -10 -10 89 89;
%             
%             ];
%         
%  arjun_expt4 = [
% 
%             12 20 81 60;
%             65 76 86 80;
%             10 16 36 26;
%             -10 84 85 -10;
%             10 90 78 22;
%             29 48 91 80;
%             
%             ];
%         
%  akshay_expt2 = [
%      
%  21 57 44 79;
%  -10 -10 -10 -10;
%  18 26 50 74;
%  -10 -10 -10 -10;
%  27 46 63 76;
%  -10 -10 15 73;
%  ];
% 
% akshay_expt4 = [
%     
% 39 18 65 89;
% 17 29 64 79;
% 20 40 71 93;
% 9 17 77 50;
% 23 40 54 87;
% 18 35 73 56;
% 
% ];
%  
% dhanush_expt2 = [
%     
% 90 10 10 80;
% -10 -10 10 79;
% 40 40 40 80;
% -10 -10 41 80;
% 11 50 100 99;
% -10 -10 -10 -10;
% 
% ];
% 
% dhanush_expt4=[
%    10 40 80 100;
%    19 50 79 100;
%    10 50 81 100;
%    10 50 82 100;
%    10 50 81 100;
%    12 50 81 100;
%    
%    
% ];


% 
% akshay_expt1=[
%    50 29 66 89;
%    35 79 60 67;
%    25 90 66 79;
%    77 84 31 50;
%    81 41 49 52;
%    54 32 22 89;
%    
%    
% ];
% 
% dhanush_expt1=[
%    51 40 91 100;
%    13 51 53 41;
%    17 33 34 40;
%    57 20 68 40;
%    80 70 44 51;
%    41 30 90 100;
%    
%    
% ];
% 
% arjun_expt1=[
%    11 24 79 92;
%    16 79 71 89;
%    16 42 51 62;
%    15 20 72 37;
%    11 21 57 40;
%    14 25 66 47;
%    
%    
% ];

load('expt_data/expt1.mat')
load('expt_data/arj_dhan_aks.mat')
x= [0 4.289 12.819 21.21];
% 
subplot(3,3,1);
y1 = arjun_expt1(1,:);
y2 = arjun_expt1(4,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Arjun - A')
hold off;


subplot(3,3,2);
y1 = arjun_expt1(2,:);
y2 = arjun_expt1(5,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Arjun - I')
hold off;


subplot(3,3,3);
y1 = arjun_expt1(3,:);
y2 = arjun_expt1(6,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Arjun - U')
hold off;



subplot(3,3,4);
y1 = akshay_expt1(1,:);
y2 = akshay_expt1(4,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - A')
hold off;


subplot(3,3,5);
y1 = akshay_expt1(2,:);
y2 = akshay_expt1(5,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - I')
hold off;


subplot(3,3,6);
y1 = akshay_expt1(3,:);
y2 = akshay_expt1(6,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - U')
hold off;

subplot(3,3,4);
y1 = akshay_expt1(1,:);
y2 = akshay_expt1(4,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - A')
hold off;


subplot(3,3,5);
y1 = akshay_expt1(2,:);
y2 = akshay_expt1(5,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - I')
hold off;


subplot(3,3,6);
y1 = akshay_expt1(3,:);
y2 = akshay_expt1(6,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - U')
hold off;

subplot(3,3,4);
y1 = akshay_expt1(1,:);
y2 = akshay_expt1(4,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - A')
hold off;


subplot(3,3,5);
y1 = akshay_expt1(2,:);
y2 = akshay_expt1(5,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - I')
hold off;


subplot(3,3,6);
y1 = akshay_expt1(3,:);
y2 = akshay_expt1(6,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Akshay - U')
hold off;

subplot(3,3,7);
y1 = dhanush_expt1(1,:);
y2 = dhanush_expt1(4,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Dhanush - A')
hold off;


subplot(3,3,8);
y1 = dhanush_expt1(2,:);
y2 = dhanush_expt1(5,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Dhanush - I')
hold off;


subplot(3,3,9);
y1 = dhanush_expt1(3,:);
y2 = dhanush_expt1(6,:);
plot(x,y1,'-o','color','b')
hold on;
plot(x,y2,'-o','color','r')
xlabel('Angle of source(°)')
ylabel('Width rating')
legend('Natural','Synthetic')
title('Dhanush - U')
hold off;


% 
% subplot(2,3,2);
% y1 = akshay_expt1(2,:);
% y2 = akshay_expt1(5,:);
% plot(x,y1,'-o','color','b')
% hold on;
% plot(x,y2,'-o','color','r')
% xlabel('Angle of source(°)')
% ylabel('Width rating')
% title('Akshay - I')
% hold off;
% % 
% subplot(2,3,3);
% y1 = akshay_expt1(3,:);
% y2 = akshay_expt1(6,:);
% plot(x,y1,'-o','color','b')
% hold on;
% plot(x,y2,'-o','color','r')
% xlabel('Angle of source(°)')
% ylabel('Width rating')
% title('Akshay - U')
% hold off;
%  
% 
% subplot(2,3,4);
% y1 = dhanush_expt1(1,:);
% y2 = dhanush_expt1(4,:);
% plot(x,y1,'-o','color','b')
% hold on;
% plot(x,y2,'-o','color','r')
% xlabel('Angle of source(°)')
% ylabel('Width rating')
% title('Dhanush - A')
% hold off;
% % % 
% % subplot(3,3,5);
% % y1 = dhanush_expt1(2,:);
% % y2 = dhanush_expt1(5,:);
% % plot(x,y1,'-o','color','b')
% % hold on;
% % plot(x,y2,'-o','color','r')
% % xlabel('Angle of source(°)')
% % ylabel('Width rating')
% % title('Dhanush - I')
% % hold off;
% % % 
% % subplot(3,3,6);
% % y1 = dhanush_expt1(3,:);
% % y2 = dhanush_expt1(6,:);
% % plot(x,y1,'-o','color','b')
% % hold on;
% % plot(x,y2,'-o','color','r')
% % xlabel('Angle of source(°)')
% % ylabel('Width rating')
% % title('Dhanush - U')
% % hold off;
% 
% % subplot(3,3,2);
% % y1 = arjun_expt4(3,:);
% % y2 = arjun_expt4(4,:);
% % plot(x,y1,'-o','color','b')
% % hold on;
% % plot(x,y2,'-o','color','r')
% % xlabel('Angle of source(°)')
% % ylabel('Width rating')
% % title('Arjun - I')
% % hold off;
% % 
% % subplot(3,3,5);
% % y1 = akshay_expt4(3,:);
% % y2 = akshay_expt4(4,:);
% % plot(x,y1,'-o','color','b')
% % hold on;
% % plot(x,y2,'-o','color','r')
% % xlabel('Angle of source(°)')
% % ylabel('Width rating')
% % title('Akshay - I')
% % hold off;
% % 
% % subplot(3,3,8);
% % y1 = dhanush_expt4(3,:);
% % y2 = dhanush_expt4(4,:);
% % plot(x,y1,'-o','color','b')
% % hold on;
% % plot(x,y2,'-o','color','r')
% % xlabel('Angle of source(°)')
% % ylabel('Width rating')
% % title('Dhanush - I')
% % hold off;
% %  
% %  
% %  
% % subplot(3,3,3);
% % y1 = arjun_expt4(5,:);
% % y2 = arjun_expt4(6,:);
% % plot(x,y1,'-o','color','b')
% % hold on;
% % plot(x,y2,'-o','color','r')
% % xlabel('Angle of source(°)')
% % ylabel('Width rating')
% % title('Arjun - U')
% % hold off;
% % 
% % subplot(3,3,6);
% % y1 = akshay_expt4(5,:);
% % y2 = akshay_expt4(6,:);
% % plot(x,y1,'-o','color','b')
% % hold on;
% % plot(x,y2,'-o','color','r')
% % xlabel('Angle of source(°)')
% % ylabel('Width rating')
% % title('Akshay - U')
% % hold off;
% % 
% % subplot(3,3,9);
% % y1 = dhanush_expt4(5,:);
% % y2 = dhanush_expt4(6,:);
% % plot(x,y1,'-o','color','b')
% % hold on;
% % plot(x,y2,'-o','color','r')
% % xlabel('Angle of source(°)')
% % ylabel('Width rating')
% % title('Dhanush - U')
% % hold off;
% %  
% % 
% %         
 