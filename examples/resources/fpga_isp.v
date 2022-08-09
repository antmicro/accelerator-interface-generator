/* Machine-generated using Migen */
module fpga_isp(
	output rgb_valid,
	input rgb_ready,
	output rgb_first,
	output rgb_last,
	output reg [31:0] rgb_payload_data,
	input raw_valid,
	output raw_ready,
	input raw_first,
	input raw_last,
	input [31:0] raw_payload_data,
	input [2:0] algorithm,
	output busy,
	input [1:0] pattern,
	input bgr,
	input [12:0] cols,
	input [12:0] rows,
	input sys_clk,
	input sys_rst
);

wire wrapper_converter_sink_valid;
wire wrapper_converter_sink_ready;
wire wrapper_converter_sink_first;
wire wrapper_converter_sink_last;
wire [31:0] wrapper_converter_sink_payload_data;
wire wrapper_converter_source_valid;
wire wrapper_converter_source_ready;
wire wrapper_converter_source_first;
wire wrapper_converter_source_last;
reg [7:0] wrapper_converter_source_payload_data;
wire wrapper_converter_source_payload_valid_token_count;
reg [1:0] wrapper_converter_mux = 2'd0;
wire wrapper_converter_first;
wire wrapper_converter_last;
wire wrapper_source_source_valid;
wire wrapper_source_source_ready;
wire wrapper_source_source_first;
wire wrapper_source_source_last;
wire [7:0] wrapper_source_source_payload_data;
wire wrapper_input_valid;
wire wrapper_input_ready;
wire wrapper_input_first;
reg wrapper_input_last;
wire [7:0] wrapper_input_payload_data;
reg wrapper_output_valid;
wire wrapper_output_ready;
reg wrapper_output_first;
reg wrapper_output_last;
reg [31:0] wrapper_output_payload_data;
reg [12:0] wrapper_last_cnt = 13'd0;
wire wrapper_working;
wire wrapper_cache_reset;
wire wrapper_irq;
wire wrapper_status;
reg wrapper_pending = 1'd0;
wire wrapper_trigger;
reg wrapper_clear;
reg [1:0] wrapper_treshold;
reg wrapper_raw_ready;
wire wrapper_raw_valid;
wire wrapper_raw_last;
wire wrapper_raw_first;
wire [7:0] wrapper_raw_data;
wire [12:0] wrapper_memory0_adr;
wire [7:0] wrapper_memory0_dat_r;
reg wrapper_memory0_we;
reg [7:0] wrapper_memory0_dat_w;
wire [12:0] wrapper_memory1_adr;
wire [7:0] wrapper_memory1_dat_r;
reg wrapper_memory1_we;
reg [7:0] wrapper_memory1_dat_w;
wire [12:0] wrapper_memory2_adr;
wire [7:0] wrapper_memory2_dat_r;
reg wrapper_memory2_we;
reg [7:0] wrapper_memory2_dat_w;
wire [12:0] wrapper_memory3_adr;
wire [7:0] wrapper_memory3_dat_r;
reg wrapper_memory3_we;
reg [7:0] wrapper_memory3_dat_w;
wire [12:0] wrapper_memory4_adr;
wire [7:0] wrapper_memory4_dat_r;
reg wrapper_memory4_we;
reg [7:0] wrapper_memory4_dat_w;
wire [12:0] wrapper_memory5_adr;
wire [7:0] wrapper_memory5_dat_r;
reg wrapper_memory5_we;
reg [7:0] wrapper_memory5_dat_w;
reg [13:0] wrapper_adrs0 = 14'd0;
reg [13:0] wrapper_adrs1 = 14'd0;
reg [13:0] wrapper_adrs2 = 14'd0;
reg [13:0] wrapper_adrs3 = 14'd0;
reg [13:0] wrapper_adrs4 = 14'd0;
reg [13:0] wrapper_adrs5 = 14'd0;
wire [7:0] wrapper_demosaiccache0;
wire [7:0] wrapper_demosaiccache1;
wire [7:0] wrapper_demosaiccache2;
wire [7:0] wrapper_demosaiccache3;
wire [7:0] wrapper_demosaiccache4;
wire [7:0] wrapper_demosaiccache5;
reg [2:0] wrapper_current_chunk = 3'd0;
reg [13:0] wrapper_collected_lines = 14'd0;
reg [13:0] wrapper_processed_lines = 14'd0;
wire wrapper_memory_reset;
wire wrapper_push_zeros;
wire wrapper_force_reset;
reg wrapper_hold_reset = 1'd0;
reg [13:0] wrapper_columns_caputred = 14'd0;
reg wrapper_underflow;
reg wrapper_overflow;
wire wrapper_error;
wire wrapper_frame_sync_incorrect;
reg wrapper_f_reset = 1'd0;
reg wrapper_wait_for_reset = 1'd0;
wire wrapper_ch_nrdy;
wire wrapper_adr_nrdy;
reg [2:0] wrapper_active;
wire wrapper_busy1;
reg wrapper_nearestneighbour_nearestneighbour_rgb_ready;
reg wrapper_nearestneighbour_nearestneighbour_rgb_valid = 1'd0;
reg wrapper_nearestneighbour_nearestneighbour_rgb_first = 1'd0;
reg wrapper_nearestneighbour_nearestneighbour_rgb_last = 1'd0;
reg [31:0] wrapper_nearestneighbour_nearestneighbour_rgb_data;
reg wrapper_nearestneighbour_nearestneighbour_working = 1'd0;
reg wrapper_nearestneighbour_nearestneighbour_first_pixel = 1'd1;
reg [15:0] wrapper_nearestneighbour_colors0 = 16'd0;
reg [15:0] wrapper_nearestneighbour_colors1 = 16'd0;
reg wrapper_nearestneighbour_g_val = 1'd0;
reg [7:0] wrapper_nearestneighbour_kernel_width = 8'd0;
reg [7:0] wrapper_nearestneighbour_b_val = 8'd0;
reg [7:0] wrapper_nearestneighbour_self = 8'd0;
reg [15:0] wrapper_nearestneighbour0 = 16'd0;
reg [15:0] wrapper_nearestneighbour1 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour0 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour1 = 16'd0;
reg [7:0] wrapper_nearestneighbour2 = 8'd0;
reg [7:0] wrapper_nearestneighbour3 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour2 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour3 = 16'd0;
reg [7:0] wrapper_nearestneighbour4 = 8'd0;
reg [7:0] wrapper_nearestneighbour5 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour4 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour5 = 16'd0;
reg [7:0] wrapper_nearestneighbour6 = 8'd0;
reg [7:0] wrapper_nearestneighbour7 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour6 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour7 = 16'd0;
reg [7:0] wrapper_nearestneighbour8 = 8'd0;
reg [7:0] wrapper_nearestneighbour9 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour8 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour9 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour10 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour11 = 16'd0;
reg [7:0] wrapper_nearestneighbour10 = 8'd0;
reg [7:0] wrapper_nearestneighbour11 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour12 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour13 = 16'd0;
reg [7:0] wrapper_nearestneighbour12 = 8'd0;
reg [7:0] wrapper_nearestneighbour13 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour14 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour15 = 16'd0;
reg [7:0] wrapper_nearestneighbour14 = 8'd0;
reg [7:0] wrapper_nearestneighbour15 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour16 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour17 = 16'd0;
reg [7:0] wrapper_nearestneighbour16 = 8'd0;
reg [7:0] wrapper_nearestneighbour17 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour18 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour19 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour20 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour21 = 16'd0;
reg [7:0] wrapper_nearestneighbour18 = 8'd0;
reg [7:0] wrapper_nearestneighbour19 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour22 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour23 = 16'd0;
reg [7:0] wrapper_nearestneighbour20 = 8'd0;
reg [7:0] wrapper_nearestneighbour21 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour24 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour25 = 16'd0;
reg [7:0] wrapper_nearestneighbour22 = 8'd0;
reg [7:0] wrapper_nearestneighbour23 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour26 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour27 = 16'd0;
reg [7:0] wrapper_nearestneighbour24 = 8'd0;
reg [7:0] wrapper_nearestneighbour25 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour28 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour29 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour30 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour31 = 16'd0;
reg [7:0] wrapper_nearestneighbour26 = 8'd0;
reg [7:0] wrapper_nearestneighbour27 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour32 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour33 = 16'd0;
reg [7:0] wrapper_nearestneighbour28 = 8'd0;
reg [7:0] wrapper_nearestneighbour29 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour34 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour35 = 16'd0;
reg [7:0] wrapper_nearestneighbour30 = 8'd0;
reg [7:0] wrapper_nearestneighbour31 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour36 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour37 = 16'd0;
reg [7:0] wrapper_nearestneighbour32 = 8'd0;
reg [7:0] wrapper_nearestneighbour33 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour38 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour39 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour40 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour41 = 16'd0;
reg [7:0] wrapper_nearestneighbour34 = 8'd0;
reg [7:0] wrapper_nearestneighbour35 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour42 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour43 = 16'd0;
reg [7:0] wrapper_nearestneighbour36 = 8'd0;
reg [7:0] wrapper_nearestneighbour37 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour44 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour45 = 16'd0;
reg [7:0] wrapper_nearestneighbour38 = 8'd0;
reg [7:0] wrapper_nearestneighbour39 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour46 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour47 = 16'd0;
reg [7:0] wrapper_nearestneighbour40 = 8'd0;
reg [7:0] wrapper_nearestneighbour41 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour48 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour49 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour50 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour51 = 16'd0;
reg [7:0] wrapper_nearestneighbour42 = 8'd0;
reg [7:0] wrapper_nearestneighbour43 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour52 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour53 = 16'd0;
reg [7:0] wrapper_nearestneighbour44 = 8'd0;
reg [7:0] wrapper_nearestneighbour45 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour54 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour55 = 16'd0;
reg [7:0] wrapper_nearestneighbour46 = 8'd0;
reg [7:0] wrapper_nearestneighbour47 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour56 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour57 = 16'd0;
reg [7:0] wrapper_nearestneighbour48 = 8'd0;
reg [7:0] wrapper_nearestneighbour49 = 8'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour58 = 16'd0;
reg [15:0] wrapper_nearestneighbour_nearestneighbour59 = 16'd0;
reg wrapper_bilinear_bilinear_rgb_ready;
reg wrapper_bilinear_bilinear_rgb_valid = 1'd0;
reg wrapper_bilinear_bilinear_rgb_first = 1'd0;
reg wrapper_bilinear_bilinear_rgb_last = 1'd0;
reg [31:0] wrapper_bilinear_bilinear_rgb_data;
reg wrapper_bilinear_bilinear_working = 1'd0;
reg wrapper_bilinear_bilinear_first_pixel = 1'd1;
reg [23:0] wrapper_bilinear_colors0 = 24'd0;
reg [23:0] wrapper_bilinear_colors1 = 24'd0;
reg [23:0] wrapper_bilinear_colors2 = 24'd0;
reg wrapper_bilinear_g_val = 1'd0;
reg [15:0] wrapper_bilinear_kernel_width = 16'd0;
reg [15:0] wrapper_bilinear_b_val = 16'd0;
reg [15:0] wrapper_bilinear_self = 16'd0;
reg [23:0] wrapper_bilinear0 = 24'd0;
reg [23:0] wrapper_bilinear1 = 24'd0;
reg [23:0] wrapper_bilinear2 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear0 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear1 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear2 = 24'd0;
reg [7:0] wrapper_bilinear3 = 8'd0;
reg [7:0] wrapper_bilinear4 = 8'd0;
reg [7:0] wrapper_bilinear5 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear3 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear4 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear5 = 24'd0;
reg [7:0] wrapper_bilinear6 = 8'd0;
reg [7:0] wrapper_bilinear7 = 8'd0;
reg [7:0] wrapper_bilinear8 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear6 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear7 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear8 = 24'd0;
reg [7:0] wrapper_bilinear9 = 8'd0;
reg [7:0] wrapper_bilinear10 = 8'd0;
reg [7:0] wrapper_bilinear11 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear9 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear10 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear11 = 24'd0;
reg [7:0] wrapper_bilinear12 = 8'd0;
reg [7:0] wrapper_bilinear13 = 8'd0;
reg [7:0] wrapper_bilinear14 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear12 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear13 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear14 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear15 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear16 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear17 = 24'd0;
reg [7:0] wrapper_bilinear15 = 8'd0;
reg [7:0] wrapper_bilinear16 = 8'd0;
reg [7:0] wrapper_bilinear17 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear18 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear19 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear20 = 24'd0;
reg [7:0] wrapper_bilinear18 = 8'd0;
reg [7:0] wrapper_bilinear19 = 8'd0;
reg [7:0] wrapper_bilinear20 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear21 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear22 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear23 = 24'd0;
reg [7:0] wrapper_bilinear21 = 8'd0;
reg [7:0] wrapper_bilinear22 = 8'd0;
reg [7:0] wrapper_bilinear23 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear24 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear25 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear26 = 24'd0;
reg [7:0] wrapper_bilinear24 = 8'd0;
reg [7:0] wrapper_bilinear25 = 8'd0;
reg [7:0] wrapper_bilinear26 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear27 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear28 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear29 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear30 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear31 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear32 = 24'd0;
reg [7:0] wrapper_bilinear27 = 8'd0;
reg [7:0] wrapper_bilinear28 = 8'd0;
reg [7:0] wrapper_bilinear29 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear33 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear34 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear35 = 24'd0;
reg [7:0] wrapper_bilinear30 = 8'd0;
reg [7:0] wrapper_bilinear31 = 8'd0;
reg [7:0] wrapper_bilinear32 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear36 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear37 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear38 = 24'd0;
reg [7:0] wrapper_bilinear33 = 8'd0;
reg [7:0] wrapper_bilinear34 = 8'd0;
reg [7:0] wrapper_bilinear35 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear39 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear40 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear41 = 24'd0;
reg [7:0] wrapper_bilinear36 = 8'd0;
reg [7:0] wrapper_bilinear37 = 8'd0;
reg [7:0] wrapper_bilinear38 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear42 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear43 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear44 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear45 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear46 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear47 = 24'd0;
reg [7:0] wrapper_bilinear39 = 8'd0;
reg [7:0] wrapper_bilinear40 = 8'd0;
reg [7:0] wrapper_bilinear41 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear48 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear49 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear50 = 24'd0;
reg [7:0] wrapper_bilinear42 = 8'd0;
reg [7:0] wrapper_bilinear43 = 8'd0;
reg [7:0] wrapper_bilinear44 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear51 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear52 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear53 = 24'd0;
reg [7:0] wrapper_bilinear45 = 8'd0;
reg [7:0] wrapper_bilinear46 = 8'd0;
reg [7:0] wrapper_bilinear47 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear54 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear55 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear56 = 24'd0;
reg [7:0] wrapper_bilinear48 = 8'd0;
reg [7:0] wrapper_bilinear49 = 8'd0;
reg [7:0] wrapper_bilinear50 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear57 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear58 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear59 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear60 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear61 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear62 = 24'd0;
reg [7:0] wrapper_bilinear51 = 8'd0;
reg [7:0] wrapper_bilinear52 = 8'd0;
reg [7:0] wrapper_bilinear53 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear63 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear64 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear65 = 24'd0;
reg [7:0] wrapper_bilinear54 = 8'd0;
reg [7:0] wrapper_bilinear55 = 8'd0;
reg [7:0] wrapper_bilinear56 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear66 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear67 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear68 = 24'd0;
reg [7:0] wrapper_bilinear57 = 8'd0;
reg [7:0] wrapper_bilinear58 = 8'd0;
reg [7:0] wrapper_bilinear59 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear69 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear70 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear71 = 24'd0;
reg [7:0] wrapper_bilinear60 = 8'd0;
reg [7:0] wrapper_bilinear61 = 8'd0;
reg [7:0] wrapper_bilinear62 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear72 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear73 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear74 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear75 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear76 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear77 = 24'd0;
reg [7:0] wrapper_bilinear63 = 8'd0;
reg [7:0] wrapper_bilinear64 = 8'd0;
reg [7:0] wrapper_bilinear65 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear78 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear79 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear80 = 24'd0;
reg [7:0] wrapper_bilinear66 = 8'd0;
reg [7:0] wrapper_bilinear67 = 8'd0;
reg [7:0] wrapper_bilinear68 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear81 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear82 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear83 = 24'd0;
reg [7:0] wrapper_bilinear69 = 8'd0;
reg [7:0] wrapper_bilinear70 = 8'd0;
reg [7:0] wrapper_bilinear71 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear84 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear85 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear86 = 24'd0;
reg [7:0] wrapper_bilinear72 = 8'd0;
reg [7:0] wrapper_bilinear73 = 8'd0;
reg [7:0] wrapper_bilinear74 = 8'd0;
reg [23:0] wrapper_bilinear_bilinear87 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear88 = 24'd0;
reg [23:0] wrapper_bilinear_bilinear89 = 24'd0;
reg wrapper_edge_directed_edge_directed_rgb_ready;
reg wrapper_edge_directed_edge_directed_rgb_valid = 1'd0;
reg wrapper_edge_directed_edge_directed_rgb_first = 1'd0;
reg wrapper_edge_directed_edge_directed_rgb_last = 1'd0;
reg [31:0] wrapper_edge_directed_edge_directed_rgb_data;
reg wrapper_edge_directed_edge_directed_working = 1'd0;
reg wrapper_edge_directed_edge_directed_first_pixel = 1'd1;
reg [39:0] wrapper_edge_directed_colors0 = 40'd0;
reg [39:0] wrapper_edge_directed_colors1 = 40'd0;
reg [39:0] wrapper_edge_directed_colors2 = 40'd0;
reg [39:0] wrapper_edge_directed_colors3 = 40'd0;
reg [39:0] wrapper_edge_directed_colors4 = 40'd0;
reg [1:0] wrapper_edge_directed_b_val = 2'd2;
reg [15:0] wrapper_edge_directed_h_abs = 16'd0;
reg [15:0] wrapper_edge_directed_colors5 = 16'd0;
reg [15:0] wrapper_edge_directed_self = 16'd0;
wire [15:0] wrapper_edge_directed_h_grad;
reg [15:0] wrapper_edge_directed_colors_to_decode;
wire [15:0] wrapper_edge_directed_v_grad;
reg [15:0] wrapper_edge_directed_kernel_width;
reg [39:0] wrapper_edge_directed0 = 40'd0;
reg [39:0] wrapper_edge_directed1 = 40'd0;
reg [39:0] wrapper_edge_directed2 = 40'd0;
reg [39:0] wrapper_edge_directed3 = 40'd0;
reg [39:0] wrapper_edge_directed4 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed0 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed1 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed2 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed3 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed4 = 40'd0;
reg [7:0] wrapper_edge_directed5 = 8'd0;
reg [7:0] wrapper_edge_directed6 = 8'd0;
reg [7:0] wrapper_edge_directed7 = 8'd0;
reg [7:0] wrapper_edge_directed8 = 8'd0;
reg [7:0] wrapper_edge_directed9 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed5 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed6 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed7 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed8 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed9 = 40'd0;
reg [7:0] wrapper_edge_directed10 = 8'd0;
reg [7:0] wrapper_edge_directed11 = 8'd0;
reg [7:0] wrapper_edge_directed12 = 8'd0;
reg [7:0] wrapper_edge_directed13 = 8'd0;
reg [7:0] wrapper_edge_directed14 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed10 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed11 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed12 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed13 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed14 = 40'd0;
reg [7:0] wrapper_edge_directed15 = 8'd0;
reg [7:0] wrapper_edge_directed16 = 8'd0;
reg [7:0] wrapper_edge_directed17 = 8'd0;
reg [7:0] wrapper_edge_directed18 = 8'd0;
reg [7:0] wrapper_edge_directed19 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed15 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed16 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed17 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed18 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed19 = 40'd0;
reg [7:0] wrapper_edge_directed20 = 8'd0;
reg [7:0] wrapper_edge_directed21 = 8'd0;
reg [7:0] wrapper_edge_directed22 = 8'd0;
reg [7:0] wrapper_edge_directed23 = 8'd0;
reg [7:0] wrapper_edge_directed24 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed20 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed21 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed22 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed23 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed24 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed25 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed26 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed27 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed28 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed29 = 40'd0;
reg [7:0] wrapper_edge_directed25 = 8'd0;
reg [7:0] wrapper_edge_directed26 = 8'd0;
reg [7:0] wrapper_edge_directed27 = 8'd0;
reg [7:0] wrapper_edge_directed28 = 8'd0;
reg [7:0] wrapper_edge_directed29 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed30 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed31 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed32 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed33 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed34 = 40'd0;
reg [7:0] wrapper_edge_directed30 = 8'd0;
reg [7:0] wrapper_edge_directed31 = 8'd0;
reg [7:0] wrapper_edge_directed32 = 8'd0;
reg [7:0] wrapper_edge_directed33 = 8'd0;
reg [7:0] wrapper_edge_directed34 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed35 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed36 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed37 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed38 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed39 = 40'd0;
reg [7:0] wrapper_edge_directed35 = 8'd0;
reg [7:0] wrapper_edge_directed36 = 8'd0;
reg [7:0] wrapper_edge_directed37 = 8'd0;
reg [7:0] wrapper_edge_directed38 = 8'd0;
reg [7:0] wrapper_edge_directed39 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed40 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed41 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed42 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed43 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed44 = 40'd0;
reg [7:0] wrapper_edge_directed40 = 8'd0;
reg [7:0] wrapper_edge_directed41 = 8'd0;
reg [7:0] wrapper_edge_directed42 = 8'd0;
reg [7:0] wrapper_edge_directed43 = 8'd0;
reg [7:0] wrapper_edge_directed44 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed45 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed46 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed47 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed48 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed49 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed50 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed51 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed52 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed53 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed54 = 40'd0;
reg [7:0] wrapper_edge_directed45 = 8'd0;
reg [7:0] wrapper_edge_directed46 = 8'd0;
reg [7:0] wrapper_edge_directed47 = 8'd0;
reg [7:0] wrapper_edge_directed48 = 8'd0;
reg [7:0] wrapper_edge_directed49 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed55 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed56 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed57 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed58 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed59 = 40'd0;
reg [7:0] wrapper_edge_directed50 = 8'd0;
reg [7:0] wrapper_edge_directed51 = 8'd0;
reg [7:0] wrapper_edge_directed52 = 8'd0;
reg [7:0] wrapper_edge_directed53 = 8'd0;
reg [7:0] wrapper_edge_directed54 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed60 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed61 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed62 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed63 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed64 = 40'd0;
reg [7:0] wrapper_edge_directed55 = 8'd0;
reg [7:0] wrapper_edge_directed56 = 8'd0;
reg [7:0] wrapper_edge_directed57 = 8'd0;
reg [7:0] wrapper_edge_directed58 = 8'd0;
reg [7:0] wrapper_edge_directed59 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed65 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed66 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed67 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed68 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed69 = 40'd0;
reg [7:0] wrapper_edge_directed60 = 8'd0;
reg [7:0] wrapper_edge_directed61 = 8'd0;
reg [7:0] wrapper_edge_directed62 = 8'd0;
reg [7:0] wrapper_edge_directed63 = 8'd0;
reg [7:0] wrapper_edge_directed64 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed70 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed71 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed72 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed73 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed74 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed75 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed76 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed77 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed78 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed79 = 40'd0;
reg [7:0] wrapper_edge_directed65 = 8'd0;
reg [7:0] wrapper_edge_directed66 = 8'd0;
reg [7:0] wrapper_edge_directed67 = 8'd0;
reg [7:0] wrapper_edge_directed68 = 8'd0;
reg [7:0] wrapper_edge_directed69 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed80 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed81 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed82 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed83 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed84 = 40'd0;
reg [7:0] wrapper_edge_directed70 = 8'd0;
reg [7:0] wrapper_edge_directed71 = 8'd0;
reg [7:0] wrapper_edge_directed72 = 8'd0;
reg [7:0] wrapper_edge_directed73 = 8'd0;
reg [7:0] wrapper_edge_directed74 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed85 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed86 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed87 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed88 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed89 = 40'd0;
reg [7:0] wrapper_edge_directed75 = 8'd0;
reg [7:0] wrapper_edge_directed76 = 8'd0;
reg [7:0] wrapper_edge_directed77 = 8'd0;
reg [7:0] wrapper_edge_directed78 = 8'd0;
reg [7:0] wrapper_edge_directed79 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed90 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed91 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed92 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed93 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed94 = 40'd0;
reg [7:0] wrapper_edge_directed80 = 8'd0;
reg [7:0] wrapper_edge_directed81 = 8'd0;
reg [7:0] wrapper_edge_directed82 = 8'd0;
reg [7:0] wrapper_edge_directed83 = 8'd0;
reg [7:0] wrapper_edge_directed84 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed95 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed96 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed97 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed98 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed99 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed100 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed101 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed102 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed103 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed104 = 40'd0;
reg [7:0] wrapper_edge_directed85 = 8'd0;
reg [7:0] wrapper_edge_directed86 = 8'd0;
reg [7:0] wrapper_edge_directed87 = 8'd0;
reg [7:0] wrapper_edge_directed88 = 8'd0;
reg [7:0] wrapper_edge_directed89 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed105 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed106 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed107 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed108 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed109 = 40'd0;
reg [7:0] wrapper_edge_directed90 = 8'd0;
reg [7:0] wrapper_edge_directed91 = 8'd0;
reg [7:0] wrapper_edge_directed92 = 8'd0;
reg [7:0] wrapper_edge_directed93 = 8'd0;
reg [7:0] wrapper_edge_directed94 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed110 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed111 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed112 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed113 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed114 = 40'd0;
reg [7:0] wrapper_edge_directed95 = 8'd0;
reg [7:0] wrapper_edge_directed96 = 8'd0;
reg [7:0] wrapper_edge_directed97 = 8'd0;
reg [7:0] wrapper_edge_directed98 = 8'd0;
reg [7:0] wrapper_edge_directed99 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed115 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed116 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed117 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed118 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed119 = 40'd0;
reg [7:0] wrapper_edge_directed100 = 8'd0;
reg [7:0] wrapper_edge_directed101 = 8'd0;
reg [7:0] wrapper_edge_directed102 = 8'd0;
reg [7:0] wrapper_edge_directed103 = 8'd0;
reg [7:0] wrapper_edge_directed104 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed120 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed121 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed122 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed123 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed124 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed125 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed126 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed127 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed128 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed129 = 40'd0;
reg [7:0] wrapper_edge_directed105 = 8'd0;
reg [7:0] wrapper_edge_directed106 = 8'd0;
reg [7:0] wrapper_edge_directed107 = 8'd0;
reg [7:0] wrapper_edge_directed108 = 8'd0;
reg [7:0] wrapper_edge_directed109 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed130 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed131 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed132 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed133 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed134 = 40'd0;
reg [7:0] wrapper_edge_directed110 = 8'd0;
reg [7:0] wrapper_edge_directed111 = 8'd0;
reg [7:0] wrapper_edge_directed112 = 8'd0;
reg [7:0] wrapper_edge_directed113 = 8'd0;
reg [7:0] wrapper_edge_directed114 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed135 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed136 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed137 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed138 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed139 = 40'd0;
reg [7:0] wrapper_edge_directed115 = 8'd0;
reg [7:0] wrapper_edge_directed116 = 8'd0;
reg [7:0] wrapper_edge_directed117 = 8'd0;
reg [7:0] wrapper_edge_directed118 = 8'd0;
reg [7:0] wrapper_edge_directed119 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed140 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed141 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed142 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed143 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed144 = 40'd0;
reg [7:0] wrapper_edge_directed120 = 8'd0;
reg [7:0] wrapper_edge_directed121 = 8'd0;
reg [7:0] wrapper_edge_directed122 = 8'd0;
reg [7:0] wrapper_edge_directed123 = 8'd0;
reg [7:0] wrapper_edge_directed124 = 8'd0;
reg [39:0] wrapper_edge_directed_edge_directed145 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed146 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed147 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed148 = 40'd0;
reg [39:0] wrapper_edge_directed_edge_directed149 = 40'd0;
wire error0;
wire error1;
reg status = 1'd0;
reg re = 1'd0;
reg r = 1'd0;
reg storage = 1'd0;
reg [4:0] nearestneighbour_state = 5'd0;
reg [4:0] nearestneighbour_next_state;
reg wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0;
reg wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0;
reg wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1;
reg wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1;
reg wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2;
reg wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2;
reg wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0;
reg wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0;
reg wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1;
reg wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1;
reg wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2;
reg wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2;
reg [15:0] wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0;
reg wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0;
reg [15:0] wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1;
reg wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1;
reg [13:0] wrapper_adrs0_nearestneighbour_next_value3;
reg wrapper_adrs0_nearestneighbour_next_value_ce3;
reg [13:0] wrapper_adrs1_nearestneighbour_next_value4;
reg wrapper_adrs1_nearestneighbour_next_value_ce4;
reg [7:0] wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0;
reg wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0;
reg [7:0] wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1;
reg wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1;
reg [7:0] wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2;
reg wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2;
reg [13:0] wrapper_processed_lines_nearestneighbour_f_next_value0;
reg wrapper_processed_lines_nearestneighbour_f_next_value_ce0;
reg [13:0] wrapper_adrs2_nearestneighbour_f_next_value1;
reg wrapper_adrs2_nearestneighbour_f_next_value_ce1;
reg [13:0] wrapper_adrs3_nearestneighbour_f_next_value2;
reg wrapper_adrs3_nearestneighbour_f_next_value_ce2;
reg [13:0] wrapper_adrs4_nearestneighbour_f_next_value3;
reg wrapper_adrs4_nearestneighbour_f_next_value_ce3;
reg [13:0] wrapper_adrs5_nearestneighbour_f_next_value4;
reg wrapper_adrs5_nearestneighbour_f_next_value_ce4;
reg [4:0] bilinear_state = 5'd0;
reg [4:0] bilinear_next_state;
reg wrapper_bilinear_bilinear_working_bilinear_next_value0;
reg wrapper_bilinear_bilinear_working_bilinear_next_value_ce0;
reg wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1;
reg wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1;
reg wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2;
reg wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2;
reg wrapper_bilinear_g_val_bilinear_lowernext_next_value0;
reg wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0;
reg wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1;
reg wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1;
reg wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2;
reg wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2;
reg [23:0] wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0;
reg wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0;
reg [23:0] wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1;
reg wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1;
reg [23:0] wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2;
reg wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2;
reg [13:0] wrapper_adrs5_bilinear_next_value3;
reg wrapper_adrs5_bilinear_next_value_ce3;
reg [13:0] wrapper_adrs0_bilinear_next_value4;
reg wrapper_adrs0_bilinear_next_value_ce4;
reg [13:0] wrapper_adrs1_bilinear_next_value5;
reg wrapper_adrs1_bilinear_next_value_ce5;
reg [15:0] wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0;
reg wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0;
reg [15:0] wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1;
reg wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1;
reg [15:0] wrapper_bilinear_self_bilinear_lowernext_t_next_value2;
reg wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2;
reg [13:0] wrapper_processed_lines_bilinear_f_next_value0;
reg wrapper_processed_lines_bilinear_f_next_value_ce0;
reg [13:0] wrapper_adrs2_bilinear_f_next_value1;
reg wrapper_adrs2_bilinear_f_next_value_ce1;
reg [13:0] wrapper_adrs3_bilinear_f_next_value2;
reg wrapper_adrs3_bilinear_f_next_value_ce2;
reg [13:0] wrapper_adrs4_bilinear_f_next_value3;
reg wrapper_adrs4_bilinear_f_next_value_ce3;
reg [4:0] edge_directed_state = 5'd0;
reg [4:0] edge_directed_next_state;
reg wrapper_edge_directed_edge_directed_working_edge_directed_next_value0;
reg wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0;
reg wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1;
reg wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1;
reg wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2;
reg wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2;
reg [1:0] wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0;
reg wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0;
reg wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1;
reg wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1;
reg wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2;
reg wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2;
reg [39:0] wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0;
reg wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0;
reg [39:0] wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1;
reg wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1;
reg [39:0] wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2;
reg wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2;
reg [39:0] wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3;
reg wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3;
reg [39:0] wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4;
reg wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4;
reg [13:0] wrapper_adrs4_edge_directed_next_value3;
reg wrapper_adrs4_edge_directed_next_value_ce3;
reg [13:0] wrapper_adrs5_edge_directed_next_value4;
reg wrapper_adrs5_edge_directed_next_value_ce4;
reg [13:0] wrapper_adrs0_edge_directed_next_value5;
reg wrapper_adrs0_edge_directed_next_value_ce5;
reg [13:0] wrapper_adrs1_edge_directed_next_value6;
reg wrapper_adrs1_edge_directed_next_value_ce6;
reg [13:0] wrapper_adrs2_edge_directed_next_value7;
reg wrapper_adrs2_edge_directed_next_value_ce7;
reg [15:0] wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0;
reg wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0;
reg [15:0] wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1;
reg wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1;
reg [15:0] wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2;
reg wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2;
reg [13:0] wrapper_adrs3_edge_directed_f_next_value0;
reg wrapper_adrs3_edge_directed_f_next_value_ce0;
reg [13:0] wrapper_processed_lines_edge_directed_f_next_value1;
reg wrapper_processed_lines_edge_directed_f_next_value_ce1;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign wrapper_converter_sink_payload_data = raw_payload_data;
assign wrapper_converter_sink_valid = raw_valid;
assign raw_ready = wrapper_converter_sink_ready;
assign wrapper_converter_sink_last = raw_last;
assign wrapper_converter_sink_first = raw_first;
assign wrapper_output_ready = rgb_ready;
assign rgb_valid = wrapper_output_valid;
assign rgb_last = wrapper_output_last;
assign rgb_first = wrapper_output_first;
assign wrapper_input_first = wrapper_source_source_first;
assign wrapper_source_source_ready = wrapper_input_ready;
assign wrapper_input_valid = wrapper_source_source_valid;
assign wrapper_input_payload_data = wrapper_source_source_payload_data;

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	wrapper_input_last <= 1'd0;
	if (((wrapper_last_cnt == (cols - 1'd1)) & raw_last)) begin
		wrapper_input_last <= 1'd1;
	end else begin
		wrapper_input_last <= 1'd0;
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign wrapper_cache_reset = wrapper_frame_sync_incorrect;
assign wrapper_trigger = wrapper_error;

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	rgb_payload_data <= 32'd0;
	if (bgr) begin
		rgb_payload_data <= {wrapper_output_payload_data[31:24], wrapper_output_payload_data[7:0], wrapper_output_payload_data[15:8], wrapper_output_payload_data[23:16]};
	end else begin
		rgb_payload_data <= wrapper_output_payload_data;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	wrapper_active <= 3'd0;
	wrapper_active[0] <= (((algorithm[0] & (~wrapper_bilinear_bilinear_working)) & (~wrapper_edge_directed_edge_directed_working)) | wrapper_nearestneighbour_nearestneighbour_working);
	wrapper_active[1] <= (((algorithm[1] & (~wrapper_nearestneighbour_nearestneighbour_working)) & (~wrapper_edge_directed_edge_directed_working)) | wrapper_bilinear_bilinear_working);
	wrapper_active[2] <= (((algorithm[2] & (~wrapper_nearestneighbour_nearestneighbour_working)) & (~wrapper_bilinear_bilinear_working)) | wrapper_edge_directed_edge_directed_working);
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end
assign wrapper_working = ((wrapper_nearestneighbour_nearestneighbour_working | wrapper_bilinear_bilinear_working) | wrapper_edge_directed_edge_directed_working);
assign busy = wrapper_working;
assign wrapper_busy1 = busy;

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	wrapper_treshold <= 2'd0;
	if (wrapper_active[0]) begin
		wrapper_treshold <= 1'd0;
	end else begin
		if (wrapper_active[1]) begin
			wrapper_treshold <= 1'd1;
		end else begin
			wrapper_treshold <= 2'd2;
		end
	end
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end
assign wrapper_source_source_valid = wrapper_converter_source_valid;
assign wrapper_converter_source_ready = wrapper_source_source_ready;
assign wrapper_source_source_first = wrapper_converter_source_first;
assign wrapper_source_source_last = wrapper_converter_source_last;
assign wrapper_source_source_payload_data = wrapper_converter_source_payload_data;
assign wrapper_converter_first = (wrapper_converter_mux == 1'd0);
assign wrapper_converter_last = (wrapper_converter_mux == 2'd3);
assign wrapper_converter_source_valid = wrapper_converter_sink_valid;
assign wrapper_converter_source_first = (wrapper_converter_sink_first & wrapper_converter_first);
assign wrapper_converter_source_last = (wrapper_converter_sink_last & wrapper_converter_last);
assign wrapper_converter_sink_ready = (wrapper_converter_last & wrapper_converter_source_ready);

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	wrapper_converter_source_payload_data <= 8'd0;
	case (wrapper_converter_mux)
		1'd0: begin
			wrapper_converter_source_payload_data <= wrapper_converter_sink_payload_data[7:0];
		end
		1'd1: begin
			wrapper_converter_source_payload_data <= wrapper_converter_sink_payload_data[15:8];
		end
		2'd2: begin
			wrapper_converter_source_payload_data <= wrapper_converter_sink_payload_data[23:16];
		end
		default: begin
			wrapper_converter_source_payload_data <= wrapper_converter_sink_payload_data[31:24];
		end
	endcase
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end
assign wrapper_converter_source_payload_valid_token_count = wrapper_converter_last;
assign error0 = wrapper_status;
assign error1 = wrapper_pending;

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	wrapper_clear <= 1'd0;
	if ((re & r)) begin
		wrapper_clear <= 1'd1;
	end
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end
assign wrapper_irq = (status & storage);
assign wrapper_status = 1'd0;
assign wrapper_error = (wrapper_overflow | wrapper_underflow);
assign wrapper_input_ready = wrapper_raw_ready;
assign wrapper_raw_valid = wrapper_input_valid;
assign wrapper_raw_last = wrapper_input_last;
assign wrapper_raw_first = wrapper_input_first;
assign wrapper_raw_data = wrapper_input_payload_data;
assign wrapper_ch_nrdy = (wrapper_current_chunk != 1'd0);
assign wrapper_adr_nrdy = (wrapper_adrs0 > 1'd0);
assign wrapper_frame_sync_incorrect = ((wrapper_raw_first & wrapper_ch_nrdy) | (wrapper_raw_first & wrapper_adr_nrdy));
assign wrapper_force_reset = ((wrapper_hold_reset | wrapper_raw_first) | wrapper_f_reset);
assign wrapper_memory_reset = wrapper_force_reset;

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	wrapper_underflow <= 1'd0;
	wrapper_overflow <= 1'd0;
	if (wrapper_raw_last) begin
		if ((wrapper_columns_caputred > (cols - 1'd1))) begin
			wrapper_overflow <= 1'd1;
		end else begin
			if ((wrapper_columns_caputred < (cols - 1'd1))) begin
				wrapper_underflow <= 1'd1;
			end else begin
				wrapper_underflow <= 1'd0;
				wrapper_overflow <= 1'd0;
			end
		end
	end else begin
		if ((cols <= wrapper_columns_caputred)) begin
			wrapper_overflow <= 1'd1;
		end else begin
			wrapper_underflow <= 1'd0;
			wrapper_overflow <= 1'd0;
		end
	end
// synthesis translate_off
	dummy_d_6 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_7;
// synthesis translate_on
always @(*) begin
	wrapper_raw_ready <= 1'd1;
	if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
		wrapper_raw_ready <= (((~wrapper_push_zeros) & (~wrapper_f_reset)) & (~wrapper_frame_sync_incorrect));
	end else begin
		wrapper_raw_ready <= 1'd0;
	end
// synthesis translate_off
	dummy_d_7 <= dummy_s;
// synthesis translate_on
end
assign wrapper_push_zeros = ((rows <= wrapper_collected_lines) & (wrapper_collected_lines <= (rows + wrapper_treshold)));
assign wrapper_memory0_adr = wrapper_adrs0;
assign wrapper_demosaiccache0 = wrapper_memory0_dat_r;
assign wrapper_memory1_adr = wrapper_adrs1;
assign wrapper_demosaiccache1 = wrapper_memory1_dat_r;
assign wrapper_memory2_adr = wrapper_adrs2;
assign wrapper_demosaiccache2 = wrapper_memory2_dat_r;
assign wrapper_memory3_adr = wrapper_adrs3;
assign wrapper_demosaiccache3 = wrapper_memory3_dat_r;
assign wrapper_memory4_adr = wrapper_adrs4;
assign wrapper_demosaiccache4 = wrapper_memory4_dat_r;
assign wrapper_memory5_adr = wrapper_adrs5;
assign wrapper_demosaiccache5 = wrapper_memory5_dat_r;

// synthesis translate_off
reg dummy_d_8;
// synthesis translate_on
always @(*) begin
	wrapper_memory0_we <= 1'd0;
	wrapper_memory0_dat_w <= 8'd0;
	wrapper_memory1_we <= 1'd0;
	wrapper_memory1_dat_w <= 8'd0;
	wrapper_memory2_we <= 1'd0;
	wrapper_memory2_dat_w <= 8'd0;
	wrapper_memory3_we <= 1'd0;
	wrapper_memory3_dat_w <= 8'd0;
	wrapper_memory4_we <= 1'd0;
	wrapper_memory4_dat_w <= 8'd0;
	wrapper_memory5_we <= 1'd0;
	wrapper_memory5_dat_w <= 8'd0;
	if (wrapper_memory_reset) begin
		wrapper_memory1_we <= 1'd1;
	end
	if (wrapper_memory_reset) begin
		wrapper_memory2_we <= 1'd1;
	end
	if (wrapper_memory_reset) begin
		wrapper_memory3_we <= 1'd1;
	end
	if (wrapper_memory_reset) begin
		wrapper_memory4_we <= 1'd1;
	end
	if (wrapper_memory_reset) begin
		wrapper_memory5_we <= 1'd1;
	end
	case (wrapper_current_chunk)
		1'd0: begin
			if (wrapper_push_zeros) begin
				wrapper_memory0_dat_w <= 1'd0;
			end else begin
				if ((~wrapper_memory_reset)) begin
					wrapper_memory0_dat_w <= wrapper_raw_data;
				end else begin
					wrapper_memory0_dat_w <= wrapper_raw_data;
				end
			end
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if (((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset))) begin
					if ((cols > wrapper_adrs0)) begin
						wrapper_memory0_we <= 1'd1;
					end else begin
						wrapper_memory1_we <= 1'd1;
					end
				end else begin
					wrapper_memory0_we <= 1'd0;
				end
			end else begin
				wrapper_memory0_we <= 1'd0;
			end
		end
		1'd1: begin
			if (wrapper_push_zeros) begin
				wrapper_memory1_dat_w <= 1'd0;
			end else begin
				if ((~wrapper_memory_reset)) begin
					wrapper_memory1_dat_w <= wrapper_raw_data;
				end else begin
					wrapper_memory0_dat_w <= wrapper_raw_data;
					wrapper_memory1_dat_w <= 1'd0;
				end
			end
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if (((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset))) begin
					if ((cols > wrapper_adrs1)) begin
						wrapper_memory1_we <= 1'd1;
					end else begin
						wrapper_memory2_we <= 1'd1;
					end
				end else begin
					wrapper_memory1_we <= 1'd0;
				end
			end else begin
				wrapper_memory1_we <= 1'd0;
			end
		end
		2'd2: begin
			if (wrapper_push_zeros) begin
				wrapper_memory2_dat_w <= 1'd0;
			end else begin
				if ((~wrapper_memory_reset)) begin
					wrapper_memory2_dat_w <= wrapper_raw_data;
				end else begin
					wrapper_memory0_dat_w <= wrapper_raw_data;
					wrapper_memory2_dat_w <= 1'd0;
				end
			end
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if (((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset))) begin
					if ((cols > wrapper_adrs2)) begin
						wrapper_memory2_we <= 1'd1;
					end else begin
						wrapper_memory3_we <= 1'd1;
					end
				end else begin
					wrapper_memory2_we <= 1'd0;
				end
			end else begin
				wrapper_memory2_we <= 1'd0;
			end
		end
		2'd3: begin
			if (wrapper_push_zeros) begin
				wrapper_memory3_dat_w <= 1'd0;
			end else begin
				if ((~wrapper_memory_reset)) begin
					wrapper_memory3_dat_w <= wrapper_raw_data;
				end else begin
					wrapper_memory0_dat_w <= wrapper_raw_data;
					wrapper_memory3_dat_w <= 1'd0;
				end
			end
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if (((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset))) begin
					if ((cols > wrapper_adrs3)) begin
						wrapper_memory3_we <= 1'd1;
					end else begin
						wrapper_memory4_we <= 1'd1;
					end
				end else begin
					wrapper_memory3_we <= 1'd0;
				end
			end else begin
				wrapper_memory3_we <= 1'd0;
			end
		end
		3'd4: begin
			if (wrapper_push_zeros) begin
				wrapper_memory4_dat_w <= 1'd0;
			end else begin
				if ((~wrapper_memory_reset)) begin
					wrapper_memory4_dat_w <= wrapper_raw_data;
				end else begin
					wrapper_memory0_dat_w <= wrapper_raw_data;
					wrapper_memory4_dat_w <= 1'd0;
				end
			end
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if (((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset))) begin
					if ((cols > wrapper_adrs4)) begin
						wrapper_memory4_we <= 1'd1;
					end else begin
						wrapper_memory5_we <= 1'd1;
					end
				end else begin
					wrapper_memory4_we <= 1'd0;
				end
			end else begin
				wrapper_memory4_we <= 1'd0;
			end
		end
		3'd5: begin
			if (wrapper_push_zeros) begin
				wrapper_memory5_dat_w <= 1'd0;
			end else begin
				if ((~wrapper_memory_reset)) begin
					wrapper_memory5_dat_w <= wrapper_raw_data;
				end else begin
					wrapper_memory0_dat_w <= wrapper_raw_data;
					wrapper_memory5_dat_w <= 1'd0;
				end
			end
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if (((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset))) begin
					if ((cols > wrapper_adrs5)) begin
						wrapper_memory5_we <= 1'd1;
					end else begin
						wrapper_memory0_we <= 1'd1;
					end
				end else begin
					wrapper_memory5_we <= 1'd0;
				end
			end else begin
				wrapper_memory5_we <= 1'd0;
			end
		end
	endcase
// synthesis translate_off
	dummy_d_8 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_9;
// synthesis translate_on
always @(*) begin
	wrapper_nearestneighbour_nearestneighbour_rgb_data <= 32'd0;
	if (wrapper_active[0]) begin
		wrapper_nearestneighbour_nearestneighbour_rgb_data <= {wrapper_nearestneighbour_kernel_width, wrapper_nearestneighbour_b_val, wrapper_nearestneighbour_self};
	end
// synthesis translate_off
	dummy_d_9 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_10;
// synthesis translate_on
always @(*) begin
	nearestneighbour_next_state <= 5'd0;
	wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
	wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd0;
	wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
	wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd0;
	wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= 16'd0;
	wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd0;
	wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= 16'd0;
	wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd0;
	wrapper_adrs0_nearestneighbour_next_value3 <= 14'd0;
	wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd0;
	wrapper_adrs1_nearestneighbour_next_value4 <= 14'd0;
	wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd0;
	wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= 8'd0;
	wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd0;
	wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= 8'd0;
	wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd0;
	wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= 8'd0;
	wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd0;
	wrapper_processed_lines_nearestneighbour_f_next_value0 <= 14'd0;
	wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd0;
	wrapper_adrs2_nearestneighbour_f_next_value1 <= 14'd0;
	wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd0;
	wrapper_adrs3_nearestneighbour_f_next_value2 <= 14'd0;
	wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd0;
	wrapper_adrs4_nearestneighbour_f_next_value3 <= 14'd0;
	wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd0;
	wrapper_adrs5_nearestneighbour_f_next_value4 <= 14'd0;
	wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd0;
	nearestneighbour_next_state <= nearestneighbour_state;
	case (nearestneighbour_state)
		1'd1: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 2'd2;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour2};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour3};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= 1'd0;
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= 1'd0;
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 2'd2;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							nearestneighbour_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour2;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour3;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		2'd2: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 1'd1;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour4};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour5};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= 1'd0;
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= 1'd0;
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 1'd1;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							nearestneighbour_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour4;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour5;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		2'd3: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 3'd4;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour6};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour7};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= 1'd0;
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= 1'd0;
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 3'd4;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							nearestneighbour_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour6;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour7;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		3'd4: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 2'd3;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour8};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour9};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= 1'd0;
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= 1'd0;
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 2'd3;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							nearestneighbour_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour8;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour9;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		3'd5: begin
			if (wrapper_active[0]) begin
				if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour10;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour11;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
						nearestneighbour_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							end
							if ((wrapper_adrs1 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									nearestneighbour_next_state <= 4'd8;
								end else begin
									if ((pattern == 1'd1)) begin
										nearestneighbour_next_state <= 3'd7;
									end else begin
										if ((pattern == 2'd3)) begin
											nearestneighbour_next_state <= 4'd9;
										end else begin
											nearestneighbour_next_state <= 4'd8;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		3'd6: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 3'd7;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour10};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour11};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= 1'd0;
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= 1'd0;
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 3'd7;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							nearestneighbour_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour12;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour13;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		3'd7: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 3'd6;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour12};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour13};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= 1'd0;
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= 1'd0;
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 3'd6;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							nearestneighbour_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour14;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour15;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		4'd8: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 4'd9;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour14};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour15};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= 1'd0;
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= 1'd0;
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 4'd9;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							nearestneighbour_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour16;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour17;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		4'd9: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 4'd8;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour16};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour17};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= 1'd0;
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= 1'd0;
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 4'd8;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							nearestneighbour_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour18;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour19;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		4'd10: begin
			if (wrapper_active[0]) begin
				if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour20;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour21;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
						nearestneighbour_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							end
							if ((wrapper_adrs2 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									nearestneighbour_next_state <= 4'd11;
								end else begin
									if ((pattern == 1'd1)) begin
										nearestneighbour_next_state <= 4'd14;
									end else begin
										if ((pattern == 2'd3)) begin
											nearestneighbour_next_state <= 4'd11;
										end else begin
											nearestneighbour_next_state <= 4'd12;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		4'd11: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 4'd12;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour18};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour19};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= 1'd0;
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= 1'd0;
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 4'd12;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							nearestneighbour_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour22;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour23;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		4'd12: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 4'd11;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour20};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour21};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= 1'd0;
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= 1'd0;
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 4'd11;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							nearestneighbour_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour24;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour25;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		4'd13: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 4'd14;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour22};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour23};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= 1'd0;
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= 1'd0;
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 4'd14;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							nearestneighbour_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour26;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour27;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		4'd14: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache2};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 4'd13;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour24};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour25};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs2_nearestneighbour_f_next_value1 <= 1'd0;
								wrapper_adrs2_nearestneighbour_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= 1'd0;
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 4'd13;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							nearestneighbour_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour28;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour29;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		4'd15: begin
			if (wrapper_active[0]) begin
				if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour30;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour31;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
						nearestneighbour_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							end
							if ((wrapper_adrs3 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									nearestneighbour_next_state <= 5'd18;
								end else begin
									if ((pattern == 1'd1)) begin
										nearestneighbour_next_state <= 5'd17;
									end else begin
										if ((pattern == 2'd3)) begin
											nearestneighbour_next_state <= 5'd19;
										end else begin
											nearestneighbour_next_state <= 5'd18;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd16: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd17;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour26};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour27};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= 1'd0;
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= 1'd0;
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd17;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							nearestneighbour_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour32;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour33;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd17: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd16;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour28};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour29};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= 1'd0;
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= 1'd0;
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd16;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							nearestneighbour_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour34;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour35;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd18: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd19;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour30};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour31};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= 1'd0;
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= 1'd0;
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd19;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							nearestneighbour_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour36;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour37;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd19: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache3};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd18;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour32};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour33};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs3_nearestneighbour_f_next_value2 <= 1'd0;
								wrapper_adrs3_nearestneighbour_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= 1'd0;
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd18;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							nearestneighbour_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour38;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour39;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd20: begin
			if (wrapper_active[0]) begin
				if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour40;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour41;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
						nearestneighbour_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							end
							if ((wrapper_adrs4 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									nearestneighbour_next_state <= 5'd21;
								end else begin
									if ((pattern == 1'd1)) begin
										nearestneighbour_next_state <= 5'd24;
									end else begin
										if ((pattern == 2'd3)) begin
											nearestneighbour_next_state <= 5'd21;
										end else begin
											nearestneighbour_next_state <= 5'd22;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd21: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd22;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour34};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour35};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= 1'd0;
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= 1'd0;
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd22;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							nearestneighbour_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour42;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour43;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd22: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd21;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour36};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour37};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= 1'd0;
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= 1'd0;
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd21;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							nearestneighbour_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour44;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour45;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd23: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd24;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour38};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour39};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= 1'd0;
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= 1'd0;
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd24;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							nearestneighbour_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour46;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour47;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd24: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache4};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd23;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour40};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour41};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs4_nearestneighbour_f_next_value3 <= 1'd0;
								wrapper_adrs4_nearestneighbour_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= 1'd0;
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd23;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
							wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							nearestneighbour_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour48;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour49;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd25: begin
			if (wrapper_active[0]) begin
				if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour50;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour51;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
						nearestneighbour_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							end
							if ((wrapper_adrs5 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									nearestneighbour_next_state <= 5'd28;
								end else begin
									if ((pattern == 1'd1)) begin
										nearestneighbour_next_state <= 5'd27;
									end else begin
										if ((pattern == 2'd3)) begin
											nearestneighbour_next_state <= 5'd29;
										end else begin
											nearestneighbour_next_state <= 5'd28;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd26: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd27;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour42};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour43};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= 1'd0;
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= 1'd0;
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd27;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							nearestneighbour_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour52;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour53;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd27: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd26;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour44};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour45};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= 1'd0;
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= 1'd0;
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd26;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							nearestneighbour_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour54;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour55;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd28: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd29;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour46};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour47};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= 1'd0;
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= 1'd0;
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd29;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							nearestneighbour_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour56;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour57;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		5'd29: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[0]) begin
					if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
						if ((((pattern == 1'd0) | pattern) == 1'd1)) begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[7:0];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0 <= wrapper_nearestneighbour_colors1[15:8];
							wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1 <= wrapper_nearestneighbour_colors0[7:0];
							wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2 <= wrapper_nearestneighbour_colors0[15:8];
							wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						if ((~wrapper_nearestneighbour_g_val)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache5};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								if (wrapper_nearestneighbour_nearestneighbour_first_pixel) begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
								end else begin
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
									wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
								end
								nearestneighbour_next_state <= 5'd28;
							end else begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_nearestneighbour48};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_nearestneighbour49};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs5_nearestneighbour_f_next_value4 <= 1'd0;
								wrapper_adrs5_nearestneighbour_f_next_value_ce4 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= 1'd0;
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd1;
								wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
								nearestneighbour_next_state <= 5'd28;
							end
						end else begin
							wrapper_processed_lines_nearestneighbour_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_nearestneighbour_f_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
							wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd1;
							wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
							wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
							wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
							wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							nearestneighbour_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
				wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
				wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour58;
				wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour59;
				wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
				nearestneighbour_next_state <= 1'd0;
			end
		end
		default: begin
			if (wrapper_active[0]) begin
				if (wrapper_nearestneighbour_nearestneighbour_rgb_ready) begin
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2 <= 1'd0;
					wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2 <= 1'd0;
						wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2 <= 1'd1;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1 <= 1'd0;
						wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1 <= 1'd1;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= wrapper_nearestneighbour_nearestneighbour0;
						wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= wrapper_nearestneighbour_nearestneighbour1;
						wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
						nearestneighbour_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0 <= {wrapper_nearestneighbour_colors0, wrapper_demosaiccache0};
								wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1 <= {wrapper_nearestneighbour_colors1, wrapper_demosaiccache1};
								wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_adrs0_nearestneighbour_next_value3 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_nearestneighbour_next_value_ce3 <= 1'd1;
								wrapper_adrs1_nearestneighbour_next_value4 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_nearestneighbour_next_value_ce4 <= 1'd1;
							end
							if ((wrapper_adrs0 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									nearestneighbour_next_state <= 1'd1;
								end else begin
									if ((pattern == 1'd1)) begin
										nearestneighbour_next_state <= 3'd4;
									end else begin
										if ((pattern == 2'd3)) begin
											nearestneighbour_next_state <= 1'd1;
										end else begin
											nearestneighbour_next_state <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
		end
	endcase
// synthesis translate_off
	dummy_d_10 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_11;
// synthesis translate_on
always @(*) begin
	wrapper_bilinear_bilinear_rgb_data <= 32'd0;
	if (wrapper_active[1]) begin
		wrapper_bilinear_bilinear_rgb_data <= {wrapper_bilinear_kernel_width[7:0], wrapper_bilinear_b_val[7:0], wrapper_bilinear_self[7:0]};
	end
// synthesis translate_off
	dummy_d_11 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_12;
// synthesis translate_on
always @(*) begin
	bilinear_next_state <= 5'd0;
	wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
	wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd0;
	wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
	wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd0;
	wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd0;
	wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd0;
	wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
	wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd0;
	wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
	wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd0;
	wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
	wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd0;
	wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= 24'd0;
	wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd0;
	wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= 24'd0;
	wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd0;
	wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= 24'd0;
	wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd0;
	wrapper_adrs5_bilinear_next_value3 <= 14'd0;
	wrapper_adrs5_bilinear_next_value_ce3 <= 1'd0;
	wrapper_adrs0_bilinear_next_value4 <= 14'd0;
	wrapper_adrs0_bilinear_next_value_ce4 <= 1'd0;
	wrapper_adrs1_bilinear_next_value5 <= 14'd0;
	wrapper_adrs1_bilinear_next_value_ce5 <= 1'd0;
	wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= 16'd0;
	wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd0;
	wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= 16'd0;
	wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd0;
	wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= 16'd0;
	wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd0;
	wrapper_processed_lines_bilinear_f_next_value0 <= 14'd0;
	wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd0;
	wrapper_adrs2_bilinear_f_next_value1 <= 14'd0;
	wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd0;
	wrapper_adrs3_bilinear_f_next_value2 <= 14'd0;
	wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd0;
	wrapper_adrs4_bilinear_f_next_value3 <= 14'd0;
	wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd0;
	bilinear_next_state <= bilinear_state;
	case (bilinear_state)
		1'd1: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 2'd2;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear3};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear4};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear5};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 2'd2;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							bilinear_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear3;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear4;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear5;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		2'd2: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 1'd1;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear6};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear7};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear8};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 1'd1;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							bilinear_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear6;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear7;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear8;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		2'd3: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 3'd4;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear9};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear10};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear11};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 3'd4;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							bilinear_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear9;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear10;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear11;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		3'd4: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 2'd3;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear12};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear13};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear14};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 2'd3;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							bilinear_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear12;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear13;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear14;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		3'd5: begin
			if (wrapper_active[1]) begin
				if (wrapper_bilinear_bilinear_rgb_ready) begin
					wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd1;
					wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
						wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear15;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear16;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear17;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
						bilinear_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							end
							if ((wrapper_adrs1 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									bilinear_next_state <= 4'd8;
								end else begin
									if ((pattern == 1'd1)) begin
										bilinear_next_state <= 3'd7;
									end else begin
										if ((pattern == 2'd3)) begin
											bilinear_next_state <= 4'd9;
										end else begin
											bilinear_next_state <= 4'd8;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		3'd6: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 3'd7;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear15};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear16};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear17};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 3'd7;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							bilinear_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear18;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear19;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear20;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		3'd7: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 3'd6;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear18};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear19};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear20};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 3'd6;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							bilinear_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear21;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear22;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear23;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		4'd8: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 4'd9;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear21};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear22};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear23};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 4'd9;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							bilinear_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear24;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear25;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear26;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		4'd9: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache0};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache1};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache2};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 4'd8;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear24};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear25};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear26};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 4'd8;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							bilinear_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear27;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear28;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear29;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		4'd10: begin
			if (wrapper_active[1]) begin
				if (wrapper_bilinear_bilinear_rgb_ready) begin
					wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd1;
					wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
						wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear30;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear31;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear32;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
						bilinear_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							end
							if ((wrapper_adrs2 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									bilinear_next_state <= 4'd11;
								end else begin
									if ((pattern == 1'd1)) begin
										bilinear_next_state <= 4'd14;
									end else begin
										if ((pattern == 2'd3)) begin
											bilinear_next_state <= 4'd11;
										end else begin
											bilinear_next_state <= 4'd12;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		4'd11: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 4'd12;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear27};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear28};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear29};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 4'd12;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							bilinear_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear33;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear34;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear35;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		4'd12: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 4'd11;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear30};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear31};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear32};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 4'd11;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							bilinear_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear36;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear37;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear38;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		4'd13: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 4'd14;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear33};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear34};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear35};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 4'd14;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							bilinear_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear39;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear40;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear41;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		4'd14: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache1};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache2};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache3};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 4'd13;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear36};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear37};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear38};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= 1'd0;
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 4'd13;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							bilinear_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear42;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear43;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear44;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		4'd15: begin
			if (wrapper_active[1]) begin
				if (wrapper_bilinear_bilinear_rgb_ready) begin
					wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd1;
					wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
						wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear45;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear46;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear47;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
						bilinear_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							end
							if ((wrapper_adrs3 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									bilinear_next_state <= 5'd18;
								end else begin
									if ((pattern == 1'd1)) begin
										bilinear_next_state <= 5'd17;
									end else begin
										if ((pattern == 2'd3)) begin
											bilinear_next_state <= 5'd19;
										end else begin
											bilinear_next_state <= 5'd18;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd16: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd17;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear39};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear40};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear41};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd17;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							bilinear_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear48;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear49;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear50;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd17: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd16;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear42};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear43};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear44};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd16;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							bilinear_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear51;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear52;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear53;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd18: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd19;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear45};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear46};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear47};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd19;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							bilinear_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear54;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear55;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear56;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd19: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache2};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache3};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache4};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd18;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear48};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear49};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear50};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs2_bilinear_f_next_value1 <= 1'd0;
								wrapper_adrs2_bilinear_f_next_value_ce1 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd18;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							bilinear_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear57;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear58;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear59;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd20: begin
			if (wrapper_active[1]) begin
				if (wrapper_bilinear_bilinear_rgb_ready) begin
					wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd1;
					wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
						wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear60;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear61;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear62;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
						bilinear_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							end
							if ((wrapper_adrs4 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									bilinear_next_state <= 5'd21;
								end else begin
									if ((pattern == 1'd1)) begin
										bilinear_next_state <= 5'd24;
									end else begin
										if ((pattern == 2'd3)) begin
											bilinear_next_state <= 5'd21;
										end else begin
											bilinear_next_state <= 5'd22;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd21: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd22;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear51};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear52};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear53};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd22;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							bilinear_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear63;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear64;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear65;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd22: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd21;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear54};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear55};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear56};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd21;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							bilinear_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear66;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear67;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear68;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd23: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd24;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear57};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear58};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear59};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd24;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							bilinear_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear69;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear70;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear71;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd24: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache3};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache4};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache5};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd23;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear60};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear61};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear62};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs3_bilinear_f_next_value2 <= 1'd0;
								wrapper_adrs3_bilinear_f_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd23;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							bilinear_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear72;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear73;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear74;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd25: begin
			if (wrapper_active[1]) begin
				if (wrapper_bilinear_bilinear_rgb_ready) begin
					wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd1;
					wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
						wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear75;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear76;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear77;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
						bilinear_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							end
							if ((wrapper_adrs5 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									bilinear_next_state <= 5'd28;
								end else begin
									if ((pattern == 1'd1)) begin
										bilinear_next_state <= 5'd27;
									end else begin
										if ((pattern == 2'd3)) begin
											bilinear_next_state <= 5'd29;
										end else begin
											bilinear_next_state <= 5'd28;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd26: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd27;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear63};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear64};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear65};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd27;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							bilinear_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear78;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear79;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear80;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd27: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd26;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear66};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear67};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear68};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd26;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							bilinear_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear81;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear82;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear83;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd28: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= ((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) >>> 1'd1);
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd29;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear69};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear70};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear71};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd29;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							bilinear_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear84;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear85;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear86;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		5'd29: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[1]) begin
					if (wrapper_bilinear_bilinear_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((((wrapper_bilinear_colors0[7:0] + wrapper_bilinear_colors0[23:16]) + wrapper_bilinear_colors2[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[15:8]) + wrapper_bilinear_colors2[15:8]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end else begin
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0 <= ((wrapper_bilinear_colors0[15:8] + wrapper_bilinear_colors2[15:8]) >>> 1'd1);
							wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1 <= ((((wrapper_bilinear_colors1[7:0] + wrapper_bilinear_colors1[23:16]) + wrapper_bilinear_colors0[7:0]) + wrapper_bilinear_colors2[23:16]) >>> 2'd2);
							wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_bilinear_self_bilinear_lowernext_t_next_value2 <= wrapper_bilinear_colors1[15:8];
							wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2 <= 1'd1;
						end
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						if ((~wrapper_bilinear_g_val)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache4};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache5};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache0};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								if (wrapper_bilinear_bilinear_first_pixel) begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd1;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd0;
									wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
									wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
								end
								bilinear_next_state <= 5'd28;
							end else begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_bilinear72};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_bilinear73};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_bilinear74};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs4_bilinear_f_next_value3 <= 1'd0;
								wrapper_adrs4_bilinear_f_next_value_ce3 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= 1'd0;
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= 1'd0;
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd1;
								wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
								bilinear_next_state <= 5'd28;
							end
						end else begin
							wrapper_processed_lines_bilinear_f_next_value0 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_bilinear_f_next_value_ce0 <= 1'd1;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
							wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd1;
							wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
							wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
							wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
							wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
							wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
							wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							bilinear_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
				wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
				wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
				wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
				wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear87;
				wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear88;
				wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear89;
				wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
				bilinear_next_state <= 1'd0;
			end
		end
		default: begin
			if (wrapper_active[1]) begin
				if (wrapper_bilinear_bilinear_rgb_ready) begin
					wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd1;
					wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2 <= 1'd0;
					wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_bilinear_bilinear_working_bilinear_next_value0 <= 1'd0;
						wrapper_bilinear_bilinear_working_bilinear_next_value_ce0 <= 1'd1;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value0 <= 1'd0;
						wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1 <= 1'd1;
						wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2 <= 1'd1;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1 <= 1'd0;
						wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= wrapper_bilinear_bilinear0;
						wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= wrapper_bilinear_bilinear1;
						wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= wrapper_bilinear_bilinear2;
						wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
						bilinear_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 1'd1) | (wrapper_processed_lines == (rows - 1'd1)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0 <= {wrapper_bilinear_colors0, wrapper_demosaiccache5};
								wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1 <= {wrapper_bilinear_colors1, wrapper_demosaiccache0};
								wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2 <= {wrapper_bilinear_colors2, wrapper_demosaiccache1};
								wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_adrs5_bilinear_next_value3 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_bilinear_next_value_ce3 <= 1'd1;
								wrapper_adrs0_bilinear_next_value4 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_bilinear_next_value_ce4 <= 1'd1;
								wrapper_adrs1_bilinear_next_value5 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_bilinear_next_value_ce5 <= 1'd1;
							end
							if ((wrapper_adrs0 == 1'd1)) begin
								if ((pattern == 1'd0)) begin
									bilinear_next_state <= 1'd1;
								end else begin
									if ((pattern == 1'd1)) begin
										bilinear_next_state <= 3'd4;
									end else begin
										if ((pattern == 2'd3)) begin
											bilinear_next_state <= 1'd1;
										end else begin
											bilinear_next_state <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
		end
	endcase
// synthesis translate_off
	dummy_d_12 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_13;
// synthesis translate_on
always @(*) begin
	wrapper_output_valid <= 1'd0;
	wrapper_output_first <= 1'd0;
	wrapper_output_last <= 1'd0;
	wrapper_output_payload_data <= 32'd0;
	wrapper_nearestneighbour_nearestneighbour_rgb_ready <= 1'd0;
	wrapper_bilinear_bilinear_rgb_ready <= 1'd0;
	wrapper_edge_directed_edge_directed_rgb_ready <= 1'd0;
	if (wrapper_active[0]) begin
		wrapper_nearestneighbour_nearestneighbour_rgb_ready <= wrapper_output_ready;
		wrapper_output_valid <= wrapper_nearestneighbour_nearestneighbour_rgb_valid;
		wrapper_output_last <= wrapper_nearestneighbour_nearestneighbour_rgb_last;
		wrapper_output_first <= wrapper_nearestneighbour_nearestneighbour_rgb_first;
		wrapper_output_payload_data <= wrapper_nearestneighbour_nearestneighbour_rgb_data;
	end
	if (wrapper_active[1]) begin
		wrapper_bilinear_bilinear_rgb_ready <= wrapper_output_ready;
		wrapper_output_valid <= wrapper_bilinear_bilinear_rgb_valid;
		wrapper_output_last <= wrapper_bilinear_bilinear_rgb_last;
		wrapper_output_first <= wrapper_bilinear_bilinear_rgb_first;
		wrapper_output_payload_data <= wrapper_bilinear_bilinear_rgb_data;
	end
	if (wrapper_active[2]) begin
		wrapper_edge_directed_edge_directed_rgb_ready <= wrapper_output_ready;
		wrapper_output_valid <= wrapper_edge_directed_edge_directed_rgb_valid;
		wrapper_output_last <= wrapper_edge_directed_edge_directed_rgb_last;
		wrapper_output_first <= wrapper_edge_directed_edge_directed_rgb_first;
		wrapper_output_payload_data <= wrapper_edge_directed_edge_directed_rgb_data;
	end
// synthesis translate_off
	dummy_d_13 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_14;
// synthesis translate_on
always @(*) begin
	wrapper_edge_directed_edge_directed_rgb_data <= 32'd0;
	if (wrapper_active[2]) begin
		wrapper_edge_directed_edge_directed_rgb_data <= {wrapper_edge_directed_h_abs[7:0], wrapper_edge_directed_colors5[7:0], wrapper_edge_directed_self[7:0]};
	end
// synthesis translate_off
	dummy_d_14 <= dummy_s;
// synthesis translate_on
end
assign wrapper_edge_directed_h_grad = (((wrapper_edge_directed_colors2[7:0] + wrapper_edge_directed_colors2[39:32]) >>> 1'd1) - wrapper_edge_directed_colors2[23:16]);
assign wrapper_edge_directed_v_grad = (((wrapper_edge_directed_colors0[23:16] + wrapper_edge_directed_colors4[23:16]) >>> 1'd1) - wrapper_edge_directed_colors2[23:16]);

// synthesis translate_off
reg dummy_d_15;
// synthesis translate_on
always @(*) begin
	wrapper_edge_directed_colors_to_decode <= 16'd0;
	if ((~wrapper_edge_directed_h_grad[15])) begin
		wrapper_edge_directed_colors_to_decode <= wrapper_edge_directed_h_grad;
	end else begin
		wrapper_edge_directed_colors_to_decode <= (-$signed({1'd0, wrapper_edge_directed_h_grad}));
	end
// synthesis translate_off
	dummy_d_15 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_16;
// synthesis translate_on
always @(*) begin
	wrapper_edge_directed_kernel_width <= 16'd0;
	if ((~wrapper_edge_directed_v_grad[15])) begin
		wrapper_edge_directed_kernel_width <= wrapper_edge_directed_v_grad;
	end else begin
		wrapper_edge_directed_kernel_width <= (-$signed({1'd0, wrapper_edge_directed_v_grad}));
	end
// synthesis translate_off
	dummy_d_16 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_17;
// synthesis translate_on
always @(*) begin
	edge_directed_next_state <= 5'd0;
	wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
	wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd0;
	wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
	wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd0;
	wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd0;
	wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd0;
	wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd0;
	wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd0;
	wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
	wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd0;
	wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
	wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd0;
	wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= 40'd0;
	wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd0;
	wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= 40'd0;
	wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd0;
	wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= 40'd0;
	wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd0;
	wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= 40'd0;
	wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd0;
	wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= 40'd0;
	wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd0;
	wrapper_adrs4_edge_directed_next_value3 <= 14'd0;
	wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd0;
	wrapper_adrs5_edge_directed_next_value4 <= 14'd0;
	wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd0;
	wrapper_adrs0_edge_directed_next_value5 <= 14'd0;
	wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd0;
	wrapper_adrs1_edge_directed_next_value6 <= 14'd0;
	wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd0;
	wrapper_adrs2_edge_directed_next_value7 <= 14'd0;
	wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd0;
	wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= 16'd0;
	wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd0;
	wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= 16'd0;
	wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd0;
	wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= 16'd0;
	wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd0;
	wrapper_adrs3_edge_directed_f_next_value0 <= 14'd0;
	wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd0;
	wrapper_processed_lines_edge_directed_f_next_value1 <= 14'd0;
	wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd0;
	edge_directed_next_state <= edge_directed_state;
	case (edge_directed_state)
		1'd1: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 2'd2;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed5};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed6};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed7};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed8};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed9};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 2'd2;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed5;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed6;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed7;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed8;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed9;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		2'd2: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 1'd1;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed10};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed11};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed12};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed13};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed14};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 1'd1;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed10;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed11;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed12;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed13;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed14;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		2'd3: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 3'd4;
							end else begin
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed15};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed16};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed17};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed18};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed19};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								end
								edge_directed_next_state <= 3'd4;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							edge_directed_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed15;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed16;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed17;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed18;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed19;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		3'd4: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs0)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 2'd3;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed20};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed21};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed22};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed23};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed24};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 2'd3;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							edge_directed_next_state <= 3'd5;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed20;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed21;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed22;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed23;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed24;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		3'd5: begin
			if (wrapper_active[2]) begin
				if (wrapper_edge_directed_edge_directed_rgb_ready) begin
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd1;
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed25;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed26;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed27;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed28;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed29;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
						edge_directed_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 2'd2) | (wrapper_processed_lines >= (rows - 2'd2)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							end
							if ((wrapper_adrs1 == 2'd2)) begin
								if ((pattern == 1'd0)) begin
									edge_directed_next_state <= 4'd8;
								end else begin
									if ((pattern == 1'd1)) begin
										edge_directed_next_state <= 3'd7;
									end else begin
										if ((pattern == 2'd3)) begin
											edge_directed_next_state <= 4'd9;
										end else begin
											edge_directed_next_state <= 4'd8;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		3'd6: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 3'd7;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed25};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed26};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed27};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed28};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed29};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 3'd7;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed30;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed31;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed32;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed33;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed34;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		3'd7: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 3'd6;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed30};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed31};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed32};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed33};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed34};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 3'd6;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed35;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed36;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed37;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed38;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed39;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		4'd8: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 4'd9;
							end else begin
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed35};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed36};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed37};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed38};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed39};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								end
								edge_directed_next_state <= 4'd9;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							edge_directed_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed40;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed41;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed42;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed43;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed44;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		4'd9: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs1)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache5};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache0};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache1};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache2};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache3};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 4'd8;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed40};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed41};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed42};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed43};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed44};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 4'd8;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							edge_directed_next_state <= 4'd10;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed45;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed46;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed47;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed48;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed49;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		4'd10: begin
			if (wrapper_active[2]) begin
				if (wrapper_edge_directed_edge_directed_rgb_ready) begin
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd1;
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed50;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed51;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed52;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed53;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed54;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
						edge_directed_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 2'd2) | (wrapper_processed_lines >= (rows - 2'd2)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							end
							if ((wrapper_adrs2 == 2'd2)) begin
								if ((pattern == 1'd0)) begin
									edge_directed_next_state <= 4'd11;
								end else begin
									if ((pattern == 1'd1)) begin
										edge_directed_next_state <= 4'd14;
									end else begin
										if ((pattern == 2'd3)) begin
											edge_directed_next_state <= 4'd11;
										end else begin
											edge_directed_next_state <= 4'd12;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		4'd11: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 4'd12;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed45};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed46};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed47};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed48};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed49};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 4'd12;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed55;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed56;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed57;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed58;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed59;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		4'd12: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 4'd11;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed50};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed51};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed52};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed53};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed54};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 4'd11;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed60;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed61;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed62;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed63;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed64;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		4'd13: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 4'd14;
							end else begin
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed55};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed56};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed57};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed58};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed59};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								end
								edge_directed_next_state <= 4'd14;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							edge_directed_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed65;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed66;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed67;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed68;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed69;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		4'd14: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs2)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache0};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache1};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache2};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache3};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache4};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 4'd13;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed60};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed61};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed62};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed63};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed64};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 4'd13;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							edge_directed_next_state <= 4'd15;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed70;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed71;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed72;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed73;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed74;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		4'd15: begin
			if (wrapper_active[2]) begin
				if (wrapper_edge_directed_edge_directed_rgb_ready) begin
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd1;
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed75;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed76;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed77;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed78;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed79;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
						edge_directed_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 2'd2) | (wrapper_processed_lines >= (rows - 2'd2)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							end
							if ((wrapper_adrs3 == 2'd2)) begin
								if ((pattern == 1'd0)) begin
									edge_directed_next_state <= 5'd18;
								end else begin
									if ((pattern == 1'd1)) begin
										edge_directed_next_state <= 5'd17;
									end else begin
										if ((pattern == 2'd3)) begin
											edge_directed_next_state <= 5'd19;
										end else begin
											edge_directed_next_state <= 5'd18;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd16: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd17;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed65};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed66};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed67};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed68};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed69};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd17;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed80;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed81;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed82;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed83;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed84;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd17: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd16;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed70};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed71};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed72};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed73};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed74};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd16;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed85;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed86;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed87;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed88;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed89;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd18: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd19;
							end else begin
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed75};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed76};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed77};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed78};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed79};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								end
								edge_directed_next_state <= 5'd19;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							edge_directed_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed90;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed91;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed92;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed93;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed94;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd19: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs3)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache1};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache2};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache3};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache4};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache5};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd18;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed80};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed81};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed82};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed83};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed84};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd18;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							edge_directed_next_state <= 5'd20;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed95;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed96;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed97;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed98;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed99;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd20: begin
			if (wrapper_active[2]) begin
				if (wrapper_edge_directed_edge_directed_rgb_ready) begin
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd1;
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed100;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed101;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed102;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed103;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed104;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
						edge_directed_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 2'd2) | (wrapper_processed_lines >= (rows - 2'd2)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							end
							if ((wrapper_adrs4 == 2'd2)) begin
								if ((pattern == 1'd0)) begin
									edge_directed_next_state <= 5'd21;
								end else begin
									if ((pattern == 1'd1)) begin
										edge_directed_next_state <= 5'd24;
									end else begin
										if ((pattern == 2'd3)) begin
											edge_directed_next_state <= 5'd21;
										end else begin
											edge_directed_next_state <= 5'd22;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd21: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd22;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed85};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed86};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed87};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed88};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed89};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd22;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed105;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed106;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed107;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed108;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed109;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd22: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd21;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed90};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed91};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed92};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed93};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed94};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd21;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed110;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed111;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed112;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed113;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed114;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd23: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd24;
							end else begin
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed95};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed96};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed97};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed98};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed99};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								end
								edge_directed_next_state <= 5'd24;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							edge_directed_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed115;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed116;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed117;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed118;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed119;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd24: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs4)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache2};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache3};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache4};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache5};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache0};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd23;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed100};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed101};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed102};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed103};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed104};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs2_edge_directed_next_value7 <= 1'd0;
									wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd23;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
							wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							edge_directed_next_state <= 5'd25;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed120;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed121;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed122;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed123;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed124;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd25: begin
			if (wrapper_active[2]) begin
				if (wrapper_edge_directed_edge_directed_rgb_ready) begin
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd1;
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed125;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed126;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed127;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed128;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed129;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
						edge_directed_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 2'd2) | (wrapper_processed_lines >= (rows - 2'd2)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							end
							if ((wrapper_adrs5 == 2'd2)) begin
								if ((pattern == 1'd0)) begin
									edge_directed_next_state <= 5'd28;
								end else begin
									if ((pattern == 1'd1)) begin
										edge_directed_next_state <= 5'd27;
									end else begin
										if ((pattern == 2'd3)) begin
											edge_directed_next_state <= 5'd29;
										end else begin
											edge_directed_next_state <= 5'd28;
										end
									end
								end
							end
						end
					end
				end
			end
		end
		5'd26: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd27;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed105};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed106};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed107};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed108};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed109};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd27;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed130;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed131;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed132;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed133;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed134;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd27: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd26;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed110};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed111};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed112};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed113};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed114};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd26;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							edge_directed_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed135;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed136;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed137;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed138;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed139;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd28: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end else begin
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[15:8]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd29;
							end else begin
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed115};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed116};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed117};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed118};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed119};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								end
								edge_directed_next_state <= 5'd29;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							edge_directed_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed140;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed141;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed142;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed143;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed144;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		5'd29: begin
			if (((~wrapper_force_reset) & (~wrapper_frame_sync_incorrect))) begin
				if (wrapper_active[2]) begin
					if (wrapper_edge_directed_edge_directed_rgb_ready) begin
						if (((pattern == 1'd0) | (pattern == 1'd1))) begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors2[31:24]) + wrapper_edge_directed_colors2[15:8]) + wrapper_edge_directed_colors3[23:16]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end else begin
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1 <= wrapper_edge_directed_colors2[23:16];
							wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0 <= ((wrapper_edge_directed_colors1[23:16] + wrapper_edge_directed_colors3[23:16]) >>> 1'd1);
							wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0 <= 1'd1;
							if ((wrapper_edge_directed_colors_to_decode < wrapper_edge_directed_kernel_width)) begin
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors2[15:8] + wrapper_edge_directed_colors2[31:24]) >>> 1'd1);
								wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
							end else begin
								if ((wrapper_edge_directed_colors_to_decode > wrapper_edge_directed_kernel_width)) begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((wrapper_edge_directed_colors1[31:24] + wrapper_edge_directed_colors3[31:24]) >>> 1'd1);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end else begin
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2 <= ((((wrapper_edge_directed_colors1[15:8] + wrapper_edge_directed_colors1[31:24]) + wrapper_edge_directed_colors3[15:8]) + wrapper_edge_directed_colors3[31:24]) >>> 2'd2);
									wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2 <= 1'd1;
								end
							end
						end
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						if ((wrapper_edge_directed_b_val > 1'd0)) begin
							if ((cols > wrapper_adrs5)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache3};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache4};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache5};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache0};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache1};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs3_edge_directed_f_next_value0 <= (wrapper_adrs3 + 1'd1);
								wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								if (wrapper_edge_directed_edge_directed_first_pixel) begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd1;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd0;
									wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
								end else begin
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
									wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
								end
								edge_directed_next_state <= 5'd28;
							end else begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_edge_directed120};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_edge_directed121};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_edge_directed122};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_edge_directed123};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_edge_directed124};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								if ((wrapper_edge_directed_b_val == 1'd1)) begin
									wrapper_adrs3_edge_directed_f_next_value0 <= 1'd0;
									wrapper_adrs3_edge_directed_f_next_value_ce0 <= 1'd1;
									wrapper_adrs4_edge_directed_next_value3 <= 1'd0;
									wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
									wrapper_adrs5_edge_directed_next_value4 <= 1'd0;
									wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
									wrapper_adrs0_edge_directed_next_value5 <= 1'd0;
									wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
									wrapper_adrs1_edge_directed_next_value6 <= 1'd0;
									wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								end
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= (wrapper_edge_directed_b_val - 1'd1);
								wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
								edge_directed_next_state <= 5'd28;
							end
						end else begin
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd1;
							wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
							wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
							wrapper_processed_lines_edge_directed_f_next_value1 <= (wrapper_processed_lines + 1'd1);
							wrapper_processed_lines_edge_directed_f_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
							wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
							wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
							wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
							wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
							wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
							wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
							wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
							wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
							wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
							wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
							wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
							wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
							wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
							wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
							wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							edge_directed_next_state <= 1'd0;
						end
					end
				end
			end else begin
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
				wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
				wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
				wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
				wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed145;
				wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed146;
				wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed147;
				wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed148;
				wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed149;
				wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
				edge_directed_next_state <= 1'd0;
			end
		end
		default: begin
			if (wrapper_active[2]) begin
				if (wrapper_edge_directed_edge_directed_rgb_ready) begin
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd1;
					wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2 <= 1'd0;
					wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2 <= 1'd1;
					if ((rows == wrapper_processed_lines)) begin
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value0 <= 1'd0;
						wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0 <= 2'd2;
						wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1 <= 1'd1;
						wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2 <= 1'd0;
						wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= wrapper_edge_directed_edge_directed0;
						wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= wrapper_edge_directed_edge_directed1;
						wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= wrapper_edge_directed_edge_directed2;
						wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= wrapper_edge_directed_edge_directed3;
						wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= wrapper_edge_directed_edge_directed4;
						wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
						edge_directed_next_state <= 1'd0;
					end else begin
						if ((((wrapper_collected_lines - wrapper_processed_lines) > 2'd2) | (wrapper_processed_lines >= (rows - 2'd2)))) begin
							if ((~wrapper_frame_sync_incorrect)) begin
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0 <= {wrapper_edge_directed_colors0, wrapper_demosaiccache4};
								wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0 <= 1'd1;
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1 <= {wrapper_edge_directed_colors1, wrapper_demosaiccache5};
								wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1 <= 1'd1;
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2 <= {wrapper_edge_directed_colors2, wrapper_demosaiccache0};
								wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2 <= 1'd1;
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3 <= {wrapper_edge_directed_colors3, wrapper_demosaiccache1};
								wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3 <= 1'd1;
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4 <= {wrapper_edge_directed_colors4, wrapper_demosaiccache2};
								wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4 <= 1'd1;
								wrapper_adrs4_edge_directed_next_value3 <= (wrapper_adrs4 + 1'd1);
								wrapper_adrs4_edge_directed_next_value_ce3 <= 1'd1;
								wrapper_adrs5_edge_directed_next_value4 <= (wrapper_adrs5 + 1'd1);
								wrapper_adrs5_edge_directed_next_value_ce4 <= 1'd1;
								wrapper_adrs0_edge_directed_next_value5 <= (wrapper_adrs0 + 1'd1);
								wrapper_adrs0_edge_directed_next_value_ce5 <= 1'd1;
								wrapper_adrs1_edge_directed_next_value6 <= (wrapper_adrs1 + 1'd1);
								wrapper_adrs1_edge_directed_next_value_ce6 <= 1'd1;
								wrapper_adrs2_edge_directed_next_value7 <= (wrapper_adrs2 + 1'd1);
								wrapper_adrs2_edge_directed_next_value_ce7 <= 1'd1;
							end
							if ((wrapper_adrs0 == 2'd2)) begin
								if ((pattern == 1'd0)) begin
									edge_directed_next_state <= 1'd1;
								end else begin
									if ((pattern == 1'd1)) begin
										edge_directed_next_state <= 3'd4;
									end else begin
										if ((pattern == 2'd3)) begin
											edge_directed_next_state <= 1'd1;
										end else begin
											edge_directed_next_state <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
		end
	endcase
// synthesis translate_off
	dummy_d_17 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	if (((wrapper_source_source_valid & wrapper_source_source_ready) & wrapper_working)) begin
		wrapper_last_cnt <= (wrapper_last_cnt + 1'd1);
	end
	if (((wrapper_last_cnt == (cols - 1'd1)) & raw_last)) begin
		wrapper_last_cnt <= 1'd0;
	end
	if (wrapper_source_source_first) begin
		if ((~wrapper_cache_reset)) begin
			wrapper_last_cnt <= 1'd1;
		end else begin
			wrapper_last_cnt <= 1'd0;
		end
	end
	if ((wrapper_converter_source_valid & wrapper_converter_source_ready)) begin
		if (wrapper_converter_last) begin
			wrapper_converter_mux <= 1'd0;
		end else begin
			wrapper_converter_mux <= (wrapper_converter_mux + 1'd1);
		end
	end
	if (wrapper_clear) begin
		wrapper_pending <= 1'd0;
	end
	if (wrapper_trigger) begin
		wrapper_pending <= 1'd1;
	end
	if ((wrapper_irq | wrapper_wait_for_reset)) begin
		wrapper_wait_for_reset <= 1'd1;
	end
	if ((wrapper_wait_for_reset & (~wrapper_irq))) begin
		wrapper_wait_for_reset <= 1'd0;
		wrapper_f_reset <= 1'd1;
	end
	if (((wrapper_wait_for_reset & (~wrapper_irq)) | wrapper_raw_first)) begin
		wrapper_adrs0 <= 1'd0;
		wrapper_adrs1 <= 1'd0;
		wrapper_adrs2 <= 1'd0;
		wrapper_adrs3 <= 1'd0;
		wrapper_adrs4 <= 1'd0;
		wrapper_adrs5 <= 1'd0;
		wrapper_processed_lines <= 1'd0;
		wrapper_current_chunk <= 1'd0;
		wrapper_collected_lines <= 1'd0;
		wrapper_wait_for_reset <= 1'd0;
	end
	if ((wrapper_raw_valid & wrapper_raw_ready)) begin
		if (((~wrapper_raw_last) & (~wrapper_irq))) begin
			wrapper_columns_caputred <= (wrapper_columns_caputred + 1'd1);
		end else begin
			wrapper_columns_caputred <= 1'd0;
		end
	end else begin
		if (((cols < wrapper_columns_caputred) | wrapper_frame_sync_incorrect)) begin
			wrapper_columns_caputred <= 1'd0;
		end
	end
	if (wrapper_memory_reset) begin
		wrapper_hold_reset <= 1'd1;
		if ((~wrapper_frame_sync_incorrect)) begin
			if ((wrapper_adrs1 < (cols - 1'd1))) begin
				wrapper_adrs1 <= (wrapper_adrs1 + 1'd1);
			end else begin
				if ((wrapper_adrs1 == (cols - 1'd1))) begin
					wrapper_f_reset <= 1'd0;
					wrapper_hold_reset <= 1'd0;
					wrapper_adrs1 <= 1'd0;
				end
			end
		end
	end
	if (wrapper_memory_reset) begin
		wrapper_hold_reset <= 1'd1;
		if ((~wrapper_frame_sync_incorrect)) begin
			if ((wrapper_adrs2 < (cols - 1'd1))) begin
				wrapper_adrs2 <= (wrapper_adrs2 + 1'd1);
			end else begin
				if ((wrapper_adrs2 == (cols - 1'd1))) begin
					wrapper_f_reset <= 1'd0;
					wrapper_hold_reset <= 1'd0;
					wrapper_adrs2 <= 1'd0;
				end
			end
		end
	end
	if (wrapper_memory_reset) begin
		wrapper_hold_reset <= 1'd1;
		if ((~wrapper_frame_sync_incorrect)) begin
			if ((wrapper_adrs3 < (cols - 1'd1))) begin
				wrapper_adrs3 <= (wrapper_adrs3 + 1'd1);
			end else begin
				if ((wrapper_adrs3 == (cols - 1'd1))) begin
					wrapper_f_reset <= 1'd0;
					wrapper_hold_reset <= 1'd0;
					wrapper_adrs3 <= 1'd0;
				end
			end
		end
	end
	if (wrapper_memory_reset) begin
		wrapper_hold_reset <= 1'd1;
		if ((~wrapper_frame_sync_incorrect)) begin
			if ((wrapper_adrs4 < (cols - 1'd1))) begin
				wrapper_adrs4 <= (wrapper_adrs4 + 1'd1);
			end else begin
				if ((wrapper_adrs4 == (cols - 1'd1))) begin
					wrapper_f_reset <= 1'd0;
					wrapper_hold_reset <= 1'd0;
					wrapper_adrs4 <= 1'd0;
				end
			end
		end
	end
	if (wrapper_memory_reset) begin
		wrapper_hold_reset <= 1'd1;
		if ((~wrapper_frame_sync_incorrect)) begin
			if ((wrapper_adrs5 < (cols - 1'd1))) begin
				wrapper_adrs5 <= (wrapper_adrs5 + 1'd1);
			end else begin
				if ((wrapper_adrs5 == (cols - 1'd1))) begin
					wrapper_f_reset <= 1'd0;
					wrapper_hold_reset <= 1'd0;
					wrapper_adrs5 <= 1'd0;
				end
			end
		end
	end
	case (wrapper_current_chunk)
		1'd0: begin
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if ((((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset)) & (~wrapper_frame_sync_incorrect))) begin
					if ((wrapper_adrs0 < (cols - 1'd1))) begin
						wrapper_adrs0 <= (wrapper_adrs0 + 1'd1);
					end else begin
						if ((wrapper_current_chunk < 3'd5)) begin
							wrapper_adrs0 <= 1'd0;
							wrapper_current_chunk <= (wrapper_current_chunk + 1'd1);
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
						end else begin
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
							wrapper_adrs0 <= 1'd0;
							wrapper_current_chunk <= 1'd0;
						end
					end
				end else begin
					if (wrapper_f_reset) begin
						wrapper_adrs0 <= 1'd0;
					end
				end
			end
		end
		1'd1: begin
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if ((((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset)) & (~wrapper_frame_sync_incorrect))) begin
					if ((wrapper_adrs1 < (cols - 1'd1))) begin
						wrapper_adrs1 <= (wrapper_adrs1 + 1'd1);
					end else begin
						if ((wrapper_current_chunk < 3'd5)) begin
							wrapper_adrs1 <= 1'd0;
							wrapper_current_chunk <= (wrapper_current_chunk + 1'd1);
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
						end else begin
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
							wrapper_adrs1 <= 1'd0;
							wrapper_current_chunk <= 1'd0;
						end
					end
				end else begin
					if (wrapper_f_reset) begin
						wrapper_adrs1 <= 1'd0;
					end
				end
			end
		end
		2'd2: begin
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if ((((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset)) & (~wrapper_frame_sync_incorrect))) begin
					if ((wrapper_adrs2 < (cols - 1'd1))) begin
						wrapper_adrs2 <= (wrapper_adrs2 + 1'd1);
					end else begin
						if ((wrapper_current_chunk < 3'd5)) begin
							wrapper_adrs2 <= 1'd0;
							wrapper_current_chunk <= (wrapper_current_chunk + 1'd1);
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
						end else begin
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
							wrapper_adrs2 <= 1'd0;
							wrapper_current_chunk <= 1'd0;
						end
					end
				end else begin
					if (wrapper_f_reset) begin
						wrapper_adrs2 <= 1'd0;
					end
				end
			end
		end
		2'd3: begin
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if ((((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset)) & (~wrapper_frame_sync_incorrect))) begin
					if ((wrapper_adrs3 < (cols - 1'd1))) begin
						wrapper_adrs3 <= (wrapper_adrs3 + 1'd1);
					end else begin
						if ((wrapper_current_chunk < 3'd5)) begin
							wrapper_adrs3 <= 1'd0;
							wrapper_current_chunk <= (wrapper_current_chunk + 1'd1);
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
						end else begin
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
							wrapper_adrs3 <= 1'd0;
							wrapper_current_chunk <= 1'd0;
						end
					end
				end else begin
					if (wrapper_f_reset) begin
						wrapper_adrs3 <= 1'd0;
					end
				end
			end
		end
		3'd4: begin
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if ((((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset)) & (~wrapper_frame_sync_incorrect))) begin
					if ((wrapper_adrs4 < (cols - 1'd1))) begin
						wrapper_adrs4 <= (wrapper_adrs4 + 1'd1);
					end else begin
						if ((wrapper_current_chunk < 3'd5)) begin
							wrapper_adrs4 <= 1'd0;
							wrapper_current_chunk <= (wrapper_current_chunk + 1'd1);
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
						end else begin
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
							wrapper_adrs4 <= 1'd0;
							wrapper_current_chunk <= 1'd0;
						end
					end
				end else begin
					if (wrapper_f_reset) begin
						wrapper_adrs4 <= 1'd0;
					end
				end
			end
		end
		3'd5: begin
			if (((wrapper_collected_lines - wrapper_processed_lines) < (3'd6 - wrapper_treshold))) begin
				if ((((wrapper_raw_valid | wrapper_push_zeros) & (~wrapper_f_reset)) & (~wrapper_frame_sync_incorrect))) begin
					if ((wrapper_adrs5 < (cols - 1'd1))) begin
						wrapper_adrs5 <= (wrapper_adrs5 + 1'd1);
					end else begin
						if ((wrapper_current_chunk < 3'd5)) begin
							wrapper_adrs5 <= 1'd0;
							wrapper_current_chunk <= (wrapper_current_chunk + 1'd1);
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
						end else begin
							wrapper_collected_lines <= (wrapper_collected_lines + 1'd1);
							wrapper_adrs5 <= 1'd0;
							wrapper_current_chunk <= 1'd0;
						end
					end
				end else begin
					if (wrapper_f_reset) begin
						wrapper_adrs5 <= 1'd0;
					end
				end
			end
		end
	endcase
	if (((wrapper_force_reset & (~wrapper_hold_reset)) & (~wrapper_raw_first))) begin
		wrapper_nearestneighbour_nearestneighbour_working <= 1'd0;
		wrapper_nearestneighbour_nearestneighbour_first_pixel <= 1'd1;
		wrapper_nearestneighbour_nearestneighbour_rgb_first <= 1'd0;
		wrapper_nearestneighbour_nearestneighbour_rgb_valid <= 1'd0;
		wrapper_nearestneighbour_g_val <= 1'd0;
		wrapper_nearestneighbour_colors0 <= wrapper_nearestneighbour0;
		wrapper_nearestneighbour_colors1 <= wrapper_nearestneighbour1;
	end
	nearestneighbour_state <= nearestneighbour_next_state;
	if (wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value_ce0) begin
		wrapper_nearestneighbour_nearestneighbour_working <= wrapper_nearestneighbour_nearestneighbour_working_nearestneighbour_next_value0;
	end
	if (wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value_ce1) begin
		wrapper_nearestneighbour_nearestneighbour_rgb_valid <= wrapper_nearestneighbour_nearestneighbour_rgb_valid_nearestneighbour_next_value1;
	end
	if (wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value_ce2) begin
		wrapper_nearestneighbour_nearestneighbour_rgb_last <= wrapper_nearestneighbour_nearestneighbour_rgb_last_nearestneighbour_next_value2;
	end
	if (wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value_ce0) begin
		wrapper_nearestneighbour_nearestneighbour_first_pixel <= wrapper_nearestneighbour_nearestneighbour_first_pixel_nearestneighbour_lowernext_next_value0;
	end
	if (wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value_ce1) begin
		wrapper_nearestneighbour_nearestneighbour_rgb_first <= wrapper_nearestneighbour_nearestneighbour_rgb_first_nearestneighbour_lowernext_next_value1;
	end
	if (wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value_ce2) begin
		wrapper_nearestneighbour_g_val <= wrapper_nearestneighbour_g_val_nearestneighbour_lowernext_next_value2;
	end
	if (wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value_ce0) begin
		wrapper_nearestneighbour_colors0 <= wrapper_nearestneighbour_colors0_nearestneighbour_lowernext_lowernext_next_value0;
	end
	if (wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value_ce1) begin
		wrapper_nearestneighbour_colors1 <= wrapper_nearestneighbour_colors1_nearestneighbour_lowernext_lowernext_next_value1;
	end
	if (wrapper_adrs0_nearestneighbour_next_value_ce3) begin
		wrapper_adrs0 <= wrapper_adrs0_nearestneighbour_next_value3;
	end
	if (wrapper_adrs1_nearestneighbour_next_value_ce4) begin
		wrapper_adrs1 <= wrapper_adrs1_nearestneighbour_next_value4;
	end
	if (wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value_ce0) begin
		wrapper_nearestneighbour_kernel_width <= wrapper_nearestneighbour_kernel_width_nearestneighbour_lowernext_t_next_value0;
	end
	if (wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value_ce1) begin
		wrapper_nearestneighbour_b_val <= wrapper_nearestneighbour_b_val_nearestneighbour_lowernext_t_next_value1;
	end
	if (wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value_ce2) begin
		wrapper_nearestneighbour_self <= wrapper_nearestneighbour_self_nearestneighbour_lowernext_t_next_value2;
	end
	if (wrapper_processed_lines_nearestneighbour_f_next_value_ce0) begin
		wrapper_processed_lines <= wrapper_processed_lines_nearestneighbour_f_next_value0;
	end
	if (wrapper_adrs2_nearestneighbour_f_next_value_ce1) begin
		wrapper_adrs2 <= wrapper_adrs2_nearestneighbour_f_next_value1;
	end
	if (wrapper_adrs3_nearestneighbour_f_next_value_ce2) begin
		wrapper_adrs3 <= wrapper_adrs3_nearestneighbour_f_next_value2;
	end
	if (wrapper_adrs4_nearestneighbour_f_next_value_ce3) begin
		wrapper_adrs4 <= wrapper_adrs4_nearestneighbour_f_next_value3;
	end
	if (wrapper_adrs5_nearestneighbour_f_next_value_ce4) begin
		wrapper_adrs5 <= wrapper_adrs5_nearestneighbour_f_next_value4;
	end
	if (((wrapper_force_reset & (~wrapper_hold_reset)) & (~wrapper_raw_first))) begin
		wrapper_bilinear_bilinear_working <= 1'd0;
		wrapper_bilinear_bilinear_first_pixel <= 1'd1;
		wrapper_bilinear_bilinear_rgb_first <= 1'd0;
		wrapper_bilinear_bilinear_rgb_valid <= 1'd0;
		wrapper_bilinear_g_val <= 1'd0;
		wrapper_bilinear_colors0 <= wrapper_bilinear0;
		wrapper_bilinear_colors1 <= wrapper_bilinear1;
		wrapper_bilinear_colors2 <= wrapper_bilinear2;
	end
	bilinear_state <= bilinear_next_state;
	if (wrapper_bilinear_bilinear_working_bilinear_next_value_ce0) begin
		wrapper_bilinear_bilinear_working <= wrapper_bilinear_bilinear_working_bilinear_next_value0;
	end
	if (wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value_ce1) begin
		wrapper_bilinear_bilinear_rgb_valid <= wrapper_bilinear_bilinear_rgb_valid_bilinear_next_value1;
	end
	if (wrapper_bilinear_bilinear_rgb_last_bilinear_next_value_ce2) begin
		wrapper_bilinear_bilinear_rgb_last <= wrapper_bilinear_bilinear_rgb_last_bilinear_next_value2;
	end
	if (wrapper_bilinear_g_val_bilinear_lowernext_next_value_ce0) begin
		wrapper_bilinear_g_val <= wrapper_bilinear_g_val_bilinear_lowernext_next_value0;
	end
	if (wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value_ce1) begin
		wrapper_bilinear_bilinear_first_pixel <= wrapper_bilinear_bilinear_first_pixel_bilinear_lowernext_next_value1;
	end
	if (wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value_ce2) begin
		wrapper_bilinear_bilinear_rgb_first <= wrapper_bilinear_bilinear_rgb_first_bilinear_lowernext_next_value2;
	end
	if (wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value_ce0) begin
		wrapper_bilinear_colors0 <= wrapper_bilinear_colors0_bilinear_lowernext_lowernext_next_value0;
	end
	if (wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value_ce1) begin
		wrapper_bilinear_colors1 <= wrapper_bilinear_colors1_bilinear_lowernext_lowernext_next_value1;
	end
	if (wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value_ce2) begin
		wrapper_bilinear_colors2 <= wrapper_bilinear_colors2_bilinear_lowernext_lowernext_next_value2;
	end
	if (wrapper_adrs5_bilinear_next_value_ce3) begin
		wrapper_adrs5 <= wrapper_adrs5_bilinear_next_value3;
	end
	if (wrapper_adrs0_bilinear_next_value_ce4) begin
		wrapper_adrs0 <= wrapper_adrs0_bilinear_next_value4;
	end
	if (wrapper_adrs1_bilinear_next_value_ce5) begin
		wrapper_adrs1 <= wrapper_adrs1_bilinear_next_value5;
	end
	if (wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value_ce0) begin
		wrapper_bilinear_kernel_width <= wrapper_bilinear_kernel_width_bilinear_lowernext_t_next_value0;
	end
	if (wrapper_bilinear_b_val_bilinear_lowernext_t_next_value_ce1) begin
		wrapper_bilinear_b_val <= wrapper_bilinear_b_val_bilinear_lowernext_t_next_value1;
	end
	if (wrapper_bilinear_self_bilinear_lowernext_t_next_value_ce2) begin
		wrapper_bilinear_self <= wrapper_bilinear_self_bilinear_lowernext_t_next_value2;
	end
	if (wrapper_processed_lines_bilinear_f_next_value_ce0) begin
		wrapper_processed_lines <= wrapper_processed_lines_bilinear_f_next_value0;
	end
	if (wrapper_adrs2_bilinear_f_next_value_ce1) begin
		wrapper_adrs2 <= wrapper_adrs2_bilinear_f_next_value1;
	end
	if (wrapper_adrs3_bilinear_f_next_value_ce2) begin
		wrapper_adrs3 <= wrapper_adrs3_bilinear_f_next_value2;
	end
	if (wrapper_adrs4_bilinear_f_next_value_ce3) begin
		wrapper_adrs4 <= wrapper_adrs4_bilinear_f_next_value3;
	end
	if (((wrapper_force_reset & (~wrapper_hold_reset)) & (~wrapper_raw_first))) begin
		wrapper_edge_directed_edge_directed_working <= 1'd0;
		wrapper_edge_directed_b_val <= 2'd2;
		wrapper_edge_directed_edge_directed_rgb_valid <= 1'd0;
		wrapper_edge_directed_edge_directed_rgb_first <= 1'd0;
		wrapper_edge_directed_edge_directed_first_pixel <= 1'd1;
		wrapper_edge_directed_colors0 <= wrapper_edge_directed0;
		wrapper_edge_directed_colors1 <= wrapper_edge_directed1;
		wrapper_edge_directed_colors2 <= wrapper_edge_directed2;
		wrapper_edge_directed_colors3 <= wrapper_edge_directed3;
		wrapper_edge_directed_colors4 <= wrapper_edge_directed4;
	end
	edge_directed_state <= edge_directed_next_state;
	if (wrapper_edge_directed_edge_directed_working_edge_directed_next_value_ce0) begin
		wrapper_edge_directed_edge_directed_working <= wrapper_edge_directed_edge_directed_working_edge_directed_next_value0;
	end
	if (wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value_ce1) begin
		wrapper_edge_directed_edge_directed_rgb_valid <= wrapper_edge_directed_edge_directed_rgb_valid_edge_directed_next_value1;
	end
	if (wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value_ce2) begin
		wrapper_edge_directed_edge_directed_rgb_last <= wrapper_edge_directed_edge_directed_rgb_last_edge_directed_next_value2;
	end
	if (wrapper_edge_directed_b_val_edge_directed_lowernext_next_value_ce0) begin
		wrapper_edge_directed_b_val <= wrapper_edge_directed_b_val_edge_directed_lowernext_next_value0;
	end
	if (wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value_ce1) begin
		wrapper_edge_directed_edge_directed_first_pixel <= wrapper_edge_directed_edge_directed_first_pixel_edge_directed_lowernext_next_value1;
	end
	if (wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value_ce2) begin
		wrapper_edge_directed_edge_directed_rgb_first <= wrapper_edge_directed_edge_directed_rgb_first_edge_directed_lowernext_next_value2;
	end
	if (wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value_ce0) begin
		wrapper_edge_directed_colors0 <= wrapper_edge_directed_colors0_edge_directed_lowernext_lowernext_next_value0;
	end
	if (wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value_ce1) begin
		wrapper_edge_directed_colors1 <= wrapper_edge_directed_colors1_edge_directed_lowernext_lowernext_next_value1;
	end
	if (wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value_ce2) begin
		wrapper_edge_directed_colors2 <= wrapper_edge_directed_colors2_edge_directed_lowernext_lowernext_next_value2;
	end
	if (wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value_ce3) begin
		wrapper_edge_directed_colors3 <= wrapper_edge_directed_colors3_edge_directed_lowernext_lowernext_next_value3;
	end
	if (wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value_ce4) begin
		wrapper_edge_directed_colors4 <= wrapper_edge_directed_colors4_edge_directed_lowernext_lowernext_next_value4;
	end
	if (wrapper_adrs4_edge_directed_next_value_ce3) begin
		wrapper_adrs4 <= wrapper_adrs4_edge_directed_next_value3;
	end
	if (wrapper_adrs5_edge_directed_next_value_ce4) begin
		wrapper_adrs5 <= wrapper_adrs5_edge_directed_next_value4;
	end
	if (wrapper_adrs0_edge_directed_next_value_ce5) begin
		wrapper_adrs0 <= wrapper_adrs0_edge_directed_next_value5;
	end
	if (wrapper_adrs1_edge_directed_next_value_ce6) begin
		wrapper_adrs1 <= wrapper_adrs1_edge_directed_next_value6;
	end
	if (wrapper_adrs2_edge_directed_next_value_ce7) begin
		wrapper_adrs2 <= wrapper_adrs2_edge_directed_next_value7;
	end
	if (wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value_ce0) begin
		wrapper_edge_directed_h_abs <= wrapper_edge_directed_h_abs_edge_directed_lowernext_t_next_value0;
	end
	if (wrapper_edge_directed_self_edge_directed_lowernext_t_next_value_ce1) begin
		wrapper_edge_directed_self <= wrapper_edge_directed_self_edge_directed_lowernext_t_next_value1;
	end
	if (wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value_ce2) begin
		wrapper_edge_directed_colors5 <= wrapper_edge_directed_colors5_edge_directed_lowernext_t_next_value2;
	end
	if (wrapper_adrs3_edge_directed_f_next_value_ce0) begin
		wrapper_adrs3 <= wrapper_adrs3_edge_directed_f_next_value0;
	end
	if (wrapper_processed_lines_edge_directed_f_next_value_ce1) begin
		wrapper_processed_lines <= wrapper_processed_lines_edge_directed_f_next_value1;
	end
	if (sys_rst) begin
		wrapper_converter_mux <= 2'd0;
		wrapper_last_cnt <= 13'd0;
		wrapper_pending <= 1'd0;
		wrapper_adrs0 <= 14'd0;
		wrapper_adrs1 <= 14'd0;
		wrapper_adrs2 <= 14'd0;
		wrapper_adrs3 <= 14'd0;
		wrapper_adrs4 <= 14'd0;
		wrapper_adrs5 <= 14'd0;
		wrapper_current_chunk <= 3'd0;
		wrapper_collected_lines <= 14'd0;
		wrapper_processed_lines <= 14'd0;
		wrapper_hold_reset <= 1'd0;
		wrapper_columns_caputred <= 14'd0;
		wrapper_f_reset <= 1'd0;
		wrapper_wait_for_reset <= 1'd0;
		wrapper_nearestneighbour_nearestneighbour_rgb_valid <= 1'd0;
		wrapper_nearestneighbour_nearestneighbour_rgb_first <= 1'd0;
		wrapper_nearestneighbour_nearestneighbour_rgb_last <= 1'd0;
		wrapper_nearestneighbour_nearestneighbour_working <= 1'd0;
		wrapper_nearestneighbour_nearestneighbour_first_pixel <= 1'd1;
		wrapper_nearestneighbour_colors0 <= 16'd0;
		wrapper_nearestneighbour_colors1 <= 16'd0;
		wrapper_nearestneighbour_g_val <= 1'd0;
		wrapper_nearestneighbour_kernel_width <= 8'd0;
		wrapper_nearestneighbour_b_val <= 8'd0;
		wrapper_nearestneighbour_self <= 8'd0;
		wrapper_bilinear_bilinear_rgb_valid <= 1'd0;
		wrapper_bilinear_bilinear_rgb_first <= 1'd0;
		wrapper_bilinear_bilinear_rgb_last <= 1'd0;
		wrapper_bilinear_bilinear_working <= 1'd0;
		wrapper_bilinear_bilinear_first_pixel <= 1'd1;
		wrapper_bilinear_colors0 <= 24'd0;
		wrapper_bilinear_colors1 <= 24'd0;
		wrapper_bilinear_colors2 <= 24'd0;
		wrapper_bilinear_g_val <= 1'd0;
		wrapper_bilinear_kernel_width <= 16'd0;
		wrapper_bilinear_b_val <= 16'd0;
		wrapper_bilinear_self <= 16'd0;
		wrapper_edge_directed_edge_directed_rgb_valid <= 1'd0;
		wrapper_edge_directed_edge_directed_rgb_first <= 1'd0;
		wrapper_edge_directed_edge_directed_rgb_last <= 1'd0;
		wrapper_edge_directed_edge_directed_working <= 1'd0;
		wrapper_edge_directed_edge_directed_first_pixel <= 1'd1;
		wrapper_edge_directed_colors0 <= 40'd0;
		wrapper_edge_directed_colors1 <= 40'd0;
		wrapper_edge_directed_colors2 <= 40'd0;
		wrapper_edge_directed_colors3 <= 40'd0;
		wrapper_edge_directed_colors4 <= 40'd0;
		wrapper_edge_directed_b_val <= 2'd2;
		wrapper_edge_directed_h_abs <= 16'd0;
		wrapper_edge_directed_colors5 <= 16'd0;
		wrapper_edge_directed_self <= 16'd0;
		nearestneighbour_state <= 5'd0;
		bilinear_state <= 5'd0;
		edge_directed_state <= 5'd0;
	end
end

reg [7:0] mem[0:8191];
always @(posedge sys_clk) begin
	if (wrapper_memory0_we)
		mem[wrapper_memory0_adr] <= wrapper_memory0_dat_w;
end

assign wrapper_memory0_dat_r = mem[wrapper_memory0_adr];

reg [7:0] mem_1[0:8191];
always @(posedge sys_clk) begin
	if (wrapper_memory1_we)
		mem_1[wrapper_memory1_adr] <= wrapper_memory1_dat_w;
end

assign wrapper_memory1_dat_r = mem_1[wrapper_memory1_adr];

reg [7:0] mem_2[0:8191];
always @(posedge sys_clk) begin
	if (wrapper_memory2_we)
		mem_2[wrapper_memory2_adr] <= wrapper_memory2_dat_w;
end

assign wrapper_memory2_dat_r = mem_2[wrapper_memory2_adr];

reg [7:0] mem_3[0:8191];
always @(posedge sys_clk) begin
	if (wrapper_memory3_we)
		mem_3[wrapper_memory3_adr] <= wrapper_memory3_dat_w;
end

assign wrapper_memory3_dat_r = mem_3[wrapper_memory3_adr];

reg [7:0] mem_4[0:8191];
always @(posedge sys_clk) begin
	if (wrapper_memory4_we)
		mem_4[wrapper_memory4_adr] <= wrapper_memory4_dat_w;
end

assign wrapper_memory4_dat_r = mem_4[wrapper_memory4_adr];

reg [7:0] mem_5[0:8191];
always @(posedge sys_clk) begin
	if (wrapper_memory5_we)
		mem_5[wrapper_memory5_adr] <= wrapper_memory5_dat_w;
end

assign wrapper_memory5_dat_r = mem_5[wrapper_memory5_adr];

endmodule

