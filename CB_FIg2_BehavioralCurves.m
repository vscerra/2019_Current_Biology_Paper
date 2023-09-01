% This script creates the behavioral figure used as Figure 2 in the 2019 Current
% Biology paper (DOI:https://doi.org/10.1016/j.cub.2018.12.013) 

%VEScerra 2019 (edited 2023)


clear
initdat = 1;

if initdat == 1
    load('TachData.mat')
end

Nfigs = 6;
% dimensions of all plots
hcurve = .35;              % h of plots
vcurve = .2;               % v of plots
hspace = 0.08;            % space between plots
vspace = 0.035;            % space between plots
vspace1 = 0.075;            % space between plots

% locations
lmargin = 0.09;
tmargin = 0.3;
col1 = lmargin;
col2 = col1+hcurve+hspace;

row1 = 1 - tmargin;
row2 = row1 - vcurve - vspace1;
row3 = row2 - vcurve - vspace;

% positions of all axes
pos = zeros(Nfigs,4);
pos(1,:) = [col1 row1 hcurve vcurve];   %cs tach
pos(2,:) = [col2 row1 hcurve vcurve];   %co tach
pos(3,:) = [col1 row2 hcurve vcurve];   %cs chron
pos(4,:) = [col2 row2 hcurve vcurve];   %co chron
pos(5,:) = [col1 row3 hcurve vcurve];   %cs chron
pos(6,:) = [col2 row3 hcurve vcurve];   %co chron

% lines, symbols and fonts
fnt1 = 10;       % for most labels
fnt2 = 12;      % panel indicators
fnt3 = 8;       % arrow labels      
line1 = 0.5;    % linewidth for axes
line2 = 1.25;   % linewidth for arrows in icons
msize1 = 3;   % for time-point indicators
tickfac = 2.7;  % factor that enlarges ticklengths

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
hframe = axes('Position',[0 0 1 1],'Visible','off');

%use same frame for xlabels
voff1 = -0.04;
text(col1+hcurve/2,row1+voff1,'rPT (ms)','Fontsize',fnt1,...
    'HorizontalAlignment','center','VerticalAlignment','middle')
text(col1+hcurve/2,row3+voff1,'Gap (ms)','Fontsize',fnt1,...
    'HorizontalAlignment','center','VerticalAlignment','middle')
text(col2+hcurve/2,row1+voff1,'rPT (ms)','Fontsize',fnt1,...
    'HorizontalAlignment','center','VerticalAlignment','middle')
text(col2+hcurve/2,row3+voff1,'Gap (ms)','Fontsize',fnt1,...
    'HorizontalAlignment','center','VerticalAlignment','middle')


% use same frame for ylabels
hoff1= 0.06;
voff1= vcurve/1.8;
voff2 = vcurve/2;
mssg = ['Correct (%)'];
text(col1-hoff1,row1+voff1, mssg,'Fontsize',fnt1, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment','middle', ...
    'rotation', 90);
text(col1-hoff1,row2+voff1, mssg,'Fontsize',fnt1, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment','middle', ...
    'rotation', 90);
mssg = ['RT (ms)'];
text(col1-hoff1,row3+voff2, mssg,'Fontsize',fnt1, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment','middle', ...
    'rotation', 90);


% produce all axes
xtick = [-100:25:250];
xtickl = {'-100';'';'-50';'';'0';'';'50';'';'100';'';'150';'';'200';'';'250'};
xtick1 = [0:25:300];
xtickl1 = {'0';'';'50';'';'100';'';'150';'';'200';'';'250';'';'300'};
ytick  = [0:25:100];
ytickl = {'0';'25';'50';'75';'100'};
ytick1  = [100:50:500];
ytick1l = {'100';'';'200';'';'300';'';'400';'';'500'};

ah = zeros(Nfigs,1);
for j=1:Nfigs
    if any(j == [1 2]);
        ah(j) = axes('Position', pos(j,:), 'Fontsize', fnt1, 'Box', 'off', ...
            'TickDir','out', 'Visible', 'on', 'clipping', 'on');
        tlen = get(ah(j),'ticklength');
        set(ah(j),'Linewidth', line1,'TickLength',tickfac*tlen);
        % x tick marks and labels
        set(ah(j),'Xtick',xtick);
        set(ah(j),'xTickLabel',xtickl);
        set(ah(j),'Ytick',ytick);
        set(ah(j),'YTickLabel',ytickl);
    elseif any(j== [3 ]);
        ah(j) = axes('Position', pos(j,:), 'Fontsize', fnt1, 'Box', 'off', ...
            'TickDir','out', 'Visible', 'on', 'clipping', 'on');
        tlen = get(ah(j),'ticklength');
        set(ah(j),'Linewidth', line1,'TickLength',tickfac*tlen);
        % x tick marks and labels
        set(ah(j),'Xtick',xtick1);
        set(ah(j),'xTickLabel',[]);
        set(ah(j),'Ytick',ytick);
        set(ah(j),'YTickLabel',ytickl);
    elseif any(j== [4 ]);
        ah(j) = axes('Position', pos(j,:), 'Fontsize', fnt1, 'Box', 'off', ...
            'TickDir','out', 'Visible', 'on', 'clipping', 'on');
        tlen = get(ah(j),'ticklength');
        set(ah(j),'Linewidth', line1,'TickLength',tickfac*tlen);
        % x tick marks and labels
        set(ah(j),'Xtick',xtick1);
        set(ah(j),'xTickLabel',[]);
        set(ah(j),'Ytick',ytick);
        set(ah(j),'YTickLabel',[]);
    elseif any(j== [5]);
        ah(j) = axes('Position', pos(j,:), 'Fontsize', fnt1, 'Box', 'off', ...
            'TickDir','out', 'Visible', 'on', 'clipping', 'on');
        tlen = get(ah(j),'ticklength');
        set(ah(j),'Linewidth', line1,'TickLength',tickfac*tlen);
        % x tick marks and labels
        set(ah(j),'Xtick',xtick1);
        set(ah(j),'xTickLabel',xtickl1);
        set(ah(j),'Ytick',ytick1);
        set(ah(j),'YTickLabel',ytick1l);
    elseif any(j== [6]);
        ah(j) = axes('Position', pos(j,:), 'Fontsize', fnt1, 'Box', 'off', ...
            'TickDir','out', 'Visible', 'on', 'clipping', 'on');
        tlen = get(ah(j),'ticklength');
        set(ah(j),'Linewidth', line1,'TickLength',tickfac*tlen);
        % x tick marks and labels
        set(ah(j),'Xtick',xtick1);
        set(ah(j),'xTickLabel',xtickl1);
        set(ah(j),'Ytick',ytick1);
        set(ah(j),'YTickLabel',[]);
        
    end
end

% graph parameters
clm = cell(11,1);
clm{1,1} = [0 0 0];
clm{2,1} = [.2 .2 .6];
clm{3,1} = [1 0 1];
clm{4,1} = [.7 .6 .8];
clm{5,1} = [1 .8 1];
% axis parameters
ylo = 0;
ylo1 = 50;
yhi = 100;
ylo2 = 100;
yhi2 = 425;
xlo1 = 0;
xhi1 = 225;

%==============================
% CS - Tachometric curves
%==============================
axes(ah(1)), hold on;
xxI = xtachCSI;
yyI = tachCSI*100;
dyyI = setachCSI*100;
yy1I = yyI + dyyI;
yy2I = yyI - dyyI;
iiI = ~isnan(dyyI);

xxR = xtachCSR;
yyR = tachCSR*100;
dyyR = setachCSR*100;
yy1R = yyR + dyyR;
yy2R = yyR - dyyR;
iiR = ~isnan(dyyR);

% plot fraction correct and SE
fill([xxI(iiI) fliplr(xxI(iiI))], [yy1I(iiI) fliplr(yy2I(iiI))], 'w', ...
    'edgecolor', clm{4,1}, 'facecolor', clm{4,1})
fill([xxR(iiR) fliplr(xxR(iiR))], [yy1R(iiR) fliplr(yy2R(iiR))], 'w', ...
    'edgecolor', clm{5,1}, 'facecolor', clm{5,1})
plot(xxR, yyR,'Color',clm{3,1},'LineWidth',line2)
plot(xxI, yyI,'Color',clm{2,1},'LineWIdth',line2)
axis([xlo1 xhi1 25 yhi]);
plot(xlim,[50 50],':','Color',clm{1,1})

%==============================
% CO - Tachometric curves
%==============================
axes(ah(2)), hold on;
xxI = xtachCOI;
yyI = tachCOI*100;
dyyI = setachCOI*100;
yy1I = yyI + dyyI;
yy2I = yyI - dyyI;
iiI = ~isnan(dyyI);

xxR = xtachCOR;
yyR = tachCOR*100;
dyyR = setachCOR*100;
yy1R = yyR + dyyR;
yy2R = yyR - dyyR;
iiR = ~isnan(dyyR);

% plot fraction correct and SE
fill([xxI(iiI) fliplr(xxI(iiI))], [yy1I(iiI) fliplr(yy2I(iiI))], 'w', ...
    'edgecolor', clm{4,1}, 'facecolor', clm{4,1})
fill([xxR(iiR) fliplr(xxR(iiR))], [yy1R(iiR) fliplr(yy2R(iiR))], 'w', ...
    'edgecolor', clm{5,1}, 'facecolor', clm{5,1})
plot(xxR, yyR, 'Color',clm{3,1},'LineWidth',line2)
plot(xxI, yyI, 'Color',clm{2,1},'LineWidth',line2)
axis([xlo1 xhi1 ylo-5 yhi]);
plot(xlim,[25 25],':','Color',clm{1,1})

%==============================
% CS - Gapometric curves
%==============================
axes(ah(3)), hold on;
plot(gapsCSI,pcsCSI*100,'O-','MarkerSize',msize1,'Color',clm{2,1})
plot(gapsCSR,pcsCSR*100,'O-','MarkerSize',msize1,'Color',clm{3,1})
axis([xlo1 xhi1 ylo1 yhi]);

axes(ah(5)), hold on;
plot(gapsCSI,rtmCSI,'O','MarkerSize',msize1,'Color',clm{2,1})
plot(gapsCSR,rtmCSR,'O','MarkerSize',msize1,'Color',clm{3,1})
errorbar(gapsCSI,rtmCSI,rtsdCSI,'Color',clm{2,1})
errorbar(gapsCSR,rtmCSR,rtsdCSR,'Color',clm{3,1})
axis([xlo1 xhi1 ylo2 yhi2]);

%==============================
% CO - Gapometric curves
%==============================
axes(ah(4)), hold on;
plot(gapsCOI,pcsCOI*100,'O-','MarkerSize',msize1,'Color',clm{2,1})
plot(gapsCOR,pcsCOR*100,'O-','MarkerSize',msize1,'Color',clm{3,1})
axis([xlo1 xhi1 ylo1 yhi]);

axes(ah(6)), hold on;
plot(gapsCOI,rtmCOI,'O','MarkerSize',msize1,'Color',clm{2,1})
plot(gapsCOR,rtmCOR,'O','MarkerSize',msize1,'Color',clm{3,1})
errorbar(gapsCOI,rtmCOI,rtsdCOI,'Color',clm{2,1})
errorbar(gapsCOR,rtmCOR,rtsdCOR,'Color',clm{3,1})
axis([xlo1 xhi1 ylo2 yhi2]);

%=================
% Annotations
%=================
annotation('doublearrow',[.25 .29],[.73 .73],'Head1Style','plain','Head2Style','plain','Head1Width',5,'Head2Width',5,'Head1Length',3,'Head2Length',3)
annotation('textbox',[.205 .725 .01 .01],'String','Guesses','LineStyle','none','FontSize',fnt3,'HorizontalAlignment','center','VerticalAlignment','middle')
annotation('textbox',[.33 .733 .01 .01],'String','Informed','LineStyle','none','FontSize',fnt3,'HorizontalAlignment','center','VerticalAlignment','middle')
annotation('textbox',[.33 .723 .01 .01],'String','Choices','LineStyle','none','FontSize',fnt3,'HorizontalAlignment','center','VerticalAlignment','middle')

annotation('doublearrow',[.67 .70],[.73 .73],'Head1Style','plain','Head2Style','plain','Head1Width',5,'Head2Width',5,'Head1Length',3,'Head2Length',3)
annotation('textbox',[.62 .725 .01 .01],'String','Guesses','LineStyle','none','FontSize',fnt3,'HorizontalAlignment','center','VerticalAlignment','middle')
annotation('textbox',[.74 .733 .01 .01],'String','Informed','LineStyle','none','FontSize',fnt3,'HorizontalAlignment','center','VerticalAlignment','middle')
annotation('textbox',[.74 .723 .01 .01],'String','Choices','LineStyle','none','FontSize',fnt3,'HorizontalAlignment','center','VerticalAlignment','middle')


slopeCSI = (parCSI(1,4)-parCSI(1,3))*100/(parCSI(1,2)-parCSI(1,1));
slopeCSR = (parCSR(1,4)-parCSR(1,3))*100/(parCSR(1,2)-parCSR(1,1));
slopeCOI = (parCOI(1,4)-parCOI(1,3))*100/(parCOI(1,2)-parCOI(1,1));
slopeCOR = (parCOR(1,4)-parCOR(1,3))*100/(parCOR(1,2)-parCOR(1,1));

% frame for letter and task tags
hoff= 0.04;
hoff1= 0.15;
hoff2 = 0.2;
voff = vcurve;
voff1 = vcurve+.02;
voff2 = vcurve+.03;
hframe = axes('Position',[0 0 1 1],'Visible','off');
text(col1+hoff,row1+voff,'\bfa','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col2+hoff,row1+voff,'\bfb','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col1+hoff,row2+voff1,'\bfc','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col2+hoff,row2+voff1,'\bfd','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col1+hoff,row3+voff,'\bfe','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col2+hoff,row3+voff,'\bff','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col1+hoff2,row1+voff2,'CS task','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
text(col2+hoff2,row1+voff2,'CO task','Fontsize',fnt2, ...
    'HorizontalAlignment', 'right', 'VerticalAlignment','cap');
print -depsc figure
