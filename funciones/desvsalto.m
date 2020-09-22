
%l vector de datos
%n espaciado
%s salto
function b= mediasalto(l,s)

a = length(l); % calculo el largo del ( el vector)
counter=0;
  for i=1:s:(a); % el ciclo va desde 1 hasta el largo del vector menos la ventana + 1
  counter=counter+1;  
      desv(counter) = std(l(i:(s+i-1))); 
  	  %b(i) porque va variando la posicion
    	% mean(l) porque necesitas  la media del vector l 
    	% (i:(n+i-1)) esto dice que va desde i hasta n+i-1, 
  end

  b=desv';
end