% ������ȫ��ƽ��PM2.5ʱ��ֲ�ͼ
clear,clc
load PM2_xian.mat
x0=PM2_xian(:,1);
y0=PM2_xian(:,2);
x=1:116;
y=interp1(x0,y0,x,'spline');
plot(x,y,'-*');