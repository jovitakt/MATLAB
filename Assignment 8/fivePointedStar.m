function fivePointedStar(x0,y0,d_inner,d_outer,theta,c) 
% Plots a pentagram using a patch() object.
% Input x0 and y0 is the location of the center of the star
% Input d_inner and d_outer are the diameters.
% Input c is  a 1 x 3 vector that contains the RGB color components of the patch() object.

% Offsetting theta so that it aligns to the center
theta = theta + pi/10; % 2pi/10 vertices/half = pi/10

% Generate 5 equal angles outer_vertice and inner_vertice. 
outer_vertice = theta:(2*pi/5):(theta+2*pi);
% Offset inner_vertice from outer_vertice by pi/5. (2pi/10 vertices)
inner_vertice = (theta+pi/5):(2*pi/5):(theta+2*pi+pi/5);

% Find the x and y coordinates of the inner vertices, 'x_inner' and 'y_inner'
x_inner = d_inner/2*cos(inner_vertice)+x0;
y_inner = d_inner/2*sin(inner_vertice)+y0;

% Find the x and y coordinates of the outer vertices, 'x_outer' and 'y_outer'
x_outer = d_outer/2*cos(outer_vertice)+x0;
y_outer = d_outer/2*sin(outer_vertice)+y0;

% Interleaving the x and y coordinates of 'x_inner','y_inner', 'x_outer' and 'y_outer'
% onto two vectors, x and y.
n = length(x_outer)+length(x_inner);

x = zeros(1,n);
x(1:2:end) = x_outer; 
x(2:2:end) = x_inner;

y = zeros(1,n);
y(1:2:end) = y_outer;
y(2:2:end) = y_inner;

% Visualisation of five pointed star with the color c.
patch(x,y,c)

end