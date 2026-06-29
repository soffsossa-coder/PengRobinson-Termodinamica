function Cp = CpCompuesto(comp,T)

R = 8.314;   % J/mol K

switch lower(comp)

    case {'metano','ch4'}

        A = 1.702;
        B = 9.081e-3;
        C = -2.164e-6;
        D = 0;
        E = 0;

    case {'etano','c2h6'}

        A = 1.131;
        B = 19.225e-3;
        C = -5.561e-6;
        D = 0;
        E = 0;

    case {'propano','c3h8'}

        A = 1.213;
        B = 28.785e-3;
        C = -8.824e-6;
        D = 0;
        E = 0;

    case {'nitrogeno','n2'}

        A = 3.280;
        B = 0.593e-3;
        C = 0;
        D = 0.040e-5;
        E = 0;

    case {'oxigeno','o2'}

        A = 3.639;
        B = 0.506e-3;
        C = 0;
        D = -0.227e-5;
        E = 0;

    case {'n-butano','nbutano','c4h10'}

        A = 1.935;
        B = 36.915e-3;
        C = -11.402e-6;
        D = 0;
        E = 0;
        
    case {'co2'}

        A = 5.457;
        B = 1.045e-3;
        C = 0;
        D = -1.157e-5;
        E = 0;

    case {'hidrogeno','h2'}

        A = 3.249;
        B = 0.422e-3;
        C = 0;
        D = 0.083e-5;
        E = 0;

    case {'agua','h2o'}

        A = 3.470;
        B = 1.450e-3;
        C = 0;
        D = 0.121e-5;
        E = 0;

    otherwise

        error('Compuesto no disponible')

end

Cp = R*(A + B*T + C*T.^2 + D./T.^2 + E*T.^3);

end