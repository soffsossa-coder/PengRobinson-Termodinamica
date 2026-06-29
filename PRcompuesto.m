function out = PRcompuesto(compuesto,modo,x1,x2)

% ==========================================================
% PRcompuesto
%
% Uso:
%
% out = PRcompuesto('co2','TP',320,3e6)
%
% out = PRcompuesto('co2','Tv',320,0.0015)
%
% out = PRcompuesto('co2','Pv',3e6,0.0015)
%
% ==========================================================

switch lower(compuesto)

    case 'metano'
        Tc = 190.56;      % [K]
        Pc = 4.599e6;     % [Pa]
        omega = 0.011;

    case 'etano'
        Tc = 305.32;
        Pc = 4.872e6;
        omega = 0.099;

    case 'propano'
        Tc = 369.83;
        Pc = 4.248e6;
        omega = 0.152;

    case 'n-butano'
        Tc = 425.12;
        Pc = 3.796e6;
        omega = 0.200;

    case 'isobutano'
        Tc = 407.81;
        Pc = 3.648e6;
        omega = 0.184;

    case 'n-pentano'
        Tc = 469.70;
        Pc = 3.370e6;
        omega = 0.251;

    case 'n-hexano'
        Tc = 507.60;
        Pc = 3.025e6;
        omega = 0.297;

    case 'agua'
        Tc = 647.10;
        Pc = 22.064e6;
        omega = 0.344;

    case 'co2'
        Tc = 304.13;
        Pc = 7.377e6;
        omega = 0.225;

    case 'n-butano','nbutano','c4h10'

        Tc = 425.2;     
        Pc = 37.97e5;    
        omega = 0.200;

    case 'nitrogenio'
        Tc = 126.20;
        Pc = 3.395e6;
        omega = 0.037;

    case 'oxigeno'
        Tc = 154.58;
        Pc = 5.043e6;
        omega = 0.022;

    case 'amoniaco'
        Tc = 405.40;
        Pc = 11.280e6;
        omega = 0.250;

    case 'metanol'
        Tc = 512.60;
        Pc = 8.090e6;
        omega = 0.565;

    case 'etanol'
        Tc = 514.00;
        Pc = 6.140e6;
        omega = 0.644;

    case 'acetona'
        Tc = 508.10;
        Pc = 4.700e6;
        omega = 0.304;

    case 'benceno'
        Tc = 562.20;
        Pc = 4.890e6;
        omega = 0.212;

    case 'tolueno'
        Tc = 591.80;
        Pc = 4.110e6;
        omega = 0.263;

    otherwise
        error('Compuesto no encontrado.');
end

out = PengRobinson(modo,x1,x2,Tc,Pc,omega);

out.compuesto = compuesto;
out.Tc = Tc;
out.Pc = Pc;
out.omega = omega;

end