`timescale 1ps/1ps

module reciever (
    input dcom,
    output reg [7:0] bus
);

reg [7:0]  dr;
reg clk;
reg ander;
reg trigger;
wire sig;

//reg init;
//wire try;

always /*#104166*/ #52083 clk <= ~clk;

initial begin
    ander <= 1;
    //init <= 1;
    clk <= 1;
    trigger <= 1;
end

assign sig = dcom & ander;
//assign try = ~(clk ^ ander);
//assign bus = dr;

always @ (sig) begin
    ander <= 0;
    trigger <= ~trigger;
end

/*
always @ (negedge try) begin
    dr[]
end
*/

always @ (trigger) begin
    //if(init == 1) begin
    //    init <= 0;

        #52083;

    //end
    for (integer i = 0; i<9; i+=1) begin
        if(i == 0) begin 
            #104166;
        end
        else begin
            dr[i-1] = dcom;
            #104166;
        end
    end
    bus <= dr;
    ander <= 1;
end

endmodule
