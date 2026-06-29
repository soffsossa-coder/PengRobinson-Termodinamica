function DS = DeltaSreal(comp,T1,P1,T2,P2)

DS = DeltaSig(comp,T1,T2,P1,P2) ...
    + SresPR(comp,T2,P2) ...
    - SresPR(comp,T1,P1);

fprintf('DeltaS = %.4f J/mol.K\n',DS)

end