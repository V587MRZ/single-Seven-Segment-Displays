`timescale 1ns / 1ps

/* question1: why use ssdCathode as reg type, counter as reg?
question2: the simulation result is wrong,but the FPGA board is correct?*/

module single_seven_segment_display(
clk,reset,enable,ssdCathode,ssdAnode,
    );
    
input wire clk,reset,enable;
output wire [6:0] ssdCathode;
output wire [3:0] ssdAnode;
reg [3:0] counter;

heartbeat HB (.beat(beat),.clk(clk),.reset(reset));

always @ (posedge clk) begin
if (reset || counter >= 10) begin
counter <= 4'b0; end
else if (beat & enable) begin
counter <= counter + 1; end
end
sevenSegmentDecoder SSD (.bcd(counter),.ssd(ssdCathode));

assign ssdAnode = 4'b1110;

endmodule
