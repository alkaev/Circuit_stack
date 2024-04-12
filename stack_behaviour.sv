    module stack(output reg[3:0] IODATA_out, input wire RESET, CLK, input wire[1:0] COMMAND, input wire[2:0] INDEX, input wire[3:0] IDATA);
    int Counter = 0;
    int INDEX_GET;
    reg[3:0] cell0; 
    reg[3:0] cell1; 
    reg[3:0] cell2; 
    reg[3:0] cell3; 
    reg[3:0] cell4; 
    always @(*) begin
        case ({RESET})
            1'b0: begin
                case ({CLK})
                    1'b0: begin
                        IODATA_out = 4'bZZZZ;
                    end
                    1'b1: begin
                        case ({COMMAND})
                            2'b00: begin // nop
                                IODATA_out = 4'bZZZZ;
                            end
                            2'b01: begin // push
                                if (Counter % 5 == 0) begin
                                cell0 = IDATA;
                                end else if (Counter % 5 == 1) begin
                                cell1 = IDATA;
                                end else if  (Counter % 5 == 2) begin
                                cell2 = IDATA;
                                end else if  (Counter % 5 == 3) begin
                                cell3 = IDATA;
                                end else begin
                                cell4 = IDATA;
                                end
                                Counter = (Counter + 1) % 5;
                                IODATA_out = 4'bZZZZ;
                            end
                            2'b10: begin // pop
                                Counter = (Counter + 4) % 5;
                                if (Counter % 5 == 0) begin
                                IODATA_out = cell0;
                                end else if (Counter % 5 == 1) begin
                                IODATA_out = cell1;
                                end else if (Counter % 5 == 2) begin
                                IODATA_out = cell2;
                                end else if (Counter % 5 == 3) begin
                                IODATA_out = cell3;
                                end else  begin
                                IODATA_out = cell4;
                                end
                            end
                            2'b11: begin // get
                                INDEX_GET = (Counter + 9 - INDEX) % 5;
                                if (INDEX_GET % 5 == 0) begin
                                IODATA_out = cell0;
                                end else if (INDEX_GET % 5 == 1) begin
                                IODATA_out = cell1;
                                end else if (INDEX_GET % 5 == 2) begin
                                IODATA_out = cell2;
                                end else if (INDEX_GET % 5 == 3) begin
                                IODATA_out = cell3;
                                end else  begin
                                IODATA_out = cell4;
                                end
                            end
                        endcase
                    end                
                endcase
            end
            1'b1: begin
                Counter = 0;
                IODATA_out = 4'bZZZZ;
                cell0 = 0;
                cell1 = 0;
                cell2 = 0;
                cell3 = 0;
                cell4 = 0;               
            end
        endcase
    end
endmodule

module stack_behaviour_normal(
    input wire RESET, 
    input wire CLK, 
    input wire[1:0] COMMAND,
    input wire[2:0] INDEX,
    inout wire[3:0] IO_DATA
    );  
    stack stack(.IODATA_out(IO_DATA), .RESET(RESET), .CLK(CLK), .COMMAND(COMMAND), .INDEX(INDEX), .IDATA(IO_DATA));
    
endmodule