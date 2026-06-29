function Sres = SresPR(comp,T,P)

out = PRcompuesto(comp,'TP',T,P);

R = 8.314;

Z = out.Z;
B = out.B;
b = out.b;
dadT = out.da_dT;

sqrt2 = sqrt(2);

L = log( ...
    (Z + (1+sqrt2)*B) ./ ...
    (Z + (1-sqrt2)*B) );

Sres = R*log(Z-B) ...
    + (dadT/(2*sqrt2*b))*L;

end