function polotseries(data,nombre,paso,n)

%INPUT:
%   dataord1: Primera serie ordenada
%   nombres: vector con: Nombre de la serie, xlabel, ylabel 
%   paso: paso de la med y desv movil.
%   n: grosor de linea




mediamov1=mediamovil(data(:,2),paso);
desvmov1=desvmovil(data(:,2),paso);
tiempo=yearmovil(data(:,1),paso);

%figure()
plot(data(:,1),data(:,2),'k','linewidth',n)
hold on
plot(tiempo,mediamov1,'r','LineWidth',n)

plot(tiempo,(mediamov1+desvmov1),'-.g','linewidth',n)

plot(tiempo,(mediamov1-desvmov1),'-.g','linewidth',n)

axis tight
grid on
title(nombre(1))
xlabel(nombre(2))
ylabel(nombre(3))
legend(nombre(1),'Media movil','Std. movil','location','best')

end
