function P = fourier_mc(DATAIN,T)
%% DGEO-UDEC, R Abarca del Rio, 2014
%% calculo de una amplitud para un determinado periodo en entrada.
%%
[n mx ]=size(DATAIN);
ar = 2*pi./T;
nm = DATAIN;
% se extrae la media o se puede extraer la pendiente (que es casi lo
% mismo a veces)
nm=nm-mean(nm);
nm=nm';
% O
nm=detrend(nm);
%
t=1:1:n;
%
% Creamos el sistema aX=b 
a=zeros(2,2);
b=zeros(2,1);
%
a(1,1) = sum(cos(ar.*t).^2);
a(2,1) = sum(sin(ar.*t).*cos(ar.*t));
a(1,2) = a(2,1); 
a(2,2) = sum(sin(ar.*t).^2);
%
b(1,1) = sum(cos(ar.*t).*nm);
b(2,1) = sum(sin(ar.*t).*nm);
%
% Obtenemos la solucion del sistema aX=b 
%
X=a\b;
%o X = pinv(a) * b;
%
% Amplitud y fase del armonico ajustado
%
amplitud=sqrt(X(1)^2+X(2)^2);
fase=atan2(X(1),X(2));
periodo=T; frecuencia=1./T;
Energia=(amplitud).^2;
%varserie=varianza./cov(nm)*100; % Porcentaje de varianza explicado
%
P = [periodo amplitud fase*180/pi X(2) X(1) Energia];

return
