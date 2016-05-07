function dydt = model_dynamics(t,y,P)

y = num2cell(y);
[PUL1,PUL2,PUL3,PUL4] = deal(y{:});

P = num2cell(P);
[ks1,ks2,ks3,ks4,ks5,ks6,ks7,ks8,ks9,kd1,kd2,kd3,kd4,K1,K2,K3,K4,K5,n1,n2,n3,n4,n5] = deal(P{:});

dPUL1dt = ks1 + ks2*(PUL3^n1/(PUL3^n1+K1^n1))+ks3*(PUL4^n5/(PUL4^n5+K5^n5)) - kd1*PUL1;
dPUL2dt = ks4 + ks5*(PUL1^n2/(PUL1^n2+K2^n2)) - kd2*PUL2;
dPUL3dt = ks6 + ks7*(K3^n3/(PUL2^n3+K3^n3)) - kd3*PUL3;
dPUL4dt = ks8 + ks9*(PUL1^n4/(PUL1^n4+K4^n4)) - kd4*PUL4;

dydt = [dPUL1dt;dPUL2dt;dPUL3dt;dPUL4dt];