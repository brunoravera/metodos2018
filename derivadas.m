function derivadas = funcion(x,t)
derivadas(1) = x(3);
derivadas(2) = x(4);
derivadas(3) = (x(4)^2)*x(1)/2;
derivadas(4) = -2*x(3)*x(4)/x(1);
endfunction

%function derivadas = funcion(x,t)
%derivadas(1) = x(3);
%derivadas(2) = x(4);
%derivadas(3) = -2*x(3)*x(4)/tan(x(2));
%derivadas(4) = -x(3)^2*sin(x(2))*cos(x(2));
%endfunction

