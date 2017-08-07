% shepard��ά��ֵ
clear,clc
load location.mat
z=zeros(1001,601);
for i=1:1001
    for j=1:601
        z(i,j)=shepard((j-301)/10,(i-501)/10);
    end
end
[x,y]=meshgrid(-30:0.1:30,-50:0.1:50);
mesh(x,y,z);
hold on;
plot3(location(:,1),location(:,2),location(:,3),'*')
name={'��ѹ���س�','����С��','��֯��','Сկ','������������','��������','������','������','������','������','�����Ļ�����','����̶','��̲'};
for i=1:13
text(location(i,1)+1,location(i,2)-1,location(i,3)+1,name{i});
end