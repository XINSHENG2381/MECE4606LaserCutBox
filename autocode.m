clc;close all;clear;

[L,W,H,P,Cut1_p1,Cut1_p3,Cut2_p8,Cut2_p10,Pattern1_p1,Pattern1_p3,Pattern2_p2,Pattern2_p4,Cir_pos_p2,Cir_pos_p4,Sc_p1,Sc_p3] = box;
r = 1.2;
dfile ='matlab2svg.svg';
if exist(dfile, 'file') 
    delete(dfile); 
end
diary on
disp('<?xml version = "1.0" encoding = "UTF-16" ?>')
disp('<svg xmlns = "http://www.w3.org/2000/svg" version = "1.1">')

% fprintf('<polyline points="%d,%d %d,%d" fill="none" stroke="black"/>\n',p1(1),p1(2),p2(1),p2(2))
seq_P = [1,5;5,6;6,10;11,12;13,14;1,11;2,12;3,13;4,14];
for i = 1:size(seq_P,1)
    disp(['<polyline points="' num2str(P(seq_P(i,1),1)) ',' num2str(P(seq_P(i,1),2)) ' ' num2str(P(seq_P(i,2),1)) ',' num2str(P(seq_P(i,2),2)) '" fill="none" stroke="black"/>'])
end
seq_Cut1_p1 = [1,2;2,3;3,4;4,1;5,6,;6,7;7,8;8,5;9,10;10,11;11,12;12,9;13,14;14,15;15,16;16,13];
for i = 1:size(seq_Cut1_p1,1)
    disp(['<polyline points="' num2str(Cut1_p1(seq_Cut1_p1(i,1),1)) ',' num2str(Cut1_p1(seq_Cut1_p1(i,1),2)) ' ' num2str(Cut1_p1(seq_Cut1_p1(i,2),1)) ',' num2str(Cut1_p1(seq_Cut1_p1(i,2),2)) '" fill="none" stroke="black"/>'])
end
seq_Cut1_p3 = [1,2;2,3;3,4;4,1;5,6,;6,7;7,8;8,5;9,10;10,11;11,12;12,9;13,14;14,15;15,16;16,13];
for i = 1:size(seq_Cut1_p3,1)
    disp(['<polyline points="' num2str(Cut1_p3(seq_Cut1_p3(i,1),1)) ',' num2str(Cut1_p3(seq_Cut1_p3(i,1),2)) ' ' num2str(Cut1_p3(seq_Cut1_p3(i,2),1)) ',' num2str(Cut1_p3(seq_Cut1_p3(i,2),2)) '" fill="none" stroke="black"/>'])
end

seq_Cut2_p8 = [1,2;2,3;3,4;4,5;5,6;6,7;7,8;8,9;9,10;10,11;12,13;13,14;14,15;15,16;16,17;17,18;18,19;19,20;20,21;21,22;23,24;25,26];
for i = 1:size(seq_Cut2_p8,1)
    disp(['<polyline points="' num2str(Cut2_p8(seq_Cut2_p8(i,1),1)) ',' num2str(Cut2_p8(seq_Cut2_p8(i,1),2)) ' ' num2str(Cut2_p8(seq_Cut2_p8(i,2),1)) ',' num2str(Cut2_p8(seq_Cut2_p8(i,2),2)) '" fill="none" stroke="black"/>'])
end

seq_Cut2_p10 = [1,2;2,3;3,4;4,5;5,6;6,7;7,8;8,9;9,10;10,11;12,13;13,14;14,15;15,16;16,17;17,18;18,19;19,20;20,21;21,22;23,24;25,26];
for i = 1:size(seq_Cut2_p10,1)
    disp(['<polyline points="' num2str(Cut2_p10(seq_Cut2_p10(i,1),1)) ',' num2str(Cut2_p10(seq_Cut2_p10(i,1),2)) ' ' num2str(Cut2_p10(seq_Cut2_p10(i,2),1)) ',' num2str(Cut2_p10(seq_Cut2_p10(i,2),2)) '" fill="none" stroke="black"/>'])
end

seq_Pattern1_p1 = [1:1:7,8,16:-1:10,17:1:31,32;2:1:8,16,15:-1:9,18:1:32,17]';
for i = 1:size(seq_Pattern1_p1,1)
    disp(['<polyline points="' num2str(Pattern1_p1(seq_Pattern1_p1(i,1),1)) ',' num2str(Pattern1_p1(seq_Pattern1_p1(i,1),2)) ' ' num2str(Pattern1_p1(seq_Pattern1_p1(i,2),1)) ',' num2str(Pattern1_p1(seq_Pattern1_p1(i,2),2)) '" fill="none" stroke="black"/>'])
end

seq_Pattern1_p3 = [1:1:7,8,16:-1:10,17:1:31,32;2:1:8,16,15:-1:9,18:1:32,17]';
for i = 1:size(seq_Pattern1_p3,1)
    disp(['<polyline points="' num2str(Pattern1_p3(seq_Pattern1_p3(i,1),1)) ',' num2str(Pattern1_p3(seq_Pattern1_p3(i,1),2)) ' ' num2str(Pattern1_p3(seq_Pattern1_p3(i,2),1)) ',' num2str(Pattern1_p3(seq_Pattern1_p3(i,2),2)) '" fill="none" stroke="black"/>'])
end

seq_Pattern2_p2 = [1:1:9,11:1:19,21:1:29,31:1:39;2:1:10,12:1:20,22:1:30,32:1:40]';
for i = 1:size(seq_Pattern2_p2,1)
    disp(['<polyline points="' num2str(Pattern2_p2(seq_Pattern2_p2(i,1),1)) ',' num2str(Pattern2_p2(seq_Pattern2_p2(i,1),2)) ' ' num2str(Pattern2_p2(seq_Pattern2_p2(i,2),1)) ',' num2str(Pattern2_p2(seq_Pattern2_p2(i,2),2)) '" fill="none" stroke="black"/>'])
end

seq_Pattern2_p4 = [1:1:9,11:1:19,21:1:29,31:1:39;2:1:10,12:1:20,22:1:30,32:1:40]';
for i = 1:size(seq_Pattern2_p4,1)
    disp(['<polyline points="' num2str(Pattern2_p4(seq_Pattern2_p4(i,1),1)) ',' num2str(Pattern2_p4(seq_Pattern2_p4(i,1),2)) ' ' num2str(Pattern2_p4(seq_Pattern2_p4(i,2),1)) ',' num2str(Pattern2_p4(seq_Pattern2_p4(i,2),2)) '" fill="none" stroke="black"/>'])
end

for i = 1:4
    disp(['<circle cx="' num2str(Cir_pos_p2(i,1)) '" cy="' num2str(Cir_pos_p2(i,2)) '" r="' num2str(r) '" fill="none" stroke="black"/>'])
end

for i = 1:4
    disp(['<circle cx="' num2str(Cir_pos_p4(i,1)) '" cy="' num2str(Cir_pos_p4(i,2)) '" r="' num2str(r) '" fill="none" stroke="black"/>'])
end

seq_Sc = [1:1:11,13:1:23,25:1:35,37:1:47;2:1:12,14:1:24,26:1:36,38:1:48]';
for i = 1:size(seq_Sc,1)
    disp(['<polyline points="' num2str(Sc_p1(seq_Sc(i,1),1)) ',' num2str(Sc_p1(seq_Sc(i,1),2)) ' ' num2str(Sc_p1(seq_Sc(i,2),1)) ',' num2str(Sc_p1(seq_Sc(i,2),2)) '" fill="none" stroke="black"/>'])
end
for i = 1:size(seq_Sc,1)
    disp(['<polyline points="' num2str(Sc_p3(seq_Sc(i,1),1)) ',' num2str(Sc_p3(seq_Sc(i,1),2)) ' ' num2str(Sc_p3(seq_Sc(i,2),1)) ',' num2str(Sc_p3(seq_Sc(i,2),2)) '" fill="none" stroke="black"/>'])
end

fprintf('<image href="icon-logo.png" x="%f" y="%f" width="%fpx" transform="translate(%f,%f)"/>\n',0.5*L,H/3,H/3,-H/3/2,-H/3/2) % icon-logo.png: 234*234 pixels
fprintf('<text x="%f" y="%f" font-size="%fem" transform="translate(%f,%f)" font-family="monospace">Digital Manufacturing</text>', L/2,H/2,H/14/16,-H/16/2*10,-H/14/16/2)
fprintf('<text x="%f" y="%f" font-size="%fem" transform="translate(%f,%f)" font-family="monospace">xg2381   tg2776</text>', L/2,2/3*H,H/14/16,-H/16/2*8,-H/14/16/2)
fprintf('<text x="%f" y="%f" font-size="%fem" transform="translate(%f,%f)" font-family="monospace">Laser Cut Box</text>', L/2,2*H+3/2*W,H/10/16,-H/16/2*9,-H/14/16/2)

disp('</svg>')
diary off