% Calcuate the resonance frequency of 3D HR resonator

rho = 1.25;             
c0 = 343;

R_cav = 0.002;           %Radius of the cavity
H_cav = 0.008;           %Height of the cavity
R_nec = 0.0005;          %Radius of the neck
H_nec = 0.002;          %Height of the cavity

V = pi*(R_cav^2)*H_cav;         %Volume of the cavity
L_eff = H_nec + 1.7*R_nec;      %The effective length of the neck

Ca = V/(rho*c0*c0) ;               
Ma = rho*L_eff/(pi*R_nec^2);

f = sqrt(1/(Ca*Ma))/(2*pi)

%%calcuate acoustic impedance
freq = 5160;
ome = 2*pi*freq;

Xb= (ome*Ma - 1/(ome*Ca) )
