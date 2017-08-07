% ������ѵ��,��ִ��s01.m����ִ�д��ļ�
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
%��һ��
[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);

net=newff(inputn,outputn,100);
net.trainParam.show=30;
net.trainParam.epochs=300;
net.trainParam.lr=0.01;
net.trainParam.goal=1e-6;
net=train(net,inputn,outputn);

% ����
inputn_test=mapminmax('apply',input_test,inputps);
an=sim(net,inputn_test);
BPoutput=mapminmax('reverse',an,outputps);
figure
plot(BPoutput,':og');
hold on
plot(output_test,'-*');
legend('Ԥ�����','�������','fontsize',12)
title('BP����Ԥ�����','fontsize',12)
xlabel('����','fontsize',12)
ylabel('���','fontsize',12)
error=BPoutput-output_test;
figure
plot(error,'-*')
title('������Ԥ�����')
errorsum=sum(abs(error));

%ʵս
point=point';
input_test=mapminmax('apply',point,inputps);
a=sim(net,input_test);
z=mapminmax('reverse',a,outputps);
x=reshape(x,1001,601);
y=reshape(y,1001,601);
z=reshape(z,1001,601);
mesh(x,y,z);
title('������ģ��������PM2.5�ֲ�');