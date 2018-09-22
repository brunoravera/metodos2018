[X Y Z] = sphere();

t = 1:0.1:6;
I = t./t;
y0 = [pi/2 1 1 3];

%A = sqrt(y0(3)^2 + y0(4)^2);
%u = cos(A*t)*y0(1) + sin(A*t)*y0(3)/A;
%v = cos(A*t)*y0(2) + sin(A*t)*y0(4)/A;

u=pi/2.*I;
v=y0(2).*I + y0(4)*t;

% resultado = lsode("derivadas", y0, t);

x = cos(u).*sin(v);
y = sin(u).*sin(v);
z = cos(v);


%x = cos(resultado(:,1)).*sin(resultado(:,2));
%y = sin(resultado(:,1)).*sin(resultado(:,2));
%z = cos(resultado(:,2));



hold all
mesh (X, Y, Z);
plot3 (x, y, z,'linewidth',3)

