function [alpha, delta, lon, lat] = groundtrack_lab(s,lon_g_0,t0,tspan,w_e)
    % [alpha, delta, lon, lat] = groundtrack_lab(s,lon_g_0,t0,tspan,w_e,mu)
    % version: 1.1
    %
    % author: albe
    % ground track plotting function
    % input:
    % s             propagated state vector
    % lon_g_0       initial longitudinal position
    % t0            
    % tspan         time vector
    % w_e           planet rotation
    %
    % output:
    % alpha         Right ascension
    % delta         declination
    % lon           longitude
    % lat           latitude



    r = sqrt(s(:,1).^2 + s(:,2).^2 + s(:,3).^2);
    
    delta = asin(s(:,3)./r);
    alpha = atan2(s(:,2),s(:,1));
    
    theta_g = lon_g_0 + w_e*(tspan'-t0);
    
    lon = alpha - theta_g;
    lat = delta;
    
    lon(:) = wrapToPi(lon(:));

    figure
    A = imread('earth.png');
    hold on
    image('XData',[-180 180], 'YData', [-90 90], 'Cdata',flipud(A))
    plot(rad2deg(lon),rad2deg(lat), 'LineStyle','none','Marker','.','Color','y')
    
    plot(rad2deg(lon(1)),rad2deg(lat(1)),'s','MarkerSize',8,'LineWidth',2,'Color','c')
    plot(rad2deg(lon(end)),rad2deg(lat(end)),'o','MarkerSize',8,'LineWidth',2,'Color','r')
    axis([-180 180 -90 90])
    xlabel('Longitude [deg]')
    ylabel('Latitude [deg]')
    legend('orbit ground track','start point','end point')


end