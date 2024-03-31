module rom #(parameter MEM_SIZE = 6, parameter DATA_W = 10)(
	 input 					   clk,
	 input 				       write,
	 input 					   read,
     input [MEM_SIZE - 1:0]    addr_w,
     input [MEM_SIZE - 1:0]    addr_r,
     input [DATA_W - 1:0]      datain,

     output reg [DATA_W - 1:0] dataout
);
    

reg [DATA_W - 1:0]mem[2**MEM_SIZE - 1:0] ;

always @(posedge clk) begin
	if (read)  dataout <= mem[addr_r] ;
	if (write) mem[addr_w] <= datain ;
end

endmodule




