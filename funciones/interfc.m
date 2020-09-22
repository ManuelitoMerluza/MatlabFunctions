function [VALOR_FILA, VALOR_COLUMNA]=interfc(data)
%INPUT: MATRIZ DE DATOS DONDE LA PRIMERA COLUMNA ES TIEMPO, Y EL RESTO
%DATOS NO PUEDE TENER MAS DE UNA SERIE DENTRO
%OUTPUT: VALOR_FILA: VALOR INTERPOLADO POR FILA DE CADA NAN, VALOR_COLUMNA:
%VALOR POR COLUMNA INTERPOLADO PARA CADA NAN.
datos=data;
data=data(:,2:end);
[x y]=find(isnan(data));
data1=data;
data2=data;


%INTERPOLACION POR COLUMNA
tiempox=[1:length(data1(:,1))]';
tiempo1=tiempox;
vc=ones(length(tiempo1),length(x));
counter=0;
valorc=1:length(x);
for i=1:length(x)
    data1(x,:)=[];
    tiempox(x)=[];
    vc(:,i)=interp1(tiempox,data1(:,y(i)),tiempo1);
    counter=counter+1;
    valorc(1,counter)=vc(x(i),i);
    
end

%INTERPOLACION POR FILA

tiempoy=[1:length(data2(1,:))]';
tiempo2=tiempoy;
vf=ones(length(tiempo2),length(y));
counter=0;
valorf=1:length(y);
for i=1:length(y)
    data2(:,y)=[];
    tiempoy(y)=[];
    vf(:,i)=interp1(tiempoy,data2(x(i),:),tiempo2);
    counter=counter+1;
    valorf(1,counter)=vf(y(i),i);
    
end

VALOR_FILA=valorf;
VALOR_COLUMNA=valorc;
end
