`include "transmitter.v"
`include "receiver.v"
`timescale 1ps/1ps

module tb;

reg [7:0] bus_value;
wire [7:0] data_out;
wire signal; 
time freq = 20416600;
reg ticker;
reg clock;

transmitter test (bus_value , signal);
reciever rec (signal , data_out, );

always #104166 ticker <= ~ticker;
always #3000 clock <= ~clock;

initial begin

    $dumpfile("check.vcd");
    $dumpvars(0,tb);
    ticker <= 1;
    clock <= 1;
    #freq bus_value=12;
    #freq bus_value=45;
    #freq bus_value=09;
    #freq bus_value=67;
    #freq bus_value=101;

    #freq #freq $finish;




end
endmodule