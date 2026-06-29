function I = Integral_dPdT(T,v1,v2,Tc,Pc,omega)

% =====================================================
% INTEGRAL TERMODINAMICA
%
% I = ∫[(dP/dT)v]dv
%
% Entradas:
%
% T      [K]
% v1     [m^3/mol]
% v2     [m^3/mol]
% Tc     [K]
% Pc     [Pa]
% omega  [-]
%
% Salida:
%
% I      [J/(mol.K)]
%
% =====================================================

f = @(v) arrayfun(@(x) ...
    PengRobinson('Tv',T,x,Tc,Pc,omega,false).dPdT_v , v);

I = integral(f,v1,v2);

fprintf('\n');
fprintf('=====================================\n');
fprintf('Integral Termodinamica Peng-Robinson\n');
fprintf('=====================================\n');

fprintf('T      = %.4f K\n',T);
fprintf('v1     = %.6e m^3/mol\n',v1);
fprintf('v2     = %.6e m^3/mol\n',v2);

fprintf('\n');
fprintf('Integral calculada:\n');
fprintf('I = ∫[(dP/dT)v]dv\n');

fprintf('\n');
fprintf('Resultado = %.6e J/(mol.K)\n',I);

fprintf('=====================================\n');

end