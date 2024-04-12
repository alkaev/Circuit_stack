`include "stack_structural.sv"

module D_trigger_tb;
    reg D, C, RESET; wire Q, notQ;
    D_trigger dt_test(.Q(Q), .D(D), .C(C), .RESET(RESET));
    int errors = 0;

    initial begin
        //#100; $monitor("time %0d: D=%b, C=%b, RESET=%b, Q=%b, notQ=%b", $time, D, C, RESET, Q, notQ);
        #1;RESET = 0; D = 0; C = 0; 
        RESET = 1; #1;
        RESET = 0; #1;
        if(Q) errors++;
        RESET = 0;
        C = 1;
        #1; if(Q) errors++;
        C = 0; D = 1;
        #1; if(Q) errors++;
        C = 1;
        #1; if(!Q) errors++;
        C = 0; D = 0;
        #1; if(!Q) errors++;

        D = 1;
        #1; if(!Q) errors++;
        RESET = 1;
        #1; if(Q) errors++;

        #1; if (errors) $display("incorrectly implemented D_trigger");
        else $display("correctly implemented D_trigger");
    end 
endmodule

module D_trigger_front_tb;
    reg D, C, RESET; wire Q;
    D_trigger_front dtf_test(.Q(Q), .D(D), .C(C), .RESET(RESET));
    int errors = 0;

    initial begin
        //#150; $monitor("time %0d: D=%b, C=%b, RESET=%b, Q=%b, notQ=%b", $time, D, C, RESET, Q, notQ);
        RESET = 0; D = 0; C = 0; 
        RESET = 1;
        #1; if(Q) errors++;
        RESET = 0;
        #1; if(Q) errors++;
        D = 1;
        #1; if(Q) errors++;
        C = 1;
        #1; if(Q) errors++;
        C = 0;
        #1; if(!Q) errors++;
        D = 0;
        #1; if(!Q) errors++;
        C = 1;
        #1; if(!Q) errors++;
        C = 0;
        #1; if(Q) errors++;

        D = 1;
        #1 C = 1;
        #1 C = 0;
        #1; if(!Q) errors++;
        RESET = 1;
        #1; if(Q) errors++;
        
        #1; if (errors) $display("incorrectly implemented D_trigger_front");
        else $display("correctly implemented D_trigger_front");
    end 
endmodule


module counter_5_tb;
    reg pop_push, C, RESET; wire Q0 , Q1, Q2, Q3, Q4;
    counter_5 counter_test(.Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4), .C(C), .RESET(RESET), .pop_push(pop_push));
    int errors = 0;

    initial begin
        //#100; $monitor("time %0d: Q0=%b , Q1=%b, Q2=%b, Q3=%b, Q4=%b", $time, Q0 , Q1, Q2, Q3, Q4);
        RESET = 0; pop_push = 0; C = 0; 
        RESET = 1;
        #1; RESET = 0;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        pop_push = 1; #1; C = 1; #1; C = 0;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;
        C = 1; #1; C = 0;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        
        #1; if (errors) $display("incorrectly implemented counter_5");
        else $display("correctly implemented counter_5");
    end 
endmodule

module Minus1_or_0_tb;
    reg A0, A1, A2, A3, A4, C; wire Q0, Q1, Q2, Q3, Q4;
    Minus1_or_0 Minus1_or_0_test(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4),
     .C(C), .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4));
    int errors = 0;

    initial begin
        //#100; $monitor("time %0d: Q0=%b , Q1=%b, Q2=%b, Q3=%b, Q4=%b", $time, Q0 , Q1, Q2, Q3, Q4);

        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0; C = 1;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        
        #1; if (errors) $display("incorrectly implemented Minus1_or_0_tb");
        else $display("correctly implemented Minus1_or_0_tb");
    end 
endmodule

module Minus2_or_0_tb;
    reg A0, A1, A2, A3, A4, C; wire Q0, Q1, Q2, Q3, Q4;
    Minus2_or_0 Minus2_or_0_test(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4),
     .C(C), .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4));
    int errors = 0;

    initial begin
        //#100; $monitor("time %0d: Q0=%b , Q1=%b, Q2=%b, Q3=%b, Q4=%b", $time, Q0 , Q1, Q2, Q3, Q4);

        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0; C = 1;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;
        
        #1; if (errors) $display("incorrectly implemented Minus2_or_0_tb");
        else $display("correctly implemented Minus2_or_0_tb");
    end 
endmodule


module Minus3_or_0_tb;
    reg A0, A1, A2, A3, A4, C; wire Q0, Q1, Q2, Q3, Q4;
    Minus3_or_0 Minus3_or_0_test(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4),
     .C(C), .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4));
    int errors = 0;

    initial begin
        //#100; $monitor("time %0d: Q0=%b , Q1=%b, Q2=%b, Q3=%b, Q4=%b", $time, Q0 , Q1, Q2, Q3, Q4);

        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1; C = 1;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0; C = 1;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;
        
        #1; if (errors) $display("incorrectly implemented Minus3_or_0_tb");
        else $display("correctly implemented Minus3_or_0_tb");
    end 
endmodule

module Minus4_or_0_tb;
    reg A0, A1, A2, A3, A4, C; wire Q0, Q1, Q2, Q3, Q4;
    Minus4_or_0 Minus4_or_0_test(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4),
     .C(C), .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4));
    int errors = 0;

    initial begin
        //#100; $monitor("time %0d: Q0=%b , Q1=%b, Q2=%b, Q3=%b, Q4=%b", $time, Q0 , Q1, Q2, Q3, Q4);

        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1; C = 1;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;

        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0; C = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0; C = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;
        
        #1; if (errors) $display("incorrectly implemented Minus4_or_0_tb");
        else $display("correctly implemented Minus4_or_0_tb");
    end 
endmodule

module OperationManager_tb;
    reg A0, A1, A2, A3, A4, pop, push, get, index0, index1, index2; wire Q0, Q1, Q2, Q3, Q4;
    OperationManager OperationManager_test(.pop(pop), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .push(push), 
    .get(get), .get0(index0), .get1(index1), .get2(index2), .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Q4(Q4));
    int errors = 0;

    initial begin
        //$monitor("time %0d: Q0=%b, Q1=%b, Q2=%b, Q3=%b, Q4=%b, ", $time, Q0, Q1, Q2, Q3, Q4);
        //push
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        push = 1; pop = 0; get = 0; index0 = 0; index1 = 0; index2 = 0;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0;
        push = 1; pop = 0; get = 0; index0 = 1; index1 = 1; index2 = 0;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1;
        push = 1; pop = 0; get = 0; index0 = 1; index1 = 0; index2 = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;

        A0 = 0; A1 =0; A2 = 1; A3 = 0; A4 = 0;
        push = 1; pop = 0; get = 0; index0 = 0; index1 = 0; index2 = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0;
        push = 1; pop = 0; get = 0; index0 = 1; index1 = 0; index2 = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;

        //pop
        A0 = 1; A1 =0; A2 = 0; A3 = 0; A4 = 0;
        push = 0; pop = 1; get = 0; index0 = 0; index1 = 0; index2 = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0;
        push = 0; pop = 1; get = 0; index0 = 1; index1 = 0; index2 = 0;
        #1; if(!Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0;
        push = 0; pop = 1; get = 0; index0 = 0; index1 = 0; index2 = 0;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0;
        push = 0; pop = 1; get = 0; index0 = 0; index1 = 1; index2 = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1;
        push = 0; pop = 1; get = 0; index0 = 0; index1 = 1; index2 = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;

        // get
        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1;
        push = 0; pop = 0; get = 1; index0 = 0; index1 = 0; index2 = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0;
        push = 0; pop = 0; get = 1; index0 = 0; index1 = 0; index2 = 1;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1;
        push = 0; pop = 0; get = 1; index0 = 0; index1 = 1; index2 = 0;
        #1; if(Q0) errors++;
        if(!Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0;
        push = 0; pop = 0; get = 1; index0 = 0; index1 = 1; index2 = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0;
        push = 0; pop = 0; get = 1; index0 = 1; index1 = 0; index2 = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        push = 0; pop = 0; get = 1; index0 = 1; index1 = 0; index2 = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(Q3) errors++;
        if(!Q4) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1;
        push = 0; pop = 0; get = 1; index0 = 1; index1 = 1; index2 = 0;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(!Q2) errors++;
        if(Q3) errors++;
        if(Q4) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0;
        push = 0; pop = 0; get = 1; index0 = 1; index1 = 1; index2 = 1;
        #1; if(Q0) errors++;
        if(Q1) errors++;
        if(Q2) errors++;
        if(!Q3) errors++;
        if(Q4) errors++;
   
        #1; if (errors) $display("incorrectly implemented OperationManager_tb");
        else $display("correctly implemented OperationManager_tb");
    end 
endmodule

module cell_4_tb;
    reg[3:0] IDATA; reg RESET, CLK; wire[3:0] ODATA;
    cell_4 cell_4_test(.ODATA(ODATA), .RESET(RESET), .CLK(CLK), .IDATA(IDATA));
    int errors = 0;

    initial begin
        //#100; $monitor("time %0d: ODATA=%b, IDATA=%b", $time, ODATA, IDATA);
        #1;
        RESET = 0; IDATA = 0; CLK = 0; 
        RESET = 1;
        #1; if(ODATA != 0) errors++;
        RESET = 0;
        IDATA = 4'b1001; CLK = 0;
        #1; if(ODATA != 0) errors++;
        IDATA = 4'b1001; CLK = 1;
        #1; if(ODATA != 4'b1001) errors++;
        IDATA = 4'b1101; CLK = 1;
        #1; if(ODATA != 4'b1101) errors++;
        IDATA = 4'b1001; CLK = 0;
        #1; if(ODATA != 4'b1101) errors++;
        RESET = 1; #1; RESET = 0;
        #1; if(ODATA != 0) errors++;
        
        IDATA = 4'b1111; CLK = 0;
        #1; if(ODATA != 0) errors++;
        IDATA = 4'b1111; CLK = 1;
        #1; if(ODATA != 4'b1111) errors++;
        IDATA = 4'b1000; CLK = 1;
        #1; if(ODATA != 4'b1000) errors++;
        IDATA = 4'b1111; CLK = 0;
        #1; if(ODATA != 4'b1000) errors++;
        IDATA = 4'b0110; CLK = 1;
        #1; if(ODATA != 4'b0110) errors++;
        IDATA = 4'b0000; CLK = 1;
        #1; if(ODATA != 4'b0000) errors++;
        
        #1; if (errors) $display("incorrectly implemented cell_4");
        else $display("correctly implemented cell_4");
    end 
endmodule

module MUX_tb;
    reg[3:0] D0, D1, D2, D3, D4; reg A0, A1, A2, A3, A4; wire[3:0] ODATA;
    MUX MUX_test(.DATA(ODATA), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4));
    int errors = 0;

    initial begin
        //#150; $monitor("time %0d: ODATA=%b", $time, ODATA);
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        D0 = 4'b0001; D1 = 4'b0000; D2 = 4'b0000; D3 = 4'b0000; D4 = 4'b0000;
        #1; if(ODATA != 4'b0001) errors++;

        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        D0 = 4'b0001; D1 = 4'b0110; D2 = 4'b1000; D3 = 4'b1111; D4 = 4'b0011;
        #1; if(ODATA != 4'b0001) errors++;

        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0;
        D0 = 4'b0001; D1 = 4'b0110; D2 = 4'b1000; D3 = 4'b1111; D4 = 4'b0011;
        #1; if(ODATA != 4'b0110) errors++;

        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0;
        D0 = 4'b0001; D1 = 4'b0110; D2 = 4'b1000; D3 = 4'b1111; D4 = 4'b0011;
        #1; if(ODATA != 4'b1000) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0;
        D0 = 4'b0001; D1 = 4'b0110; D2 = 4'b1000; D3 = 4'b1111; D4 = 4'b0011;
        #1; if(ODATA != 4'b1111) errors++;

        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1;
        D0 = 4'b0001; D1 = 4'b0110; D2 = 4'b1000; D3 = 4'b1111; D4 = 4'b0011;
        #1; if(ODATA != 4'b0011) errors++;
        
        #1; if (errors) $display("incorrectly implemented MUX");
        else $display("correctly implemented MUX");
    end 
endmodule
    
module MEM_tb;
    reg[3:0] IDATA; reg A0, A1, A2, A3, A4, R_W, CLK, RESET; wire[3:0] ODATA;
    MEM MEM_test(.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .R_W(R_W), .CLK(CLK), .RESET(RESET), .IDATA(IDATA), .ODATA(ODATA));
    int errors = 0;

    initial begin
        //#100; $monitor("time %0d: ODATA=%b, RESET=%b, IDATA=%b, A0=%b, A1=%b, A2=%b, A3=%b, A4=%b, R_W=%b, CLK=%b", $time, ODATA, RESET, IDATA, A0, A1, A2, A3, A4, R_W, CLK);
        RESET = 0; IDATA = 4'b0000; CLK = 0;
        #1; 
        RESET = 1; #1;
        RESET = 0; #1;
        if(IDATA) errors++;
        //write 0000 in A0
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        IDATA = 4'b0000; R_W = 1'b1; 
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b0000) errors++;

        //write 0010 in A1
        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0;
        IDATA = 4'b0010; R_W = 1'b1;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b0010) errors++;

        //write 0100 in A2
        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0;
        IDATA = 4'b0100; R_W = 1'b1;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b0100) errors++;

        //write 0100 in A3
        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0;
        IDATA = 4'b0110; R_W = 1'b1;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b0110) errors++;

        //write 1000 in A4
        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1;
        IDATA = 4'b1000; R_W = 1'b1;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b1000) errors++;

        //CLK = 0 nothing change
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        IDATA = 4'b1111; R_W = 1;

        //READ  A0 (0)
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        IDATA = 4'b1111; R_W = 1'b0;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b0000) errors++;

        //write 1111 in A0
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        IDATA = 4'b1111; R_W = 1'b1;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b1111) errors++;

        //READ  A1 (0010)
        A0 = 0; A1 = 1; A2 = 0; A3 = 0; A4 = 0;
        IDATA = 4'b1111; R_W = 1'b0;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b0010) errors++;

        //READ  A2 (0100)
        A0 = 0; A1 = 0; A2 = 1; A3 = 0; A4 = 0;
        IDATA = 4'b1111; R_W = 1'b0;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b0100) errors++;

        //READ  A3 (0110)
        A0 = 0; A1 = 0; A2 = 0; A3 = 1; A4 = 0;
        IDATA = 4'b1111; R_W = 1'b0;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b0110) errors++;

        //READ  A4 (1000)
        A0 = 0; A1 = 0; A2 = 0; A3 = 0; A4 = 1;
        IDATA = 4'b1111; R_W = 1'b0;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b1000) errors++;

        //READ  A0 (1111)
        A0 = 1; A1 = 0; A2 = 0; A3 = 0; A4 = 0;
        IDATA = 4'b0000; R_W = 1'b0;
        #1 CLK = 1;
        #1 CLK = 0;
        #1; if(ODATA != 4'b1111) errors++;
      
        #1; if (errors) $display("incorrectly implemented MEM");
        else $display("correctly implemented MEM");
    end
endmodule


module in_out_tb;
    wire Q;
    reg A, B;
    int errors = 0;
    in_out test_ioh(.A(A), .B(B), .Q(Q));
    initial begin
        //#100; $monitor("time %0d: A=%b, B=%b, Q=%b", $time, A, B, Q);

        A = 0; B = 0; #1;
        if (Q != 1'bz) errors++;
        A = 0; B = 1; #1;
        if (Q != 1'bz) errors++;
        A = 1; B = 0; #1;
        if (Q != 0) errors++;
        A = 1; B = 1; #1;
        if (Q != 1) errors++;
             
        #1; if (errors) $display("incorrectly implemented in_out");
        else $display("correctly implemented in_out");
    end 
endmodule


module in_out_4_tb;
    reg[3:0] IDATA; reg READ; wire[3:0] ODATA;
    in_out_4 in_out_4_test(.IDATA(IDATA), .READ(READ), .ODATA(ODATA));
    int errors = 0;
    
    initial begin
        //#100; $monitor("time %0d: ODATA=%b, IDATA=%b", $time, ODATA, IDATA);
        READ = 1'b0; IDATA = 4'b0000; #1;
        if (ODATA != 4'bZZZZ) errors++;

        READ = 1'b1; IDATA = 4'b0000; #1;
        if (ODATA != 4'b0000) errors++;

        READ = 1'b1; IDATA = 4'b0011; #1;
        if (ODATA != 4'b0011) errors++;

        READ = 1; IDATA = 4'b1111; #1;
        if (ODATA != 4'b1111) errors++;

        READ = 0; IDATA = 4'b0101; #1;
        if (ODATA != 4'bZZZZ) errors++;
        
      
        #1; if (errors) $display("incorrectly implemented in_out_4");
        else $display("correctly implemented in_out_4");
    end 
endmodule

module stack_tb;
    int errors = 0;

    wire[3:0] IO_DATA;
    reg RESET, CLK;
    reg[1:0] COMMAND;
    reg[2:0] INDEX;

    reg[3:0] DATA;
    assign IO_DATA = DATA;

    stack_structural_normal stack_test(.IO_DATA(IO_DATA), .RESET(RESET), .CLK(CLK), .COMMAND(COMMAND), .INDEX(INDEX));

    initial begin
        #100; $monitor("time %0d: RESET=%b, CLK=%b, COMMAND=%b, INDEX=%b, IO_DATA=%b", $time, RESET, CLK, COMMAND, INDEX, IO_DATA);
        DATA =4'b0000; INDEX = 3'b000; COMMAND = 2'b00; CLK = 0; RESET = 0;
        #1;
        RESET = 1; #1; RESET = 0; #1;
        DATA = 4'b0000; 
        #1; CLK = 1; #1 CLK = 0; #1;

        COMMAND = 2'b01; 
        DATA = 4'b0001; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b0010; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b0011; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b0100; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b0101; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b0110; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'bZZZZ;
 
        COMMAND = 2'b10; #1; CLK = 1; 
        #1; if(IO_DATA != 4'b0110) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++; 
        #1; CLK = 1; 
        #1; if(IO_DATA != 4'b0101) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++;
        #1; CLK = 1; 
        #1; if(IO_DATA != 4'b0100) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++;
        #1; CLK = 1; 
        #1; if(IO_DATA != 4'b0011) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++;
        #1; CLK = 1; 
        #1; if(IO_DATA != 4'b0010) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++;

        COMMAND = 2'b01; 
        DATA = 4'b1111; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b1110; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b1100; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b1000; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'b0000; #1; CLK = 1; 
        #1 CLK = 0; #1;
        DATA = 4'bZZZZ;

        COMMAND = 2'b11; #1;
        CLK = 1; INDEX = 3'b000;
        #1; if(IO_DATA != 4'b0000) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++; 
      
        CLK = 1; INDEX = 3'b001;
        #1; if(IO_DATA != 4'b1000) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++; 
  
        CLK = 1; INDEX = 3'b010;
        #1; if(IO_DATA != 4'b1100) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++; 

        CLK = 1; INDEX = 3'b011;
        #1; if(IO_DATA != 4'b1110) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++; 

        CLK = 1; INDEX = 3'b100;
        #1; if(IO_DATA != 4'b1111) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++; 
        

        COMMAND = 2'b10; #1; CLK = 1; 
        #1; if(IO_DATA != 4'b0000) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++; 
        #1; CLK = 1; 
        #1; if(IO_DATA != 4'b1000) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++;
        #1; CLK = 1; 
        #1; if(IO_DATA != 4'b1100) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++;
        #1; CLK = 1; 
        #1; if(IO_DATA != 4'b1110) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++;
        #1; CLK = 1; 
        #1; if(IO_DATA != 4'b1111) errors++; 
        #1; CLK = 0; 
        #1; if(IO_DATA != 4'bZZZZ) errors++;

        
     
        #1; if (errors) $display("incorrectly implemented stack_structural_normal");
        else $display("correctly implemented stack_structural_normal");
    end 

endmodule