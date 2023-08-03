`resetall

module axis_fifo #
(
    parameter DATA_WIDTH = 32,
    parameter FIFO_DEPTH = 2048,
    parameter PIPELINE_LEN = 5
)
(
    input  wire                   clk,
    input  wire                   rst,

    /* Input AXI Stream */
    input  wire [DATA_WIDTH-1:0]  in_axis_tdata,
    input  wire                   in_axis_tvalid,
    output wire                   in_axis_tready,
    input  wire                   in_axis_tuser,
    input  wire                   in_axis_tlast,

     /* Output AXI Stream */
    output wire [DATA_WIDTH-1:0]  out_axis_tdata,
    output wire                   out_axis_tvalid,
    input  wire                   out_axis_tready,
    output wire                   out_axis_tuser,
    output wire                   out_axis_tlast
);

parameter ADDR_WIDTH = $clog2(FIFO_DEPTH);

/* Memory block on which FIFO is implemented*/
reg [WIDTH-1:0] ram[(2**ADDR_WIDTH)-1:0];

/* Keep track of AXIS signals*/
localparam USER_OFFSET = DATA_WIDTH;
localparam LAST_OFFSET = USER_OFFSET + 1;
localparam WIDTH       = LAST_OFFSET + 1;

/* Handling  FIFO input */

reg [ADDR_WIDTH:0] read_ptr = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] write_ptr = {ADDR_WIDTH+1{1'b0}};
reg [ADDR_WIDTH:0] write_ptr_next = {ADDR_WIDTH+1{1'b0}};

wire full = (write_ptr == (read_ptr ^ {1'b1, {ADDR_WIDTH{1'b0}}}));
wire empty = (write_ptr_next == read_ptr);

assign in_axis_tready = !full;

reg [WIDTH-1:0] out_pipe_reg[PIPELINE_LEN:0];
reg [PIPELINE_LEN:0] out_pipe_tvalid = 0;

wire [WIDTH-1:0] in_axis;
generate
    assign in_axis[DATA_WIDTH-1:0]   = in_axis_tdata;
    assign in_axis[USER_OFFSET]      = in_axis_tuser;
    assign in_axis[LAST_OFFSET]      = in_axis_tlast;
endgenerate

wire [WIDTH-1:0] out_axis = out_pipe_reg[PIPELINE_LEN];

wire                   out_pipe_tready;
wire                   out_axis_tvalid_pipe = out_pipe_tvalid[PIPELINE_LEN];
wire [DATA_WIDTH-1:0]  out_axis_tdata_pipe  = out_axis[DATA_WIDTH-1:0];
wire                   out_axis_tuser_pipe  = out_axis[USER_OFFSET];
wire                   out_axis_tlast_pipe  = out_axis[LAST_OFFSET];

wire                   out_axis_tready_wire;
wire                   out_axis_tvalid_wire;
wire [DATA_WIDTH-1:0]  out_axis_tdata_wire;
wire                   out_axis_tuser_wire;
wire                   out_axis_tlast_wire;

/* Reads */
integer j;
always @(posedge clk) begin
    if (rst) begin
        read_ptr <= {ADDR_WIDTH+1{1'b0}};
        out_pipe_tvalid <= 0;
    end

    if (out_pipe_tready) begin
        out_pipe_tvalid[PIPELINE_LEN] <= 1'b0;
    end

    for (j = PIPELINE_LEN; j > 0; j = j - 1) begin
        if (out_pipe_tready || ((~out_pipe_tvalid) >> j)) begin
            out_pipe_tvalid[j] <= out_pipe_tvalid[j-1];
            out_pipe_reg[j] <= out_pipe_reg[j-1];

            out_pipe_tvalid[j-1] <= 1'b0;
        end
    end

    if (out_pipe_tready || ~out_pipe_tvalid) begin
        out_pipe_tvalid[0] <= 1'b0;
        out_pipe_reg[0] <= ram[read_ptr[ADDR_WIDTH-1:0]];
        if (!empty && !fifo_half_full) begin
            out_pipe_tvalid[0] <= 1'b1;
            read_ptr <= read_ptr + 1;
        end
    end
end

/* Writes */
always @(posedge clk) begin
    if (rst) begin
        write_ptr <= {ADDR_WIDTH+1{1'b0}};
        write_ptr_next <= {ADDR_WIDTH+1{1'b0}};
    end

    if (in_axis_tready && in_axis_tvalid) begin
        ram[write_ptr[ADDR_WIDTH-1:0]] <= in_axis;
        write_ptr <= write_ptr + 1;
        write_ptr_next <= write_ptr + 1;
    end
end
generate

/* Handling FIFO output */

parameter OUT_ADDR_WIDTH = PIPELINE_LEN < 2 ? 3 : $clog2(PIPELINE_LEN*4+1);

reg [DATA_WIDTH-1:0] fifo_tdata[2**OUT_ADDR_WIDTH-1:0];
reg                  fifo_tuser[2**OUT_ADDR_WIDTH-1:0];
reg                  fifo_tlast[2**OUT_ADDR_WIDTH-1:0];

assign out_pipe_tready = 1'b1;

reg [DATA_WIDTH-1:0] out_fifo_tdata  = {DATA_WIDTH{1'b0}};
reg                  out_fifo_tvalid = 1'b0;
reg                  out_fifo_tuser  = {1{1'b0}};
reg                  out_fifo_tlast  = 1'b0;

assign out_axis_tdata_wire  = out_fifo_tdata;
assign out_axis_tvalid_wire = out_fifo_tvalid;
assign out_axis_tuser_wire  = out_fifo_tuser;
assign out_axis_tlast_wire  = out_fifo_tlast;

reg [OUT_ADDR_WIDTH:0] fifo_write_ptr = 0;
reg [OUT_ADDR_WIDTH:0] fifo_read_ptr = 0;

wire fifo_empty = fifo_write_ptr == fifo_read_ptr;
wire fifo_full = fifo_write_ptr == (fifo_read_ptr ^ {1'b1, {OUT_ADDR_WIDTH{1'b0}}});
reg fifo_half_full = 1'b0;

always @(posedge clk) begin
    out_fifo_tvalid <= out_fifo_tvalid && !out_axis_tready_wire;
    fifo_half_full <= $unsigned(fifo_write_ptr - fifo_read_ptr) >= 2**(OUT_ADDR_WIDTH-1);

    if (rst) begin
        fifo_read_ptr <= 0;
        fifo_write_ptr <= 0;

        out_fifo_tvalid <= 1'b0;
    end

    /* Reads */
    if (!fifo_empty && (!out_fifo_tvalid || out_axis_tready_wire)) begin
        out_fifo_tdata <= fifo_tdata[fifo_read_ptr[OUT_ADDR_WIDTH-1:0]];
        out_fifo_tvalid <= 1'b1;
        out_fifo_tuser <= fifo_tuser[fifo_read_ptr[OUT_ADDR_WIDTH-1:0]];
        out_fifo_tlast <= fifo_tlast[fifo_read_ptr[OUT_ADDR_WIDTH-1:0]];

        fifo_read_ptr <= fifo_read_ptr + 1;
    end

    /* Writes */
    if (!fifo_full && out_axis_tvalid_pipe) begin
        fifo_tdata[fifo_write_ptr[OUT_ADDR_WIDTH-1:0]] <= out_axis_tdata_pipe;
        fifo_tuser[fifo_write_ptr[OUT_ADDR_WIDTH-1:0]] <= out_axis_tuser_pipe;
        fifo_tlast[fifo_write_ptr[OUT_ADDR_WIDTH-1:0]] <= out_axis_tlast_pipe;

        fifo_write_ptr <= fifo_write_ptr + 1;
    end
end

assign out_axis_tdata = out_axis_tdata_wire;
assign out_axis_tvalid = out_axis_tvalid_wire;
assign out_axis_tready_wire = out_axis_tready;
assign out_axis_tuser = out_axis_tuser_wire;
assign out_axis_tlast = out_axis_tlast_wire;

endgenerate
endmodule