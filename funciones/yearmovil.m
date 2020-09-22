
%l vector de datos
%n espaciado
function b= yearmovil(l,n)

a = length(l); % calculo el largo del ( el vector)

  for i=1:(a-n+1); % el ciclo va desde 1 hasta el largo del vector menos la ventana + 1
	yearmovil(i) = sum(l(i:(n+i-1)))/n; 
  	  %b(i) porque va variando la posicion 
    	% mean(l) porque necesitas  la media del vector l 
    	% (i:(n+i-1)) esto dice que va desde i hasta n+i-1, 
  end

  b=yearmovil;
end