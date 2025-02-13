%SID: 862480118
%Kincade-Bennett,Elijah

%ME18A Assignment Lab 1
%January 16, 2025


p2=input("what is p2 in mW?");
p1= 1;

dBm= 10*log10(p2/p1);

fprintf("%.2f mW is equal to %.2f dBm",p2, dBm)