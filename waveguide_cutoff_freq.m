% Calcuate the cutoff frequency of acoustic rectangle waveguide

c0=343;         %sound speed in air
nx=1; ny=0;     %assume lx>ly

lx = 0.2;

f_cut = c0/2*sqrt((1/lx)^2)

