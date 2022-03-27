clear
clc
close all

Year = [1790:10:1950]; % 10 year increments from 1790 to 1950.
% Population of the United States for every decade from 1790 to 1950 in units of 1000
Population = [3939, 5308, 7240, 9638, 12866, 17069, 23192, 31443, 38558, ...
    50156, 62948, 75995, 91972, 105711, 122775, 131669, 150697];

% Logistic model for population
t = [1770:2:1990]; % Model should extend +-20 years, increments of 2 ensure smooth curve.
P = 197273./(1+exp(-0.03134*(t-1913.25))); % Given formula

% Rescaling the population and model to 10^6.
Population= Population*1e3/1e6;
P = P*1e3/1e6;

% Plot of the population as a function of year with the data superimposed
% over the logistic population model.
plot_model = plot(t,P,'k-','LineWidth',3); % Black solid line, line width 3
hold on % Superimposing the plots
% Black-outline circular markers, line width .1, red marker with size 8.
plot_measured = plot(Year,Population,'ko','LineWidth',.1,'MarkerSize',8,'MarkerFaceColor',[1 0 0]);
hold off % Stop holding
xlim([min(Year) max(Year)]) % Setting limits for domain, tightening axis

% Axes labels with influence over font type and size
xlabel('Year')
ylabel('Population (Millions)')
set(gca,'FontSize',12,'FontName','Times') % For current axes, font size 12, font name Times.

% Plot title with influence over font type and size
title('Population of the United States',FontSize=20,FontName="Times")

% Legend in the northwest corner of the plot with influence over font type and size
plot_legend = legend('Fit','Measured',"Location","northwest",'FontSize',14, ...
    'FontName','Times');

% Removal of the top and right axes borders
set(gca,'box','off')

% Background of the figure set to white
set(gcf,'Color','w') % Current figure, color white.







