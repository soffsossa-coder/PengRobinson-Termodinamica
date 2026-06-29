function DH = DeltaHreal(comp,T1,P1,T2,P2)

DH = DeltaHig(comp,T1,T2) ...
   + HresPR(comp,T2,P2) ...
   - HresPR(comp,T1,P1);

fprintf('DeltaH = %.4f J/mol\n',DH)

end