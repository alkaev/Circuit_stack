

module RS(output wire Q, input wire R, C, S, RESET);
    wire Rc, Sc, notQ, w1;
    and IN1(Rc, R, C);
    and IN2(Sc, S, C);
    nor NOR1(w1, Sc, Q); 
    or OR1(notQ, w1, RESET);
    nor NOR2(Q, notQ, Rc);
endmodule

module D_trigger(output wire Q, input wire C, D, RESET);
    wire  notD;
    not ND(notD, D);
    RS RS1(.Q(Q), .R(notD), .C(C), .S(D), .RESET(RESET) );
endmodule

module D_trigger_front(output wire Q, input wire C, D, RESET);
    wire notC, w1;
    not NC(notC, C);
    D_trigger D_TR1(.Q(w1), .C(C), .D(D), .RESET(RESET));
    D_trigger D_TR2(.Q(Q), .C(notC), .D(w1), .RESET(RESET));
endmodule


module counter_5(output wire Q0, Q1, Q2, Q3, Q4, input wire C, pop_push, RESET);
    wire w01, w02, w11, w12, w21, w22, w31, w32, w41, w42, W0, W1, W2, W3, W4, resandW0, resandC, notpop_push;
    not Npush_pop(notpop_push, pop_push);

    and W_01(w01, pop_push, Q4);
    and W_02(w02, notpop_push, Q1);
    or W_0(W0, w01, w02);
    or res_and_wo(resandW0, W0, RESET);
    or res_and_c(resandC, RESET, C);
    D_trigger_front D_TR0(.Q(Q0), .C(resandC), .D(resandW0), .RESET(RESET));

    and W_11(w11, pop_push, Q0);
    and W_12(w12, notpop_push, Q2);
    or W_1(W1, w11, w12);
    D_trigger_front D_TR1(.Q(Q1), .C(C), .D(W1), .RESET(RESET));

    and W_21(w21, pop_push, Q1);
    and W_22(w22, notpop_push, Q3);
    or W_2(W2, w21, w22);
    D_trigger_front D_TR2(.Q(Q2), .C(C), .D(W2), .RESET(RESET));

    and W_31(w31, pop_push, Q2);
    and W_32(w32, notpop_push, Q4);
    or W_3(W3, w31, w32);
    D_trigger_front D_TR3(.Q(Q3), .C(C), .D(W3), .RESET(RESET));

    and W_41(w41, pop_push, Q3);
    and W_42(w42, notpop_push, Q0);
    or W_4(W4, w41, w42);
    D_trigger_front D_TR4(.Q(Q4), .C(C), .D(W4), .RESET(RESET));
endmodule

module Minus1_or_0(output wire Q0, Q1, Q2, Q3, Q4, input wire A0, A1, A2, A3, A4, C);
    and Q_0(Q0, C, A1 );
    and Q_1(Q1, C, A2 );
    and Q_2(Q2, C, A3 );
    and Q_3(Q3, C, A4 );
    and Q_4(Q4, C, A0 );
endmodule

module Minus2_or_0(output wire Q0, Q1, Q2, Q3, Q4, input wire A0, A1, A2, A3, A4, C);
    and Q_0(Q0, C, A2 );
    and Q_1(Q1, C, A3 );
    and Q_2(Q2, C, A4 );
    and Q_3(Q3, C, A0 );
    and Q_4(Q4, C, A1 );
endmodule

module Minus3_or_0(output wire Q0, Q1, Q2, Q3, Q4, input wire A0, A1, A2, A3, A4, C);
    and Q_0(Q0, C, A3 );
    and Q_1(Q1, C, A4 );
    and Q_2(Q2, C, A0 );
    and Q_3(Q3, C, A1 );
    and Q_4(Q4, C, A2 );
endmodule

module Minus4_or_0(output wire Q0, Q1, Q2, Q3, Q4, input wire A0, A1, A2, A3, A4, C);
    and Q_0(Q0, C, A4 );
    and Q_1(Q1, C, A0 );
    and Q_2(Q2, C, A1 );
    and Q_3(Q3, C, A2 );
    and Q_4(Q4, C, A3 );
endmodule

module OperationManager(output wire Q0, Q1, Q2, Q3, Q4, input wire pop, push, get, get0, get1, get2,  A0, A1, A2, A3, A4 );
    wire w00, w01, w02, w03, w04, w10, w11, w12, w13, w14, w20, w21, w22, w23, w24, w30, w31, w32, w33, w34, w40, notget0, notget1, notget2,
    w41, w42, w43, w44, w50, w51, w52, w53, w54, pushOrget, C2, C3, C4, g0, g1, g2, g3, g4, g5, g6, g7;

    not Ng0(notget0, get0);
    not Ng1(notget1, get1);
    not Ng2(notget2, get2);

    and get_0(g0, notget0, notget1, notget2, get);
    and get_1(g1, notget0, notget1, get2, get);
    and get_2(g2, notget0, get1, notget2, get);
    and get_3(g3, notget0, get1, get2, get);
    and get_4(g4, get0, notget1, notget2, get);
    and get_5(g5, get0, notget1, get2, get);
    and get_6(g6, get0, get1, notget2, get);
    and get_7(g7, get0, get1, get2, get);
    
    or C_1(C1, g4, push);
    or C_2(C2, g0, g5);
    or c_3(C3, g1, g6);
    or C_4(C4, g2, g7);

    Minus1_or_0 M0(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .C(pop), .Q0(w00), .Q1(w01), .Q2(w02), .Q3(w03), .Q4(w04));
    and AND0(w10, C1, A0);
    and AND1(w11, C1, A1);
    and AND2(w12, C1, A2);
    and AND3(w13, C1, A3);
    and AND4(w14, C1, A4);
    
    // нижнии модули

    Minus1_or_0 M1(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .C(C2), .Q0(w20), .Q1(w21), .Q2(w22), .Q3(w23), .Q4(w24));
    Minus2_or_0 M2(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .C(C3), .Q0(w30), .Q1(w31), .Q2(w32), .Q3(w33), .Q4(w34));
    Minus3_or_0 M3(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .C(C4), .Q0(w40), .Q1(w41), .Q2(w42), .Q3(w43), .Q4(w44));
    Minus4_or_0 M4(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .C(g3), .Q0(w50), .Q1(w51), .Q2(w52), .Q3(w53), .Q4(w54));

    // выходы
    
    or Q_0(Q0, w00, w10, w20, w30, w40, w50);
    or Q_1(Q1, w01, w11, w21, w31, w41, w51);
    or Q_2(Q2, w02, w12, w22, w32, w42, w52);
    or Q_3(Q3, w03, w13, w23, w33, w43, w53);
    or Q_4(Q4, w04, w14, w24, w34, w44, w54);
    
endmodule

module cell_4(output wire[3:0] ODATA, input wire RESET, CLK, input wire[3:0] IDATA);
    
    D_trigger D_TR0(.Q(ODATA[0]), .C(CLK), .RESET(RESET), .D(IDATA[0]));
    D_trigger D_TR1(.Q(ODATA[1]), .C(CLK), .RESET(RESET), .D(IDATA[1]));
    D_trigger D_TR2(.Q(ODATA[2]), .C(CLK), .RESET(RESET), .D(IDATA[2]));
    D_trigger D_TR3(.Q(ODATA[3]), .C(CLK), .RESET(RESET), .D(IDATA[3]));

endmodule

module MUX(output wire[3:0] DATA, input wire A0, A1, A2, A3, A4, input wire[3:0] D0, D1, D2, D3, D4);
wire w00, w01, w02, w03, w10, w11, w12, w13, w20, w21, w22, w23, w30, w31, w32, w33, w40, w41, w42, w43;

    and AND00(w00, A0, D0[0]);
    and AND01(w01, A0, D0[1]);
    and AND02(w02, A0, D0[2]);
    and AND03(w03, A0, D0[3]);

    and AND10(w10, A1, D1[0]);
    and AND11(w11, A1, D1[1]);
    and AND12(w12, A1, D1[2]);
    and AND13(w13, A1, D1[3]);

    and AND20(w20, A2, D2[0]);
    and AND21(w21, A2, D2[1]);
    and AND22(w22, A2, D2[2]);
    and AND23(w23, A2, D2[3]);

    and AND30(w30, A3, D3[0]);
    and AND31(w31, A3, D3[1]);
    and AND32(w32, A3, D3[2]);
    and AND33(w33, A3, D3[3]);

    and AND40(w40, A4, D4[0]);
    and AND41(w41, A4, D4[1]);
    and AND42(w42, A4, D4[2]);
    and AND43(w43, A4, D4[3]);

    or OR0(DATA[0], w00, w10, w20, w30, w40);
    or OR1(DATA[1], w01, w11, w21, w31, w41);
    or OR2(DATA[2], w02, w12, w22, w32, w42);
    or OR3(DATA[3], w03, w13, w23, w33, w43);

endmodule  

module MEM(output wire[3:0] ODATA, input wire A0, A1, A2, A3, A4, R_W, CLK, RESET, input wire[3:0] IDATA);
    wire RC, CLK0, CLK1, CLK2, CLK3, CLK4;
    wire[3:0] D0, D1, D2, D3, D4;
    
    and read_and_clk(RC, CLK, R_W);
    and AND0(CLK0, RC, A0);
    and AND1(CLK1, RC, A1);
    and AND2(CLK2, RC, A2);
    and AND3(CLK3, RC, A3);
    and AND4(CLK4, RC, A4);

    cell_4 Cell0(.ODATA(D0), .RESET(RESET), .CLK(CLK0), .IDATA(IDATA));
    cell_4 Cell1(.ODATA(D1), .RESET(RESET), .CLK(CLK1), .IDATA(IDATA));
    cell_4 Cell2(.ODATA(D2), .RESET(RESET), .CLK(CLK2), .IDATA(IDATA));
    cell_4 Cell3(.ODATA(D3), .RESET(RESET), .CLK(CLK3), .IDATA(IDATA));
    cell_4 Cell4(.ODATA(D4), .RESET(RESET), .CLK(CLK4), .IDATA(IDATA));

    MUX MUX1(.DATA(ODATA), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4));
endmodule

module in_out(output wire Q, input wire A, B);
    wire notA; 
    not not_A(notA, A);
    nmos p_tr(Q, (B), A);
    pmos n_tr(Q, (B), notA);
endmodule

module in_out_4(output wire[3:0] ODATA, input wire READ, input wire[3:0] IDATA);

    in_out INOUT0(.Q(ODATA[0]), .A(READ), .B(IDATA[0]) );
    in_out INOUT1(.Q(ODATA[1]), .A(READ), .B(IDATA[1]) );
    in_out INOUT2(.Q(ODATA[2]), .A(READ), .B(IDATA[2]) );
    in_out INOUT3(.Q(ODATA[3]), .A(READ), .B(IDATA[3]) );

endmodule

module stack(output wire[3:0] IODATA_out, input wire RESET, CLK, input wire[1:0] COMMAND, input wire[2:0] INDEX, input wire[3:0] IDATA);
    wire notOP1, notOP2, nop, push, pop, get, getORpop, pushORpop, CLKcounter, CLKpopORget, notpop, counterPP,
    Q0, Q1, Q2, Q3, Q4, W0, W1, W2, W3, W4;
    wire[3:0] OUTMEM;
    not not_OP1(notOP1, COMMAND[0]);
    not not_OP2(notOP2, COMMAND[1]);
    and NOP(nop, notOP1, notOP2);
    and PUSH(push, notOP1, COMMAND[1]);
    and POP(pop, COMMAND[0], notOP2);
    not NOT_POP(notpop, pop);
    and GET(get, COMMAND[0], COMMAND[1]);
    or POP_OR_GET(getORpop, pop, get);
    or PUSH_OR_POP(pushORpop, push, pop);
    and CLK_COUNTER(CLKcounter, pushORpop, CLK);
    and CLK_POP_OR_GET(CLKpopORget, getORpop, CLK);
    or COUNTER_PP(counterPP, notpop, push);

    counter_5 C5(.C(CLKcounter), .pop_push(counterPP), .RESET(RESET), .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4));
    OperationManager M5(.pop(pop), .A0(Q0), .A1(Q1), .A2(Q2), .A3(Q3), .A4(Q4), 
    .push(push), .get(get), .get0(INDEX[0]), .get1(INDEX[1]), .get2(INDEX[2]), .Q0(W0), .Q1(W1), .Q2(W2), .Q3(W3), .Q4(W4) );
    MEM MEM0(.A0(W0), .A1(W1), .A2(W2), .A3(W3), .A4(W4), .R_W(push), .CLK(CLK), .RESET(RESET), .IDATA(IDATA), .ODATA(OUTMEM));
    in_out INOUT0(.Q(OUTMEM[0]), .A(CLKpopORget), .B(IODATA_out[0]));
    in_out INOUT1(.Q(OUTMEM[1]), .A(CLKpopORget), .B(IODATA_out[1]));
    in_out INOUT2(.Q(OUTMEM[2]), .A(CLKpopORget), .B(IODATA_out[2]));
    in_out INOUT3(.Q(OUTMEM[3]), .A(CLKpopORget), .B(IODATA_out[3]));
endmodule 

module stack_structural_normal(
    input wire RESET, 
    input wire CLK, 
    input wire[1:0] COMMAND,
    input wire[2:0] INDEX,
    inout wire[3:0] IO_DATA
    ); 
    
   stack ST0(.IODATA_out(IO_DATA), .RESET(RESET), .CLK(CLK), .COMMAND(COMMAND), .INDEX(INDEX), .IDATA(IO_DATA));

endmodule
