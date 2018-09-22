s = 0:0.1:2;

yo = [1 0.1 -0.8 0.5];

resultado = lsode("derivadas", yo, s);

x = resultado(:,1).*cos(resultado(:,2));
y = resultado(:,1).*sin(resultado(:,2));
z = resultado(:,1);


[X,Y,Z] = cylinder(0:0.01:1, 100);
mesh(X,Y,Z)
axis square

hold all

plot3(x,y,z,'linewidth',3)

