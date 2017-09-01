module InstructionDecoder (input [15:0] inst, input  phase, input  z, output  arith, output  ioimm, output  ld, output  jump, output  regwr, output  zwr, output  owr);
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
wire  inst16_O;
SB_LUT4 #(.LUT_INIT(16'h0001)) inst0 (.I0(inst[14]), .I1(inst[15]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) inst1 (.I0(inst[14]), .I1(inst[15]), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h0003)) inst2 (.I0(inst[14]), .I1(inst[15]), .I2(1'b0), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h0100)) inst3 (.I0(inst[12]), .I1(inst[13]), .I2(inst[14]), .I3(inst[15]), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'h0400)) inst4 (.I0(inst[12]), .I1(inst[13]), .I2(inst[14]), .I3(inst[15]), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'h0800)) inst5 (.I0(inst[12]), .I1(inst[13]), .I2(inst[14]), .I3(inst[15]), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) inst6 (.I0(inst4_O), .I1(inst3_O), .I2(1'b0), .I3(1'b0), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'h1000)) inst7 (.I0(inst[12]), .I1(inst[13]), .I2(inst[14]), .I3(inst[15]), .O(inst7_O));
SB_LUT4 #(.LUT_INIT(16'h8000)) inst8 (.I0(inst[8]), .I1(inst[9]), .I2(inst[10]), .I3(inst[11]), .O(inst8_O));
SB_LUT4 #(.LUT_INIT(16'h0001)) inst9 (.I0(inst[8]), .I1(inst[9]), .I2(inst[10]), .I3(inst[11]), .O(inst9_O));
SB_LUT4 #(.LUT_INIT(16'h0002)) inst10 (.I0(inst[8]), .I1(inst[9]), .I2(inst[10]), .I3(inst[11]), .O(inst10_O));
SB_LUT4 #(.LUT_INIT(16'hACAC)) inst11 (.I0(inst9_O), .I1(inst10_O), .I2(z), .I3(1'b0), .O(inst11_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) inst12 (.I0(inst8_O), .I1(inst11_O), .I2(1'b0), .I3(1'b0), .O(inst12_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst13 (.I0(inst7_O), .I1(inst12_O), .I2(1'b0), .I3(1'b0), .O(inst13_O));
SB_LUT4 #(.LUT_INIT(16'hFE00)) inst14 (.I0(inst2_O), .I1(inst3_O), .I2(inst4_O), .I3(phase), .O(inst14_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst15 (.I0(inst2_O), .I1(phase), .I2(1'b0), .I3(1'b0), .O(inst15_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst16 (.I0(inst5_O), .I1(phase), .I2(1'b0), .I3(1'b0), .O(inst16_O));
assign arith = inst1_O;
assign ioimm = inst3_O;
assign ld = inst6_O;
assign jump = inst13_O;
assign regwr = inst14_O;
assign zwr = inst15_O;
assign owr = inst16_O;
endmodule

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

module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0), .I1(I1), .CI(CIN), .CO(inst1_CO));
assign O = inst0_O;
assign COUT = inst1_CO;
endmodule

module AdderCout8 (input [7:0] I0, input [7:0] I1, output [7:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
wire  inst4_O;
wire  inst4_COUT;
wire  inst5_O;
wire  inst5_COUT;
wire  inst6_O;
wire  inst6_COUT;
wire  inst7_O;
wire  inst7_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
FullAdder inst4 (.I0(I0[4]), .I1(I1[4]), .CIN(inst3_COUT), .O(inst4_O), .COUT(inst4_COUT));
FullAdder inst5 (.I0(I0[5]), .I1(I1[5]), .CIN(inst4_COUT), .O(inst5_O), .COUT(inst5_COUT));
FullAdder inst6 (.I0(I0[6]), .I1(I1[6]), .CIN(inst5_COUT), .O(inst6_O), .COUT(inst6_COUT));
FullAdder inst7 (.I0(I0[7]), .I1(I1[7]), .CIN(inst6_COUT), .O(inst7_O), .COUT(inst7_COUT));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
assign COUT = inst7_COUT;
endmodule

module Mux2 (input [1:0] I, input  S, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
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
Mux2 inst0 (.I({I1[0],I0[0]}), .S(S), .O(inst0_O));
Mux2 inst1 (.I({I1[1],I0[1]}), .S(S), .O(inst1_O));
Mux2 inst2 (.I({I1[2],I0[2]}), .S(S), .O(inst2_O));
Mux2 inst3 (.I({I1[3],I0[3]}), .S(S), .O(inst3_O));
Mux2 inst4 (.I({I1[4],I0[4]}), .S(S), .O(inst4_O));
Mux2 inst5 (.I({I1[5],I0[5]}), .S(S), .O(inst5_O));
Mux2 inst6 (.I({I1[6],I0[6]}), .S(S), .O(inst6_O));
Mux2 inst7 (.I({I1[7],I0[7]}), .S(S), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Sequencer8 (input [7:0] addr, input  jump, input  we, output [7:0] O, input  CLK);
wire [7:0] inst0_O;
wire [7:0] inst1_O;
wire  inst1_COUT;
wire [7:0] inst2_O;
Register8CE inst0 (.I(inst2_O), .O(inst0_O), .CLK(CLK), .CE(we));
AdderCout8 inst1 (.I0(inst0_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst1_O), .COUT(inst1_COUT));
Mux2x8 inst2 (.I0(inst1_O), .I1(addr), .S(jump), .O(inst2_O));
assign O = inst0_O;
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

module DualRAM16x8 (input [3:0] RADDR0, output [7:0] RDATA0, input [3:0] RADDR1, output [7:0] RDATA1, input [3:0] WADDR, input [7:0] WDATA, input  CLK, input  WE);
wire [7:0] inst0_O;
wire [7:0] inst1_O;
wire [7:0] inst2_O;
wire [7:0] inst3_O;
wire [7:0] inst4_O;
wire [7:0] inst5_O;
wire [7:0] inst6_O;
wire [7:0] inst7_O;
wire [7:0] inst8_O;
wire [7:0] inst9_O;
wire [7:0] inst10_O;
wire [7:0] inst11_O;
wire [7:0] inst12_O;
wire [7:0] inst13_O;
wire [7:0] inst14_O;
wire [7:0] inst15_O;
wire [15:0] inst16_O;
wire [15:0] inst17_O;
wire [7:0] inst18_O;
wire [7:0] inst19_O;
wire [7:0] inst20_O;
wire [7:0] inst21_O;
wire [7:0] inst22_O;
wire [7:0] inst23_O;
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
wire [7:0] inst43_O;
wire [7:0] inst44_O;
wire [7:0] inst45_O;
wire [7:0] inst46_O;
wire [7:0] inst47_O;
Register8CE inst0 (.I(WDATA), .O(inst0_O), .CLK(CLK), .CE(inst17_O[0]));
Register8CE inst1 (.I(WDATA), .O(inst1_O), .CLK(CLK), .CE(inst17_O[1]));
Register8CE inst2 (.I(WDATA), .O(inst2_O), .CLK(CLK), .CE(inst17_O[2]));
Register8CE inst3 (.I(WDATA), .O(inst3_O), .CLK(CLK), .CE(inst17_O[3]));
Register8CE inst4 (.I(WDATA), .O(inst4_O), .CLK(CLK), .CE(inst17_O[4]));
Register8CE inst5 (.I(WDATA), .O(inst5_O), .CLK(CLK), .CE(inst17_O[5]));
Register8CE inst6 (.I(WDATA), .O(inst6_O), .CLK(CLK), .CE(inst17_O[6]));
Register8CE inst7 (.I(WDATA), .O(inst7_O), .CLK(CLK), .CE(inst17_O[7]));
Register8CE inst8 (.I(WDATA), .O(inst8_O), .CLK(CLK), .CE(inst17_O[8]));
Register8CE inst9 (.I(WDATA), .O(inst9_O), .CLK(CLK), .CE(inst17_O[9]));
Register8CE inst10 (.I(WDATA), .O(inst10_O), .CLK(CLK), .CE(inst17_O[10]));
Register8CE inst11 (.I(WDATA), .O(inst11_O), .CLK(CLK), .CE(inst17_O[11]));
Register8CE inst12 (.I(WDATA), .O(inst12_O), .CLK(CLK), .CE(inst17_O[12]));
Register8CE inst13 (.I(WDATA), .O(inst13_O), .CLK(CLK), .CE(inst17_O[13]));
Register8CE inst14 (.I(WDATA), .O(inst14_O), .CLK(CLK), .CE(inst17_O[14]));
Register8CE inst15 (.I(WDATA), .O(inst15_O), .CLK(CLK), .CE(inst17_O[15]));
Decoder4 inst16 (.I(WADDR), .O(inst16_O));
And2x16 inst17 (.I0(inst16_O), .I1({WE,WE,WE,WE,WE,WE,WE,WE,WE,WE,WE,WE,WE,WE,WE,WE}), .O(inst17_O));
Mux2x8 inst18 (.I0(inst0_O), .I1(inst1_O), .S(RADDR0[0]), .O(inst18_O));
Mux2x8 inst19 (.I0(inst2_O), .I1(inst3_O), .S(RADDR0[0]), .O(inst19_O));
Mux2x8 inst20 (.I0(inst4_O), .I1(inst5_O), .S(RADDR0[0]), .O(inst20_O));
Mux2x8 inst21 (.I0(inst6_O), .I1(inst7_O), .S(RADDR0[0]), .O(inst21_O));
Mux2x8 inst22 (.I0(inst8_O), .I1(inst9_O), .S(RADDR0[0]), .O(inst22_O));
Mux2x8 inst23 (.I0(inst10_O), .I1(inst11_O), .S(RADDR0[0]), .O(inst23_O));
Mux2x8 inst24 (.I0(inst12_O), .I1(inst13_O), .S(RADDR0[0]), .O(inst24_O));
Mux2x8 inst25 (.I0(inst14_O), .I1(inst15_O), .S(RADDR0[0]), .O(inst25_O));
Mux2x8 inst26 (.I0(inst18_O), .I1(inst19_O), .S(RADDR0[1]), .O(inst26_O));
Mux2x8 inst27 (.I0(inst20_O), .I1(inst21_O), .S(RADDR0[1]), .O(inst27_O));
Mux2x8 inst28 (.I0(inst22_O), .I1(inst23_O), .S(RADDR0[1]), .O(inst28_O));
Mux2x8 inst29 (.I0(inst24_O), .I1(inst25_O), .S(RADDR0[1]), .O(inst29_O));
Mux2x8 inst30 (.I0(inst26_O), .I1(inst27_O), .S(RADDR0[2]), .O(inst30_O));
Mux2x8 inst31 (.I0(inst28_O), .I1(inst29_O), .S(RADDR0[2]), .O(inst31_O));
Mux2x8 inst32 (.I0(inst30_O), .I1(inst31_O), .S(RADDR0[3]), .O(inst32_O));
Mux2x8 inst33 (.I0(inst0_O), .I1(inst1_O), .S(RADDR1[0]), .O(inst33_O));
Mux2x8 inst34 (.I0(inst2_O), .I1(inst3_O), .S(RADDR1[0]), .O(inst34_O));
Mux2x8 inst35 (.I0(inst4_O), .I1(inst5_O), .S(RADDR1[0]), .O(inst35_O));
Mux2x8 inst36 (.I0(inst6_O), .I1(inst7_O), .S(RADDR1[0]), .O(inst36_O));
Mux2x8 inst37 (.I0(inst8_O), .I1(inst9_O), .S(RADDR1[0]), .O(inst37_O));
Mux2x8 inst38 (.I0(inst10_O), .I1(inst11_O), .S(RADDR1[0]), .O(inst38_O));
Mux2x8 inst39 (.I0(inst12_O), .I1(inst13_O), .S(RADDR1[0]), .O(inst39_O));
Mux2x8 inst40 (.I0(inst14_O), .I1(inst15_O), .S(RADDR1[0]), .O(inst40_O));
Mux2x8 inst41 (.I0(inst33_O), .I1(inst34_O), .S(RADDR1[1]), .O(inst41_O));
Mux2x8 inst42 (.I0(inst35_O), .I1(inst36_O), .S(RADDR1[1]), .O(inst42_O));
Mux2x8 inst43 (.I0(inst37_O), .I1(inst38_O), .S(RADDR1[1]), .O(inst43_O));
Mux2x8 inst44 (.I0(inst39_O), .I1(inst40_O), .S(RADDR1[1]), .O(inst44_O));
Mux2x8 inst45 (.I0(inst41_O), .I1(inst42_O), .S(RADDR1[2]), .O(inst45_O));
Mux2x8 inst46 (.I0(inst43_O), .I1(inst44_O), .S(RADDR1[2]), .O(inst46_O));
Mux2x8 inst47 (.I0(inst45_O), .I1(inst46_O), .S(RADDR1[3]), .O(inst47_O));
assign RDATA0 = inst32_O;
assign RDATA1 = inst47_O;
endmodule

module Logic8 (input [7:0] A, input [7:0] B, input  S0, input  S1, output [7:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst0 (.I0(A[0]), .I1(B[0]), .I2(S0), .I3(S1), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst1 (.I0(A[1]), .I1(B[1]), .I2(S0), .I3(S1), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst2 (.I0(A[2]), .I1(B[2]), .I2(S0), .I3(S1), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst3 (.I0(A[3]), .I1(B[3]), .I2(S0), .I3(S1), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst4 (.I0(A[4]), .I1(B[4]), .I2(S0), .I3(S1), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst5 (.I0(A[5]), .I1(B[5]), .I2(S0), .I3(S1), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst6 (.I0(A[6]), .I1(B[6]), .I2(S0), .I3(S1), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'h6E8C)) inst7 (.I0(A[7]), .I1(B[7]), .I2(S0), .I3(S1), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
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

module AdderCinCout8 (input [7:0] I0, input [7:0] I1, input  CIN, output [7:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
wire  inst4_O;
wire  inst4_COUT;
wire  inst5_O;
wire  inst5_COUT;
wire  inst6_O;
wire  inst6_COUT;
wire  inst7_O;
wire  inst7_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(CIN), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
FullAdder inst4 (.I0(I0[4]), .I1(I1[4]), .CIN(inst3_COUT), .O(inst4_O), .COUT(inst4_COUT));
FullAdder inst5 (.I0(I0[5]), .I1(I1[5]), .CIN(inst4_COUT), .O(inst5_O), .COUT(inst5_COUT));
FullAdder inst6 (.I0(I0[6]), .I1(I1[6]), .CIN(inst5_COUT), .O(inst6_O), .COUT(inst6_COUT));
FullAdder inst7 (.I0(I0[7]), .I1(I1[7]), .CIN(inst6_COUT), .O(inst7_O), .COUT(inst7_COUT));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
assign COUT = inst7_COUT;
endmodule

module Arith8 (input [7:0] A, input [7:0] B, input  SUB, input  CARRY, input  CIN, output [7:0] O, output  COUT);
wire [7:0] inst0_O;
wire [7:0] inst1_O;
wire [7:0] inst2_O;
wire  inst2_COUT;
wire  inst3_O;
Invert8 inst0 (.I(B), .O(inst0_O));
Mux2x8 inst1 (.I0(B), .I1(inst0_O), .S(SUB), .O(inst1_O));
AdderCinCout8 inst2 (.I0(A), .I1(inst1_O), .CIN(inst3_O), .O(inst2_O), .COUT(inst2_COUT));
SB_LUT4 #(.LUT_INIT(16'h6C6C)) inst3 (.I0(CIN), .I1(SUB), .I2(CARRY), .I3(1'b0), .O(inst3_O));
assign O = inst2_O;
assign COUT = inst2_COUT;
endmodule

module ALU8 (input [7:0] A, input [7:0] B, input [1:0] op, input  insttype, output [7:0] O);
wire [7:0] inst0_O;
wire [7:0] inst1_O;
wire  inst1_COUT;
wire [7:0] inst2_O;
Logic8 inst0 (.A(A), .B(B), .S0(op[0]), .S1(op[1]), .O(inst0_O));
Arith8 inst1 (.A(A), .B(B), .SUB(op[0]), .CARRY(op[1]), .CIN(1'b0), .O(inst1_O), .COUT(inst1_COUT));
Mux2x8 inst2 (.I0(inst0_O), .I1(inst1_O), .S(insttype), .O(inst2_O));
assign O = inst2_O;
endmodule

module pico (input [15:0] data, output [7:0] addr, output [7:0] port, output  we, input [7:0] I, output [7:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_O;
wire  inst2_Q;
wire  inst3_arith;
wire  inst3_ioimm;
wire  inst3_ld;
wire  inst3_jump;
wire  inst3_regwr;
wire  inst3_zwr;
wire  inst3_owr;
wire [7:0] inst4_O;
wire [7:0] inst5_RDATA0;
wire [7:0] inst5_RDATA1;
wire [7:0] inst6_O;
wire [7:0] inst7_O;
wire [7:0] inst8_O;
wire  inst9_O;
wire  inst10_O;
wire  inst11_O;
SB_DFF inst0 (.C(CLK), .D(inst1_O), .Q(inst0_Q));
SB_LUT4 #(.LUT_INIT(16'h6666)) inst1 (.I0(inst0_Q), .I1(1'b1), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_DFFE inst2 (.C(CLK), .E(inst3_zwr), .D(inst11_O), .Q(inst2_Q));
InstructionDecoder inst3 (.inst(data), .phase(inst0_Q), .z(inst2_Q), .arith(inst3_arith), .ioimm(inst3_ioimm), .ld(inst3_ld), .jump(inst3_jump), .regwr(inst3_regwr), .zwr(inst3_zwr), .owr(inst3_owr));
Sequencer8 inst4 (.addr({data[7],data[6],data[5],data[4],data[3],data[2],data[1],data[0]}), .jump(inst3_jump), .we(inst0_Q), .O(inst4_O), .CLK(CLK));
DualRAM16x8 inst5 (.RADDR0({data[11],data[10],data[9],data[8]}), .RDATA0(inst5_RDATA0), .RADDR1({data[7],data[6],data[5],data[4]}), .RDATA1(inst5_RDATA1), .WADDR({data[11],data[10],data[9],data[8]}), .WDATA(inst8_O), .CLK(CLK), .WE(inst3_regwr));
ALU8 inst6 (.A(inst5_RDATA0), .B(inst5_RDATA1), .op({data[13],data[12]}), .insttype(inst3_arith), .O(inst6_O));
Mux2x8 inst7 (.I0(I), .I1({data[7],data[6],data[5],data[4],data[3],data[2],data[1],data[0]}), .S(inst3_ioimm), .O(inst7_O));
Mux2x8 inst8 (.I0(inst6_O), .I1(inst7_O), .S(inst3_ld), .O(inst8_O));
SB_LUT4 #(.LUT_INIT(16'h0001)) inst9 (.I0(inst6_O[0]), .I1(inst6_O[1]), .I2(inst6_O[2]), .I3(inst6_O[3]), .O(inst9_O));
SB_LUT4 #(.LUT_INIT(16'h0001)) inst10 (.I0(inst6_O[4]), .I1(inst6_O[5]), .I2(inst6_O[6]), .I3(inst6_O[7]), .O(inst10_O));
SB_LUT4 #(.LUT_INIT(16'h8888)) inst11 (.I0(inst9_O), .I1(inst10_O), .I2(1'b0), .I3(1'b0), .O(inst11_O));
assign addr = inst4_O;
assign port = {data[7],data[6],data[5],data[4],data[3],data[2],data[1],data[0]};
assign we = inst3_owr;
assign O = inst5_RDATA0;
endmodule

module main (input [7:0] J1, output [7:0] J3, input  CLKIN);
wire [15:0] inst0_RDATA;
wire [7:0] inst1_addr;
wire [7:0] inst1_port;
wire  inst1_we;
wire [7:0] inst1_O;
wire [7:0] inst2_O;
SB_RAM40_4K #(.INIT_0(256'h0000000000000000000000000000CF02B100C1055010B000C102501081018000),
.INIT_1(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_2(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_3(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_4(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_5(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_6(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_7(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_8(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_9(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_A(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_B(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_C(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_D(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_E(256'h0000000000000000000000000000000000000000000000000000000000000000),
.INIT_F(256'h0000000000000000000000000000000000000000000000000000000000000000),
.READ_MODE(0),
.WRITE_MODE(0)) inst0 (.RDATA(inst0_RDATA), .RADDR({1'b0,1'b0,1'b0,inst1_addr[7],inst1_addr[6],inst1_addr[5],inst1_addr[4],inst1_addr[3],inst1_addr[2],inst1_addr[1],inst1_addr[0]}), .RCLK(CLKIN), .RCLKE(1'b1), .RE(1'b1), .WCLK(CLKIN), .WCLKE(1'b0), .WE(1'b0), .WADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .MASK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
pico inst1 (.data(inst0_RDATA), .addr(inst1_addr), .port(inst1_port), .we(inst1_we), .I(J1), .O(inst1_O), .CLK(CLKIN));
Register8CE inst2 (.I(inst1_O), .O(inst2_O), .CLK(CLKIN), .CE(inst1_we));
assign J3 = inst2_O;
endmodule

