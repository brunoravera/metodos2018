function derivadas = funcion(x)
derivadas(1) = x(3);
derivadas(2) = x(4);
derivadas(3) = -2*x(2)*x(3)*x(4)/(x(1).^2+x(2).^2+1);
derivadas(4) = -2*x(1)*x(3)*x(4)/(x(1).^2+x(2).^2+1);
endfunction

function salida = euler(t, h, y_0)
intervalo = 0:h:t;
salida = y_0;
for k = 1:(length(intervalo)-1)
  salida(k+1,:) = salida(k,:) + h * funcion(salida(k, :));
endfor
endfunction

t = 1
h = 0.0001
y_0 = [1 2 3 4]

M = euler(t, h, y_0);
u = M(:,1);
v = M(:,2);
uv = u .* v;


% Resultado de Octave

s = 0:h:t;
yo = [1; 2; 3; 4];
resultado = lsode("funcion", yo, s);
x = resultado(:,1);
y = resultado(:,2);
z = x .*y;


%% Medir el error
