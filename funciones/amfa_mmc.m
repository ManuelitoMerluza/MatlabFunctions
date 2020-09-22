function P=amfa_mmc(m,ar);
%	Ajusta un polinomio sinusoidal a un conjunto de datos por el 
%       metodo de minimos cuadrados y entrega la amplitud y fase.
%
%	P= amfa_mmc(m,ar)
%
%  m  = [indice temporal, serie]
%       el indice temporal esta asociado a cada dato, pueden no ser x-espaciados
%	
%  ar = periodos del armonicos a emplear en el ajuste.
%
%  P  = retorna el Periodo amplitud y fase, de los periodos [ar]
%  [periodo amplitud fase Acoef   Bcoef  varianza %explicado];


ar=2*pi./ar(:);
nm=m(:,2);
t =m(:,1);

% calcula promedio y lo sustrae de la serie
%nmedio=mean(nm);
%nm=nm-nmedio;

% Obtiene la solucion del sistema aX=b 
nar=length(ar);
a=zeros(2*nar);
b=zeros(2*nar,1);

for j=1:nar
	for i=1:nar 
		a(j,i)         = sum(sin(ar(j).*t).*sin(ar(i).*t));
		a(j+nar,i)     = sum(cos(ar(j).*t).*sin(ar(i).*t));
		a(j,i+nar)     = sum(sin(ar(j).*t).*cos(ar(i).*t));
		a(j+nar,i+nar) = sum(cos(ar(j).*t).*cos(ar(i).*t));
	end
	b(j)    = sum(nm.*sin(ar(j).*t));
	b(j+nar)= sum(nm.*cos(ar(j).*t));
end

%  pone en X la soluci¢n del sistema  aX = b

X=a\b;

%__________________________________________
% Amplitud y fase de cada armonico ajustado

amplitud = sqrt((X(1:nar)).^2+(X(nar+1:2*nar)).^2);
fase = atan2(X(1:nar),X(nar+1:2*nar))*180/pi;
periodo =(ar/(2*pi)).^(-1);
varianza =(amplitud).^2./2;
varserie = varianza./cov(nm)*100; %Porcentage de varianza

% [periodo amplitud fase   Acoef(cos)    Bcoef(sin)          varianza %explicado];
P=[periodo amplitud fase X(nar+1:2*nar) X(1:nar)  varianza varserie  ];

return


% test de la rutina

%tt = [1:1:365*10]';
%s = 10*cos(2*pi/365*tt - 90*(2*pi/360));
%P = amfa_mmc([tt s],365)

%s = 10*cos(2*pi/365*tt)+ 10*sin(2*pi/365*tt);
%P = amfa_mmc([tt s],365)

