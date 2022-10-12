function [] = plot_Earth(r)

figure
plot3(r(:,1),r(:,2),r(:,3),'Color','y')
hold on
opts.Units='km';         %this command i needed to set the units of the planet3D, otherwise the Earth is enormous and covers all the other plots
h=planet3D('Earth',opts);%this function is better than earth_sphere since the colorbar doesn't go crazy. Try to use earth_sphere to verify it.
h.Annotation.LegendInformation.IconDisplayStyle = 'off'; %it prevent the planet3D function to print useless information on the figure's legend.
grid on
legend('Orbit','Location','Best');
clc;                     %it clears the command window from the infomation printed by the planet3D function.



end

