function DU = DeltaUreal(comp,T1,P1,T2,P2)

DU = DeltaUig(comp,T1,T2) ...
    + UresPR(comp,T2,P2) ...
    - UresPR(comp,T1,P1);

fprintf('DeltaU = %.4f J/mol\n',DU)

end