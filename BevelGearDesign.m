clear;

%using the SKF Bearing Catalog

%assuming small axial and radial loads therefore do not need tapered roller

%bearings

 

load Bdata.mat

load BevelShaftData.mat

 

%assume Lr = 10^6

Lr = 10.^6;

%from descrption drill run 8h/day, 5day/week, 50week/year, 2 years

Ld = nBshaft*8*5*50*2*60;

%a=3 for ball bearings

a = 3;

 

%only radial loading on point B

%using section 1.1 single row ball bearings for 25mm diameter and 9mm width 

xd = Ld/Lr;

FdB = sqrt(FbX.^2+FbZ.^2)/1000;

dB = 25;

DB = 42;

dmB = (dB+DB)/2

cB = 7.02;

puB = 0.193;

 

%from diagram 5 in SKF catalog, using dmB

v1B = 350; %minimum rated viscosity

%assuming an operating temperature of 50 celcius, pick an actual lubricant

%greater than v1

vB = 500; %actual viscosity of ISO VG 1000 grade from diagram 6

 

kB = vB/v1B

 

%contamination factor

ncB = 0.5; %value was picked based on table 4 and is the low end of normal cleanliness and slight contamination

 

ncB*puB/FdB

 

%from diagram 2 using value above

askfB = 1.5; %interpolation from figure

 

a1B = 0.47; %from table 1 for reliablity of 97

 

LnmB = a1B*askfB*((cB/FdB).^a)*10^6;

 

nB = LnmB/Ld;

 

%combined loading on point C

%using section 1.1 single row ball bearings for 25mm diameter and 9mm width

FaC = FcY/1000;

FrC = sqrt(FcX.^2+FcZ.^2)/1000;

dC = 25;

DC = 42;

dmC = (dC+DC)/2;

cC = 7.02;

puC = 0.193;

f0C = 15;

c0C = 4.3;

 

valueC = f0C*FaC/c0C

 

%using table 8 for ball bearings X and Y coefficients 

YC = 1.45 + ((valueC-1.38)/(2.07-1.38))*(1.31-1.45);

XC = 0.56;

 

FdC = XC*FrC+YC*FaC;

 

%from diagram 5 in SKF catalog, using dmA

v1C = 350; %minimum rated viscosity

%assuming an operating temperature of 50 celcius, pick an actual lubricant

%greater than v1

vC = 500; %actual viscosity of ISO VG 1000 grade from diagram 6

 

kC = vC/v1C

 

%contamination factor

ncC = 0.5; %value was picked based on table 4 and is the low end of normal cleanliness and slight contamination

 

ncC*puC/FdC

 

%from diagram 2 using value above

askfC = 50; %interpolation from figure

 

a1C = 0.37; %from table 1 for reliablity of 98

 

LnmC = a1C*askfC*((cC/FdC).^a)*10^6

 

nC = LnmC/Ld

 

save('BevelBearingData','Ld', 'LnmB', 'nB', 'LnmC', 'nC');