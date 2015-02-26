%% Short Pole Figure Analysis Tutorial
% How to estimate ODFs from diffraction data.

%% Open in Editor
%
%% Import diffraction data
% The following script is automatically generated by the import wizard.

% specify scrystal and specimen symmetry
cs = crystalSymmetry('-3m',[1.4,1.4,1.5]);

% specify file names
fname = {...
  fullfile(mtexDataPath,'PoleFigure','dubna','Q(10-10)_amp.cnv'),...
  fullfile(mtexDataPath,'PoleFigure','dubna','Q(10-11)(01-11)_amp.cnv'),...
  fullfile(mtexDataPath,'PoleFigure','dubna','Q(11-22)_amp.cnv')};

% specify crystal directions
h = {Miller(1,0,-1,0,cs),[Miller(0,1,-1,1,cs),Miller(1,0,-1,1,cs)],Miller(1,1,-2,2,cs)};

% specify structure coefficients
c = {1,[0.52 ,1.23],1};

% import pole figure data
pf = loadPoleFigure(fname,h,cs,'superposition',c,...
  'comment','Dubna Tutorial pole figures')

%% Plot pole figures

plot(pf)

%% Estimate an ODF
odf = calcODF(pf)

%% Calculate c-axis pole figure from the ODF
plotPDF(odf,Miller(0,0,1,cs),'antipodal')
