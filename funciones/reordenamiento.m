function newdata=reordenamiento(data) 
%data debe ser una matriz donde la primera columna son años, y 
%los demas datos presentan un muestreo constante (por mes, por dia, por hora, etc)

year=data(:,1); %separamos los años para crear un nuevo vector de tiempo
counter=0; % creamos un contador por comodidad
for i=1:length(year)
    for j=1:length(data(1,2:end))
        counter=counter+1;
        l=(j-1)/length(data(1,2:end)); %creamos separaciones decimales equidistantes para el nuevo vector de tiempo
        time(counter)=year(i)+l;
        dato(counter)=data(i,j+1);
    end
end

newdata=[time' dato']; %juntamos el nuevo vector de tiempo y el vector de datos en una matriz de 2 columnas
