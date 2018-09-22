%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gráfico de la superficie del paraboloide hiperbólico r(u,v) = (u, v, uv) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tx = ty = linspace (-100, 100, 10)';
[xx, yy] = meshgrid (tx, ty);
tz = xx .* yy ;
mesh (tx, ty, tz);

% surf(tz) mas colorido


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gráfico de la curva geodésica %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function derivadas = funcion(x,s)
derivadas(1) = x(3);
derivadas(2) = x(4);
derivadas(3) = -2*x(2)*x(3)*x(4)/(x(1).^2+x(2).^2+1);
derivadas(4) = -2*x(1)*x(3)*x(4)/(x(1).^2+x(2).^2+1);
endfunction

s = 0:1:100;
yo = [1; 2; 3; 4];
resultado = lsode("funcion", yo, s);
x = resultado(:,1);
y = resultado(:,2);
z = x .*y;
plot3 (x, y, z, '-k')

xlabel('u');
ylabel('v');
zlabel('u.v');
legend('Curva geodésica');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gráfico de la curva geodésica sobre la superficie del paraboloide hiperbólico %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tx = linspace (0, 5, 10)';
ty = linspace (0, 300, 10)';
[xx, yy] = meshgrid (tx, ty);
tz = xx .* yy ;

hold all;
mesh (tx, ty, tz);
plot3 (x, y, z, '-k')

xlabel('u');
ylabel('v');
zlabel('u.v');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gráfico de la curva geodésica y su estimación sobre la superficie del paraboloide hiperbólico %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function salida = euler(t, h, y_0)
intervalo = 0:h:t;
salida = y_0;
for k = 1:(length(intervalo)-1)
  salida(k+1,:) = salida(k,:) + h * funcion(salida(k, :));
endfor
endfunction


t = 10
h = 0.01
y_0 = [1 2 3 4]

M = euler(t, h, y_0);
u = M(:,1);
v = M(:,2);
uv = u .* v;

s = 0:h:t;
resultado = lsode("funcion", yo, s);
x = resultado(:,1);
y = resultado(:,2);
z = x .*y;




tx = linspace (0, 6, 100)';
ty = linspace (0, 30, 100)';
[xx, yy] = meshgrid (tx, ty);
tz = xx .* yy ;

hold all;
mesh (tx, ty, tz);
plot3 (x, y, z, '-k')
plot3(u, v, uv, '-b')

xlabel('u');
ylabel('v');
zlabel('u.v');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gráfico del cilindro %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure
[X,Y,Z] = cylinder([1 1],50);
mesh(X,Y,Z)
axis square

hold all

t = 0:0.01:1;
p0 = 1;
q0 = 20;
x = cos(q0*t);
y = sin(q0*t);
z = p0*t;

plot3(x,y,z)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grafico del plano %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a = 1;
b = 2;

figure
X = linspace(0,1,10);
Y = linspace(0,1,10);
[XX YY] = meshgrid(X,Y);
ZZ = a*XX+b*YY;
mesh(XX,YY,ZZ)
axis square

hold all

t = 0:0.1:0.5;
p0 = 1;
q0 = 2;
x = p0*t;
y = q0*t;
z = a*p0*t + b*q0*t;

plot3(x,y,z)

xlabel('x');
ylabel('y');
zlabel('z');


