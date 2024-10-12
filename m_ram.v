module m_reg_file 
(
    input                       clk,
    input      [2:0] addr,
    input      [63:0] data,
    input                       we,

    output reg [31:0] data00r,
    output reg [31:0] data01r,
    output reg [31:0] data02r,
    output reg [31:0] data03r,
    output reg [31:0] data04r,
    output reg [31:0] data05r,
    output reg [31:0] data06r,
    output reg [31:0] data07r,
    
    output reg [31:0] data00i,
    output reg [31:0] data01i,
    output reg [31:0] data02i,
    output reg [31:0] data03i,
    output reg [31:0] data04i,
    output reg [31:0] data05i,
    output reg [31:0] data06i,
    output reg [31:0] data07i
);

  reg [63:0]  mem [7:0];

  always @ (posedge clk) begin
    if (we)
      mem[addr] <= data;
  end

  always @ (posedge clk) begin
      data00r <= mem[ 0][63:32];
      data00i <= mem[ 0][31:0];
      data01r <= mem[ 1][63:32];
      data01i <= mem[ 1][31:0];
      data02r <= mem[ 2][63:32];
      data02i <= mem[ 2][31:0];
      data03r <= mem[ 3][63:32];
      data03i <= mem[ 3][31:0];
      data04r <= mem[ 4][63:32];
      data04i <= mem[ 4][31:0];
      data05r <= mem[ 5][63:32];
      data05i <= mem[ 5][31:0];
      data06r <= mem[ 6][63:32];
      data06i <= mem[ 6][31:0];
      data07r <= mem[ 7][63:32];
      data07i <= mem[ 7][31:0];
  end

endmodule