% Calcuate the approxiate resonance frequency of 2D HR resonator

rho = 1.25;             
c0 = 343;

W_cav = 0.04;           %width of the cavity
H_cav = 0.05;           %Height of the cavity
W_nec = 0.01;          %width of the neck
H_nec = 0.01;          %Height of the cavity

V = W_cav*H_cav*1;         %Volume of the cavity
L_eff = H_nec + 1.7*(W_nec/2);      %The effective length of the neck

Ca = V/(rho*c0*c0) ;               
Ma = rho*L_eff/W_nec;

f = sqrt(1/(Ca*Ma))/(2*pi)