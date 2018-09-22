
function derivadas = funcion(x,s)
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

t = 100
h = [0.01 0.1 0.2 0.5 1];
h_eval = 0:1:100;

y_0 = [2 -2 sqrt(0.5) sqrt(0.5)];
yo = [2; -2; sqrt(0.5); sqrt(0.5)];

res_error = [];
tiempo_referencia = [];
tiempo_estimacion = [];


for h=h

%%%%%%%%%%%%%%%%%%%%%%%
% Curva de referencia %
%%%%%%%%%%%%%%%%%%%%%%%


s = 0:h:t;
tic;
resultado = lsode("funcion", yo, s);
tiempo_referencia = [tiempo_referencia toc];
x = resultado(:,1);
y = resultado(:,2);
z = x .*y;
M_referencia = [x y z];


tic;
M = euler(t, h, y_0);
tiempo_estimacion = [tiempo_estimacion toc];

u = M(:,1);
v = M(:,2);
uv = u .* v;
M_estimada = [u v uv];

%%%%%%%%%
% Error %
%%%%%%%%%

indices = ismember(s, h_eval);
a = 1:rows(M_referencia);
indices2 = indices .* a;
indices3 = indices2(indices2 ~= 0);
M_comparar_referencia = M_referencia (indices3,:);
M_comparar_estimada = M_estimada (indices3,:);


error = 0;
for i = 1:rows(M_comparar_referencia)
error = error + norm(M_comparar_referencia(i,:)-M_comparar_estimada(i,:));
endfor

res_error = [res_error; h error];



endfor


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gráficos de resultados %
%%%%%%%%%%%%%%%%%%%%%%%%%%

res_error;
tiempo_referencia;
tiempo_estimacion;

% Error
plot(res_error(:,1), res_error(:,2), '-.db', 'linewidth', 2)
grid on;
xlabel('h');
ylabel('error');


% Tiempo
hold all;
plot(res_error(:,1), tiempo_referencia, '-.dk','linewidth', 2);
plot(res_error(:,1), tiempo_estimacion, '-.db','linewidth', 2);
grid on;
xlabel('h');
ylabel('tiempo (segundos)');
legend('tiempo de referencia', 'tiempo de estimación');
