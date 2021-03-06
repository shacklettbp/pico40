module Register8CE (input [7:0] I, output [7:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFE inst3 (.C(CLK), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFE inst4 (.C(CLK), .E(CE), .D(I[4]), .Q(inst4_Q));
SB_DFFE inst5 (.C(CLK), .E(CE), .D(I[5]), .Q(inst5_Q));
SB_DFFE inst6 (.C(CLK), .E(CE), .D(I[6]), .Q(inst6_Q));
SB_DFFE inst7 (.C(CLK), .E(CE), .D(I[7]), .Q(inst7_Q));
assign O = {inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Add8 (input [7:0] I0, input [7:0] I1, output [7:0] O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
wire  inst2_O;
wire  inst3_CO;
wire  inst4_O;
wire  inst5_CO;
wire  inst6_O;
wire  inst7_CO;
wire  inst8_O;
wire  inst9_CO;
wire  inst10_O;
wire  inst11_CO;
wire  inst12_O;
wire  inst13_CO;
wire  inst14_O;
wire  inst15_CO;
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst0 (.I0(1'b0), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0[0]), .I1(I1[0]), .CI(1'b0), .CO(inst1_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst2 (.I0(1'b0), .I1(I0[1]), .I2(I1[1]), .I3(inst1_CO), .O(inst2_O));
SB_CARRY inst3 (.I0(I0[1]), .I1(I1[1]), .CI(inst1_CO), .CO(inst3_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst4 (.I0(1'b0), .I1(I0[2]), .I2(I1[2]), .I3(inst3_CO), .O(inst4_O));
SB_CARRY inst5 (.I0(I0[2]), .I1(I1[2]), .CI(inst3_CO), .CO(inst5_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst6 (.I0(1'b0), .I1(I0[3]), .I2(I1[3]), .I3(inst5_CO), .O(inst6_O));
SB_CARRY inst7 (.I0(I0[3]), .I1(I1[3]), .CI(inst5_CO), .CO(inst7_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst8 (.I0(1'b0), .I1(I0[4]), .I2(I1[4]), .I3(inst7_CO), .O(inst8_O));
SB_CARRY inst9 (.I0(I0[4]), .I1(I1[4]), .CI(inst7_CO), .CO(inst9_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst10 (.I0(1'b0), .I1(I0[5]), .I2(I1[5]), .I3(inst9_CO), .O(inst10_O));
SB_CARRY inst11 (.I0(I0[5]), .I1(I1[5]), .CI(inst9_CO), .CO(inst11_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst12 (.I0(1'b0), .I1(I0[6]), .I2(I1[6]), .I3(inst11_CO), .O(inst12_O));
SB_CARRY inst13 (.I0(I0[6]), .I1(I1[6]), .CI(inst11_CO), .CO(inst13_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst14 (.I0(1'b0), .I1(I0[7]), .I2(I1[7]), .I3(inst13_CO), .O(inst14_O));
SB_CARRY inst15 (.I0(I0[7]), .I1(I1[7]), .CI(inst13_CO), .CO(inst15_CO));
assign O = {inst14_O,inst12_O,inst10_O,inst8_O,inst6_O,inst4_O,inst2_O,inst0_O};
assign COUT = inst15_CO;
endmodule

module Mux2x8 (input [7:0] I0, input [7:0] I1, input  S, output [7:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst0 (.I0(I0[0]), .I1(I1[0]), .I2(S), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst1 (.I0(I0[1]), .I1(I1[1]), .I2(S), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst2 (.I0(I0[2]), .I1(I1[2]), .I2(S), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst3 (.I0(I0[3]), .I1(I1[3]), .I2(S), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst4 (.I0(I0[4]), .I1(I1[4]), .I2(S), .I3(1'b0), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst5 (.I0(I0[5]), .I1(I1[5]), .I2(S), .I3(1'b0), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst6 (.I0(I0[6]), .I1(I1[6]), .I2(S), .I3(1'b0), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst7 (.I0(I0[7]), .I1(I1[7]), .I2(S), .I3(1'b0), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Decoder4 (input [3:0] I, output [15:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_O;
wire  inst9_O;
wire  inst10_O;
wire  inst11_O;
wire  inst12_O;
wire  inst13_O;
wire  inst14_O;
wire  inst15_O;
SB_LUT4 #(.LUT_INIT(16'h0001)) inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) inst1 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h0004)) inst2 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h0008)) inst3 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'h0010)) inst4 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'h0020)) inst5 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'h0040)) inst6 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'h0080)) inst7 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst7_O));
SB_LUT4 #(.LUT_INIT(16'h0100)) inst8 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst8_O));
SB_LUT4 #(.LUT_INIT(16'h0200)) inst9 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst9_O));
SB_LUT4 #(.LUT_INIT(16'h0400)) inst10 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst10_O));
SB_LUT4 #(.LUT_INIT(16'h0800)) inst11 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst11_O));
SB_LUT4 #(.LUT_INIT(16'h1000)) inst12 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst12_O));
SB_LUT4 #(.LUT_INIT(16'h2000)) inst13 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst13_O));
SB_LUT4 #(.LUT_INIT(16'h4000)) inst14 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst14_O));
SB_LUT4 #(.LUT_INIT(16'h8000)) inst15 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst15_O));
assign O = {inst15_O,inst14_O,inst13_O,inst12_O,inst11_O,inst10_O,inst9_O,inst8_O,inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module And2x16 (input [15:0] I0, input [15:0] I1, output [15:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_O;
wire  inst9_O;
wire  inst10_O;
wire  inst11_O;
wire  inst12_O;
wire  inst13_O;
wire  inst14_O;
wire  inst15_O;
SB_LUT4 #(.LUT_INIT(16'h8888)) inst0 (.I0(I0[0]), .I1(I1[0]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst1 (.I0(I0[1]), .I1(I1[1]), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst2 (.I0(I0[2]), .I1(I1[2]), .I2(1'b0), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst3 (.I0(I0[3]), .I1(I1[3]), .I2(1'b0), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst4 (.I0(I0[4]), .I1(I1[4]), .I2(1'b0), .I3(1'b0), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst5 (.I0(I0[5]), .I1(I1[5]), .I2(1'b0), .I3(1'b0), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst6 (.I0(I0[6]), .I1(I1[6]), .I2(1'b0), .I3(1'b0), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst7 (.I0(I0[7]), .I1(I1[7]), .I2(1'b0), .I3(1'b0), .O(inst7_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst8 (.I0(I0[8]), .I1(I1[8]), .I2(1'b0), .I3(1'b0), .O(inst8_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst9 (.I0(I0[9]), .I1(I1[9]), .I2(1'b0), .I3(1'b0), .O(inst9_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst10 (.I0(I0[10]), .I1(I1[10]), .I2(1'b0), .I3(1'b0), .O(inst10_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst11 (.I0(I0[11]), .I1(I1[11]), .I2(1'b0), .I3(1'b0), .O(inst11_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst12 (.I0(I0[12]), .I1(I1[12]), .I2(1'b0), .I3(1'b0), .O(inst12_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst13 (.I0(I0[13]), .I1(I1[13]), .I2(1'b0), .I3(1'b0), .O(inst13_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst14 (.I0(I0[14]), .I1(I1[14]), .I2(1'b0), .I3(1'b0), .O(inst14_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst15 (.I0(I0[15]), .I1(I1[15]), .I2(1'b0), .I3(1'b0), .O(inst15_O));
assign O = {inst15_O,inst14_O,inst13_O,inst12_O,inst11_O,inst10_O,inst9_O,inst8_O,inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Invert8 (input [7:0] I, output [7:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
SB_LUT4 #(.LUT_INIT(16'h5555)) inst0 (.I0(I[0]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(I[1]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst2 (.I0(I[2]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst3 (.I0(I[3]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst4 (.I0(I[4]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst5 (.I0(I[5]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst6 (.I0(I[6]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst7 (.I0(I[7]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Adc8 (input [7:0] I0, input [7:0] I1, input  CIN, output [7:0] O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
wire  inst2_O;
wire  inst3_CO;
wire  inst4_O;
wire  inst5_CO;
wire  inst6_O;
wire  inst7_CO;
wire  inst8_O;
wire  inst9_CO;
wire  inst10_O;
wire  inst11_CO;
wire  inst12_O;
wire  inst13_CO;
wire  inst14_O;
wire  inst15_CO;
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst0 (.I0(1'b0), .I1(I0[0]), .I2(I1[0]), .I3(CIN), .O(inst0_O));
SB_CARRY inst1 (.I0(I0[0]), .I1(I1[0]), .CI(CIN), .CO(inst1_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst2 (.I0(1'b0), .I1(I0[1]), .I2(I1[1]), .I3(inst1_CO), .O(inst2_O));
SB_CARRY inst3 (.I0(I0[1]), .I1(I1[1]), .CI(inst1_CO), .CO(inst3_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst4 (.I0(1'b0), .I1(I0[2]), .I2(I1[2]), .I3(inst3_CO), .O(inst4_O));
SB_CARRY inst5 (.I0(I0[2]), .I1(I1[2]), .CI(inst3_CO), .CO(inst5_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst6 (.I0(1'b0), .I1(I0[3]), .I2(I1[3]), .I3(inst5_CO), .O(inst6_O));
SB_CARRY inst7 (.I0(I0[3]), .I1(I1[3]), .CI(inst5_CO), .CO(inst7_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst8 (.I0(1'b0), .I1(I0[4]), .I2(I1[4]), .I3(inst7_CO), .O(inst8_O));
SB_CARRY inst9 (.I0(I0[4]), .I1(I1[4]), .CI(inst7_CO), .CO(inst9_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst10 (.I0(1'b0), .I1(I0[5]), .I2(I1[5]), .I3(inst9_CO), .O(inst10_O));
SB_CARRY inst11 (.I0(I0[5]), .I1(I1[5]), .CI(inst9_CO), .CO(inst11_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst12 (.I0(1'b0), .I1(I0[6]), .I2(I1[6]), .I3(inst11_CO), .O(inst12_O));
SB_CARRY inst13 (.I0(I0[6]), .I1(I1[6]), .CI(inst11_CO), .CO(inst13_CO));
SB_LUT4 #(.LUT_INIT(16'hC33C)) inst14 (.I0(1'b0), .I1(I0[7]), .I2(I1[7]), .I3(inst13_CO), .O(inst14_O));
SB_CARRY inst15 (.I0(I0[7]), .I1(I1[7]), .CI(inst13_CO), .CO(inst15_CO));
assign O = {inst14_O,inst12_O,inst10_O,inst8_O,inst6_O,inst4_O,inst2_O,inst0_O};
assign COUT = inst15_CO;
endmodule

module main (input [7:0] J1, output [7:0] J3, input  CLKIN);
wire [15:0] inst0_RDATA;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_Q;
wire  inst9_O;
wire  inst10_Q;
wire  inst11_O;
wire  inst12_O;
wire  inst13_O;
wire  inst14_Q;
wire  inst15_O;
wire  inst16_O;
wire  inst17_O;
wire  inst18_O;
wire  inst19_O;
wire  inst20_O;
wire  inst21_O;
wire [7:0] inst22_O;
wire [7:0] inst23_O;
wire  inst23_COUT;
wire [7:0] inst24_O;
wire [7:0] inst25_O;
wire [7:0] inst26_O;
wire [7:0] inst27_O;
wire [7:0] inst28_O;
wire [7:0] inst29_O;
wire [7:0] inst30_O;
wire [7:0] inst31_O;
wire [7:0] inst32_O;
wire [7:0] inst33_O;
wire [7:0] inst34_O;
wire [7:0] inst35_O;
wire [7:0] inst36_O;
wire [7:0] inst37_O;
wire [7:0] inst38_O;
wire [7:0] inst39_O;
wire [7:0] inst40_O;
wire [7:0] inst41_O;
wire [7:0] inst42_O;
wire [15:0] inst43_O;
wire [15:0] inst44_O;
wire [7:0] inst45_O;
wire [7:0] inst46_O;
wire [7:0] inst47_O;
wire [7:0] inst48_O;
wire [7:0] inst49_O;
wire [7:0] inst50_O;
wire [7:0] inst51_O;
wire [7:0] inst52_O;
wire [7:0] inst53_O;
wire [7:0] inst54_O;
wire [7:0] inst55_O;
wire [7:0] inst56_O;
wire [7:0] inst57_O;
wire [7:0] inst58_O;
wire [7:0] inst59_O;
wire [7:0] inst60_O;
wire [7:0] inst61_O;
wire [7:0] inst62_O;
wire [7:0] inst63_O;
wire [7:0] inst64_O;
wire [7:0] inst65_O;
wire [7:0] inst66_O;
wire [7:0] inst67_O;
wire [7:0] inst68_O;
wire [7:0] inst69_O;
wire [7:0] inst70_O;
wire [7:0] inst71_O;
wire [7:0] inst72_O;
wire [7:0] inst73_O;
wire [7:0] inst74_O;
wire  inst75_O;
wire  inst76_O;
wire  inst77_O;
wire  inst78_O;
wire  inst79_O;
wire  inst80_O;
wire  inst81_O;
wire  inst82_O;
wire [7:0] inst83_O;
wire [7:0] inst84_O;
wire [7:0] inst85_O;
wire  inst85_COUT;
wire  inst86_O;
wire [7:0] inst87_O;
wire  inst88_O;
wire  inst89_O;
wire  inst90_O;
wire  inst91_O;
wire  inst92_O;
wire  inst93_O;
wire  inst94_O;
wire  inst95_O;
wire  inst96_O;
wire  inst97_O;
wire  inst98_O;
wire  inst99_O;
wire  inst100_O;
wire  inst101_O;
wire  inst102_O;
wire  inst103_O;
wire  inst104_O;
wire  inst105_O;
wire  inst106_O;
wire  inst107_O;
wire  inst108_O;
wire  inst109_O;
wire  inst110_O;
wire  inst111_O;
wire  inst112_O;
wire  inst113_O;
wire  inst114_O;
wire  inst115_O;
wire  inst116_O;
wire  inst117_O;
wire  inst118_O;
wire  inst119_O;
wire  inst120_O;
wire  inst121_O;
wire [7:0] inst122_O;
wire  inst123_O;
SB_RAM40_4K #(.INIT_1(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_0(256'h0000000000000000000000000000CF02B100C1055010B000C102501081018000),
.INIT_3(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_2(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_5(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_4(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_7(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_6(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_9(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_8(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_A(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_C(256'h0000000000000000000000000000000000000000000000000000000000000000),
.READ_MODE(0),
.INIT_E(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_D(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_F(256'h0000000000000000000000000000000000000000000000000000000000000000),
.WRITE_MODE(0),
.INIT_B(256'h0000000000000000000000000000000000000000000000000000000000000000)) inst0 (.RDATA(inst0_RDATA), .RADDR({1'b0,1'b0,1'b0,inst22_O[7],inst22_O[6],inst22_O[5],inst22_O[4],inst22_O[3],inst22_O[2],inst22_O[1],inst22_O[0]}), .RCLK(CLKIN), .RCLKE(1'b1), .RE(1'b1), .WCLK(CLKIN), .WCLKE(1'b0), .WE(1'b0), .WADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .MASK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
SB_LUT4 #(.LUT_INIT(16'h0001)) inst1 (.I0(inst0_RDATA[14]), .I1(inst0_RDATA[15]), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) inst2 (.I0(inst0_RDATA[14]), .I1(inst0_RDATA[15]), .I2(1'b0), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h0003)) inst3 (.I0(inst0_RDATA[14]), .I1(inst0_RDATA[15]), .I2(1'b0), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'h0100)) inst4 (.I0(inst0_RDATA[12]), .I1(inst0_RDATA[13]), .I2(inst0_RDATA[14]), .I3(inst0_RDATA[15]), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'h0400)) inst5 (.I0(inst0_RDATA[12]), .I1(inst0_RDATA[13]), .I2(inst0_RDATA[14]), .I3(inst0_RDATA[15]), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'h0800)) inst6 (.I0(inst0_RDATA[12]), .I1(inst0_RDATA[13]), .I2(inst0_RDATA[14]), .I3(inst0_RDATA[15]), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'h1000)) inst7 (.I0(inst0_RDATA[12]), .I1(inst0_RDATA[13]), .I2(inst0_RDATA[14]), .I3(inst0_RDATA[15]), .O(inst7_O));
SB_DFF inst8 (.C(CLKIN), .D(inst9_O), .Q(inst8_Q));
SB_LUT4 #(.LUT_INIT(16'h6666)) inst9 (.I0(inst8_Q), .I1(1'b1), .I2(1'b0), .I3(1'b0), .O(inst9_O));
SB_DFFE inst10 (.C(CLKIN), .E(inst120_O), .D(inst119_O), .Q(inst10_Q));
SB_LUT4 #(.LUT_INIT(16'h0001)) inst11 (.I0(inst0_RDATA[8]), .I1(inst0_RDATA[9]), .I2(inst0_RDATA[10]), .I3(inst0_RDATA[11]), .O(inst11_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) inst12 (.I0(inst0_RDATA[8]), .I1(inst0_RDATA[9]), .I2(inst0_RDATA[10]), .I3(inst0_RDATA[11]), .O(inst12_O));
SB_LUT4 #(.LUT_INIT(16'hACAC)) inst13 (.I0(inst11_O), .I1(inst12_O), .I2(inst10_Q), .I3(1'b0), .O(inst13_O));
SB_DFFE inst14 (.C(CLKIN), .E(inst121_O), .D(inst85_COUT), .Q(inst14_Q));
SB_LUT4 #(.LUT_INIT(16'h0004)) inst15 (.I0(inst0_RDATA[8]), .I1(inst0_RDATA[9]), .I2(inst0_RDATA[10]), .I3(inst0_RDATA[11]), .O(inst15_O));
SB_LUT4 #(.LUT_INIT(16'h0008)) inst16 (.I0(inst0_RDATA[8]), .I1(inst0_RDATA[9]), .I2(inst0_RDATA[10]), .I3(inst0_RDATA[11]), .O(inst16_O));
SB_LUT4 #(.LUT_INIT(16'hACAC)) inst17 (.I0(inst15_O), .I1(inst16_O), .I2(inst14_Q), .I3(1'b0), .O(inst17_O));
SB_LUT4 #(.LUT_INIT(16'h8000)) inst18 (.I0(inst0_RDATA[8]), .I1(inst0_RDATA[9]), .I2(inst0_RDATA[10]), .I3(inst0_RDATA[11]), .O(inst18_O));
SB_LUT4 #(.LUT_INIT(16'hFEFE)) inst19 (.I0(inst18_O), .I1(inst13_O), .I2(inst17_O), .I3(1'b0), .O(inst19_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst20 (.I0(inst7_O), .I1(inst19_O), .I2(1'b0), .I3(1'b0), .O(inst20_O));
SB_LUT4 #(.LUT_INIT(16'hFE00)) inst21 (.I0(inst3_O), .I1(inst4_O), .I2(inst5_O), .I3(inst8_Q), .O(inst21_O));
Register8CE inst22 (.I(inst24_O), .O(inst22_O), .CLK(CLKIN), .CE(inst8_Q));
Add8 inst23 (.I0(inst22_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst23_O), .COUT(inst23_COUT));
Mux2x8 inst24 (.I0(inst23_O), .I1({inst0_RDATA[7],inst0_RDATA[6],inst0_RDATA[5],inst0_RDATA[4],inst0_RDATA[3],inst0_RDATA[2],inst0_RDATA[1],inst0_RDATA[0]}), .S(inst20_O), .O(inst24_O));
Mux2x8 inst25 (.I0({inst0_RDATA[7],inst0_RDATA[6],inst0_RDATA[5],inst0_RDATA[4],inst0_RDATA[3],inst0_RDATA[2],inst0_RDATA[1],inst0_RDATA[0]}), .I1(J1), .S(inst5_O), .O(inst25_O));
Mux2x8 inst26 (.I0(inst87_O), .I1(inst25_O), .S(inst88_O), .O(inst26_O));
Register8CE inst27 (.I(inst26_O), .O(inst27_O), .CLK(CLKIN), .CE(inst44_O[0]));
Register8CE inst28 (.I(inst26_O), .O(inst28_O), .CLK(CLKIN), .CE(inst44_O[1]));
Register8CE inst29 (.I(inst26_O), .O(inst29_O), .CLK(CLKIN), .CE(inst44_O[2]));
Register8CE inst30 (.I(inst26_O), .O(inst30_O), .CLK(CLKIN), .CE(inst44_O[3]));
Register8CE inst31 (.I(inst26_O), .O(inst31_O), .CLK(CLKIN), .CE(inst44_O[4]));
Register8CE inst32 (.I(inst26_O), .O(inst32_O), .CLK(CLKIN), .CE(inst44_O[5]));
Register8CE inst33 (.I(inst26_O), .O(inst33_O), .CLK(CLKIN), .CE(inst44_O[6]));
Register8CE inst34 (.I(inst26_O), .O(inst34_O), .CLK(CLKIN), .CE(inst44_O[7]));
Register8CE inst35 (.I(inst26_O), .O(inst35_O), .CLK(CLKIN), .CE(inst44_O[8]));
Register8CE inst36 (.I(inst26_O), .O(inst36_O), .CLK(CLKIN), .CE(inst44_O[9]));
Register8CE inst37 (.I(inst26_O), .O(inst37_O), .CLK(CLKIN), .CE(inst44_O[10]));
Register8CE inst38 (.I(inst26_O), .O(inst38_O), .CLK(CLKIN), .CE(inst44_O[11]));
Register8CE inst39 (.I(inst26_O), .O(inst39_O), .CLK(CLKIN), .CE(inst44_O[12]));
Register8CE inst40 (.I(inst26_O), .O(inst40_O), .CLK(CLKIN), .CE(inst44_O[13]));
Register8CE inst41 (.I(inst26_O), .O(inst41_O), .CLK(CLKIN), .CE(inst44_O[14]));
Register8CE inst42 (.I(inst26_O), .O(inst42_O), .CLK(CLKIN), .CE(inst44_O[15]));
Decoder4 inst43 (.I({inst0_RDATA[11],inst0_RDATA[10],inst0_RDATA[9],inst0_RDATA[8]}), .O(inst43_O));
And2x16 inst44 (.I0(inst43_O), .I1({inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O,inst21_O}), .O(inst44_O));
Mux2x8 inst45 (.I0(inst27_O), .I1(inst28_O), .S(inst0_RDATA[8]), .O(inst45_O));
Mux2x8 inst46 (.I0(inst29_O), .I1(inst30_O), .S(inst0_RDATA[8]), .O(inst46_O));
Mux2x8 inst47 (.I0(inst31_O), .I1(inst32_O), .S(inst0_RDATA[8]), .O(inst47_O));
Mux2x8 inst48 (.I0(inst33_O), .I1(inst34_O), .S(inst0_RDATA[8]), .O(inst48_O));
Mux2x8 inst49 (.I0(inst35_O), .I1(inst36_O), .S(inst0_RDATA[8]), .O(inst49_O));
Mux2x8 inst50 (.I0(inst37_O), .I1(inst38_O), .S(inst0_RDATA[8]), .O(inst50_O));
Mux2x8 inst51 (.I0(inst39_O), .I1(inst40_O), .S(inst0_RDATA[8]), .O(inst51_O));
Mux2x8 inst52 (.I0(inst41_O), .I1(inst42_O), .S(inst0_RDATA[8]), .O(inst52_O));
Mux2x8 inst53 (.I0(inst45_O), .I1(inst46_O), .S(inst0_RDATA[9]), .O(inst53_O));
Mux2x8 inst54 (.I0(inst47_O), .I1(inst48_O), .S(inst0_RDATA[9]), .O(inst54_O));
Mux2x8 inst55 (.I0(inst49_O), .I1(inst50_O), .S(inst0_RDATA[9]), .O(inst55_O));
Mux2x8 inst56 (.I0(inst51_O), .I1(inst52_O), .S(inst0_RDATA[9]), .O(inst56_O));
Mux2x8 inst57 (.I0(inst53_O), .I1(inst54_O), .S(inst0_RDATA[10]), .O(inst57_O));
Mux2x8 inst58 (.I0(inst55_O), .I1(inst56_O), .S(inst0_RDATA[10]), .O(inst58_O));
Mux2x8 inst59 (.I0(inst57_O), .I1(inst58_O), .S(inst0_RDATA[11]), .O(inst59_O));
Mux2x8 inst60 (.I0(inst27_O), .I1(inst28_O), .S(inst0_RDATA[4]), .O(inst60_O));
Mux2x8 inst61 (.I0(inst29_O), .I1(inst30_O), .S(inst0_RDATA[4]), .O(inst61_O));
Mux2x8 inst62 (.I0(inst31_O), .I1(inst32_O), .S(inst0_RDATA[4]), .O(inst62_O));
Mux2x8 inst63 (.I0(inst33_O), .I1(inst34_O), .S(inst0_RDATA[4]), .O(inst63_O));
Mux2x8 inst64 (.I0(inst35_O), .I1(inst36_O), .S(inst0_RDATA[4]), .O(inst64_O));
Mux2x8 inst65 (.I0(inst37_O), .I1(inst38_O), .S(inst0_RDATA[4]), .O(inst65_O));
Mux2x8 inst66 (.I0(inst39_O), .I1(inst40_O), .S(inst0_RDATA[4]), .O(inst66_O));
Mux2x8 inst67 (.I0(inst41_O), .I1(inst42_O), .S(inst0_RDATA[4]), .O(inst67_O));
Mux2x8 inst68 (.I0(inst60_O), .I1(inst61_O), .S(inst0_RDATA[5]), .O(inst68_O));
Mux2x8 inst69 (.I0(inst62_O), .I1(inst63_O), .S(inst0_RDATA[5]), .O(inst69_O));
Mux2x8 inst70 (.I0(inst64_O), .I1(inst65_O), .S(inst0_RDATA[5]), .O(inst70_O));
Mux2x8 inst71 (.I0(inst66_O), .I1(inst67_O), .S(inst0_RDATA[5]), .O(inst71_O));
Mux2x8 inst72 (.I0(inst68_O), .I1(inst69_O), .S(inst0_RDATA[6]), .O(inst72_O));
Mux2x8 inst73 (.I0(inst70_O), .I1(inst71_O), .S(inst0_RDATA[6]), .O(inst73_O));
Mux2x8 inst74 (.I0(inst72_O), .I1(inst73_O), .S(inst0_RDATA[7]), .O(inst74_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst75 (.I0(inst59_O[0]), .I1(inst74_O[0]), .I2(inst0_RDATA[12]), .I3(inst0_RDATA[13]), .O(inst75_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst76 (.I0(inst59_O[1]), .I1(inst74_O[1]), .I2(inst0_RDATA[12]), .I3(inst0_RDATA[13]), .O(inst76_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst77 (.I0(inst59_O[2]), .I1(inst74_O[2]), .I2(inst0_RDATA[12]), .I3(inst0_RDATA[13]), .O(inst77_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst78 (.I0(inst59_O[3]), .I1(inst74_O[3]), .I2(inst0_RDATA[12]), .I3(inst0_RDATA[13]), .O(inst78_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst79 (.I0(inst59_O[4]), .I1(inst74_O[4]), .I2(inst0_RDATA[12]), .I3(inst0_RDATA[13]), .O(inst79_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst80 (.I0(inst59_O[5]), .I1(inst74_O[5]), .I2(inst0_RDATA[12]), .I3(inst0_RDATA[13]), .O(inst80_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst81 (.I0(inst59_O[6]), .I1(inst74_O[6]), .I2(inst0_RDATA[12]), .I3(inst0_RDATA[13]), .O(inst81_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst82 (.I0(inst59_O[7]), .I1(inst74_O[7]), .I2(inst0_RDATA[12]), .I3(inst0_RDATA[13]), .O(inst82_O));
Invert8 inst83 (.I(inst74_O), .O(inst83_O));
Mux2x8 inst84 (.I0(inst74_O), .I1(inst83_O), .S(inst0_RDATA[12]), .O(inst84_O));
Adc8 inst85 (.I0(inst59_O), .I1(inst84_O), .CIN(inst86_O), .O(inst85_O), .COUT(inst85_COUT));
SB_LUT4 #(.LUT_INIT(16'h6C6C)) inst86 (.I0(inst14_Q), .I1(inst0_RDATA[12]), .I2(inst0_RDATA[13]), .I3(1'b0), .O(inst86_O));
Mux2x8 inst87 (.I0({inst82_O,inst81_O,inst80_O,inst79_O,inst78_O,inst77_O,inst76_O,inst75_O}), .I1(inst85_O), .S(inst2_O), .O(inst87_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) inst88 (.I0(inst5_O), .I1(inst4_O), .I2(1'b0), .I3(1'b0), .O(inst88_O));
SB_LUT4 #(.LUT_INIT(16'h0001)) inst89 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst89_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst90 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst90_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst91 (.I0(inst89_O), .I1(inst90_O), .I2(inst87_O[4]), .I3(1'b0), .O(inst91_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst92 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst92_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst93 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst93_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst94 (.I0(inst92_O), .I1(inst93_O), .I2(inst87_O[4]), .I3(1'b0), .O(inst94_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst95 (.I0(inst91_O), .I1(inst94_O), .I2(inst87_O[5]), .I3(1'b0), .O(inst95_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst96 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst96_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst97 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst97_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst98 (.I0(inst96_O), .I1(inst97_O), .I2(inst87_O[4]), .I3(1'b0), .O(inst98_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst99 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst99_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst100 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst100_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst101 (.I0(inst99_O), .I1(inst100_O), .I2(inst87_O[4]), .I3(1'b0), .O(inst101_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst102 (.I0(inst98_O), .I1(inst101_O), .I2(inst87_O[5]), .I3(1'b0), .O(inst102_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst103 (.I0(inst95_O), .I1(inst102_O), .I2(inst87_O[6]), .I3(1'b0), .O(inst103_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst104 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst104_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst105 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst105_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst106 (.I0(inst104_O), .I1(inst105_O), .I2(inst87_O[4]), .I3(1'b0), .O(inst106_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst107 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst107_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst108 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst108_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst109 (.I0(inst107_O), .I1(inst108_O), .I2(inst87_O[4]), .I3(1'b0), .O(inst109_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst110 (.I0(inst106_O), .I1(inst109_O), .I2(inst87_O[5]), .I3(1'b0), .O(inst110_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst111 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst111_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst112 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst112_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst113 (.I0(inst111_O), .I1(inst112_O), .I2(inst87_O[4]), .I3(1'b0), .O(inst113_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst114 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst114_O));
SB_LUT4 #(.LUT_INIT(16'h0000)) inst115 (.I0(inst87_O[0]), .I1(inst87_O[1]), .I2(inst87_O[2]), .I3(inst87_O[3]), .O(inst115_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst116 (.I0(inst114_O), .I1(inst115_O), .I2(inst87_O[4]), .I3(1'b0), .O(inst116_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst117 (.I0(inst113_O), .I1(inst116_O), .I2(inst87_O[5]), .I3(1'b0), .O(inst117_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst118 (.I0(inst110_O), .I1(inst117_O), .I2(inst87_O[6]), .I3(1'b0), .O(inst118_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst119 (.I0(inst103_O), .I1(inst118_O), .I2(inst87_O[7]), .I3(1'b0), .O(inst119_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst120 (.I0(inst3_O), .I1(inst8_Q), .I2(1'b0), .I3(1'b0), .O(inst120_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst121 (.I0(inst2_O), .I1(inst8_Q), .I2(1'b0), .I3(1'b0), .O(inst121_O));
Register8CE inst122 (.I(inst59_O), .O(inst122_O), .CLK(CLKIN), .CE(inst123_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst123 (.I0(inst6_O), .I1(inst8_Q), .I2(1'b0), .I3(1'b0), .O(inst123_O));
assign J3 = inst122_O;
endmodule

