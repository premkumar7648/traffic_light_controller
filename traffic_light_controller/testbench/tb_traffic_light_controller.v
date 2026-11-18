`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2026 19:15:33
// Design Name: 
// Module Name: tb_traffic_light_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_traffic_light_controller;
reg clock=0; 
wire red, yellow, green;

traffic_light_controller uut (.clock(clock), .red(red), .yellow(yellow), .green(green));

always begin
    clock = ~clock; #10000;
end

initial begin
    #100000; 
    $stop;
end

endmodule