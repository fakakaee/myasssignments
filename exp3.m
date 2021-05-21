% Mu
Mu1=[0,0];
Mu2=[2,3];
Mu3=[-2,0];

syms sample1 sample2 sample3;

%covarians
cov1= [2 0 ; 0 1];
cov2= [1 0.5 ; 0.5 3];
cov3= [2 0 ; 0 1];


%sample1=mvnrnd(m1,sigma1,50);
class1=mvnrnd(Mu1,cov1,50);
class2=mvnrnd(Mu2,cov2,50);
class3=mvnrnd(Mu3,cov3,50);

syms1=[ class1; class2; class3];



for i=1:50
if class1(i,1)>=1
class1(i,3)=1;
plot(class1(i,1),class1(i,2),'bo');
hold on
else
class1(i,3)=2;
plot(class1(i,1),class1(i,2),'ro');
hold on
end
end
for i=1:50
if class2(i,1)<=1
class2(i,3)=2;
plot(class2(i,1),class2(i,2),'b*');
hold on
else
class3(i,3)=1;
plot(class3(i,1),class3(i,2),'r*');
hold on
end
end
X=(class1(:,3));
%MisClassificationRateForSample1=r
tabulate(X)
Y=(class2(:,3));
%MisClassificationRateForSample2=r
tabulate(Y)
%Plot x=1
Z=(class3(:,3));
%MisClassificationRateForSample3=r
tabulate(Z)
a=1; b=-2:2/100:2; 
plot(a,b,'-k');