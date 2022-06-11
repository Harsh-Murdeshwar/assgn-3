`include "transmitter_parity.v"
`timescale 1ps/1ps

module testb ();

reg [7:0] bus_value;
wire data_out;
time freq = 11;

transmitter test (bus_value , data_out);
initial begin

    $dumpfile("check.vcd");
    $dumpvars(0,testb);

    #freq bus_value=12;
    #freq bus_value=45;
    #freq bus_value=09;
    #freq bus_value=67;
    #freq bus_value=101;
    #freq $finish;




end
endmodule