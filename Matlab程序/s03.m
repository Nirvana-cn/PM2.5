% 作西安全市平均PM2.5时间分布图
clear,clc
load PM2_xian.mat
x0=PM2_xian(:,1);
y0=PM2_xian(:,2);
x=1:116;
y=interp1(x0,y0,x,'spline');
plot(x,y,'-*');