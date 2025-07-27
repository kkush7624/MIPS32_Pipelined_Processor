module test1_MIPS32;
    reg clk1, clk2;
    integer k;

    pipe_MIPS32 DUT(clk1, clk2);

    // Clock generation
    initial begin
        clk1 = 0; clk2 = 0;
        repeat(50) begin // Extended for full pipeline completion
            #5 clk1 = 1; #5 clk1 = 0;
            #5 clk2 = 1; #5 clk2 = 0;
        end
    end

    // Instruction memory and reg file init
    initial begin
        for (k = 0; k <= 31; k = k + 1)
            DUT.Reg[k] = k;

        DUT.Mem[0] = 32'h2801000a; // ADDI R1, R0, 10
        DUT.Mem[1] = 32'h28020014; // ADDI R2, R0, 20
        DUT.Mem[2] = 32'h28030019; // ADDI R3, R0, 25
        DUT.Mem[3] = 32'h0ce77800; // OR R7,R7,R7 (dummy)
        DUT.Mem[4] = 32'h0ce77800; // dummy
        DUT.Mem[5] = 32'h00222000; // ADD R4 = R1 + R2
        DUT.Mem[6] = 32'h0ce77800; // dummy
        DUT.Mem[7] = 32'h00832800; // ADD R5 = R4 + R3
        DUT.Mem[8] = 32'hfc000000; // HLT

        DUT.HALTED = 0;
        DUT.PC = 0;
        DUT.TAKEN_BRANCH = 0;

        #580 // Wait for all instructions to complete
        for (k = 0; k < 6; k = k + 1)
            $display("R%1d = %2d", k, DUT.Reg[k]);
    end

    // Dump waveform
    initial begin
        $dumpfile("DUT.vcd");
        $dumpvars(1, DUT); // dump internals
        #600 $finish;
    end
endmodule
