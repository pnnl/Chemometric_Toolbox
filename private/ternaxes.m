% TERNAXES create ternary axis
%   HOLD_STATE = TERNAXES(MAJORS) creates a ternary axis system using the system
%   defaults and with MAJORS major tickmarks.

% Author: Carl Sandrock 20050211

% To Do

% Modifications
% 20160405 (SA) Added lines to change the order/direction of axes (i.e.
%               clockwise or counter-clockwise) cooresponding to user-specified
%               option on terncoords
%
% Tom Bryan 31 October 2021.  Made percentage true. Increased tick label
% font size

% Modifiers
% (CS) Carl Sandrock
% (SA) Shahab Afshari

function [hold_state, cax, next] = ternaxes(majors)
    if nargin < 1
        majors = 10;
    end

    % TODO: Handle these as options
    direction = 'clockwise';
    percentage = true;

    %TODO: Get a better way of offsetting the labels
    xoffset = 0.25;
    yoffset = 0.01;

    %TODO: Get a better way of offsetting the labels
    tickLabelFontSize = 15;

    % get hold state
    cax = newplot;
    next = lower(get(cax,'NextPlot'));
    hold_state = ishold;

    % get x-axis text color so grid is in same color
    tc = get(cax,'xcolor');
    ls = get(cax,'gridlinestyle');

    % Hold on to current Text defaults, reset them to the
    % Axes' font attributes so tick marks use them.
    fAngle  = get(cax, 'DefaultTextFontAngle');
    fName   = get(cax, 'DefaultTextFontName');
    fSize   = get(cax, 'DefaultTextFontSize');
    fWeight = get(cax, 'DefaultTextFontWeight');
    fUnits  = get(cax, 'DefaultTextUnits');

    set(cax, 'DefaultTextFontAngle',  get(cax, 'FontAngle'), ...
        'DefaultTextFontName',   get(cax, 'FontName'), ...
        'DefaultTextFontSize',   get(cax, 'FontSize'), ...
        'DefaultTextFontWeight', get(cax, 'FontWeight'), ...
        'DefaultTextUnits','data')

    % only do grids if hold is off
    if ~hold_state
    	%plot axis lines
    	hold on;
    	plot ([0 1 0.5 0],[0 0 sin(1/3*pi) 0], 'color', tc, 'linewidth',1,...
            'handlevisibility','off');
    	set(gca, 'visible', 'off');

        % plot background if necessary
        if ~ischar(get(cax,'color'))
            patch('xdata', [0 1 0.5 0], 'ydata', [0 0 sin(1/3*pi) 0], ...
                'edgecolor',tc,'facecolor',get(gca,'color'),...
                'handlevisibility','off');
        end

    	% Generate labels
        majorticks = linspace(0, 1, majors + 1);
        majorticks = majorticks(1:end-1);

        if percentage
            multiplier = 100;
        else
            multiplier = 1;
        end

        if ~strcmp(direction, 'clockwise')
            labels = num2str(majorticks'*multiplier);
        else
            labels = num2str(majorticks(end:-1:1)'*multiplier);
        end

        zerocomp = zeros(size(majorticks)); % represents zero composition

    	% Plot right labels (no c - only b a)
        [lxc, lyc] = terncoords(1-majorticks, majorticks, zerocomp);
    	text(lxc+0.05, lyc-0.025, [repmat('  ', length(labels), 1) labels],...
            'FontSize',tickLabelFontSize);

    	% Plot bottom labels (no b - only a c)
        [lxb, lyb] = terncoords(majorticks, zerocomp, 1-majorticks); % fB = 1-fA
    	text(lxb-0.115, lyb-0.065, labels, 'VerticalAlignment', 'Top',...
            'FontSize',tickLabelFontSize);

    	% Plot left labels (no a, only c b)
    	[lxa, lya] = terncoords(zerocomp, 1-majorticks, majorticks);
    	text(lxa-0.035, lya+0.09, labels,...
            'FontSize',tickLabelFontSize);

    	nlabels = length(labels)-1;
    	for i = 1:nlabels
            plot([lxa(i+1) lxb(nlabels - i + 2)], [lya(i+1) lyb(nlabels - i + 2)], ls, 'color', tc, 'linewidth',0.25,...
                'handlevisibility','off');
            plot([lxb(i+1) lxc(nlabels - i + 2)], [lyb(i+1) lyc(nlabels - i + 2)], ls, 'color', tc, 'linewidth',0.25,...
                'handlevisibility','off');
            plot([lxc(i+1) lxa(nlabels - i + 2)], [lyc(i+1) lya(nlabels - i + 2)], ls, 'color', tc, 'linewidth',0.25,...
                'handlevisibility','off');
    	end;
    end;

    % Reset defaults
    set(cax, 'DefaultTextFontAngle', fAngle , ...
        'DefaultTextFontName',   fName , ...
        'DefaultTextFontSize',   fSize, ...
        'DefaultTextFontWeight', fWeight, ...
        'DefaultTextUnits', fUnits );
