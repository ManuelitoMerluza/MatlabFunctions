function [modelo] = reconstruccion(tabla,numero,tiempo)
%tabla es el frecuenciograma calculado (frec,periodo,amp,fase)
%numero se refiere a la cantidad de amplitudes a considerar si es que estan
%ordenadas de mayor a menor (para la reconstruccion)
%tiempo se refiere a la cantidad de datos, que aquí pasan a ser tiempo

f = tabla(1:numero,1); %frecuencias
r = tabla(1:numero,3); %amplitud
desf = tabla(1:numero,4); %desfase
modelo = [];

if numero == 1
    for i = 1:tiempo
        modelo(1,i) = r*cos(2*pi*f*i + desf); %no he probado que funcione con solo una frecuencia, para eso prefiera la formula
    end 
else 
    for i = 1:tiempo
        for j = 1:length(r)
            modelo(j,i) = r(j)*cos(2*pi*f(j)*i + desf(j));
        end
    end
modelo = sum(modelo); %reconstruccion lista
end

