% This script creates the task figure used as Figure 1 in the 2019 Current
% Biology paper (DOI:https://doi.org/10.1016/j.cub.2018.12.013) 

%VEScerra 2019

clear
Nfigs = 19;
% dimensions of all plots0.030
hcurve  = 0.055*1.7;       % h-of all task
vcurve  = 0.04*1.7;            % v - task
hspace = 0.005;                  % horizontal offset
vspace = 0.040;                         %vertical offset

hspace1 = .015;                                 % horizontal space between tasks
vspace1 = 0.04;                                 % vertical spacing

% locations
lmargin = 0.03;
tmargin = 0.2;
col1 = lmargin;
col2 = col1+hcurve-hspace;
col3 = col2+hcurve-hspace;
col4 = col3+hcurve-hspace;
col5 = col4+hcurve-hspace;

col6 = col5+hcurve+hspace1*1.5;
col7 = col6+hcurve-hspace;
col8 = col7+hcurve-hspace;
col9 = col8+hcurve-hspace;
col10 = col9+hcurve-hspace;

row1 = 1 - tmargin;
row2 = row1 - vcurve + vspace;
row3 = row2 - vcurve + vspace;
row4 = row3 - vcurve + vspace;
row5 = row4 - vcurve + vspace;

row6 = row5 - vspace1-vcurve;
row7 = row6 - vcurve + vspace;
row8 = row7 - vcurve + vspace;
row9 = row8 - vcurve + vspace;
row10 = row9 - vcurve + vspace;

% positions of all axes
pos = zeros(Nfigs,4);
pos(1,:) = [col1 row1 hcurve vcurve];       %dst fix
pos(2,:) = [col2 row2 hcurve vcurve];       %dst taron
pos(3,:) = [col3 row3 hcurve vcurve];       %dst go
pos(4,:) = [col4 row4 hcurve vcurve];       %dst sacc

pos(5,:) = [col6 row1 hcurve vcurve];       %epop fix
pos(6,:) = [col7 row2 hcurve vcurve];       %epop taron
pos(7,:) = [col8 row3 hcurve vcurve];       %epop cue
pos(8,:) = [col9 row4 hcurve vcurve];       %epop go
pos(9,:) = [col10 row5 hcurve vcurve];      %epop sacc

pos(10,:) = [col1 row6 hcurve vcurve];      %cs fix
pos(11,:) = [col2 row7 hcurve vcurve];      %cs taron
pos(12,:) = [col3 row8 hcurve vcurve];      %cs go
pos(13,:) = [col4 row9 hcurve vcurve];    	%cs cue
pos(14,:) = [col5 row10 hcurve vcurve];     %cs sacc

pos(15,:) = [col6 row6 hcurve vcurve];      %co fix
pos(16,:) = [col7 row7 hcurve vcurve];      %co taron
pos(17,:) = [col8 row8 hcurve vcurve];      %co go
pos(18,:) = [col9 row9 hcurve vcurve];      %co cue
pos(19,:) = [col10 row10 hcurve vcurve];    %co sacc

% lines, symbols and fonts
fnt1 = 12;       % for most labels
fnt2 = 12;      % panel indicators
fnt3 = 10;      % axes labels and annotations
fnt4 = 9;       % rPT annotations

line1 = 1.25;   % linewidth for arrows in icons
line2 = 1.5;    % linewidth for cue on Sac Sc.

msize1 = 14;
msize2 = 20;        %markersize for stimuli figures
msize3 = 4;         %markersize for arrowhead in stimuli figures

% initialize paper and figure 1
figure(1); clf;
whitebg('white')
set(gcf,'color', 'white')
colordef none
asp = 8.5/11;
% Use 'Paperorientation' to turn to landscape
set(gcf,'Units','inches','Position',[0.15 0.5 asp*6 6], ...
    'Paperposition',[0 0 8.5 11]);

% frame for letter tags
hoff= -0.008;
voff = 0.04*3;
hoff1 = .00;
voff1 = .055*2.1;
hframe = axes('Position',[0 0 1 1],'Visible','off');

text(col1+hoff,row1+voff,'\bfa','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col6+hoff,row1+voff,'\bfb','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col1+hoff,row6+voff,'\bfc','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col6+hoff,row6+voff,'\bfd','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');


text(col1+hoff1,row1+voff1,'Delayed-saccade task','Fontsize',fnt3, ...
    'HorizontalAlignment', 'left', 'VerticalAlignment','cap');
text(col6+hoff1,row1+voff1,'Easy-oddball task','Fontsize',fnt3, ...
    'HorizontalAlignment', 'left', 'VerticalAlignment','cap');
text(col1+hoff1,row6+voff1,'CS task','Fontsize',fnt3, ...
    'HorizontalAlignment', 'left', 'VerticalAlignment','cap');
text(col6+hoff1,row6+voff1,'CO task','Fontsize',fnt3, ...
    'HorizontalAlignment', 'left', 'VerticalAlignment','cap');

% produce all axes
xtick = [-100:25:250];
xtickl = ['-100';'    ';' -50';'    ';'  0 ';'    ';' 50 ';'    ';' 100';'    ';' 150';'    ';' 200';'    ';'    '];
xtick1 = [0:25:300];
xtickl1 = [' 0 ';'   ';'   ';'   ';'100';'   ';'   ';'   ';'200';'   ';'   ';'   ';'300'];
ytick  = [0,50,100];
ytickl = [' 0 ';' 50';'100'];
ytick1  = [100:50:400];
ytick1l = ['   ';'150';'   ';'250';'   ';'350';'   '];

ah = zeros(Nfigs,1);
for j=1:Nfigs
        ah(j) = axes('Position',pos(j,:),'Box','off',...
            'xTickLabel',[],'yTickLabel',[],'TickDir','in','Visible','off','clipping','off');
end

% graph parameters
clm = cell(11,1);
clm{1,1} = [0 0 0];
clm{2,1} = [1 1 1];
clm{3,1} = [.8 .8 .8];
clm{4,1} = [.35 .35 .35];

%============================
% Task Graphics
%============================
x1 = -6;
x2 = 6;
y1 = -6;
y2 = 6;
x3 = -1;
x4 = 3;

xlo = -10;
xhi = 10;
ylo = -10;
yhi = 10;
xoffset = 2;
yoffset = 3;

%===========================
% DST
%===========================
% Fixation
axes(ah(1)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'r.','markersize',msize2)
mssg = ['Fixation'];
text(xlo,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Target on
axes(ah(2)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'r.','markersize',msize2)
mssg = ['Target on'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Go
axes(ah(3)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'r.','markersize',msize2)
mssg = ['Go'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Saccade
axes(ah(4)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'r.','markersize',msize2)
plot([-x4 -x3],[0 0],'color',clm{2,1},'LineWidth',line1)
plot(-x4,0,'<','color',clm{2,1},'markersize',msize3,'MarkerFaceColor',clm{2,1})
mssg = ['Saccade'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

%===========================
% Epop
%===========================
%Fixation
axes(ah(5)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
mssg = ['Fixation'];
text(xlo,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Targets on 
axes(ah(6)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(x1,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(x2,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(0,y1,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(0,y2,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
mssg = ['Targets on'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Cue
axes(ah(7)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(x1,0,'r.','markersize',msize2,'MarkerFaceColor',clm{4,1})
plot(x2,0,'g.','markersize',msize2,'MarkerFaceColor',clm{4,1})
plot(0,y1,'g.','markersize',msize2,'MarkerFaceColor',clm{4,1})
plot(0,y2,'g.','markersize',msize2,'MarkerFaceColor',clm{4,1})
mssg = ['Cue'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Go
axes(ah(8)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'r.','markersize',msize2)
plot(x2,0,'g.','markersize',msize2)
plot(0,y1,'g.','markersize',msize2)
plot(0,y2,'g.','markersize',msize2)
mssg = ['Go'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Saccade
axes(ah(9)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'r.','markersize',msize2)
plot(x2,0,'g.','markersize',msize2)
plot(0,y1,'g.','markersize',msize2)
plot(0,y2,'g.','markersize',msize2)
plot([-x4 -x3],[0 0],'color',clm{2,1},'LineWidth',line1)
plot(-x4,0,'<','color',clm{2,1},'markersize',msize3,'MarkerFaceColor',clm{2,1})
mssg = ['Saccade'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')


%===========================
% CS
%===========================
% Fixation
axes(ah(10)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'r.','markersize',msize2)
mssg = ['Fixation'];
text(xlo,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Targets on
axes(ah(11)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'r.','markersize',msize2)
plot(x1,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(x2,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
mssg = ['Targets on'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Go
axes(ah(12)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(x2,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
mssg = ['Go'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Cue
axes(ah(13)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'r.','markersize',msize2)
plot(x2,0,'g.','markersize',msize2)
mssg = ['Cue'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Saccade
axes(ah(14)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'r.','markersize',msize2)
plot(x2,0,'g.','markersize',msize2)
plot([-x4 -x3],[0 0],'color',clm{2,1},'LineWidth',line1)
plot(-x4,0,'<','color',clm{2,1},'markersize',msize3,'MarkerFaceColor',clm{2,1})
mssg = ['Saccade'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

%===========================
% CO
%===========================
% Fixation
axes(ah(15)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
mssg = ['Fixation'];
text(xlo,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Targets on
axes(ah(16)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(0,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(x1,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(x2,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(0,y1,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(0,y2,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
mssg = ['Targets on'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Go
axes(ah(17)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(x2,0,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(0,y1,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
plot(0,y2,'.','markersize',msize2,'MarkerFaceColor',clm{4,1},'MarkerEdgeColor',clm{4,1})
mssg = ['Go'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Cue
axes(ah(18)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'r.','markersize',msize2)
plot(x2,0,'g.','markersize',msize2)
plot(0,y1,'g.','markersize',msize2)
plot(0,y2,'g.','markersize',msize2)
mssg = ['Cue'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Saccade
axes(ah(19)),hold on;
rectangle('position',[-10 -10 20 20],'Edgecolor',clm{2,1},'FaceColor',clm{1,1},'LineWidth',line2,'clipping','off')
plot(x1,0,'O','markersize',msize1,'MarkerEdgeColor',clm{3,1},'MarkerFaceColor',clm{3,1})
plot(x1,0,'r.','markersize',msize2)
plot(x2,0,'g.','markersize',msize2)
plot(0,y1,'g.','markersize',msize2)
plot(0,y2,'g.','markersize',msize2)
plot([-x4 -x3],[0 0],'color',clm{2,1},'LineWidth',line1)
plot(-x4,0,'<','color',clm{2,1},'markersize',msize3,'MarkerFaceColor',clm{2,1})
mssg = ['Saccade'];
text(xlo+xoffset,yhi+yoffset,mssg,'FontSize',fnt3)
set(gca,'visible','off')

% Arrow and label indicator parameters
hl = 3;
hw = 3;
tbw = .04;
tbh = .02;

%DS
% RT arrows
annotation('arrow',[.15 .20],[.745 .745],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('arrow',[.22 .29],[.715 .715],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('line',[.15 .22],[.745 .715],'Color','b')
annotation('textbox',[.173 .715 tbw tbh],'string','RT','LineStyle','none',...
    'fontsize',fnt3,'BackgroundColor','w','HorizontalAlignment','center',...
    'VerticalAlignment','middle','Color','b')

%EO
% RT arrows
annotation('arrow',[.71 .76],[.72 .72],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('arrow',[.78 .85],[.69 .69],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('line',[.71 .78],[.72 .69],'Color','b')
annotation('textbox',[.73 .69 tbw tbh],'string','RT','LineStyle','none',...
    'fontsize',fnt3,'BackgroundColor','w','HorizontalAlignment','center',...
    'VerticalAlignment','middle','Color','b')

%CS
% RT arrows
annotation('arrow',[.11 .20],[.525 .525],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('arrow',[.24 .30],[.47 .47],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('line',[.11 .24],[.525 .47],'Color','b')
annotation('textbox',[.173 .483 tbw tbh],'string','RT','LineStyle','none',...
    'fontsize',fnt3,'BackgroundColor','w','HorizontalAlignment','center',...
    'VerticalAlignment','middle','Color','b')
% rPT arrows
annotation('arrow',[.23 .29],[.50 .50],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('arrow',[.31 .375],[.47 .47],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('line',[.23 .31],[.50 .47],'Color','b')
annotation('textbox',[.25 .475 tbw tbh],'string','rPT','LineStyle','none',...
    'fontsize',fnt4,'BackgroundColor','w','HorizontalAlignment','center',...
    'VerticalAlignment','middle','Color','b')
% Gap arrows
annotation('arrow',[.36 .305],[.595 .595],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('arrow',[.45 .395],[.565 .565],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('line',[.36 .45],[.595 .565],'Color','b')
annotation('textbox',[.375 .577 tbw tbh],'string','Gap','LineStyle','none',...
    'fontsize',fnt3,'BackgroundColor','w','HorizontalAlignment','center',...
    'VerticalAlignment','middle','Color','b')
%CO
% RT arrows
annotation('arrow',[.58 .67],[.525 .525],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('arrow',[.71 .77],[.47 .47],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('line',[.58 .71],[.525 .47],'Color','b')
annotation('textbox',[.645 .483 tbw tbh],'string','RT','LineStyle','none',...
    'fontsize',fnt3,'BackgroundColor','w','HorizontalAlignment','center',...
    'VerticalAlignment','middle','Color','b')
% rPT arrows
annotation('arrow',[.70 .76],[.50 .50],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('arrow',[.78 .845],[.47 .47],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('line',[.70 .78],[.50 .47],'Color','b')
annotation('textbox',[.72 .475 tbw tbh],'string','rPT','LineStyle','none',...
    'fontsize',fnt4,'BackgroundColor','w','HorizontalAlignment','center',...
    'VerticalAlignment','middle','Color','b')
% Gap arrows
annotation('arrow',[.83 .775],[.595 .595],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('arrow',[.92 .865],[.565 .565],'Color','b','HeadLength',hl,'HeadWidth',hw,'HeadStyle','plain')
annotation('line',[.83 .92],[.595 .565],'Color','b')
annotation('textbox',[.845 .577 tbw tbh],'string','Gap','LineStyle','none',...
    'fontsize',fnt3,'BackgroundColor','w','HorizontalAlignment','center',...
    'VerticalAlignment','middle','Color','b')



print '-dpsc2' figure