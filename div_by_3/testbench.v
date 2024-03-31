`timescale 1 ns / 100 ps

module testbench(); 

reg [7:0]imm = 0;
wire div;

div_by_3 #(.DATA_W(8)) div_by_3(.data(imm), .divisibility(div)); 



initial begin
    $dumpvars;      // Open for dump of signals 
    $display("Test started...");   // Write to console    
    #2 imm = 5; 
    #2 imm = 12;
    #2 imm = 37; 
    #2 imm = 29;
    #2 imm = 33;
    #2 imm = 45;
    #2 $finish;    // Stop simulation
end

endmodule
