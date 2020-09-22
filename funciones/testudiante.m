function t_obs=testudiante(R,n)

S_t=sqrt((1-R.^2)/(n-2));
t_obs=abs(R)./S_t;

end
