function out = PengRobinson(mode,x1,x2,Tc,Pc,omega,mostrar)
if nargin < 7
    mostrar = true;
end
% ==========================================================
% PENG-ROBINSON EOS
%
% MODOS:
%
% 'TP'
% x1 = T [K]
% x2 = P [Pa]
%
% 'Tv'
% x1 = T [K]
% x2 = v [m³/mol]
%
% 'Pv'
% x1 = P [Pa]
% x2 = v [m³/mol]
%
% ==========================================================

R = 8.314462618;   % J/(mol·K)

switch mode

%% ==========================================================
%% CASO TP
%% ==========================================================

case 'TP'

    T = x1;
    P = x2;

    Tr = T/Tc;

    kappa = 0.37464 + 1.54226*omega - 0.26992*omega^2;

    alpha = (1 + kappa*(1-sqrt(Tr)))^2;
    
    a = 0.45724*(R^2*Tc^2/Pc)*alpha;
    
    b = 0.07780*(R*Tc/Pc);

    A = a*P/(R^2*T^2);

    B = b*P/(R*T);

    coef = [1 ...
           -(1-B) ...
            (A - 3*B^2 - 2*B) ...
           -(A*B - B^2 - B^3)];

    Zall = roots(coef);

    Zreal = real(Zall(abs(imag(Zall))<1e-8));
    
    Zreal = sort(Zreal);
    
    vreal = Zreal*R*T/P;

if length(Zreal)==3

    Zliq  = Zreal(1);
    Zmeta = Zreal(2);
    Zvap  = Zreal(3);
    
    % LIMITACION: se selecciona siempre la raiz vapor (Z mayor).
    % No se implementa criterio de estabilidad por fugacidad.
    % Para calculos en fase liquida, usar Z = Zreal(1).
    Z = Zvap;
    v = Zvap*R*T/P;

else

    Z = Zreal;
    v = vreal;

end
   out.T = T;
   out.P = P;

   out.Z = Z;
   out.v = v;

   out.Tr = Tr;
   out.alpha = alpha;

   out.a = a;
   out.b = b;

   out.A = A;
   out.B = B;

    % ==========================================
    % Derivadas termodinámicas
    % ==========================================

    vcalc = v(end);   % usa la raíz mayor (fase vapor)

    aux = PengRobinson('Tv',T,vcalc,Tc,Pc,omega,false);

    out.dPdT_v = aux.dPdT_v;
    out.dPdv_T = aux.dPdv_T;
    out.da_dT  = aux.da_dT;
    out.dvdT_P = aux.dvdT_P;
%% ==========================================================
%% CASO Tv
%% ==========================================================

case 'Tv'

    T = x1;          % [K]
    v = x2;          % [m³/mol]

    Tr = T/Tc;

    kappa = 0.37464 ...
           +1.54226*omega ...
           -0.26992*omega^2;

    alpha = (1 + kappa*(1-sqrt(Tr)))^2;

    a = 0.45724*(R^2*Tc^2/Pc)*alpha;
    % [Pa·m^6/mol²]

    b = 0.07780*(R*Tc/Pc);
    % [m³/mol]

    % ==========================================
    % da/dT
    % ==========================================

    dT = 1e-4;

    alpha_plus = (1 + kappa*(1-sqrt((T+dT)/Tc)))^2;

    alpha_minus = (1 + kappa*(1-sqrt((T-dT)/Tc)))^2;

    a_plus = 0.45724*(R^2*Tc^2/Pc)*alpha_plus;

    a_minus = 0.45724*(R^2*Tc^2/Pc)*alpha_minus;

    da_dT = (a_plus - a_minus)/(2*dT);

    out.da_dT = da_dT;

    % ==========================================
    % Presión por Peng-Robinson
    % ==========================================

    P = (R*T)/(v-b) ...
       - a/(v*(v+b)+b*(v-b));

    A = a*P/(R^2*T^2);
    B = b*P/(R*T);

    out.A = A;
    out.B = B;
    
    % [Pa]

    % ==========================================
    % Factor de compresibilidad
    % ==========================================

    Z = P*v/(R*T);

    % ==========================================
    % (dP/dT)v
    % ==========================================

    dT = 1e-4;     % [K]

    a_plus = 0.45724*(R^2*Tc^2/Pc) ...
            *(1+kappa*(1-sqrt((T+dT)/Tc)))^2;

    a_minus = 0.45724*(R^2*Tc^2/Pc) ...
             *(1+kappa*(1-sqrt((T-dT)/Tc)))^2;

    Pplus = (R*(T+dT))/(v-b) ...
           - a_plus/(v*(v+b)+b*(v-b));

    Pminus = (R*(T-dT))/(v-b) ...
            - a_minus/(v*(v+b)+b*(v-b));

    dPdT_v = (Pplus-Pminus)/(2*dT);
    % [Pa/K]

    % ==========================================
    % (dP/dv)T
    % ==========================================

    dv = 1e-8;     % [m³/mol]

    Pplus = (R*T)/(v+dv-b) ...
          - a/((v+dv)*(v+dv+b)+b*((v+dv)-b));

    Pminus = (R*T)/(v-dv-b) ...
           - a/((v-dv)*(v-dv+b)+b*((v-dv)-b));

    dPdv_T = (Pplus-Pminus)/(2*dv);
    % [Pa·mol/m³²]

    % ==========================================
    % Salida
    % ==========================================

    out.T = T;
    out.P = P;
    out.v = v;
    out.Z = Z;

    out.Tr = Tr;
    out.alpha = alpha;

    out.a = a;
    out.b = b;

    dvdT_P = -dPdT_v/dPdv_T;

    out.dPdT_v = dPdT_v;
    out.dPdv_T = dPdv_T;
    out.da_dT  = da_dT;

    out.dvdT_P = dvdT_P;


%% ==========================================================
%% CASO Pv
%% ==========================================================

case 'Pv'

    P = x1;
    v = x2;

    b = 0.07780*(R*Tc/Pc);

    a0 = 0.45724*(R^2*Tc^2/Pc);

    kappa = 0.37464 + 1.54226*omega - 0.26992*omega^2;

    fun = @(T) ...
        (R*T)/(v-b) ...
        - (a0*(1+kappa*(1-sqrt(T/Tc))).^2) ...
        /(v*(v+b)+b*(v-b)) ...
        - P;

    T = fzero(fun,[200 2000]);

    out = PengRobinson('Tv',T,v,Tc,Pc,omega,false);

    out.P = P;

otherwise

    error('Modo invalido. Use TP, Tv o Pv.')

end

% ==========================================================
% MOSTRAR RESULTADOS
% ==========================================================

if mostrar

    fprintf('\n');
    fprintf('=====================================\n');
    fprintf('Peng-Robinson EOS\n');
    fprintf('=====================================\n');

if isfield(out,'T')
    fprintf('T        = %.6f K\n',out.T);
end

if isfield(out,'P')
    fprintf('P        = %.6e Pa\n',out.P);
end

% ==========================================
% FACTOR DE COMPRESIBILIDAD Y VOLUMEN
% ==========================================

if isfield(out,'Z')

    if length(out.Z) == 1

        fprintf('Z        = %.6f\n',out.Z);

    elseif length(out.Z) == 3

        fprintf('\n');
        fprintf('Raices de Z:\n');

        fprintf('Z_liquido     = %.6f\n',out.Z(1));
        fprintf('Z_metaestable = %.6f\n',out.Z(2));
        fprintf('Z_vapor       = %.6f\n',out.Z(3));

    else

        fprintf('Z = \n');
        disp(out.Z)

    end

end

if isfield(out,'v')

    if length(out.v) == 1

        fprintf('v        = %.6e m^3/mol\n',out.v);

    elseif length(out.v) == 3

        fprintf('\n');
        fprintf('Volumenes molares:\n');

        fprintf('v_liquido     = %.6e m^3/mol\n',out.v(1));
        fprintf('v_metaestable = %.6e m^3/mol\n',out.v(2));
        fprintf('v_vapor       = %.6e m^3/mol\n',out.v(3));

    else

        fprintf('v = \n');
        disp(out.v)

    end

end

if isfield(out,'Z')

    if isfield(out,'Zvap')

        fprintf('\n');
        fprintf('Numero de raices reales = 3\n');
        fprintf('Posible coexistencia liquido-vapor\n');

    elseif length(out.Z) == 1

        fprintf('\n');
        fprintf('Numero de raices reales = 1\n');
        fprintf('Estado monofasico\n');

    end

end

if isfield(out,'Tr')
    fprintf('Tr       = %.6f\n',out.Tr);
end

if isfield(out,'alpha')
    fprintf('alpha    = %.6f\n',out.alpha);
end

if isfield(out,'a')
    fprintf('a        = %.6e Pa*m^6/mol^2\n',out.a);
end

if isfield(out,'b')
    fprintf('b        = %.6e m^3/mol\n',out.b);
end

if isfield(out,'A')
    fprintf('A        = %.6e\n',out.A);
end

if isfield(out,'B')
    fprintf('B        = %.6e\n',out.B);
end

if isfield(out,'dPdT_v')
    fprintf('dP/dT|v  = %.6e Pa/K\n',out.dPdT_v);
end

if isfield(out,'dPdv_T')
    fprintf('dP/dv|T  = %.6e Pa/(m^3/mol)\n',out.dPdv_T);
end

if isfield(out,'dvdT_P')
    fprintf('dv/dT|P  = %.6e (m^3/mol)/K\n',out.dvdT_P);
end

if isfield(out,'da_dT')
    fprintf('da/dT    = %.6e\n',out.da_dT);
end

fprintf('=====================================\n');

end

  
