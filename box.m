function [L,W,H,P,Cut1_p1,Cut1_p3,Cut2_p8,Cut2_p10,Pattern1_p1,Pattern1_p3,Pattern2_p2,Pattern2_p4,Cir_pos_p2,Cir_pos_p4,Sc_p1,Sc_p3] = box
    T = 3; %thickness: 3 mm / The default unit in svg file is pixel.
    initpos = [0,0];
    while true
        L = input("Input the value of LENGTH (mm):\n");
        W = input("Input the value of WIDTH (mm):\n");
        H = input("Input the value of HEIGHT (mm):\n");
        if (initpos(1) + 2*L + W + 6*T)<= 457 && max(initpos(2) + 2*W + 3*T, initpos(2) + 2*H + 3*T)<= 457
            break;
        else
            disp('Error: Exceed the dismension of the board (457 mm * 304 mm)');
        end
    end
    p1 = initpos;
    p2 = p1 + [0,H];
    p3 = p2 + [0,W];
    p4 = p3 + [0,H];
    p5 = p4 + [0,W];
    p6 = p5 + [L,0];
    p7 = p6 + [0,-W];
    p8 = p7 + [0,-H];
    p9 = p8 + [0,-W];
    p10 = p9 + [0,-H];
    p11 = p10 + [W,0];
    p12 = p11 + [0,H];
    p13 = p12 + [0,W];
    p14 = p13 + [0,H];
    P = [p1;p2;p3;p4;p5;p6;p7;p8;p9;p10;p11;p12;p13;p14];
    line([p1(1);p5(1)],[p1(2);p5(2)])
    line([p5(1);p6(1)],[p5(2);p6(2)])
    line([p6(1);p10(1)],[p6(2);p10(2)])
    line([p11(1);p12(1)],[p11(2);p12(2)])
    line([p13(1);p14(1)],[p13(2);p14(2)])
    line([p1(1);p11(1)],[p1(2);p11(2)])
    line([p2(1);p12(1)],[p2(2);p12(2)])
    line([p3(1);p13(1)],[p3(2);p13(2)])
    line([p4(1);p14(1)],[p4(2);p14(2)])
    axis equal
    axis([0,L+W,0,2*(W+H)])

    [Cut1_p1] = Cut1(p1,L,W,H,T);
    [Cut1_p3] = Cut1(p3,L,W,H,T);
    [Cut2_p8] = Cut2(p8,L,W,H,T);
    [Cut2_p10] = Cut2(p10,L,W,H,T);
    [Pattern1_p1] = Pattern1(p1,L,W,H,T);
    [Pattern1_p3] = Pattern1(p3,L,W,H,T);
    [Pattern2_p2] = Pattern2(p2,L,W,H,T);
    [Pattern2_p4] = Pattern2(p4,L,W,H,T);
    r = 1.2; 
    Cir_pos_p2 = circle(p2,r,L,W,H,T);
    Cir_pos_p4 = circle(p4,r,L,W,H,T);
    Sc_p1 = screw(p1,L,W,H,T);
    Sc_p3 = screw(p3,L,W,H,T);
  
end

function [C] = Cut1(po,L,W,H,T)
    c1 = po + [0,3/8*H];
    c2 = c1 + [0,-H/8];
    c3 = c2 + [T,0];
    c4 = c3 + [0,H/8];

    Cpart1 = [c1;c2;c3;c4];
    line(Cpart1(:,1),Cpart1(:,2)) 
    line([c1(1),c4(1)],[c1(2),c4(2)])

    c5 = po + [0,5/8*H];
    c6 = c5 + [0,-H/8];
    c7 = c6 + [T,0];
    c8 = c7 + [0,H/8];

    Cpart2 = [c5;c6;c7;c8];
    line(Cpart2(:,1),Cpart2(:,2)) 
    line([c5(1),c8(1)],[c5(2),c8(2)])
    
    c9 = po + [L,5/8*H];
    c10 = c9 + [0,-H/8];
    c11 = c10 + [-T,0];
    c12 = c11 + [0,H/8];
    Cpart3 = [c9;c10;c11;c12];
    line(Cpart3(:,1),Cpart3(:,2)) 
    line([c9(1),c12(1)],[c9(2),c12(2)])

    c13 = po + [L,3/8*H];
    c14 = c13 + [0,-H/8];
    c15 = c14 + [-T,0];
    c16 = c15 + [0,H/8];
    Cpart4 = [c13;c14;c15;c16];
    line(Cpart4(:,1),Cpart4(:,2)) 
    line([c13(1),c16(1)],[c13(2),c16(2)])

    C = [Cpart1;Cpart2;Cpart3;Cpart4];
end

function [C] = Cut2(po,L,W,H,T)
    C_init = [];
    C_init(1,:) = po + [T,0];
    C_init(2,:) = C_init(1,:) + [0,1/4*H];
    C_init(3,:) = C_init(2,:) + [-T,0];
    C_init(4,:) = C_init(3,:) + [0,H/8];
    C_init(5,:) = C_init(4,:) + [T,0];
    C_init(6,:) = C_init(5,:) + [0,H/8];
    C_init(7,:) = C_init(6,:) + [-T,0];
    C_init(8,:) = C_init(7,:) + [0,H/8];
    C_init(9,:) = C_init(8,:) + [T,0];
    C_init(10,:) = po + [T,H];
    C_init(11,:) = po + [0,H];
    line(C_init(:,1),C_init(:,2)) 
    %%%% Vmirror %%%%%%
    C_vm = [2*po(1) + W - C_init(:,1),C_init(:,2)];
    line(C_vm(:,1),C_vm(:,2)) 
    %%%% others %%%%%%%
    c1 = po + [T,T];
    c2 = po + [W - T,T];
    line([c1(1),c2(1)],[c1(2),c2(2)])
    c3 = po + [T,H - T];
    c4 = po + [W - T,H - T];
    line([c3(1),c4(1)],[c3(2),c4(2)])
    C = [C_init;C_vm;c1;c2;c3;c4];

end

function [Pattern_po] = Pattern1(po,L,W,H,T)
    c1 = po + [T/6,0];
    c2 = c1 + [0,T];
    c3 = po + [L/2-2*T/3,T];
    c4 = c3 - [0,T];
    c5 = po + [L/2-T/3,0];
    c6 = c5 + [0,T];
    c7 = po + [L/2-T/6,T];
    c8 = po + [L/2-T/6,0];
    %%% mirroring vertical  %%%%%
    c9 = [L - c1(1),c1(2)];
    c10 = [L - c2(1),c2(2)];
    c11 = [L - c3(1),c3(2)];
    c12 = [L - c4(1),c4(2)];
    c13 = [L - c5(1),c5(2)];
    c14 = [L - c6(1),c6(2)];
    c15 = [L - c7(1),c7(2)];
    c16 = [L - c8(1),c8(2)];

    Cpart1 = [c1;c2;c3;c4;c5;c6;c7;c8;c9;c10;c11;c12;c13;c14;c15;c16];
    line(Cpart1(:,1),Cpart1(:,2)) 
    line([c1(1),c8(1)],[c1(2),c8(2)])
    
    %%% mirroring horizonal %%%%%
    c17 = [c1(1),2*po(2) + H - c1(2)];
    c18 = [c2(1),2*po(2) + H - c2(2)];
    c19 = [c3(1),2*po(2) + H - c3(2)];
    c20 = [c4(1),2*po(2) + H - c4(2)];
    c21 = [c5(1),2*po(2) + H - c5(2)];
    c22 = [c6(1),2*po(2) + H - c6(2)];
    c23 = [c7(1),2*po(2) + H - c7(2)];
    c24 = [c8(1),2*po(2) + H - c8(2)];
    c25 = [c9(1),2*po(2) + H - c9(2)];
    c26 = [c10(1),2*po(2) + H - c10(2)];
    c27 = [c11(1),2*po(2) + H - c11(2)];
    c28 = [c12(1),2*po(2) + H - c12(2)];
    c29 = [c13(1),2*po(2) + H - c13(2)];
    c30 = [c14(1),2*po(2) + H - c14(2)];
    c31 = [c15(1),2*po(2) + H - c15(2)];
    c32 = [c16(1),2*po(2) + H - c16(2)];
    Cpart2 = [c17;c18;c19;c20;c21;c22;c23;c24;c25;c26;c27;c28;c29;c30;c31;c32];
    line(Cpart2(:,1),Cpart2(:,2)) 
    line([c17(1),c32(1)],[c17(2),c32(2)])
    Pattern_po = [Cpart1;Cpart2];


end

function [Pattern_po] = Pattern2(po,L,W,H,T)
    c1 = po + [0,T];
    c2 = c1 + [T/6,0];
    c3 = c2 - [0,T];
    c4 = po + [L/2-2/3*T,0];
    c5 = c4 + [0,T];
    c6 = po + [L/2-T/3,T];
    c7 = po + [L/2-T/3,0];
    c8 = po + [L/2-T/6,0];
    c9 = c8 + [0,T];
    c10 = c9 + [T/6,0];
    Cpart1 = [c1;c2;c3;c4;c5;c6;c7;c8;c9;c10];
    line(Cpart1(:,1),Cpart1(:,2))
    %%% mirroring vertical  %%%%%
    c11 = [2*po(1) + L - c1(1),c1(2)];
    c12 = [2*po(1) + L - c2(1),c2(2)];
    c13 = [2*po(1) + L - c3(1),c3(2)];
    c14 = [2*po(1) + L - c4(1),c4(2)];
    c15 = [2*po(1) + L - c5(1),c5(2)];
    c16 = [2*po(1) + L - c6(1),c6(2)];
    c17 = [2*po(1) + L - c7(1),c7(2)];
    c18 = [2*po(1) + L - c8(1),c8(2)];
    c19 = [2*po(1) + L - c9(1),c9(2)];
    c20 = [2*po(1) + L - c10(1),c10(2)];
    Cpart2 = [c11;c12;c13;c14;c15;c16;c17;c18;c19;c20];
    line(Cpart2(:,1),Cpart2(:,2))

    %%% mirroring horizonal %%%%%
    c21 = [c1(1),2*po(2) + W - c1(2)];
    c22 = [c2(1),2*po(2) + W - c2(2)];
    c23 = [c3(1),2*po(2) + W - c3(2)];
    c24 = [c4(1),2*po(2) + W - c4(2)];
    c25 = [c5(1),2*po(2) + W - c5(2)];
    c26 = [c6(1),2*po(2) + W - c6(2)];
    c27 = [c7(1),2*po(2) + W - c7(2)];
    c28 = [c8(1),2*po(2) + W - c8(2)];
    c29 = [c9(1),2*po(2) + W - c9(2)];
    c30 = [c10(1),2*po(2) + W - c10(2)];
    Cpart3 = [c21;c22;c23;c24;c25;c26;c27;c28;c29;c30];
    line(Cpart3(:,1),Cpart3(:,2))

    c31 = [c11(1),2*po(2) + W - c11(2)];
    c32 = [c12(1),2*po(2) + W - c12(2)];
    c33 = [c13(1),2*po(2) + W - c13(2)];
    c34 = [c14(1),2*po(2) + W - c14(2)];
    c35 = [c15(1),2*po(2) + W - c15(2)];
    c36 = [c16(1),2*po(2) + W - c16(2)];
    c37 = [c17(1),2*po(2) + W - c17(2)];
    c38 = [c18(1),2*po(2) + W - c18(2)];
    c39 = [c19(1),2*po(2) + W - c19(2)];
    c40 = [c20(1),2*po(2) + W - c20(2)];
    Cpart4 = [c31;c32;c33;c34;c35;c36;c37;c38;c39;c40];
    line(Cpart4(:,1),Cpart4(:,2))

    Pattern_po = [Cpart1;Cpart2;Cpart3;Cpart4];
end

function pos = circle(po,r,L,W,H,T)
    pos = zeros(4,2);
    pos(1,:) = po + [L/4-T/4,T/2];
    pos(2,:) = po + [L/4-T/4,W - T/2];
    pos(3,:) = po + [3*L/4+T/4,T/2];
    pos(4,:) = po + [3*L/4+T/4,W - T/2];    
end

function [Sc] = screw(po,L,W,H,T)
    Ls = 7; % original nail 10mm then minus thickness 3mm
    Rs = 1.2;
    Wh = 2;
    Lh = 5;
    b = Lh/2 - Rs;
    c1 = po + [L/4-T/4-Rs,T];
    c2 = c1 + [0,Ls/4];
    c3 = c2 + [-b,0];
    c4 = c3 + [0,Wh];
    c5 = c4 + [b,0];
    c6 = c1 + [0,Ls];
    c12 = c1 + [2*Rs,0];
    c11 = c12 + [0,Ls/4];
    c10 = c11 + [b,0];
    c9 = c10 + [0,Wh];
    c8 = c9 + [-b,0];
    c7 = c6 + [2*Rs,0];
    C_init = [c1;c2;c3;c4;c5;c6;c7;c8;c9;c10;c11;c12];
    line(C_init(:,1),C_init(:,2))
    %%% mirroring vertical  %%%%%
    C_vm = [2*po(1) + L - C_init(:,1),C_init(:,2)];
    line(C_vm(:,1),C_vm(:,2))
    %%% mirroring horizonal %%%%%
    Sc= [C_init;C_vm];
    C_hm = [Sc(:,1),2*po(2) + H - Sc(:,2)];
    line(C_hm(1:size(C_hm)/2,1),C_hm(1:size(C_hm)/2,2))
    line(C_hm(size(C_hm)/2+1:end,1),C_hm(size(C_hm)/2+1:end,2))
    Sc= [Sc;C_hm];

end

