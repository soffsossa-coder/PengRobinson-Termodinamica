function DU = DeltaUig(comp,T1,T2)

f = @(T) CvCompuesto(comp,T);

DU = integral(f,T1,T2);

end