`include "stack_behaviour.sv"

module stack_behaviour_tb;
    reg debug = 0;
    int errors = 0;

    wire[3:0] IO_DATA;
    reg RESET;
    reg CLK;
    reg[1:0] COMMAND;
    reg[2:0] INDEX;

    reg[3:0] DATA;
    assign IO_DATA = DATA;

    stack_behaviour_normal stack(.IO_DATA(IO_DATA), .RESET(RESET), .CLK(CLK), .COMMAND(COMMAND), .INDEX(INDEX));

    initial begin
        //#100; $monitor("time %0d: RESET=%b, CLK=%b, COMMAND=%b, INDEX=%b, IO_DATA=%b", $time, RESET, CLK, COMMAND, INDEX, IO_DATA);
        INDEX = 3'b000; COMMAND = 2'b00; CLK = 0; RESET = 0;
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
