`timescale 1ps/1ps

module reciever (
    input dcom,
    input clk,
    input tick_in,
    output reg [7:0] bus
);

reg [7:0]  dr;
reg ander;
reg tickstart;
wire tick;
reg trigger;
reg [4:0] counter;
wire sig;
reg [4:0] bitno;
reg init;
reg read;

initial begin
    ander <= 1;
    init <= 0;
    counter <= 1;
    bitno <= 0;
    tickstart <= 0;
    read <= 1;
    trigger <= 1;
end

assign sig = dcom & ander;
assign tick = tick_in & tickstart;

always @ (negedge sig) begin
    ander <= 0;
    tickstart <= 1;
    read <= 1;
    trigger <= ~trigger;
end

always @ (posedge tick) begin
    if(counter == 16) begin
        trigger <= ~trigger;
    end
    else begin
        counter <= counter +1;
    end
end

always @ (trigger) begin
    if(init == 0)  init <= 1;

    else begin

        if(bitno == 0) begin
            bitno <= bitno +1;
        end
        else begin
            dr <= ((dr)|(dcom<<(bitno-1)));
            bitno <= bitno +1;
        end

        counter <= 1;
        if(bitno == 8) begin
            bitno <= 0;
            read <= 0;
            ander <= 1;
        end
    end

always @ (clk) begin
    if(read == 0) begin
        bus <= dr;
        read <= 1;
    end
end

end
endmodule