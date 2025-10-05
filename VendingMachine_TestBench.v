`timescale 1ns/1ps
`define CLOCK_PERIOD 10

module VendingMachine_TestBench;
    reg [3:0] item_number;
    reg nickel_in, dime_in, clock, reset;
    wire nickel_out, dispense;

    VendingMachine VM(
        .item_number(item_number),
        .nickel_in(nickel_in),
        .dime_in(dime_in),
        .clock(clock),
        .reset(reset),
        .nickel_out(nickel_out),
        .dispense(dispense)
    );

    initial clock = 0;
    always #(`CLOCK_PERIOD/2) clock = ~clock;

    initial begin
        item_number = 4'b0100;
        nickel_in = 0;
        dime_in = 0;
        reset = 0;
        #(`CLOCK_PERIOD);
        reset = 1;
        #(`CLOCK_PERIOD);
        reset = 0;
        #(`CLOCK_PERIOD);
        nickel_in = 1; dime_in = 0;
        #(`CLOCK_PERIOD);
        nickel_in = 0; dime_in = 1;
        #(`CLOCK_PERIOD);
        nickel_in = 0; dime_in = 0;
        #(`CLOCK_PERIOD);
        nickel_in = 1; dime_in = 0;
        #(`CLOCK_PERIOD);
        nickel_in = 0; dime_in = 1;
        #(`CLOCK_PERIOD);
        nickel_in = 0; dime_in = 0;
        #(`CLOCK_PERIOD*5);
        $finish;
    end

    initial begin
        $dumpfile("VendingMachine_tb.vcd");
        $dumpvars(0, VendingMachine_TestBench);
    end
endmodule
