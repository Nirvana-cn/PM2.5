function [ result ] = shepard( x , y )
load location.mat
r=zeros(1,13);
sum_r=0;
w=zeros(1,13);
result=0;
for i=1:13
    r(i)=sqrt( (x-location(i,1))^2 + (y-location(i,2))^2 );
    sum_r=1/r(i)^2 + sum_r; 
    if(r(i)==0)
        result=location(i,3);
    end
end

for i=1:13
    w(i)=(1/(r(i)^2))/sum_r;
end

if (result ==0)
    for i=1:13
    result = location(i,3)*w(i) + result;
    end
end

end

