function [valor_fila valor_columna x y]=interfcarreglado(data);
%INPUT: MATRIZ SOLAMENTE DE DATOS,SIN TIEMPO
%DATOS NO PUEDE TENER MAS DE UNA SERIE DENTRO
%OUTPUT: VALOR_FILA: VALOR INTERPOLADO POR FILA DE CADA NAN, VALOR_COLUMNA:
%VALOR POR COLUMNA INTERPOLADO PARA CADA NAN.
%x: columna 
%y: fila
datos=data;
[x y]=find(isnan(data));
data1=data;
data2=data;
[a b]=size(data);

%INTERPOLACION POR FILA

for i=1:length(x)
    f(i).fila=data(x(i),:);
    posf(i).fila=1:b;
    posf(i).fila(y(i))=[];
    f(i).fila(y(i))=[];
    interf(i).x=interp1(posf(i).fila,f(i).fila,y(i),'spline');
    
end

%INTERPOLACION POR COLUMNA

for i=1:length(y)
    c(i).columna=data(:,y(i));
    posc(i).columna=1:a;
    posc(i).columna(x(i))=[];
    c(i).columna(x(i))=[];
    interc(i).y=interp1(posc(i).columna,c(i).columna,x(i),'spline');
end

counter=0;

for e=1:length(x)
    counter=counter+1;
    valor_fila(1,counter)=interf(e).x;
    valor_columna(1,counter)=interc(e).y;
end

end
