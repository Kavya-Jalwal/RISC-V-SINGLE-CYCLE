module tb_top;
reg clk,reset;
top uut (.clk(clk),.reset(reset));
initial begin
clk=0;
reset=1;
#20;
reset=0;
#40 $finish;
end
always begin
#5 clk=~clk;
end
endmodule
