module div_by_3 #(parameter DATA_W = 8)(
	input [DATA_W-1:0] data,
	
	output divisibility
);

	wire [DATA_W-1:0] divider = 8'd3;
	
	assign divisibility = (data % divider == 0) ? 1 : 0; 
	
endmodule
