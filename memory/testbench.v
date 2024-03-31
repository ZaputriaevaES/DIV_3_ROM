`timescale 1 ns / 100 ps

module testbench();

reg clk = 1'b0; // Represents clock, initial value is 0 

always begin
    #1 clk = ~clk; // Toggle clock every 1ns 
end

reg  write = 1'b1;
reg  read =  1'b0;

reg  [5:0]addr_w = 6'h0;
reg  [5:0]addr_r = 6'h0;

reg  [9:0]d = 10'd12; //input  data 
wire [9:0]q;          //output data  //mem[0]: 12 -> | 12 | -> x

rom #(.MEM_SIZE(6), .DATA_W(10)) rom(.clk(clk), .write(write), .read(read), .addr_w(addr_w), .addr_r(addr_r), .datain(d), .dataout(q));


initial begin
    $dumpvars;      // Open for dump of signals
    $display("Test started...");   // Write to console 
    #2 write = 1'b0; read =  1'b1; addr_w = 6'h0; addr_r = 6'h0; d = 10'd13; //mem[0]: 13 -> | 12 | -> 12
    #2 write = 1'b1; read =  1'b0; addr_w = 6'h0; addr_r = 6'h0; d = 10'd14; //mem[0]: 14 -> | 14 | -> 12
  	#2 write = 1'b0; read =  1'b1; addr_w = 6'h0; addr_r = 6'h0; d = 10'd15; //mem[0]: 15 -> | 14 | -> 14 
  	#2 write = 1'b1; read =  1'b0; addr_w = 6'h1; addr_r = 6'h1; d = 10'd36; //mem[1]: 36 -> | 36 | -> 14
  	#2 write = 1'b0; read =  1'b1; addr_w = 6'h1; addr_r = 6'h1; d = 10'd37; //mem[1]: 37 -> | 36 | -> 36 
  	#2 write = 1'b1; read =  1'b1; addr_w = 6'h1; addr_r = 6'h1; d = 10'd38; //mem[1]: 38 -> | 38 | -> 36 !!!R=1 & W=1 
  	#2 write = 1'b0; read =  1'b1; addr_w = 6'h1; addr_r = 6'h1; d = 10'd39; //mem[1]: 39 -> | 38 | -> 38  
    #40 $finish;    // Stop simulation
end

endmodule








