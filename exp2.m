clear;
clc;
close all;


% Mu
Mu1=[0,0];
Mu2=[2,3];
Mu3=[-2,0];

syms sample1 sample2 sample3;

%covarians
cov1= [2 0 ; 0 1];
cov2= [1 0.5 ; 0.5 3];
cov3= [2 0 ; 0 1];

%Det
dcov(1)= det (cov1);
dcov(2)= det (cov2);
dcov(3)= det (cov3);


%(x-mu)
f1= ([sample1-0;sample2-0]);
f2= ([sample1-2;sample2-3]);
f3= ([sample1+2;sample3-0]);

f4= ([sample1-0;sample3-0]);
f5= ([sample2-2;sample3-3]);
f6= ([sample2+2;sample3+0]);


%(x-mu)'
prim1=transpose(f1);
prim2=transpose(f2);
prim3=transpose(f4);
prim4=transpose(f3);
prim5=transpose(f5);
prim6=transpose(f6);

%covariance
valcov1= log (dcov(1)); 
valcov2= log (dcov(2));
valcov3= log (dcov(3));

%g(x1)=g(x2)
g1= (-(0.5)*prim1*cov1*f1) - (0.5)*valcov1;
g2=(-(0.5)*prim2*cov2)-(0.5)*valcov2;
t1=g1-g2;
%g(x1)=g(x3)
g3=(-(.5)*prim3*cov2)-(0.5)*valcov1;
g4=(-(0.5)*prim4*cov3*f3)-(0.5)*valcov3;
t2=g3-g4;
%g(x2)=q(x3)
g5=(-(0.5)*prim5*cov2*f5)-(0.5)*valcov2;
g6=(-(0.5)*prim6*cov3*f6)-(0.5)*valcov3;
t3=g5-g6;

for i=1:1:50
    Func(1).xd= 0+sqrt(dcov(1))* randn();
    Func(1).yd= 0+sqrt(dcov(1))* randn();
    plot(Func(1).xd, Func(1).yd, 'b.');
        hold on;
        

end

for i=1:1:50
    Func(2).xd=2+sqrt(dcov(2))* randn();
    Func(2).yd=3+sqrt(dcov(2))* randn();
    plot(Func(2).xd, Func(2).yd, 'r.');
        hold on;
        
end

for i=1:1:50
    Func(3).xd=-2+sqrt(dcov(3))* randn();
    Func(3).yd=0+sqrt(dcov(3))* randn();
    plot(Func(3).xd, Func(3).yd, 'g.');
        hold on;
        
end
% x_2=11/12 x_1^(2 )+5/3 x_2^2+5/3 x_1-3.52
ezplot('(11/12)*sample1^2+(5/3)*sample2^2+(5/3)*sample1-sample2-3.52');
hold on;
% x_1^2 ?+2x?_2^2-2x_1+2=0
ezplot('sample1^2+2*sample2^2-(2*sample1)+2');
hold on;
% x_2=(-31)/24 x_1^2-3/4 x_2^2+1/6 x_1-3.04
ezplot('(-31/24)*sample1^2+(3/4)*sample2^2-(1/6)*sample1-sample2-3.04');








