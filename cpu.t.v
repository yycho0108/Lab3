`include "cpu.v"
module testcpu();

  reg clk;
  reg pass;

  cpu cputest(clk);

  initial 
  begin
    clk=0;
  end

  always 
    #50 clk=!clk;

  initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, cputest);

    #5000;
    $finish;
  end

endmodule
