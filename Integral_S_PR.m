function DS = Integral_S_PR(T,v1,v2,Tc,Pc,omega)

%=========================================
% Integral de Entropia usando Peng-Robinson
%
% dS = ∫ (∂P/∂T)v dv
%
% Resultado:
% DS [J/mol.K]
%=========================================

f = @(v) arrayfun(@(x) ...
    PengRobinson('Tv',T,x,Tc,Pc,omega,false).dPdT_v, v);

DS = integral(f,v1,v2);

fprintf('\n');
fprintf('=====================================\n');
fprintf('Contribucion EOS a Entropia\n');
fprintf('=====================================\n');
fprintf('T      = %.4f K\n',T);
fprintf('v1     = %.6e m^3/mol\n',v1);
fprintf('v2     = %.6e m^3/mol\n',v2);
fprintf('\n');
fprintf('Integral calculada:\n');
fprintf('DS = ∫[(∂P/∂T)_v]dv\n');
fprintf('\n');
fprintf('Resultado = %.6e J/mol.K\n',DS);
fprintf('=====================================\n');

end