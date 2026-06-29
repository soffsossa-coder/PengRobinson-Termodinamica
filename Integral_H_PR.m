function DH = Integral_H_PR(T,P1,P2,Tc,Pc,omega)

% =====================================================
% CONTRIBUCION EOS A LA ENTALPIA
%
% DH = ∫ [ v - T(dv/dT)P ] dP
%
% Entradas:
%
% T      [K]
% P1     [Pa]
% P2     [Pa]
% Tc     [K]
% Pc     [Pa]
% omega  [-]
%
% Salida:
%
% DH     [J/mol]
%
% =====================================================

f = @(P) arrayfun(@(x) IntegrandoH(T,x,Tc,Pc,omega),P);

DH = integral(f,P1,P2);

fprintf('\n');
fprintf('=====================================\n');
fprintf('Contribucion EOS a Entalpia\n');
fprintf('=====================================\n');

fprintf('T      = %.4f K\n',T);
fprintf('P1     = %.6e Pa\n',P1);
fprintf('P2     = %.6e Pa\n',P2);

fprintf('\n');
fprintf('Integral calculada:\n');
fprintf('DH = ∫[v - T(dv/dT)P]dP\n');

fprintf('\n');
fprintf('Resultado = %.6e J/mol\n',DH);

fprintf('=====================================\n');

end

% =====================================================
% FUNCION AUXILIAR
% =====================================================

function y = IntegrandoH(T,P,Tc,Pc,omega)

out = PengRobinson('TP',T,P,Tc,Pc,omega,false);

% Raiz vapor
v = out.v(end);

dvdT_P = out.dvdT_P;

y = v - T*dvdT_P;

end