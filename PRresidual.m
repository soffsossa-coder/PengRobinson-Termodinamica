function out = PRresidual(compuesto,T,P)

% ==========================================
% PROPIEDADES RESIDUALES PENG-ROBINSON
%
% Entradas:
%
% compuesto
% T [K]
% P [Pa]
%
% Salidas:
%
% HR [J/mol]
% SR [J/(mol.K)]
% GR [J/mol]
% UR [J/mol]
%
% ==========================================

R = 8.314462618;

% Obtener propiedades EOS
pr = PRcompuesto(compuesto,'TP',T,P);

% Raiz vapor
Z = pr.Z(end);
v = pr.v(end);

A = pr.A;
B = pr.B;

a = pr.a;
b = pr.b;

da_dT = pr.da_dT;

% ==========================================
% Termino logaritmico
% ==========================================

L = log( ...
    (Z + (1+sqrt(2))*B) / ...
    (Z + (1-sqrt(2))*B) );

% ==========================================
% Entalpia residual
% ==========================================

HR = R*T*(Z-1) ...
    + ((T*da_dT - a)/(2*sqrt(2)*b))*L;

% ==========================================
% Entropia residual
% ==========================================

SR = R*log(Z-B) ...
    + (da_dT/(2*sqrt(2)*b))*L;

% ==========================================
% Gibbs residual
% ==========================================

GR = HR - T*SR;

% ==========================================
% Energia interna residual
% ==========================================

UR = HR - P*(v - R*T/P);

% ==========================================
% Mostrar resultados
% ==========================================

fprintf('\n');
fprintf('=====================================\n');
fprintf('Propiedades Residuales Peng-Robinson\n');
fprintf('=====================================\n');

fprintf('HR = %.6e J/mol\n',HR);
fprintf('SR = %.6e J/(mol.K)\n',SR);
fprintf('GR = %.6e J/mol\n',GR);
fprintf('UR = %.6e J/mol\n',UR);

fprintf('=====================================\n');

% ==========================================
% Salida
% ==========================================

out.HR = HR;
out.SR = SR;
out.GR = GR;
out.UR = UR;

end