function W = Integral_W_PR(T,v1,v2,Tc,Pc,omega)

f = @(v) arrayfun(@(x) ...
    PengRobinson('Tv',T,x,Tc,Pc,omega,false).P, v);

W = integral(f,v1,v2);

fprintf('\n');
fprintf('=====================================\n');
fprintf('Trabajo con Peng-Robinson\n');
fprintf('=====================================\n');
fprintf('T      = %.4f K\n',T);
fprintf('v1     = %.6e m^3/mol\n',v1);
fprintf('v2     = %.6e m^3/mol\n',v2);
fprintf('\n');
fprintf('W = ∫Pdv\n');
fprintf('\n');
fprintf('Resultado = %.6e J/mol\n',W);
fprintf('=====================================\n');

end