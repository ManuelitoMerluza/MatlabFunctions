function[datos_interpolados]=interpolar2D(datos)
%datos corresponde a la base de datos sin el tiempo
%creamos una grilla con el largo de los datos en x e y
[x y]=meshgrid(1:length(datos(1,:)),1:length(datos(:,1)));
%creamos una variable logica para ver los datos que no son NaN
idx=~isnan(datos);
%creamos auxiliares en la grilla y en los datos para seleccionar los
%que no son NaN
x2=x(idx);
y2=y(idx);
datos2=datos(idx);
%interpolamos
datos_interpolados=griddata(x2,y2,datos2,x,y,'v4');

