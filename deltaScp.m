function dS = deltaScp(T1,T2,A,B,C,D)

% ==========================================
% Integración de Cp/T
%
% Devuelve:
% dS en J/mol.K
% ==========================================

dS = A*log(T2/T1) ...
    + B*(T2-T1) ...
    + (C/2)*(T2^2-T1^2) ...
    + (D/3)*(T2^3-T1^3);

fprintf('\n');
fprintf('ΔS = %.6f J/mol.K\n',dS);

end