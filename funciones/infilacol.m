function [mat_fil,mat_col]=infilacol(data)
%data con primera columna de año
agno=data(:,1);
dat=data(:,2:end);
[f,c]=find(isnan(dat)==1);
mat_fil=[]
mat_col=[]
for i=1:length(f)
    %columnain
    columna=dat(:,c(i));
    col_aux=columna;
    agno_aux=agno;
    col=[agno,columna];
    col(f(i),:)=[]
    intercol=interp1(col(:,1),col(:,2),agno_aux,'spline');
    coli=[agno_aux,intercol]
    mat_col=[mat_col,coli]
    %fila
    fila=dat(f(i),:);
    fila_aux=fila;
    x_dom=1:length(fila)
    fil=[x_dom',fila'];
    fil(c(i),:)=[]
    interfil=interp1(fil(:,1),fil(:,2),x_dom','spline')
    fili=[x_dom',interfil];
    mat_fil=[mat_fil,fili]
end
end 