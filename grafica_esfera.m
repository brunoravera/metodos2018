%[X Y Z] = sphere();
[X Y Z] = cylinder(0:0.01:1, 50);

t = 0:0.01:0.5;
y0 = [0.1; 1; 1; 3];

%A = sqrt(y0(3)^2 + y0(4)^2);
%u = cos(A*t)*y0(1) + sin(A*t)*y0(3)/A;
%v = cos(A*t)*y0(2) + sin(A*t)*y0(4)/A;

resultado = lsode("derivadas", y0, t);

%x = cos(u).*sin(v);
%y = sin(u).*sin(v);
%z = cos(v);


%x = cos(resultado(:,1)).*sin(resultado(:,2));
%y = sin(resultado(:,1)).*sin(resultado(:,2));
%z = cos(resultado(:,2));

x = resultado(:,1).*cos(resultado(:,2));
y = resultado(:,1).*sin(resultado(:,2));
z = resultado(:,1);

hold all
mesh (X, Y, Z);
plot3 (x, y, z)
