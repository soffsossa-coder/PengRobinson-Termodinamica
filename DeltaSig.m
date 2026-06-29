function DS = DeltaSig(comp,T1,T2,P1,P2)

R = 8.314;

f = @(T) CpCompuesto(comp,T)./T;

DS = integral(f,T1,T2) ...
    - R*log(P2/P1);

end