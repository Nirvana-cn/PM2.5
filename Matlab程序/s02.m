% 神经网络训练,先执行s01.m，再执行此文件
z=reshape(z,1001*601,1);
x=reshape(x,1001*601,1);
y=reshape(y,1001*601,1);
point=[x,y];
value=z;
k=rand(1,1001*601);
[m,n]=sort(k);
input_train=point(n(1:9900),:)';
output_train=value(n(1:9900),:)';
input_test=point(n(9901:10000),:)';
output_test=value(n(9901:10000),:)';
input_train=[location(:,1:2)',input_train];
output_train=[location(:,3)',output_train];
%归一化
[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);

net=newff(inputn,outputn,100);
net.trainParam.show=30;
net.trainParam.epochs=300;
net.trainParam.lr=0.01;
net.trainParam.goal=1e-6;
net=train(net,inputn,outputn);

% 测试
inputn_test=mapminmax('apply',input_test,inputps);
an=sim(net,inputn_test);
BPoutput=mapminmax('reverse',an,outputps);
figure
plot(BPoutput,':og');
hold on
plot(output_test,'-*');
legend('预测输出','期望输出','fontsize',12)
title('BP网络预测输出','fontsize',12)
xlabel('样本','fontsize',12)
ylabel('输出','fontsize',12)
error=BPoutput-output_test;
figure
plot(error,'-*')
title('神经网络预测误差')
errorsum=sum(abs(error));

%实战
point=point';
input_test=mapminmax('apply',point,inputps);
a=sim(net,input_test);
z=mapminmax('reverse',a,outputps);
x=reshape(x,1001,601);
y=reshape(y,1001,601);
z=reshape(z,1001,601);
mesh(x,y,z);
title('神经网络模拟西安市PM2.5分布');