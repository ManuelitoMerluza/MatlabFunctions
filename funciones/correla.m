function corre=correla(x,y)
R=corrcoef(x,y);
corre=R(1,2);
end