module top(input clk_100mhz, output [3:1] aled, output [3:1] kled);

reg [25:0] counter = 0;
assign aled = counter[25:23];
assign kled = counter[25:23];

always @(posedge clk_100mhz) counter <= counter + 1;

endmodule     
