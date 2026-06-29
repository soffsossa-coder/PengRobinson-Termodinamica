function dH = deltaHcp(T1,T2,A,B,C,D)

% ==========================================
% Integración de Cp
%
% Cp = A + B*T + C*T^2 + D*T^3
%
% T en K
% Cp en J/mol.K
%
% Devuelve:
% dH en J/mol
% ==========================================

dH = A*(T2-T1) ...
    + (B/2)*(T2^2-T1^2) ...
    + (C/3)*(T2^3-T1^3) ...
    + (D/4)*(T2^4-T1^4);

fprintf('\n');
fprintf('ΔH = %.6f J/mol\n',dH);

end