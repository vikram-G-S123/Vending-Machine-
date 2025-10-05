// Item 1 module
module Item_One(
    input nickel_in, dime_in, clock, reset,
    output reg nickel_out, dispense
);
    reg [4:0] current_state, next_state;

    localparam  S0  = 5'b00001,
                S5  = 5'b00010,
                S10 = 5'b00100,
                S15 = 5'b01000,
                S20 = 5'b10000;

    always @(posedge clock) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        nickel_out = 0;
        dispense   = 0;
        case(current_state)
            S0:  if(nickel_in) next_state = S5; else if(dime_in) next_state = S10; else next_state = S0;
            S5:  if(nickel_in) next_state = S10; else if(dime_in) next_state = S15; else next_state = S5;
            S10: if(nickel_in) next_state = S15; else if(dime_in) next_state = S20; else next_state = S10;
            S15: next_state = S0;
            S20: next_state = S0;
            default: next_state = S0;
        endcase

        // Output logic
        if(current_state == S5 && dime_in) dispense = 1;
        if(current_state == S10 && nickel_in) dispense = 1;
        if(current_state == S10 && dime_in)   {nickel_out, dispense} = 2'b11;
    end
endmodule

// Item 2 module
module Item_Two(
    input nickel_in, dime_in, clock, reset,
    output reg nickel_out, dispense
);
    reg [5:0] current_state, next_state;

    localparam  S0  = 6'b000001,
                S5  = 6'b000010,
                S10 = 6'b000100,
                S15 = 6'b001000,
                S20 = 6'b010000,
                S25 = 6'b100000;

    always @(posedge clock) begin
        if(reset) current_state <= S0;
        else current_state <= next_state;
    end

    always @(*) begin
        nickel_out = 0; dispense = 0;
        case(current_state)
            S0:  if(nickel_in) next_state = S5; else if(dime_in) next_state = S10; else next_state = S0;
            S5:  if(nickel_in) next_state = S10; else if(dime_in) next_state = S15; else next_state = S5;
            S10: if(nickel_in) next_state = S15; else if(dime_in) next_state = S20; else next_state = S10;
            S15: if(nickel_in) next_state = S20; else if(dime_in) next_state = S25; else next_state = S15;
            S20: next_state = S0;
            S25: next_state = S0;
            default: next_state = S0;
        endcase

        if(current_state==S10 && dime_in) {nickel_out, dispense} = 2'b01;
        if(current_state==S15 && dime_in) {nickel_out, dispense} = 2'b11;
        if(current_state==S15 && nickel_in) dispense = 1;
    end
endmodule

// Item 3 module
module Item_Three(
    input nickel_in, dime_in, clock, reset,
    output reg nickel_out, dispense
);
    reg [6:0] current_state, next_state;

    localparam  S0  = 7'b0000001,
                S5  = 7'b0000010,
                S10 = 7'b0000100,
                S15 = 7'b0001000,
                S20 = 7'b0010000,
                S25 = 7'b0100000,
                S30 = 7'b1000000;

    always @(posedge clock) begin
        if(reset) current_state <= S0;
        else current_state <= next_state;
    end

    always @(*) begin
        nickel_out = 0; dispense = 0;
        case(current_state)
            S0:  if(nickel_in) next_state = S5; else if(dime_in) next_state = S10; else next_state = S0;
            S5:  if(nickel_in) next_state = S10; else if(dime_in) next_state = S15; else next_state = S5;
            S10: if(nickel_in) next_state = S15; else if(dime_in) next_state = S20; else next_state = S10;
            S15: if(nickel_in) next_state = S20; else if(dime_in) next_state = S25; else next_state = S15;
            S20: if(nickel_in) next_state = S25; else if(dime_in) next_state = S30; else next_state = S20;
            S25: next_state = S0;
            S30: next_state = S0;
            default: next_state = S0;
        endcase

        if(current_state==S15 && dime_in) dispense = 1;
        if(current_state==S20 && nickel_in) dispense = 1;
        if(current_state==S20 && dime_in) {nickel_out, dispense} = 2'b11;
        if(current_state==S25 && nickel_in) dispense = 1;
    end
endmodule

// Item 4 module
module Item_Four(
    input nickel_in, dime_in, clock, reset,
    output reg nickel_out, dispense
);
    reg [7:0] current_state, next_state;

    localparam  S0  = 8'b00000001,
                S5  = 8'b00000010,
                S10 = 8'b00000100,
                S15 = 8'b00001000,
                S20 = 8'b00010000,
                S25 = 8'b00100000,
                S30 = 8'b01000000,
                S35 = 8'b10000000;

    always @(posedge clock) begin
        if(reset) current_state <= S0;
        else current_state <= next_state;
    end

    always @(*) begin
        nickel_out = 0; dispense = 0;
        case(current_state)
            S0:  if(nickel_in) next_state = S5; else if(dime_in) next_state = S10; else next_state = S0;
            S5:  if(nickel_in) next_state = S10; else if(dime_in) next_state = S15; else next_state = S5;
            S10: if(nickel_in) next_state = S15; else if(dime_in) next_state = S20; else next_state = S10;
            S15: if(nickel_in) next_state = S20; else if(dime_in) next_state = S25; else next_state = S15;
            S20: if(nickel_in) next_state = S25; else if(dime_in) next_state = S30; else next_state = S20;
            S25: if(nickel_in) next_state = S30; else if(dime_in) next_state = S35; else next_state = S25;
            S30: next_state = S0;
            S35: next_state = S0;
            default: next_state = S0;
        endcase

        if(current_state==S15 && dime_in) dispense = 1;
        if(current_state==S20 && dime_in) dispense = 1;
        if(current_state==S25 && nickel_in) dispense = 1;
        if(current_state==S25 && dime_in) {nickel_out, dispense} = 2'b11;
        if(current_state==S30 && nickel_in) dispense = 1;
    end
endmodule

// Top vending machine module
module VendingMachine(
    input [3:0] item_number,
    input nickel_in, dime_in, clock, reset,
    output reg nickel_out, dispense
);
    wire No1, No2, No3, No4;
    wire D1, D2, D3, D4;

    Item_One IO(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .reset(reset), .nickel_out(No1), .dispense(D1));
    Item_Two ITW(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .reset(reset), .nickel_out(No2), .dispense(D2));
    Item_Three ITH(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .reset(reset), .nickel_out(No3), .dispense(D3));
    Item_Four IF(.nickel_in(nickel_in), .dime_in(dime_in), .clock(clock), .reset(reset), .nickel_out(No4), .dispense(D4));

    always @(*) begin
        case(item_number)
            4'b0001: begin nickel_out = No1; dispense = D1; end
            4'b0010: begin nickel_out = No2; dispense = D2; end
            4'b0100: begin nickel_out = No3; dispense = D3; end
            4'b1000: begin nickel_out = No4; dispense = D4; end
            default: begin nickel_out = 0; dispense = 0; end
        endcase
    end
endmodule
