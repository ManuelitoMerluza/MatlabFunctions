function filacolumnareo(data);
[x y z k]=interfcarreglado(data);
variables={'Puntos','Valores_Fila','Valores_Columna'};
ptos=[z k];
tabla=table(ptos,x',y','VariableNames',variables)
end
