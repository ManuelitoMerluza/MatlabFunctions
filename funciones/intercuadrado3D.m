function [posiciones val]=intercuadrado3D(data,peso,l)
%INPUT
%DATA: MATRIZ 3D (dato,dato,tiempo)
%PESO: Vector de pesos
%l: largo tiempo
%OUTPUT
%posicion: posiciones NaN (x,y,z)
%val: valores interpolados
count=0;
counter=0;
for i=1:l
    count=count+1;
    counter=counter+1;
    a=data(:,:,i);
    [x y]=find(isnan(a));
    if length(x)~=0
        for e=1:length(x)
	    counter=counter+1;
            valor(counter)=interpol2(a,length(peso),peso,x(e),y(e));
            fila(counter)=x(e);
            columna(counter)=y(e);
	    tiempo(counter)=count;
            x(e)=0;
            y(e)=0;
	    
        end
    else
	counter=counter+1;
        valor(counter)=0;
        fila(counter)=0;
        columna(counter)=0;
	tiempo(counter)=0;
    end
end
h=find(valor~=0);
w=find(fila~=0);
g=find(columna~=0);
t=find(tiempo~=0);
val=valor(h);
col=columna(g);
fil=fila(w);
tiempo=tiempo(t);
%[fila columna]=find(isnan(data));
posiciones=[fil' col' tiempo'];
end
