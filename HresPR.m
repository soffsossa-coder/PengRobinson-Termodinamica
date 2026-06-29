function Hres = HresPR(comp,T,P)

out = PRcompuesto(comp,'TP',T,P);

R = 8.314;

Z = out.Z;
a = out.a;
b = out.b;
B = out.B;
dadT = out.da_dT;

sqrt2 = sqrt(2);

L = log( ...
    (Z + (1+sqrt2)*B) ./ ...
    (Z + (1-sqrt2)*B) );

Hres = R*T*(Z-1) ...
     + ((T*dadT - a)/(2*sqrt2*b))*L;

end