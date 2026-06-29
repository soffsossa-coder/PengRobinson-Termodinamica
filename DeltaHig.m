function DH = DeltaHig(comp,T1,T2)

f = @(T) CpCompuesto(comp,T);

DH = integral(f,T1,T2);

end