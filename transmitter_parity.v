`timescale 1ps/1ps
module transmitter (input [7:0] bus , output data);

reg clk;
integer i;
assign data=temp;
reg temp;
initial begin
    clk<=0;
    
end

always #1 clk=~clk;

always @(clk) begin

    if (bus=== 8'bxxxxxxxx) temp<=1;

    else begin
        temp<=0;
        
        #1

        for (i=0 ; i<8 ; i++)  begin
            temp<=bus[i];
            #1;
        end  

        temp= bus[0]^bus[1]^bus[2]^bus[3]^bus[4]^bus[5]^bus[6]^bus[7];

        #1

        temp<=1;

        #1;
    end
end

endmodule