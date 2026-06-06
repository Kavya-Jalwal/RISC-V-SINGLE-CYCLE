module Intruction_Mem(clk,reset,read_address,instruction_out );
  input clk,reset;
  input [31:0] read_address;
  output reg [31:0] instruction_out;
  
  reg [31:0] I_Mem[63:0]; //64 memoey location each have address of 32 bit
  integer i;

  initial begin
    for(i=0;i<64;i=i+1)
        I_Mem[i] = 32'b0;

    I_Mem[0] = 32'b0000000_11001_10000_000_01101_0110011;//add x13,x16,x25
     I_Mem[4]  = 32'b0100000_00011_01000_000_00101_0110011; // sub x5,x8,x3
    I_Mem[8]  = 32'b0000000_00011_00010_111_00001_0110011; // and x1,x2,x3
    I_Mem[12] = 32'b0000000_00101_00011_110_00100_0110011; // or x4,x3,x5
  end
//  initial begin 
//   r type
//     I_Mem[0] =32'b00000000000000000000000000000000;// dont keep 0 //error was coming
//     I_Mem[0] = 32'b0000000_11001_10000_000_01101_0110011;// add x13 , x16 ,x25
//     I_Mem[8] = 32'b0100000_00011_01000_000_00101_0110011; //sub x5 , x8 ,x3
//     I_Mem[12] = 32'b0000000_00011_00010_111_00001_0110011;// and x1, x2, x3
//     I_Mem[16] = 32'b0000000_00101_00011_110_00100_0110011;// or x4,x3,x5
     
//  // i type
//     I_Mem[20] = 32'b0000000_00011_10101_000_10110_0010011;// addi x22, x21, 3
//     I_Mem[24] = 32'b0000000_00001_01000_110_01001_0010011;// ori x9,x8,1
//  // l type
//     I_Mem[28] = 32'b0000000_01111_00101_010_01000_0000011;// lw x8,15(x5)
//     I_Mem[32] = 32'b0000000_00011_00011_010_01001_0000011;// lw x9,3(x3)
//  // S type
//     I_Mem[36] = 32'b0000000_01111_00101_010_01100_0100011;// sw x15,12(x5)
//     I_Mem[40] = 32'b0000000_01110_00110_010_01010_0100011;// sw x14,10(x6)
//   //SB TYPE
//     I_Mem[44] = 32'h00948663;// beq x9,x9,12
//    end
   
 always @(*) begin
    if(read_address < 64)// since read_address goes out of range then X value comes
        instruction_out = I_Mem[read_address];
    else
        instruction_out = 32'b0;
end
endmodule
