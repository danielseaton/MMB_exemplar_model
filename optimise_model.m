ks1 = 0.1/5*0.35;
ks2 = 8/5*0.35;
ks3 = 0.1/5*0.35;
ks4 = 0.4/6*0.8;
ks5 = 4/6*0.8;
ks6 = 0.2/3;
ks7 = 4/3;
ks8 = 0.1/3;
ks9 = 6/3;

kd1 = 0.4;
kd2 = 0.8;
kd3 = 1.0;
kd4 = 1.4;

K1 = 0.5/3;
K2 = 0.2/5;
K3 = 0.8/6;
K4 = 3/5;
K5 = 1/3;

n1 = 2;
n2 = 3;
n3 = 3;
n4 = 2;
n5 = 2;


P0 = [ks1,ks2,ks3,ks4,ks5,ks6,ks7,ks8,ks9,kd1,kd2,kd3,kd4,K1,K2,K3,K4,K5,n1,n2,n3,n4,n5];


load('experimental_data')

obj_fun = @(P) objective_function(P,data);
lower_bounds = zeros(length(P0),1);
upper_bounds = 20*ones(length(P0),1);
lower_bounds([10,11,12,13]) = 0.1; %lower limit on how slow the dynamics can be
upper_bounds([10,11,12,13]) = 3; %upper limit on how fast the dynamics can be
lower_bounds(19:end) = ones(5,1);
upper_bounds(19:end) = 3.1*ones(5,1);


% options = optimoptions('fmincon','Display','iter');
options = optimoptions('fmincon','Display','iter','Algorithm','active-set');
Popt = fmincon(obj_fun,P0,[],[],[],[],lower_bounds,upper_bounds,[],options);
save('optimisation_run_fmincon_3','Popt')


