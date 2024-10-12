module s_reg_file 
(
    input       clk,
    input      [2:0] addr,
    input       re,
    input      [31:0] data00_r,
    input      [31:0] data01_r,
    input      [31:0] data02_r,
    input      [31:0] data03_r,
    input      [31:0] data04_r,
    input      [31:0] data05_r,
    input      [31:0] data06_r,
    input      [31:0] data07_r,
		       
    input      [31:0] data00_i,
    input      [31:0] data01_i,
    input      [31:0] data02_i,
    input      [31:0] data03_i,
    input      [31:0] data04_i,
    input      [31:0] data05_i,
    input      [31:0] data06_i,
    input      [31:0] data07_i,

	output reg      [63:0] data
);
  reg [63:0]  mem [7:0];

  always @ (posedge clk) begin
    mem[ 0] <= {data00_r, data00_i};
    mem[ 1] <= {data01_r, data01_i};
    mem[ 2] <= {data02_r, data02_i};
    mem[ 3] <= {data03_r, data03_i};
    mem[ 4] <= {data04_r, data04_i};
    mem[ 5] <= {data05_r, data05_i};
    mem[ 6] <= {data06_r, data06_i};
    mem[ 7] <= {data07_r, data07_i};
  end
  always @ (posedge clk) begin
    if (re)
      data <= mem[addr];
  end
endmodule