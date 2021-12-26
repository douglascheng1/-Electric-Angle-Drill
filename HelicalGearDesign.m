% %assuming small axial and radial loads therefore do not need tapered roller

% %bearings

 

clear;

%using the SKF Bearing Catalog

%assuming small axial and radial loads therefore do not need tapered roller

%bearings

 

load Hdata.mat

load HelicalShaftData.mat

 

FdX = Wx_Bevel+Wx_Helix;

 

%assume Lr = 10^6

Lr = 10.^6;

%from descrption drill run 8h/day, 5day/week, 50week/year, 2 years

Ld = nHshaft*8*5*50*2*60;

%a=3 for ball bearings

a = 3;

 

%only radial loading on point A

%using section 1.1 single row ball bearings for 22mm diameter and 14mm width 

FdA = sqrt(FaY.^2+FaZ.^2)/1000;

dA = 22;

DA = 50;

dmB = (dA+DA)/2

cA = 14;

puA = 0.325;

 

%from diagram 5 in SKF catalog, using dmA

v1A = 90; %minimum rated viscosity

%assuming an operating temperature of 50 celcius, pick an actual lubricant

%greater than v1

vA = 200; %actual viscosity of ISO VG 320 grade from diagram 6

 

kB = vA/v1A

 

%contamination factor

ncA = 0.5; %value was picked based on table 4 and is the low end of normal cleanliness and slight contamination

 

ncA*puA/FdA

 

%from diagram 2 using value above

askfA = 1.75; %interpolation from figure

 

a1A = 0.47; %from table 1 for reliablity of 97

 

LnmA = a1A*askfA*((cA/FdA).^a)*10^6;

 

nA = LnmA/Ld;

 

%combined loading on point D

%using section 1.1 single row ball bearings for 25mm diameter and 9mm width

FaD = FdX/1000;

FrD = sqrt(FdY.^2+FdZ.^2)/1000;

dD = 15;

DD = 32;

dmD = (dD+DD)/2;

cD = 5.85;

puD = 0.12;

f0D = 14;

c0D = 2.85;

 

valueD = f0D*FaD/c0D

 

%using table 8 for ball bearings X and Y coefficients 

YD = 2.3 + ((valueD-0.172)/(0.345-0.172))*(1.99-2.3);

XD = 0.56;

 

FdD = XD*FrD+YD*FaD;

 

%from diagram 5 in SKF catalog, using dmD

v1D = 100; %minimum rated viscosity

%assuming an operating temperature of 50 celcius, pick an actual lubricant

%greater than v1

vD = 200; %actual viscosity of ISO VG 320 grade from diagram 6

 

kD = vD/v1D

 

%contamination factor

ncD = 0.5; %value was picked based on table 4 and is the low end of normal cleanliness and slight contamination

 

ncD*puD/FdD

 

%from diagram 2 using value above

askfD = 10; %interpolation from figure

 

a1D = 0.37; %from table 1 for reliablity of 98

 

LnmD = a1D*askfD*((cD/FdD).^a)*10^6

 

nD = LnmD/Ld

 

save('HelicalBearingData','Ld', 'LnmA', 'nA', 'LnmD', 'nD');