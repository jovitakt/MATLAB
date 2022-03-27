function rightRectPrism(x0,y0,z0,W,L,T,c)
% Generates a a three dimensional closed single right rectangular prism
% with boundaries created from fill3() polygons.
% Inputs x0, y0, and z0 represent the lower corner of the prism in the x, y, and z axes
% Inputs W, L, and T represent the lengths of the prism in the x, y, and z axes
% Input c should anticipate a 1 x 3 vector that contains the RGB color components of the polygon. 

hold on % Plot all the surfaces together
% Surface 1, fill surface with c
fill3([x0 x0+W x0+W x0],[y0 y0 y0 y0],[z0 z0 z0+T z0+T],c)
% Surface 2, fill surface with c
fill3([x0 x0+W x0+W x0],[y0+L y0+L y0+L y0+L],[z0 z0 z0+T z0+T],c)
% Surface 3, fill surface with c
fill3([x0+W x0+W x0+W x0+W],[y0 y0 y0+L y0+L],[z0 z0+T z0+T z0],c)
% Surface 4, fill surface with c
fill3([x0 x0 x0 x0],[y0 y0 y0+L y0+L],[z0 z0+T z0+T z0],c)
% Surface 5, fill surface with c
fill3([x0 x0+W x0+W x0],[y0 y0 y0+L y0+L],[z0 z0 z0 z0],c)
% Surface 6, fill surface with c
fill3([x0 x0+W x0+W x0],[y0 y0 y0+L y0+L],[z0+T z0+T z0+T z0+T],c)
hold off % Stop holding

end