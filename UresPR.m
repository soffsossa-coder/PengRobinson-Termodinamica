function Ures = UresPR(comp,T,P)

out = PRcompuesto(comp,'TP',T,P);

R = 8.314462618;

% Fase vapor: se selecciona la raiz de mayor Z (out.Z es vector cuando hay 3 raices)
Z = out.Z(end);

Hres = HresPR(comp,T,P);

Ures = Hres - R*T*(Z - 1);

end
