function dydt = true_model_dynamics(t,y,P)

y = num2cell(y);
[OSC1,OSC2,OSC3,OSC4] = deal(y{:});

P = num2cell(P);
[ks1,ks2,ks3,ks4,ks5,ks6,ks7,ks8,ks9,kd1,kd2,kd3,kd4,K1,K2,K3,K4,K5,K6,n1,n2,n3,n4,n5,n6] = deal(P{:});

dOSC1dt = ks1 + ks2*(OSC3^n1/(OSC3^n1+K1^n1))+ks3*(OSC4^n5/(OSC4^n5+K5^n5)) - kd1*OSC1;
dOSC2dt = ks4 + ks5*(OSC1^n2/(OSC1^n2+K2^n2))*(K6^n6/(OSC4^n6+K6^n6)) - kd2*OSC2;
dOSC3dt = ks6 + ks7*(K3^n3/(OSC2^n3+K3^n3)) - kd3*OSC3;
dOSC4dt = ks8 + ks9*(OSC1^n4/(OSC1^n4+K4^n4)) - kd4*OSC4;

dydt = [dOSC1dt;dOSC2dt;dOSC3dt;dOSC4dt];