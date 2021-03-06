`ifndef __MUX_V__
`define __MUX_V__
// http://www.alteraforum.com/forum/showthread.php?t=22519
module mux 
#(   parameter WIDTH    = 8,
     parameter CHANNELS = 4) 
(
    output  [WIDTH-1:0]                 out,
    input   [(CHANNELS*WIDTH)-1:0]      in_bus,
    input   [$clog2(CHANNELS)-1:0]    sel   
);

genvar ig;
    
wire [WIDTH-1:0] input_array [0:CHANNELS-1];

assign out = input_array[sel];

generate
    for(ig=0; ig<CHANNELS; ig=ig+1) begin: array
        assign input_array[ig] = in_bus[(ig*WIDTH)+:WIDTH];
    end
endgenerate
endmodule

`endif
