`ifndef __DATAMEMORY_V__
`define __DATAMEMORY_V__

module datamemory
(
    input          clk,
    input          writeEnable,
    input [31:0]   dataIn,
    input [31:0]   address,
    output [31:0]  dataOut
);
    reg [31:0] memory [(1<<8)-1:0];

    initial begin
		  // read memory layout ...
		  $readmemh("datamemory.dat", memory);
	  end

    always @(posedge clk) begin
        if(writeEnable)
            memory[address] <= dataIn;
    end

    assign dataOut = memory[address];

endmodule
`endif
