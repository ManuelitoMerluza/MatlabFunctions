function[frecuencia_1]=frecuenciograma(datos)%funcion para calcular la amplitud en funcion de la frecuencia

contador=0;
d=datos;
matriz=[];
N=length(d);
dt=1;
fn=1/2*dt; %frecuencia de nyquist
f0=1/(dt*N); % frecuencia fundamental

for f=f0:f0:(fn-f0); %definimos la frecuencia
  [R,psi]=coef_circular_inversa(f,d); %segun el metodo usado en practica
  %(matriz inversa)
    
  contador=contador+1; %posicion de los valores  
  matriz(contador,1)=f; %columna con las frecuencias
  matriz(contador,2)=1./f; %columna con periodos
  matriz(contador,3)=R; %columna con las amplitudes
  matriz(contador,4)=psi; %columna con el desfase 
 
  R=0;  %limpiamos valores
  psi=0;
end

frecuencia_1=matriz;
