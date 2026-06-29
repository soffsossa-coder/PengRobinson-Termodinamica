function DU = Integral_U_PR(T,v1,v2,Tc,Pc,omega)

% =====================================================
% CONTRIBUCION EOS A LA ENERGIA INTERNA
%
% DU = ∫ [ T(dP/dT)v - P ] dv
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
% DU     [J/mol]
%
% =====================================================

f = @(v) arrayfun(@(x) ...
    T*PengRobinson('Tv',T,x,Tc,Pc,omega,false).dPdT_v ...
    -PengRobinson('Tv',T,x,Tc,Pc,omega,false).P , v);

DU = integral(f,v1,v2);

fprintf('\n');
fprintf('=====================================\n');
fprintf('Contribucion EOS a Energia Interna\n');
fprintf('=====================================\n');

fprintf('T      = %.4f K\n',T);
fprintf('v1     = %.6e m^3/mol\n',v1);
fprintf('v2     = %.6e m^3/mol\n',v2);

fprintf('\n');
fprintf('Integral calculada:\n');
fprintf('DU = ∫[T(dP/dT)v - P]dv\n');

fprintf('\n');
fprintf('Resultado = %.6e J/mol\n',DU);

fprintf('=====================================\n');

end