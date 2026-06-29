function Ures = UresPR(comp,T,P)

out = PRcompuesto(comp,'TP',T,P);

R = 8.314;

Hres = HresPR(comp,T,P);

Ures = Hres - R*T*(out.Z - 1);

end