
function  p=extremos(serie,a,b)
%INPUT:
%serie: serie(:,1)=tiempo serie(:,2)=datos
%a: condicion extremo max
%b: condicon extremo min
%OUTPUT:
%extremo1: Valor extremo max
%tiempoextremo1: tiempo extremo max
%extremo2: Valor extremo min
%tiempoextremo2: tiempo extremo min


posextremo1=find((serie(:,2)-a)>=0);
posextremo2=find((serie(:,2)-b)<=0);
extremo1=serie(posextremo1,2);
extremo2=serie(posextremo2,2);
tiempoextremo1=serie(posextremo1,1);
tiempoextremo2=serie(posextremo2,1);
p=struct('extremo1',extremo1,'t1',tiempoextremo1,'e2',extremo2,'t2',tiempoextremo2);
end