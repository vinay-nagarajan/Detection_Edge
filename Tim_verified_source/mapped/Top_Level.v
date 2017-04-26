/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Apr 25 20:21:16 2017
/////////////////////////////////////////////////////////////


module AHB ( clk, n_rst, hready, re, we, stop, raddr_ready, waddr_ready, waddr, 
        raddr, buffer2_data, hrdata, greyscale_data, haddr, hwdata, hwrite, 
        read_complete, write_complete, inc_raddr, inc_waddr );
  input [31:0] waddr;
  input [31:0] raddr;
  input [31:0] buffer2_data;
  input [31:0] hrdata;
  output [31:0] greyscale_data;
  output [31:0] haddr;
  output [31:0] hwdata;
  input clk, n_rst, hready, re, we, stop, raddr_ready, waddr_ready;
  output hwrite, read_complete, write_complete, inc_raddr, inc_waddr;
  wire   re_ff, we_ff, prev_hwrite, hready_ff, init, init2, raddr_ready_ff,
         waddr_ready_ff, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n75, n80, n81, n82, n83, n86, n87, n88, n91, n92, n93, n96, n97, n98,
         n101, n102, n103, n106, n107, n108, n111, n112, n113, n116, n117,
         n118, n121, n122, n123, n126, n127, n128, n131, n132, n133, n136,
         n137, n138, n141, n142, n143, n146, n147, n148, n151, n152, n153,
         n156, n157, n158, n161, n162, n163, n166, n167, n168, n171, n172,
         n173, n176, n177, n178, n181, n182, n183, n186, n187, n188, n191,
         n192, n193, n196, n197, n198, n201, n202, n203, n206, n207, n208,
         n211, n212, n213, n216, n217, n218, n221, n222, n223, n226, n227,
         n228, n231, n232, n233, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n272, n274, n275, n276, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n315, n318, n319, n323, n325, n327, n328, n331, n333, n334, n337,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n523, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n654, n687,
         n688, n689, n690, n691, n692, n693, n694, n2, n3, n4, n39, n74, n76,
         n77, n78, n79, n84, n85, n89, n90, n94, n95, n99, n100, n104, n105,
         n109, n110, n114, n115, n119, n120, n124, n125, n129, n130, n134,
         n135, n139, n140, n144, n145, n149, n150, n154, n155, n159, n160,
         n164, n165, n169, n170, n174, n175, n179, n180, n184, n185, n189,
         n190, n194, n195, n199, n200, n204, n205, n209, n210, n214, n215,
         n219, n220, n224, n225, n229, n230, n234, n235, n236, n237, n271,
         n273, n277, n314, n316, n317, n320, n321, n322, n324, n326, n329,
         n330, n332, n335, n336, n338, n348, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756;
  wire   [2:0] Q;
  wire   [31:0] prev_raddr;
  wire   [31:0] prev_waddr;

  DFFSR init_reg ( .D(1'b1), .CLK(clk), .R(n230), .S(1'b1), .Q(init) );
  DFFSR waddr_ready_ff_reg ( .D(n523), .CLK(clk), .R(n230), .S(1'b1), .Q(
        waddr_ready_ff) );
  DFFSR \Q_reg[0]  ( .D(n692), .CLK(clk), .R(n230), .S(1'b1), .Q(Q[0]) );
  DFFSR hwrite_reg ( .D(n39), .CLK(clk), .R(n230), .S(1'b1), .Q(hwrite) );
  DFFSR init2_reg ( .D(n687), .CLK(clk), .R(n230), .S(1'b1), .Q(init2) );
  DFFSR raddr_ready_ff_reg ( .D(n654), .CLK(clk), .R(n230), .S(1'b1), .Q(
        raddr_ready_ff) );
  DFFSR \Q_reg[2]  ( .D(n694), .CLK(clk), .R(n229), .S(1'b1), .Q(Q[2]) );
  DFFSR hready_ff_reg ( .D(n690), .CLK(clk), .R(n229), .S(1'b1), .Q(hready_ff)
         );
  DFFSR re_ff_reg ( .D(n693), .CLK(clk), .R(n229), .S(1'b1), .Q(re_ff) );
  DFFSR \Q_reg[1]  ( .D(n691), .CLK(clk), .R(n229), .S(1'b1), .Q(Q[1]) );
  DFFSR prev_hwrite_reg ( .D(n688), .CLK(clk), .R(n229), .S(1'b1), .Q(
        prev_hwrite) );
  DFFSR read_complete_reg ( .D(n671), .CLK(clk), .R(n229), .S(1'b1), .Q(
        read_complete) );
  DFFSR \greyscale_data_reg[31]  ( .D(n572), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[31]) );
  DFFSR \greyscale_data_reg[30]  ( .D(n573), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[30]) );
  DFFSR \greyscale_data_reg[29]  ( .D(n574), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[29]) );
  DFFSR \greyscale_data_reg[28]  ( .D(n575), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[28]) );
  DFFSR \greyscale_data_reg[27]  ( .D(n576), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[27]) );
  DFFSR \greyscale_data_reg[26]  ( .D(n577), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[26]) );
  DFFSR \greyscale_data_reg[25]  ( .D(n578), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[25]) );
  DFFSR \greyscale_data_reg[24]  ( .D(n579), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[24]) );
  DFFSR \greyscale_data_reg[23]  ( .D(n580), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[23]) );
  DFFSR \greyscale_data_reg[22]  ( .D(n581), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[22]) );
  DFFSR \greyscale_data_reg[21]  ( .D(n582), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[21]) );
  DFFSR \greyscale_data_reg[20]  ( .D(n583), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[20]) );
  DFFSR \greyscale_data_reg[19]  ( .D(n584), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[19]) );
  DFFSR \greyscale_data_reg[18]  ( .D(n585), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[18]) );
  DFFSR \greyscale_data_reg[17]  ( .D(n586), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[17]) );
  DFFSR \greyscale_data_reg[16]  ( .D(n587), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[16]) );
  DFFSR \greyscale_data_reg[15]  ( .D(n588), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[15]) );
  DFFSR \greyscale_data_reg[14]  ( .D(n589), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[14]) );
  DFFSR \greyscale_data_reg[13]  ( .D(n622), .CLK(clk), .R(n224), .S(1'b1), 
        .Q(greyscale_data[13]) );
  DFFSR \greyscale_data_reg[12]  ( .D(n623), .CLK(clk), .R(n224), .S(1'b1), 
        .Q(greyscale_data[12]) );
  DFFSR \greyscale_data_reg[11]  ( .D(n624), .CLK(clk), .R(n224), .S(1'b1), 
        .Q(greyscale_data[11]) );
  DFFSR \greyscale_data_reg[10]  ( .D(n625), .CLK(clk), .R(n224), .S(1'b1), 
        .Q(greyscale_data[10]) );
  DFFSR \greyscale_data_reg[9]  ( .D(n626), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[9]) );
  DFFSR \greyscale_data_reg[8]  ( .D(n627), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[8]) );
  DFFSR \greyscale_data_reg[7]  ( .D(n628), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[7]) );
  DFFSR \greyscale_data_reg[6]  ( .D(n629), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[6]) );
  DFFSR \greyscale_data_reg[5]  ( .D(n630), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[5]) );
  DFFSR \greyscale_data_reg[4]  ( .D(n631), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[4]) );
  DFFSR \greyscale_data_reg[3]  ( .D(n632), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[3]) );
  DFFSR \greyscale_data_reg[2]  ( .D(n633), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[2]) );
  DFFSR \greyscale_data_reg[1]  ( .D(n634), .CLK(clk), .R(n220), .S(1'b1), .Q(
        greyscale_data[1]) );
  DFFSR \greyscale_data_reg[0]  ( .D(n635), .CLK(clk), .R(n220), .S(1'b1), .Q(
        greyscale_data[0]) );
  DFFSR we_ff_reg ( .D(n689), .CLK(clk), .R(n220), .S(1'b1), .Q(we_ff) );
  DFFSR \hwdata_reg[31]  ( .D(n638), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[31]) );
  DFFSR \hwdata_reg[30]  ( .D(n639), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[30]) );
  DFFSR \hwdata_reg[29]  ( .D(n640), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[29]) );
  DFFSR \hwdata_reg[28]  ( .D(n641), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[28]) );
  DFFSR \hwdata_reg[27]  ( .D(n642), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[27]) );
  DFFSR \hwdata_reg[26]  ( .D(n643), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[26]) );
  DFFSR \hwdata_reg[25]  ( .D(n644), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[25]) );
  DFFSR \hwdata_reg[24]  ( .D(n645), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[24]) );
  DFFSR \hwdata_reg[23]  ( .D(n646), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[23]) );
  DFFSR \hwdata_reg[22]  ( .D(n647), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[22]) );
  DFFSR \hwdata_reg[21]  ( .D(n648), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[21]) );
  DFFSR \hwdata_reg[20]  ( .D(n649), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[20]) );
  DFFSR \hwdata_reg[19]  ( .D(n650), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[19]) );
  DFFSR \hwdata_reg[18]  ( .D(n651), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[18]) );
  DFFSR \hwdata_reg[17]  ( .D(n652), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[17]) );
  DFFSR \hwdata_reg[16]  ( .D(n653), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[16]) );
  DFFSR \hwdata_reg[15]  ( .D(n655), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[15]) );
  DFFSR \hwdata_reg[14]  ( .D(n656), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[14]) );
  DFFSR \hwdata_reg[13]  ( .D(n657), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[13]) );
  DFFSR \hwdata_reg[12]  ( .D(n658), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[12]) );
  DFFSR \hwdata_reg[11]  ( .D(n659), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[11]) );
  DFFSR \hwdata_reg[10]  ( .D(n660), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[10]) );
  DFFSR \hwdata_reg[9]  ( .D(n661), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[9]) );
  DFFSR \hwdata_reg[8]  ( .D(n662), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[8]) );
  DFFSR \hwdata_reg[7]  ( .D(n663), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[7]) );
  DFFSR \hwdata_reg[6]  ( .D(n664), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[6]) );
  DFFSR \hwdata_reg[5]  ( .D(n665), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[5]) );
  DFFSR \hwdata_reg[4]  ( .D(n666), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[4]) );
  DFFSR \hwdata_reg[3]  ( .D(n667), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[3]) );
  DFFSR \hwdata_reg[2]  ( .D(n668), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[2]) );
  DFFSR \hwdata_reg[1]  ( .D(n669), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[1]) );
  DFFSR \hwdata_reg[0]  ( .D(n670), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[0]) );
  DFFSR \prev_waddr_reg[31]  ( .D(n536), .CLK(clk), .R(n215), .S(1'b1), .Q(
        prev_waddr[31]) );
  DFFSR \prev_waddr_reg[0]  ( .D(n539), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[0]) );
  DFFSR \prev_waddr_reg[1]  ( .D(n540), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[1]) );
  DFFSR \prev_waddr_reg[2]  ( .D(n541), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[2]) );
  DFFSR \prev_waddr_reg[3]  ( .D(n542), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[3]) );
  DFFSR \prev_waddr_reg[4]  ( .D(n543), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[4]) );
  DFFSR \prev_waddr_reg[5]  ( .D(n544), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[5]) );
  DFFSR \prev_waddr_reg[6]  ( .D(n545), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[6]) );
  DFFSR \prev_waddr_reg[7]  ( .D(n546), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[7]) );
  DFFSR \prev_waddr_reg[8]  ( .D(n547), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[8]) );
  DFFSR \prev_waddr_reg[9]  ( .D(n548), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[9]) );
  DFFSR \prev_waddr_reg[10]  ( .D(n549), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[10]) );
  DFFSR \prev_waddr_reg[11]  ( .D(n550), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[11]) );
  DFFSR \prev_waddr_reg[12]  ( .D(n551), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[12]) );
  DFFSR \prev_waddr_reg[13]  ( .D(n552), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[13]) );
  DFFSR \prev_waddr_reg[14]  ( .D(n553), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[14]) );
  DFFSR \prev_waddr_reg[15]  ( .D(n554), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[15]) );
  DFFSR \prev_waddr_reg[16]  ( .D(n555), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[16]) );
  DFFSR \prev_waddr_reg[17]  ( .D(n556), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[17]) );
  DFFSR \prev_waddr_reg[18]  ( .D(n557), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[18]) );
  DFFSR \prev_waddr_reg[19]  ( .D(n558), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[19]) );
  DFFSR \prev_waddr_reg[20]  ( .D(n559), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[20]) );
  DFFSR \prev_waddr_reg[21]  ( .D(n560), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[21]) );
  DFFSR \prev_waddr_reg[22]  ( .D(n561), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[22]) );
  DFFSR \prev_waddr_reg[23]  ( .D(n562), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[23]) );
  DFFSR \prev_waddr_reg[24]  ( .D(n563), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[24]) );
  DFFSR \prev_waddr_reg[25]  ( .D(n564), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[25]) );
  DFFSR \prev_waddr_reg[26]  ( .D(n565), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[26]) );
  DFFSR \prev_waddr_reg[27]  ( .D(n566), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[27]) );
  DFFSR \prev_waddr_reg[28]  ( .D(n567), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[28]) );
  DFFSR \prev_waddr_reg[29]  ( .D(n538), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[29]) );
  DFFSR \prev_waddr_reg[30]  ( .D(n537), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[30]) );
  DFFSR write_complete_reg ( .D(n4), .CLK(clk), .R(n209), .S(1'b1), .Q(
        write_complete) );
  DFFSR \prev_raddr_reg[31]  ( .D(n235), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_raddr[31]) );
  DFFSR \haddr_reg[31]  ( .D(n590), .CLK(clk), .R(n209), .S(1'b1), .Q(
        haddr[31]) );
  DFFSR \prev_raddr_reg[30]  ( .D(n236), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_raddr[30]) );
  DFFSR \haddr_reg[30]  ( .D(n591), .CLK(clk), .R(n209), .S(1'b1), .Q(
        haddr[30]) );
  DFFSR \prev_raddr_reg[29]  ( .D(n237), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[29]) );
  DFFSR \haddr_reg[29]  ( .D(n592), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[29]) );
  DFFSR \prev_raddr_reg[28]  ( .D(n534), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[28]) );
  DFFSR \haddr_reg[28]  ( .D(n593), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[28]) );
  DFFSR \prev_raddr_reg[27]  ( .D(n533), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[27]) );
  DFFSR \haddr_reg[27]  ( .D(n594), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[27]) );
  DFFSR \prev_raddr_reg[26]  ( .D(n532), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[26]) );
  DFFSR \haddr_reg[26]  ( .D(n595), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[26]) );
  DFFSR \prev_raddr_reg[25]  ( .D(n531), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[25]) );
  DFFSR \haddr_reg[25]  ( .D(n596), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[25]) );
  DFFSR \prev_raddr_reg[24]  ( .D(n530), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[24]) );
  DFFSR \haddr_reg[24]  ( .D(n597), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[24]) );
  DFFSR \prev_raddr_reg[23]  ( .D(n529), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[23]) );
  DFFSR \haddr_reg[23]  ( .D(n598), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[23]) );
  DFFSR \prev_raddr_reg[22]  ( .D(n528), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[22]) );
  DFFSR \haddr_reg[22]  ( .D(n599), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[22]) );
  DFFSR \prev_raddr_reg[21]  ( .D(n527), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[21]) );
  DFFSR \haddr_reg[21]  ( .D(n600), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[21]) );
  DFFSR \prev_raddr_reg[20]  ( .D(n526), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[20]) );
  DFFSR \haddr_reg[20]  ( .D(n601), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[20]) );
  DFFSR \prev_raddr_reg[19]  ( .D(n525), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[19]) );
  DFFSR \haddr_reg[19]  ( .D(n602), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[19]) );
  DFFSR \prev_raddr_reg[18]  ( .D(n524), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[18]) );
  DFFSR \haddr_reg[18]  ( .D(n603), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[18]) );
  DFFSR \prev_raddr_reg[17]  ( .D(n348), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[17]) );
  DFFSR \haddr_reg[17]  ( .D(n604), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[17]) );
  DFFSR \prev_raddr_reg[16]  ( .D(n338), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[16]) );
  DFFSR \haddr_reg[16]  ( .D(n605), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[16]) );
  DFFSR \prev_raddr_reg[15]  ( .D(n336), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[15]) );
  DFFSR \haddr_reg[15]  ( .D(n606), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[15]) );
  DFFSR \prev_raddr_reg[14]  ( .D(n335), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[14]) );
  DFFSR \haddr_reg[14]  ( .D(n607), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[14]) );
  DFFSR \prev_raddr_reg[13]  ( .D(n332), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[13]) );
  DFFSR \haddr_reg[13]  ( .D(n608), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[13]) );
  DFFSR \prev_raddr_reg[12]  ( .D(n330), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[12]) );
  DFFSR \haddr_reg[12]  ( .D(n609), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[12]) );
  DFFSR \prev_raddr_reg[11]  ( .D(n329), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[11]) );
  DFFSR \haddr_reg[11]  ( .D(n610), .CLK(clk), .R(n199), .S(1'b1), .Q(
        haddr[11]) );
  DFFSR \prev_raddr_reg[10]  ( .D(n326), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[10]) );
  DFFSR \haddr_reg[10]  ( .D(n611), .CLK(clk), .R(n199), .S(1'b1), .Q(
        haddr[10]) );
  DFFSR \prev_raddr_reg[9]  ( .D(n324), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[9]) );
  DFFSR \haddr_reg[9]  ( .D(n612), .CLK(clk), .R(n199), .S(1'b1), .Q(haddr[9])
         );
  DFFSR \prev_raddr_reg[8]  ( .D(n322), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[8]) );
  DFFSR \haddr_reg[8]  ( .D(n613), .CLK(clk), .R(n199), .S(1'b1), .Q(haddr[8])
         );
  DFFSR \prev_raddr_reg[7]  ( .D(n321), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[7]) );
  DFFSR \haddr_reg[7]  ( .D(n614), .CLK(clk), .R(n199), .S(1'b1), .Q(haddr[7])
         );
  DFFSR \prev_raddr_reg[6]  ( .D(n320), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[6]) );
  DFFSR \haddr_reg[6]  ( .D(n615), .CLK(clk), .R(n199), .S(1'b1), .Q(haddr[6])
         );
  DFFSR \prev_raddr_reg[5]  ( .D(n317), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[5]) );
  DFFSR \haddr_reg[5]  ( .D(n616), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[5])
         );
  DFFSR \prev_raddr_reg[4]  ( .D(n316), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[4]) );
  DFFSR \haddr_reg[4]  ( .D(n617), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[4])
         );
  DFFSR \prev_raddr_reg[3]  ( .D(n314), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[3]) );
  DFFSR \haddr_reg[3]  ( .D(n618), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[3])
         );
  DFFSR \prev_raddr_reg[2]  ( .D(n277), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[2]) );
  DFFSR \haddr_reg[2]  ( .D(n619), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[2])
         );
  DFFSR \prev_raddr_reg[1]  ( .D(n273), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[1]) );
  DFFSR \haddr_reg[1]  ( .D(n620), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[1])
         );
  DFFSR \prev_raddr_reg[0]  ( .D(n271), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[0]) );
  DFFSR \haddr_reg[0]  ( .D(n621), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[0])
         );
  OAI21X1 U4 ( .A(n164), .B(n571), .C(n535), .Y(n523) );
  AOI22X1 U7 ( .A(hwdata[31]), .B(n175), .C(buffer2_data[31]), .D(n160), .Y(n5) );
  AOI22X1 U9 ( .A(hwdata[30]), .B(n165), .C(buffer2_data[30]), .D(n160), .Y(n7) );
  AOI22X1 U11 ( .A(hwdata[29]), .B(n165), .C(buffer2_data[29]), .D(n160), .Y(
        n8) );
  AOI22X1 U13 ( .A(hwdata[28]), .B(n165), .C(buffer2_data[28]), .D(n160), .Y(
        n9) );
  AOI22X1 U15 ( .A(hwdata[27]), .B(n169), .C(buffer2_data[27]), .D(n160), .Y(
        n10) );
  AOI22X1 U17 ( .A(hwdata[26]), .B(n169), .C(buffer2_data[26]), .D(n160), .Y(
        n11) );
  AOI22X1 U19 ( .A(hwdata[25]), .B(n169), .C(buffer2_data[25]), .D(n160), .Y(
        n12) );
  AOI22X1 U21 ( .A(hwdata[24]), .B(n170), .C(buffer2_data[24]), .D(n164), .Y(
        n13) );
  AOI22X1 U23 ( .A(hwdata[23]), .B(n170), .C(buffer2_data[23]), .D(n160), .Y(
        n14) );
  AOI22X1 U25 ( .A(hwdata[22]), .B(n170), .C(buffer2_data[22]), .D(n160), .Y(
        n15) );
  AOI22X1 U27 ( .A(hwdata[21]), .B(n174), .C(buffer2_data[21]), .D(n160), .Y(
        n16) );
  AOI22X1 U29 ( .A(hwdata[20]), .B(n174), .C(buffer2_data[20]), .D(n160), .Y(
        n17) );
  AOI22X1 U31 ( .A(hwdata[19]), .B(n174), .C(buffer2_data[19]), .D(n160), .Y(
        n18) );
  AOI22X1 U33 ( .A(hwdata[18]), .B(n174), .C(buffer2_data[18]), .D(n160), .Y(
        n19) );
  AOI22X1 U35 ( .A(hwdata[17]), .B(n174), .C(buffer2_data[17]), .D(n164), .Y(
        n20) );
  AOI22X1 U37 ( .A(hwdata[16]), .B(n174), .C(buffer2_data[16]), .D(n164), .Y(
        n21) );
  AOI22X1 U39 ( .A(hwdata[15]), .B(n174), .C(buffer2_data[15]), .D(n164), .Y(
        n22) );
  AOI22X1 U41 ( .A(hwdata[14]), .B(n175), .C(buffer2_data[14]), .D(n164), .Y(
        n23) );
  AOI22X1 U43 ( .A(hwdata[13]), .B(n175), .C(buffer2_data[13]), .D(n164), .Y(
        n24) );
  AOI22X1 U45 ( .A(hwdata[12]), .B(n175), .C(buffer2_data[12]), .D(n164), .Y(
        n25) );
  AOI22X1 U47 ( .A(hwdata[11]), .B(n175), .C(buffer2_data[11]), .D(n164), .Y(
        n26) );
  AOI22X1 U49 ( .A(hwdata[10]), .B(n175), .C(buffer2_data[10]), .D(n164), .Y(
        n27) );
  AOI22X1 U51 ( .A(hwdata[9]), .B(n175), .C(buffer2_data[9]), .D(n164), .Y(n28) );
  AOI22X1 U53 ( .A(hwdata[8]), .B(n179), .C(buffer2_data[8]), .D(n164), .Y(n29) );
  AOI22X1 U55 ( .A(hwdata[7]), .B(n179), .C(buffer2_data[7]), .D(n164), .Y(n30) );
  AOI22X1 U57 ( .A(hwdata[6]), .B(n179), .C(buffer2_data[6]), .D(n164), .Y(n31) );
  AOI22X1 U59 ( .A(hwdata[5]), .B(n179), .C(buffer2_data[5]), .D(n164), .Y(n32) );
  AOI22X1 U61 ( .A(hwdata[4]), .B(n179), .C(buffer2_data[4]), .D(n160), .Y(n33) );
  AOI22X1 U63 ( .A(hwdata[3]), .B(n179), .C(buffer2_data[3]), .D(n164), .Y(n34) );
  AOI22X1 U65 ( .A(hwdata[2]), .B(n179), .C(buffer2_data[2]), .D(n160), .Y(n35) );
  AOI22X1 U67 ( .A(hwdata[1]), .B(n180), .C(buffer2_data[1]), .D(n164), .Y(n36) );
  AOI22X1 U69 ( .A(hwdata[0]), .B(n180), .C(buffer2_data[0]), .D(n160), .Y(n37) );
  AOI22X1 U71 ( .A(greyscale_data[31]), .B(n145), .C(hrdata[31]), .D(n115), 
        .Y(n38) );
  AOI22X1 U73 ( .A(greyscale_data[30]), .B(n155), .C(hrdata[30]), .D(n115), 
        .Y(n41) );
  AOI22X1 U75 ( .A(greyscale_data[29]), .B(n155), .C(hrdata[29]), .D(n115), 
        .Y(n42) );
  AOI22X1 U77 ( .A(greyscale_data[28]), .B(n155), .C(hrdata[28]), .D(n115), 
        .Y(n43) );
  AOI22X1 U79 ( .A(greyscale_data[27]), .B(n155), .C(hrdata[27]), .D(n115), 
        .Y(n44) );
  AOI22X1 U81 ( .A(greyscale_data[26]), .B(n155), .C(hrdata[26]), .D(n115), 
        .Y(n45) );
  AOI22X1 U83 ( .A(greyscale_data[25]), .B(n155), .C(hrdata[25]), .D(n115), 
        .Y(n46) );
  AOI22X1 U85 ( .A(greyscale_data[24]), .B(n155), .C(hrdata[24]), .D(n115), 
        .Y(n47) );
  AOI22X1 U87 ( .A(greyscale_data[23]), .B(n154), .C(hrdata[23]), .D(n115), 
        .Y(n48) );
  AOI22X1 U89 ( .A(greyscale_data[22]), .B(n154), .C(hrdata[22]), .D(n115), 
        .Y(n49) );
  AOI22X1 U91 ( .A(greyscale_data[21]), .B(n154), .C(hrdata[21]), .D(n115), 
        .Y(n50) );
  AOI22X1 U93 ( .A(greyscale_data[20]), .B(n154), .C(hrdata[20]), .D(n115), 
        .Y(n51) );
  AOI22X1 U95 ( .A(greyscale_data[19]), .B(n154), .C(hrdata[19]), .D(n115), 
        .Y(n52) );
  AOI22X1 U97 ( .A(greyscale_data[18]), .B(n154), .C(hrdata[18]), .D(n119), 
        .Y(n53) );
  AOI22X1 U99 ( .A(greyscale_data[17]), .B(n154), .C(hrdata[17]), .D(n119), 
        .Y(n54) );
  AOI22X1 U101 ( .A(greyscale_data[16]), .B(n150), .C(hrdata[16]), .D(n119), 
        .Y(n55) );
  AOI22X1 U103 ( .A(greyscale_data[15]), .B(n150), .C(hrdata[15]), .D(n119), 
        .Y(n56) );
  AOI22X1 U105 ( .A(greyscale_data[14]), .B(n150), .C(hrdata[14]), .D(n119), 
        .Y(n57) );
  AOI22X1 U107 ( .A(greyscale_data[13]), .B(n150), .C(hrdata[13]), .D(n119), 
        .Y(n58) );
  AOI22X1 U109 ( .A(greyscale_data[12]), .B(n150), .C(hrdata[12]), .D(n119), 
        .Y(n59) );
  AOI22X1 U111 ( .A(greyscale_data[11]), .B(n150), .C(hrdata[11]), .D(n119), 
        .Y(n60) );
  AOI22X1 U113 ( .A(greyscale_data[10]), .B(n150), .C(hrdata[10]), .D(n119), 
        .Y(n61) );
  AOI22X1 U115 ( .A(greyscale_data[9]), .B(n149), .C(hrdata[9]), .D(n119), .Y(
        n62) );
  AOI22X1 U117 ( .A(greyscale_data[8]), .B(n149), .C(hrdata[8]), .D(n119), .Y(
        n63) );
  AOI22X1 U119 ( .A(greyscale_data[7]), .B(n149), .C(hrdata[7]), .D(n119), .Y(
        n64) );
  AOI22X1 U121 ( .A(greyscale_data[6]), .B(n149), .C(hrdata[6]), .D(n119), .Y(
        n65) );
  AOI22X1 U123 ( .A(greyscale_data[5]), .B(n149), .C(hrdata[5]), .D(n120), .Y(
        n66) );
  AOI22X1 U125 ( .A(greyscale_data[4]), .B(n149), .C(hrdata[4]), .D(n120), .Y(
        n67) );
  AOI22X1 U127 ( .A(greyscale_data[3]), .B(n149), .C(hrdata[3]), .D(n120), .Y(
        n68) );
  AOI22X1 U129 ( .A(greyscale_data[2]), .B(n145), .C(hrdata[2]), .D(n120), .Y(
        n69) );
  AOI22X1 U131 ( .A(greyscale_data[1]), .B(n145), .C(hrdata[1]), .D(n120), .Y(
        n70) );
  AOI22X1 U133 ( .A(greyscale_data[0]), .B(n145), .C(hrdata[0]), .D(n120), .Y(
        n71) );
  NAND2X1 U134 ( .A(n72), .B(n73), .Y(n590) );
  AOI21X1 U135 ( .A(haddr[31]), .B(n74), .C(n75), .Y(n73) );
  OAI22X1 U136 ( .A(n110), .B(n682), .C(n105), .D(n722), .Y(n75) );
  AOI22X1 U139 ( .A(waddr[31]), .B(n4), .C(raddr[31]), .D(n100), .Y(n72) );
  NAND2X1 U140 ( .A(n81), .B(n82), .Y(n591) );
  AOI21X1 U141 ( .A(haddr[30]), .B(n74), .C(n83), .Y(n82) );
  OAI22X1 U142 ( .A(n110), .B(n721), .C(n105), .D(n723), .Y(n83) );
  AOI22X1 U145 ( .A(waddr[30]), .B(n4), .C(raddr[30]), .D(n100), .Y(n81) );
  NAND2X1 U146 ( .A(n86), .B(n87), .Y(n592) );
  AOI21X1 U147 ( .A(haddr[29]), .B(n74), .C(n88), .Y(n87) );
  OAI22X1 U148 ( .A(n110), .B(n720), .C(n109), .D(n724), .Y(n88) );
  AOI22X1 U151 ( .A(waddr[29]), .B(n4), .C(raddr[29]), .D(n80), .Y(n86) );
  NAND2X1 U152 ( .A(n91), .B(n92), .Y(n593) );
  AOI21X1 U153 ( .A(haddr[28]), .B(n74), .C(n93), .Y(n92) );
  OAI22X1 U154 ( .A(n110), .B(n719), .C(n109), .D(n725), .Y(n93) );
  AOI22X1 U157 ( .A(waddr[28]), .B(n4), .C(raddr[28]), .D(n80), .Y(n91) );
  NAND2X1 U158 ( .A(n96), .B(n97), .Y(n594) );
  AOI21X1 U159 ( .A(haddr[27]), .B(n74), .C(n98), .Y(n97) );
  OAI22X1 U160 ( .A(n110), .B(n718), .C(n109), .D(n726), .Y(n98) );
  AOI22X1 U163 ( .A(waddr[27]), .B(n4), .C(raddr[27]), .D(n80), .Y(n96) );
  NAND2X1 U164 ( .A(n101), .B(n102), .Y(n595) );
  AOI21X1 U165 ( .A(haddr[26]), .B(n74), .C(n103), .Y(n102) );
  OAI22X1 U166 ( .A(n110), .B(n717), .C(n109), .D(n727), .Y(n103) );
  AOI22X1 U169 ( .A(waddr[26]), .B(n4), .C(raddr[26]), .D(n80), .Y(n101) );
  NAND2X1 U170 ( .A(n106), .B(n107), .Y(n596) );
  AOI21X1 U171 ( .A(haddr[25]), .B(n74), .C(n108), .Y(n107) );
  OAI22X1 U172 ( .A(n110), .B(n716), .C(n105), .D(n728), .Y(n108) );
  AOI22X1 U175 ( .A(waddr[25]), .B(n4), .C(raddr[25]), .D(n100), .Y(n106) );
  NAND2X1 U176 ( .A(n111), .B(n112), .Y(n597) );
  AOI21X1 U177 ( .A(haddr[24]), .B(n637), .C(n113), .Y(n112) );
  OAI22X1 U178 ( .A(n110), .B(n715), .C(n105), .D(n729), .Y(n113) );
  AOI22X1 U181 ( .A(waddr[24]), .B(n4), .C(raddr[24]), .D(n100), .Y(n111) );
  NAND2X1 U182 ( .A(n116), .B(n117), .Y(n598) );
  AOI21X1 U183 ( .A(haddr[23]), .B(n74), .C(n118), .Y(n117) );
  OAI22X1 U184 ( .A(n110), .B(n714), .C(n109), .D(n730), .Y(n118) );
  AOI22X1 U187 ( .A(waddr[23]), .B(n4), .C(raddr[23]), .D(n80), .Y(n116) );
  NAND2X1 U188 ( .A(n121), .B(n122), .Y(n599) );
  AOI21X1 U189 ( .A(haddr[22]), .B(n74), .C(n123), .Y(n122) );
  OAI22X1 U190 ( .A(n110), .B(n713), .C(n109), .D(n731), .Y(n123) );
  AOI22X1 U193 ( .A(waddr[22]), .B(n4), .C(raddr[22]), .D(n80), .Y(n121) );
  NAND2X1 U194 ( .A(n126), .B(n127), .Y(n600) );
  AOI21X1 U195 ( .A(haddr[21]), .B(n74), .C(n128), .Y(n127) );
  OAI22X1 U196 ( .A(n110), .B(n712), .C(n109), .D(n732), .Y(n128) );
  AOI22X1 U199 ( .A(waddr[21]), .B(n4), .C(raddr[21]), .D(n80), .Y(n126) );
  NAND2X1 U200 ( .A(n131), .B(n132), .Y(n601) );
  AOI21X1 U201 ( .A(haddr[20]), .B(n74), .C(n133), .Y(n132) );
  OAI22X1 U202 ( .A(n110), .B(n711), .C(n109), .D(n733), .Y(n133) );
  AOI22X1 U205 ( .A(waddr[20]), .B(n4), .C(raddr[20]), .D(n80), .Y(n131) );
  NAND2X1 U206 ( .A(n136), .B(n137), .Y(n602) );
  AOI21X1 U207 ( .A(haddr[19]), .B(n74), .C(n138), .Y(n137) );
  OAI22X1 U208 ( .A(n110), .B(n710), .C(n109), .D(n734), .Y(n138) );
  AOI22X1 U211 ( .A(waddr[19]), .B(n4), .C(raddr[19]), .D(n80), .Y(n136) );
  NAND2X1 U212 ( .A(n141), .B(n142), .Y(n603) );
  AOI21X1 U213 ( .A(haddr[18]), .B(n74), .C(n143), .Y(n142) );
  OAI22X1 U214 ( .A(n110), .B(n709), .C(n109), .D(n735), .Y(n143) );
  AOI22X1 U217 ( .A(waddr[18]), .B(n39), .C(raddr[18]), .D(n100), .Y(n141) );
  NAND2X1 U218 ( .A(n146), .B(n147), .Y(n604) );
  AOI21X1 U219 ( .A(haddr[17]), .B(n74), .C(n148), .Y(n147) );
  OAI22X1 U220 ( .A(n110), .B(n708), .C(n109), .D(n736), .Y(n148) );
  AOI22X1 U223 ( .A(waddr[17]), .B(n39), .C(raddr[17]), .D(n80), .Y(n146) );
  NAND2X1 U224 ( .A(n151), .B(n152), .Y(n605) );
  AOI21X1 U225 ( .A(haddr[16]), .B(n74), .C(n153), .Y(n152) );
  OAI22X1 U226 ( .A(n110), .B(n707), .C(n109), .D(n737), .Y(n153) );
  AOI22X1 U229 ( .A(waddr[16]), .B(n39), .C(raddr[16]), .D(n100), .Y(n151) );
  NAND2X1 U230 ( .A(n156), .B(n157), .Y(n606) );
  AOI21X1 U231 ( .A(haddr[15]), .B(n74), .C(n158), .Y(n157) );
  OAI22X1 U232 ( .A(n110), .B(n706), .C(n109), .D(n738), .Y(n158) );
  AOI22X1 U235 ( .A(waddr[15]), .B(n39), .C(raddr[15]), .D(n80), .Y(n156) );
  NAND2X1 U236 ( .A(n161), .B(n162), .Y(n607) );
  AOI21X1 U237 ( .A(haddr[14]), .B(n74), .C(n163), .Y(n162) );
  OAI22X1 U238 ( .A(n110), .B(n705), .C(n109), .D(n739), .Y(n163) );
  AOI22X1 U241 ( .A(waddr[14]), .B(n39), .C(raddr[14]), .D(n100), .Y(n161) );
  NAND2X1 U242 ( .A(n166), .B(n167), .Y(n608) );
  AOI21X1 U243 ( .A(haddr[13]), .B(n74), .C(n168), .Y(n167) );
  OAI22X1 U244 ( .A(n110), .B(n704), .C(n109), .D(n740), .Y(n168) );
  AOI22X1 U247 ( .A(waddr[13]), .B(n39), .C(raddr[13]), .D(n80), .Y(n166) );
  NAND2X1 U248 ( .A(n171), .B(n172), .Y(n609) );
  AOI21X1 U249 ( .A(haddr[12]), .B(n74), .C(n173), .Y(n172) );
  OAI22X1 U250 ( .A(n110), .B(n703), .C(n109), .D(n741), .Y(n173) );
  AOI22X1 U253 ( .A(waddr[12]), .B(n39), .C(raddr[12]), .D(n100), .Y(n171) );
  NAND2X1 U254 ( .A(n176), .B(n177), .Y(n610) );
  AOI21X1 U255 ( .A(haddr[11]), .B(n74), .C(n178), .Y(n177) );
  OAI22X1 U256 ( .A(n110), .B(n702), .C(n105), .D(n742), .Y(n178) );
  AOI22X1 U259 ( .A(waddr[11]), .B(n39), .C(raddr[11]), .D(n100), .Y(n176) );
  NAND2X1 U260 ( .A(n181), .B(n182), .Y(n611) );
  AOI21X1 U261 ( .A(haddr[10]), .B(n74), .C(n183), .Y(n182) );
  OAI22X1 U262 ( .A(n110), .B(n701), .C(n105), .D(n743), .Y(n183) );
  AOI22X1 U265 ( .A(waddr[10]), .B(n39), .C(raddr[10]), .D(n100), .Y(n181) );
  NAND2X1 U266 ( .A(n186), .B(n187), .Y(n612) );
  AOI21X1 U267 ( .A(haddr[9]), .B(n74), .C(n188), .Y(n187) );
  OAI22X1 U268 ( .A(n110), .B(n700), .C(n105), .D(n744), .Y(n188) );
  AOI22X1 U271 ( .A(waddr[9]), .B(n39), .C(raddr[9]), .D(n100), .Y(n186) );
  NAND2X1 U272 ( .A(n191), .B(n192), .Y(n613) );
  AOI21X1 U273 ( .A(haddr[8]), .B(n74), .C(n193), .Y(n192) );
  OAI22X1 U274 ( .A(n110), .B(n699), .C(n105), .D(n745), .Y(n193) );
  AOI22X1 U277 ( .A(waddr[8]), .B(n39), .C(raddr[8]), .D(n100), .Y(n191) );
  NAND2X1 U278 ( .A(n196), .B(n197), .Y(n614) );
  AOI21X1 U279 ( .A(haddr[7]), .B(n74), .C(n198), .Y(n197) );
  OAI22X1 U280 ( .A(n114), .B(n698), .C(n105), .D(n746), .Y(n198) );
  AOI22X1 U283 ( .A(waddr[7]), .B(n39), .C(raddr[7]), .D(n100), .Y(n196) );
  NAND2X1 U284 ( .A(n201), .B(n202), .Y(n615) );
  AOI21X1 U285 ( .A(haddr[6]), .B(n74), .C(n203), .Y(n202) );
  OAI22X1 U286 ( .A(n114), .B(n697), .C(n105), .D(n747), .Y(n203) );
  AOI22X1 U289 ( .A(waddr[6]), .B(n39), .C(raddr[6]), .D(n100), .Y(n201) );
  NAND2X1 U290 ( .A(n206), .B(n207), .Y(n616) );
  AOI21X1 U291 ( .A(haddr[5]), .B(n74), .C(n208), .Y(n207) );
  OAI22X1 U292 ( .A(n114), .B(n696), .C(n105), .D(n748), .Y(n208) );
  AOI22X1 U295 ( .A(waddr[5]), .B(n39), .C(raddr[5]), .D(n100), .Y(n206) );
  NAND2X1 U296 ( .A(n211), .B(n212), .Y(n617) );
  AOI21X1 U297 ( .A(haddr[4]), .B(n637), .C(n213), .Y(n212) );
  OAI22X1 U298 ( .A(n114), .B(n695), .C(n105), .D(n749), .Y(n213) );
  AOI22X1 U301 ( .A(waddr[4]), .B(n4), .C(raddr[4]), .D(n100), .Y(n211) );
  NAND2X1 U302 ( .A(n216), .B(n217), .Y(n618) );
  AOI21X1 U303 ( .A(haddr[3]), .B(n74), .C(n218), .Y(n217) );
  OAI22X1 U304 ( .A(n114), .B(n686), .C(n105), .D(n750), .Y(n218) );
  AOI22X1 U307 ( .A(waddr[3]), .B(n4), .C(raddr[3]), .D(n100), .Y(n216) );
  NAND2X1 U308 ( .A(n221), .B(n222), .Y(n619) );
  AOI21X1 U309 ( .A(haddr[2]), .B(n637), .C(n223), .Y(n222) );
  OAI22X1 U310 ( .A(n114), .B(n685), .C(n105), .D(n751), .Y(n223) );
  AOI22X1 U313 ( .A(waddr[2]), .B(n39), .C(raddr[2]), .D(n100), .Y(n221) );
  NAND2X1 U314 ( .A(n226), .B(n227), .Y(n620) );
  AOI21X1 U315 ( .A(haddr[1]), .B(n637), .C(n228), .Y(n227) );
  OAI22X1 U316 ( .A(n114), .B(n684), .C(n105), .D(n752), .Y(n228) );
  AOI22X1 U319 ( .A(waddr[1]), .B(n39), .C(raddr[1]), .D(n100), .Y(n226) );
  NAND2X1 U320 ( .A(n231), .B(n232), .Y(n621) );
  AOI21X1 U321 ( .A(haddr[0]), .B(n637), .C(n233), .Y(n232) );
  OAI22X1 U322 ( .A(n114), .B(n683), .C(n105), .D(n753), .Y(n233) );
  AOI22X1 U326 ( .A(waddr[0]), .B(n4), .C(raddr[0]), .D(n100), .Y(n231) );
  AOI22X1 U329 ( .A(n120), .B(raddr[0]), .C(n129), .D(prev_raddr[0]), .Y(n239)
         );
  AOI22X1 U331 ( .A(n120), .B(raddr[1]), .C(n129), .D(prev_raddr[1]), .Y(n240)
         );
  AOI22X1 U333 ( .A(n120), .B(raddr[2]), .C(n129), .D(prev_raddr[2]), .Y(n241)
         );
  AOI22X1 U335 ( .A(n120), .B(raddr[3]), .C(n130), .D(prev_raddr[3]), .Y(n242)
         );
  AOI22X1 U337 ( .A(n120), .B(raddr[4]), .C(n130), .D(prev_raddr[4]), .Y(n243)
         );
  AOI22X1 U339 ( .A(n120), .B(raddr[5]), .C(n130), .D(prev_raddr[5]), .Y(n244)
         );
  AOI22X1 U341 ( .A(n120), .B(raddr[6]), .C(n134), .D(prev_raddr[6]), .Y(n245)
         );
  AOI22X1 U343 ( .A(n124), .B(raddr[7]), .C(n134), .D(prev_raddr[7]), .Y(n246)
         );
  AOI22X1 U345 ( .A(n124), .B(raddr[8]), .C(n134), .D(prev_raddr[8]), .Y(n247)
         );
  AOI22X1 U347 ( .A(n124), .B(raddr[9]), .C(n135), .D(prev_raddr[9]), .Y(n248)
         );
  AOI22X1 U349 ( .A(n124), .B(raddr[10]), .C(n135), .D(prev_raddr[10]), .Y(
        n249) );
  AOI22X1 U351 ( .A(n124), .B(raddr[11]), .C(n135), .D(prev_raddr[11]), .Y(
        n250) );
  AOI22X1 U353 ( .A(n124), .B(raddr[12]), .C(n139), .D(prev_raddr[12]), .Y(
        n251) );
  AOI22X1 U355 ( .A(n124), .B(raddr[13]), .C(n139), .D(prev_raddr[13]), .Y(
        n252) );
  AOI22X1 U357 ( .A(n124), .B(raddr[14]), .C(n139), .D(prev_raddr[14]), .Y(
        n253) );
  AOI22X1 U359 ( .A(n124), .B(raddr[15]), .C(n140), .D(prev_raddr[15]), .Y(
        n254) );
  AOI22X1 U361 ( .A(n124), .B(raddr[16]), .C(n140), .D(prev_raddr[16]), .Y(
        n255) );
  AOI22X1 U363 ( .A(n124), .B(raddr[17]), .C(n140), .D(prev_raddr[17]), .Y(
        n256) );
  AOI22X1 U365 ( .A(n124), .B(raddr[18]), .C(n140), .D(prev_raddr[18]), .Y(
        n257) );
  AOI22X1 U367 ( .A(n124), .B(raddr[19]), .C(n140), .D(prev_raddr[19]), .Y(
        n258) );
  AOI22X1 U369 ( .A(n125), .B(raddr[20]), .C(n140), .D(prev_raddr[20]), .Y(
        n259) );
  AOI22X1 U371 ( .A(n125), .B(raddr[21]), .C(n140), .D(prev_raddr[21]), .Y(
        n260) );
  AOI22X1 U373 ( .A(n125), .B(raddr[22]), .C(n144), .D(prev_raddr[22]), .Y(
        n261) );
  AOI22X1 U375 ( .A(n125), .B(raddr[23]), .C(n144), .D(prev_raddr[23]), .Y(
        n262) );
  AOI22X1 U377 ( .A(n125), .B(raddr[24]), .C(n144), .D(prev_raddr[24]), .Y(
        n263) );
  AOI22X1 U379 ( .A(n125), .B(raddr[25]), .C(n144), .D(prev_raddr[25]), .Y(
        n264) );
  AOI22X1 U381 ( .A(n125), .B(raddr[26]), .C(n144), .D(prev_raddr[26]), .Y(
        n265) );
  AOI22X1 U383 ( .A(n125), .B(raddr[27]), .C(n144), .D(prev_raddr[27]), .Y(
        n266) );
  AOI22X1 U385 ( .A(n125), .B(raddr[28]), .C(n144), .D(prev_raddr[28]), .Y(
        n267) );
  AOI22X1 U387 ( .A(n125), .B(raddr[29]), .C(n145), .D(prev_raddr[29]), .Y(
        n268) );
  AOI22X1 U389 ( .A(n125), .B(raddr[30]), .C(n145), .D(prev_raddr[30]), .Y(
        n269) );
  AOI22X1 U391 ( .A(n125), .B(raddr[31]), .C(n145), .D(prev_raddr[31]), .Y(
        n270) );
  OAI21X1 U392 ( .A(n674), .B(n272), .C(n234), .Y(n654) );
  OAI21X1 U394 ( .A(n274), .B(n673), .C(n140), .Y(n272) );
  AOI22X1 U398 ( .A(n99), .B(waddr[30]), .C(prev_waddr[30]), .D(n79), .Y(n275)
         );
  AOI22X1 U400 ( .A(n99), .B(waddr[29]), .C(prev_waddr[29]), .D(n79), .Y(n278)
         );
  AOI22X1 U402 ( .A(n95), .B(waddr[28]), .C(prev_waddr[28]), .D(n79), .Y(n279)
         );
  AOI22X1 U404 ( .A(n95), .B(waddr[27]), .C(prev_waddr[27]), .D(n79), .Y(n280)
         );
  AOI22X1 U406 ( .A(n95), .B(waddr[26]), .C(prev_waddr[26]), .D(n79), .Y(n281)
         );
  AOI22X1 U408 ( .A(n95), .B(waddr[25]), .C(prev_waddr[25]), .D(n79), .Y(n282)
         );
  AOI22X1 U410 ( .A(n95), .B(waddr[24]), .C(prev_waddr[24]), .D(n78), .Y(n283)
         );
  AOI22X1 U412 ( .A(n95), .B(waddr[23]), .C(prev_waddr[23]), .D(n78), .Y(n284)
         );
  AOI22X1 U414 ( .A(n95), .B(waddr[22]), .C(prev_waddr[22]), .D(n78), .Y(n285)
         );
  AOI22X1 U416 ( .A(n94), .B(waddr[21]), .C(prev_waddr[21]), .D(n78), .Y(n286)
         );
  AOI22X1 U418 ( .A(n94), .B(waddr[20]), .C(prev_waddr[20]), .D(n78), .Y(n287)
         );
  AOI22X1 U420 ( .A(n94), .B(waddr[19]), .C(prev_waddr[19]), .D(n78), .Y(n288)
         );
  AOI22X1 U422 ( .A(n94), .B(waddr[18]), .C(prev_waddr[18]), .D(n78), .Y(n289)
         );
  AOI22X1 U424 ( .A(n94), .B(waddr[17]), .C(prev_waddr[17]), .D(n78), .Y(n290)
         );
  AOI22X1 U426 ( .A(n94), .B(waddr[16]), .C(prev_waddr[16]), .D(n78), .Y(n291)
         );
  AOI22X1 U428 ( .A(n94), .B(waddr[15]), .C(prev_waddr[15]), .D(n78), .Y(n292)
         );
  AOI22X1 U430 ( .A(n90), .B(waddr[14]), .C(prev_waddr[14]), .D(n78), .Y(n293)
         );
  AOI22X1 U432 ( .A(n90), .B(waddr[13]), .C(prev_waddr[13]), .D(n78), .Y(n294)
         );
  AOI22X1 U434 ( .A(n90), .B(waddr[12]), .C(prev_waddr[12]), .D(n78), .Y(n295)
         );
  AOI22X1 U436 ( .A(n90), .B(waddr[11]), .C(prev_waddr[11]), .D(n77), .Y(n296)
         );
  AOI22X1 U438 ( .A(n90), .B(waddr[10]), .C(prev_waddr[10]), .D(n77), .Y(n297)
         );
  AOI22X1 U440 ( .A(n90), .B(waddr[9]), .C(prev_waddr[9]), .D(n77), .Y(n298)
         );
  AOI22X1 U442 ( .A(n90), .B(waddr[8]), .C(prev_waddr[8]), .D(n77), .Y(n299)
         );
  AOI22X1 U444 ( .A(n89), .B(waddr[7]), .C(prev_waddr[7]), .D(n77), .Y(n300)
         );
  AOI22X1 U446 ( .A(n89), .B(waddr[6]), .C(prev_waddr[6]), .D(n77), .Y(n301)
         );
  AOI22X1 U448 ( .A(n89), .B(waddr[5]), .C(prev_waddr[5]), .D(n77), .Y(n302)
         );
  AOI22X1 U450 ( .A(n85), .B(waddr[4]), .C(prev_waddr[4]), .D(n77), .Y(n303)
         );
  AOI22X1 U452 ( .A(n85), .B(waddr[3]), .C(prev_waddr[3]), .D(n77), .Y(n304)
         );
  AOI22X1 U454 ( .A(n85), .B(waddr[2]), .C(prev_waddr[2]), .D(n77), .Y(n305)
         );
  AOI22X1 U456 ( .A(n84), .B(waddr[1]), .C(prev_waddr[1]), .D(n77), .Y(n306)
         );
  AOI22X1 U458 ( .A(n84), .B(waddr[0]), .C(prev_waddr[0]), .D(n77), .Y(n307)
         );
  AOI22X1 U460 ( .A(n84), .B(waddr[31]), .C(prev_waddr[31]), .D(n77), .Y(n308)
         );
  OAI21X1 U462 ( .A(n309), .B(n310), .C(n165), .Y(n276) );
  NAND2X1 U463 ( .A(init2), .B(n311), .Y(n310) );
  NAND2X1 U464 ( .A(n114), .B(n312), .Y(n309) );
  NAND2X1 U465 ( .A(init), .B(n313), .Y(n687) );
  OAI21X1 U466 ( .A(n671), .B(n274), .C(init2), .Y(n313) );
  OAI21X1 U467 ( .A(n311), .B(n680), .C(n315), .Y(n688) );
  NOR2X1 U468 ( .A(n672), .B(n671), .Y(n315) );
  OAI21X1 U470 ( .A(n160), .B(n681), .C(n755), .Y(n689) );
  NAND3X1 U473 ( .A(n312), .B(n318), .C(n319), .Y(n6) );
  OAI21X1 U475 ( .A(n311), .B(n677), .C(n756), .Y(n690) );
  OAI22X1 U477 ( .A(n679), .B(n323), .C(n568), .D(n325), .Y(n691) );
  OAI21X1 U478 ( .A(n636), .B(n323), .C(n327), .Y(n692) );
  OAI21X1 U479 ( .A(n328), .B(n675), .C(n569), .Y(n327) );
  NOR2X1 U481 ( .A(n570), .B(n333), .Y(n328) );
  OAI21X1 U483 ( .A(n125), .B(n678), .C(n754), .Y(n693) );
  NOR2X1 U485 ( .A(n274), .B(n672), .Y(n40) );
  NAND3X1 U487 ( .A(n238), .B(n114), .C(n311), .Y(n274) );
  OAI21X1 U489 ( .A(n676), .B(n323), .C(n339), .Y(n694) );
  NAND3X1 U490 ( .A(n568), .B(n331), .C(n569), .Y(n339) );
  NAND2X1 U492 ( .A(n340), .B(n323), .Y(n325) );
  OAI21X1 U494 ( .A(n342), .B(n343), .C(n637), .Y(n323) );
  NOR2X1 U496 ( .A(n340), .B(n342), .Y(n311) );
  NOR2X1 U498 ( .A(n341), .B(n344), .Y(n343) );
  OAI21X1 U499 ( .A(n680), .B(n681), .C(n331), .Y(n344) );
  NAND3X1 U500 ( .A(prev_hwrite), .B(raddr_ready_ff), .C(n345), .Y(n331) );
  NOR2X1 U501 ( .A(n677), .B(n678), .Y(n345) );
  NAND2X1 U506 ( .A(n333), .B(n334), .Y(n341) );
  NAND3X1 U507 ( .A(hready_ff), .B(we_ff), .C(n346), .Y(n334) );
  NOR2X1 U508 ( .A(prev_hwrite), .B(n571), .Y(n346) );
  NAND2X1 U510 ( .A(n347), .B(re_ff), .Y(n333) );
  NOR2X1 U511 ( .A(stop), .B(prev_hwrite), .Y(n347) );
  NOR2X1 U512 ( .A(n676), .B(n337), .Y(n342) );
  NOR2X1 U513 ( .A(Q[1]), .B(Q[0]), .Y(n337) );
  NAND2X1 U514 ( .A(init), .B(n238), .Y(inc_waddr) );
  NAND3X1 U515 ( .A(n636), .B(n676), .C(Q[1]), .Y(n238) );
  NAND2X1 U517 ( .A(n104), .B(init), .Y(inc_raddr) );
  OAI21X1 U519 ( .A(n318), .B(n673), .C(n312), .Y(n80) );
  NAND3X1 U520 ( .A(n679), .B(n676), .C(Q[0]), .Y(n312) );
  NAND3X1 U523 ( .A(Q[0]), .B(n676), .C(Q[1]), .Y(n318) );
  AND2X2 U474 ( .A(n114), .B(n311), .Y(n319) );
  AND2X2 U497 ( .A(n337), .B(n676), .Y(n340) );
  INVX2 U5 ( .A(n89), .Y(n77) );
  INVX1 U6 ( .A(n311), .Y(n637) );
  INVX2 U8 ( .A(n85), .Y(n78) );
  BUFX2 U10 ( .A(n6), .Y(n165) );
  AND2X1 U12 ( .A(n337), .B(Q[2]), .Y(n3) );
  INVX2 U14 ( .A(n135), .Y(n119) );
  INVX2 U16 ( .A(n139), .Y(n115) );
  INVX2 U18 ( .A(n134), .Y(n120) );
  INVX2 U20 ( .A(n130), .Y(n124) );
  INVX2 U22 ( .A(n129), .Y(n125) );
  BUFX2 U24 ( .A(n159), .Y(n140) );
  BUFX2 U26 ( .A(n159), .Y(n129) );
  BUFX2 U28 ( .A(n159), .Y(n130) );
  BUFX2 U30 ( .A(n159), .Y(n134) );
  BUFX2 U32 ( .A(n159), .Y(n135) );
  BUFX2 U34 ( .A(n159), .Y(n139) );
  BUFX2 U36 ( .A(n159), .Y(n144) );
  BUFX2 U38 ( .A(n159), .Y(n145) );
  BUFX2 U40 ( .A(n159), .Y(n149) );
  BUFX2 U42 ( .A(n159), .Y(n150) );
  BUFX2 U44 ( .A(n159), .Y(n154) );
  BUFX2 U46 ( .A(n159), .Y(n155) );
  INVX2 U48 ( .A(n76), .Y(n74) );
  INVX2 U50 ( .A(n637), .Y(n76) );
  INVX2 U52 ( .A(n169), .Y(n164) );
  INVX2 U54 ( .A(n170), .Y(n160) );
  INVX2 U56 ( .A(n40), .Y(n159) );
  BUFX2 U58 ( .A(n6), .Y(n170) );
  BUFX2 U60 ( .A(n6), .Y(n169) );
  BUFX2 U62 ( .A(n6), .Y(n179) );
  BUFX2 U64 ( .A(n6), .Y(n174) );
  BUFX2 U66 ( .A(n6), .Y(n175) );
  INVX2 U68 ( .A(n84), .Y(n79) );
  BUFX2 U70 ( .A(n6), .Y(n180) );
  INVX2 U72 ( .A(n104), .Y(n100) );
  INVX2 U74 ( .A(n238), .Y(n39) );
  INVX2 U76 ( .A(n238), .Y(n4) );
  INVX2 U78 ( .A(n2), .Y(n105) );
  INVX2 U80 ( .A(n2), .Y(n109) );
  BUFX2 U82 ( .A(n184), .Y(n195) );
  BUFX2 U84 ( .A(n184), .Y(n199) );
  BUFX2 U86 ( .A(n184), .Y(n200) );
  BUFX2 U88 ( .A(n185), .Y(n204) );
  BUFX2 U90 ( .A(n185), .Y(n205) );
  BUFX2 U92 ( .A(n185), .Y(n209) );
  BUFX2 U94 ( .A(n189), .Y(n210) );
  BUFX2 U96 ( .A(n189), .Y(n214) );
  BUFX2 U98 ( .A(n189), .Y(n215) );
  BUFX2 U100 ( .A(n190), .Y(n219) );
  BUFX2 U102 ( .A(n190), .Y(n220) );
  BUFX2 U104 ( .A(n190), .Y(n224) );
  BUFX2 U106 ( .A(n194), .Y(n225) );
  BUFX2 U108 ( .A(n194), .Y(n229) );
  BUFX2 U110 ( .A(n194), .Y(n230) );
  BUFX2 U112 ( .A(n276), .Y(n89) );
  BUFX2 U114 ( .A(n276), .Y(n85) );
  BUFX2 U116 ( .A(n276), .Y(n84) );
  BUFX2 U118 ( .A(n276), .Y(n95) );
  BUFX2 U120 ( .A(n276), .Y(n94) );
  BUFX2 U122 ( .A(n276), .Y(n90) );
  INVX2 U124 ( .A(n3), .Y(n114) );
  BUFX2 U126 ( .A(n276), .Y(n99) );
  AND2X2 U128 ( .A(n672), .B(n673), .Y(n2) );
  INVX2 U130 ( .A(n80), .Y(n104) );
  INVX2 U132 ( .A(n3), .Y(n110) );
  BUFX2 U137 ( .A(n_rst), .Y(n184) );
  BUFX2 U138 ( .A(n_rst), .Y(n185) );
  BUFX2 U143 ( .A(n_rst), .Y(n189) );
  BUFX2 U144 ( .A(n_rst), .Y(n190) );
  BUFX2 U149 ( .A(n_rst), .Y(n194) );
  INVX2 U150 ( .A(raddr_ready), .Y(n234) );
  INVX2 U155 ( .A(n270), .Y(n235) );
  INVX2 U156 ( .A(n269), .Y(n236) );
  INVX2 U161 ( .A(n268), .Y(n237) );
  INVX2 U162 ( .A(n239), .Y(n271) );
  INVX2 U167 ( .A(n240), .Y(n273) );
  INVX2 U168 ( .A(n241), .Y(n277) );
  INVX2 U173 ( .A(n242), .Y(n314) );
  INVX2 U174 ( .A(n243), .Y(n316) );
  INVX2 U179 ( .A(n244), .Y(n317) );
  INVX2 U180 ( .A(n245), .Y(n320) );
  INVX2 U185 ( .A(n246), .Y(n321) );
  INVX2 U186 ( .A(n247), .Y(n322) );
  INVX2 U191 ( .A(n248), .Y(n324) );
  INVX2 U192 ( .A(n249), .Y(n326) );
  INVX2 U197 ( .A(n250), .Y(n329) );
  INVX2 U198 ( .A(n251), .Y(n330) );
  INVX2 U203 ( .A(n252), .Y(n332) );
  INVX2 U204 ( .A(n253), .Y(n335) );
  INVX2 U209 ( .A(n254), .Y(n336) );
  INVX2 U210 ( .A(n255), .Y(n338) );
  INVX2 U215 ( .A(n256), .Y(n348) );
  INVX2 U216 ( .A(n257), .Y(n524) );
  INVX2 U221 ( .A(n258), .Y(n525) );
  INVX2 U222 ( .A(n259), .Y(n526) );
  INVX2 U227 ( .A(n260), .Y(n527) );
  INVX2 U228 ( .A(n261), .Y(n528) );
  INVX2 U233 ( .A(n262), .Y(n529) );
  INVX2 U234 ( .A(n263), .Y(n530) );
  INVX2 U239 ( .A(n264), .Y(n531) );
  INVX2 U240 ( .A(n265), .Y(n532) );
  INVX2 U245 ( .A(n266), .Y(n533) );
  INVX2 U246 ( .A(n267), .Y(n534) );
  INVX2 U251 ( .A(waddr_ready), .Y(n535) );
  INVX2 U252 ( .A(n308), .Y(n536) );
  INVX2 U257 ( .A(n275), .Y(n537) );
  INVX2 U258 ( .A(n278), .Y(n538) );
  INVX2 U263 ( .A(n307), .Y(n539) );
  INVX2 U264 ( .A(n306), .Y(n540) );
  INVX2 U269 ( .A(n305), .Y(n541) );
  INVX2 U270 ( .A(n304), .Y(n542) );
  INVX2 U275 ( .A(n303), .Y(n543) );
  INVX2 U276 ( .A(n302), .Y(n544) );
  INVX2 U281 ( .A(n301), .Y(n545) );
  INVX2 U282 ( .A(n300), .Y(n546) );
  INVX2 U287 ( .A(n299), .Y(n547) );
  INVX2 U288 ( .A(n298), .Y(n548) );
  INVX2 U293 ( .A(n297), .Y(n549) );
  INVX2 U294 ( .A(n296), .Y(n550) );
  INVX2 U299 ( .A(n295), .Y(n551) );
  INVX2 U300 ( .A(n294), .Y(n552) );
  INVX2 U305 ( .A(n293), .Y(n553) );
  INVX2 U306 ( .A(n292), .Y(n554) );
  INVX2 U311 ( .A(n291), .Y(n555) );
  INVX2 U312 ( .A(n290), .Y(n556) );
  INVX2 U317 ( .A(n289), .Y(n557) );
  INVX2 U318 ( .A(n288), .Y(n558) );
  INVX2 U323 ( .A(n287), .Y(n559) );
  INVX2 U324 ( .A(n286), .Y(n560) );
  INVX2 U325 ( .A(n285), .Y(n561) );
  INVX2 U327 ( .A(n284), .Y(n562) );
  INVX2 U328 ( .A(n283), .Y(n563) );
  INVX2 U330 ( .A(n282), .Y(n564) );
  INVX2 U332 ( .A(n281), .Y(n565) );
  INVX2 U334 ( .A(n280), .Y(n566) );
  INVX2 U336 ( .A(n279), .Y(n567) );
  INVX2 U338 ( .A(n341), .Y(n568) );
  INVX2 U340 ( .A(n325), .Y(n569) );
  INVX2 U342 ( .A(n334), .Y(n570) );
  INVX2 U344 ( .A(waddr_ready_ff), .Y(n571) );
  INVX2 U346 ( .A(n38), .Y(n572) );
  INVX2 U348 ( .A(n41), .Y(n573) );
  INVX2 U350 ( .A(n42), .Y(n574) );
  INVX2 U352 ( .A(n43), .Y(n575) );
  INVX2 U354 ( .A(n44), .Y(n576) );
  INVX2 U356 ( .A(n45), .Y(n577) );
  INVX2 U358 ( .A(n46), .Y(n578) );
  INVX2 U360 ( .A(n47), .Y(n579) );
  INVX2 U362 ( .A(n48), .Y(n580) );
  INVX2 U364 ( .A(n49), .Y(n581) );
  INVX2 U366 ( .A(n50), .Y(n582) );
  INVX2 U368 ( .A(n51), .Y(n583) );
  INVX2 U370 ( .A(n52), .Y(n584) );
  INVX2 U372 ( .A(n53), .Y(n585) );
  INVX2 U374 ( .A(n54), .Y(n586) );
  INVX2 U376 ( .A(n55), .Y(n587) );
  INVX2 U378 ( .A(n56), .Y(n588) );
  INVX2 U380 ( .A(n57), .Y(n589) );
  INVX2 U382 ( .A(n58), .Y(n622) );
  INVX2 U384 ( .A(n59), .Y(n623) );
  INVX2 U386 ( .A(n60), .Y(n624) );
  INVX2 U388 ( .A(n61), .Y(n625) );
  INVX2 U390 ( .A(n62), .Y(n626) );
  INVX2 U393 ( .A(n63), .Y(n627) );
  INVX2 U395 ( .A(n64), .Y(n628) );
  INVX2 U396 ( .A(n65), .Y(n629) );
  INVX2 U397 ( .A(n66), .Y(n630) );
  INVX2 U399 ( .A(n67), .Y(n631) );
  INVX2 U401 ( .A(n68), .Y(n632) );
  INVX2 U403 ( .A(n69), .Y(n633) );
  INVX2 U405 ( .A(n70), .Y(n634) );
  INVX2 U407 ( .A(n71), .Y(n635) );
  INVX2 U409 ( .A(Q[0]), .Y(n636) );
  INVX2 U411 ( .A(n5), .Y(n638) );
  INVX2 U413 ( .A(n7), .Y(n639) );
  INVX2 U415 ( .A(n8), .Y(n640) );
  INVX2 U417 ( .A(n9), .Y(n641) );
  INVX2 U419 ( .A(n10), .Y(n642) );
  INVX2 U421 ( .A(n11), .Y(n643) );
  INVX2 U423 ( .A(n12), .Y(n644) );
  INVX2 U425 ( .A(n13), .Y(n645) );
  INVX2 U427 ( .A(n14), .Y(n646) );
  INVX2 U429 ( .A(n15), .Y(n647) );
  INVX2 U431 ( .A(n16), .Y(n648) );
  INVX2 U433 ( .A(n17), .Y(n649) );
  INVX2 U435 ( .A(n18), .Y(n650) );
  INVX2 U437 ( .A(n19), .Y(n651) );
  INVX2 U439 ( .A(n20), .Y(n652) );
  INVX2 U441 ( .A(n21), .Y(n653) );
  INVX2 U443 ( .A(n22), .Y(n655) );
  INVX2 U445 ( .A(n23), .Y(n656) );
  INVX2 U447 ( .A(n24), .Y(n657) );
  INVX2 U449 ( .A(n25), .Y(n658) );
  INVX2 U451 ( .A(n26), .Y(n659) );
  INVX2 U453 ( .A(n27), .Y(n660) );
  INVX2 U455 ( .A(n28), .Y(n661) );
  INVX2 U457 ( .A(n29), .Y(n662) );
  INVX2 U459 ( .A(n30), .Y(n663) );
  INVX2 U461 ( .A(n31), .Y(n664) );
  INVX2 U469 ( .A(n32), .Y(n665) );
  INVX2 U471 ( .A(n33), .Y(n666) );
  INVX2 U472 ( .A(n34), .Y(n667) );
  INVX2 U476 ( .A(n35), .Y(n668) );
  INVX2 U480 ( .A(n36), .Y(n669) );
  INVX2 U482 ( .A(n37), .Y(n670) );
  INVX2 U484 ( .A(n312), .Y(n671) );
  INVX2 U486 ( .A(n318), .Y(n672) );
  INVX2 U488 ( .A(init2), .Y(n673) );
  INVX2 U491 ( .A(raddr_ready_ff), .Y(n674) );
  INVX2 U493 ( .A(n331), .Y(n675) );
  INVX2 U495 ( .A(Q[2]), .Y(n676) );
  INVX2 U502 ( .A(hready_ff), .Y(n677) );
  INVX2 U503 ( .A(re_ff), .Y(n678) );
  INVX2 U504 ( .A(Q[1]), .Y(n679) );
  INVX2 U505 ( .A(prev_hwrite), .Y(n680) );
  INVX2 U509 ( .A(we_ff), .Y(n681) );
  INVX2 U516 ( .A(prev_waddr[31]), .Y(n682) );
  INVX2 U518 ( .A(prev_waddr[0]), .Y(n683) );
  INVX2 U521 ( .A(prev_waddr[1]), .Y(n684) );
  INVX2 U522 ( .A(prev_waddr[2]), .Y(n685) );
  INVX2 U524 ( .A(prev_waddr[3]), .Y(n686) );
  INVX2 U699 ( .A(prev_waddr[4]), .Y(n695) );
  INVX2 U700 ( .A(prev_waddr[5]), .Y(n696) );
  INVX2 U701 ( .A(prev_waddr[6]), .Y(n697) );
  INVX2 U702 ( .A(prev_waddr[7]), .Y(n698) );
  INVX2 U703 ( .A(prev_waddr[8]), .Y(n699) );
  INVX2 U704 ( .A(prev_waddr[9]), .Y(n700) );
  INVX2 U705 ( .A(prev_waddr[10]), .Y(n701) );
  INVX2 U706 ( .A(prev_waddr[11]), .Y(n702) );
  INVX2 U707 ( .A(prev_waddr[12]), .Y(n703) );
  INVX2 U708 ( .A(prev_waddr[13]), .Y(n704) );
  INVX2 U709 ( .A(prev_waddr[14]), .Y(n705) );
  INVX2 U710 ( .A(prev_waddr[15]), .Y(n706) );
  INVX2 U711 ( .A(prev_waddr[16]), .Y(n707) );
  INVX2 U712 ( .A(prev_waddr[17]), .Y(n708) );
  INVX2 U713 ( .A(prev_waddr[18]), .Y(n709) );
  INVX2 U714 ( .A(prev_waddr[19]), .Y(n710) );
  INVX2 U715 ( .A(prev_waddr[20]), .Y(n711) );
  INVX2 U716 ( .A(prev_waddr[21]), .Y(n712) );
  INVX2 U717 ( .A(prev_waddr[22]), .Y(n713) );
  INVX2 U718 ( .A(prev_waddr[23]), .Y(n714) );
  INVX2 U719 ( .A(prev_waddr[24]), .Y(n715) );
  INVX2 U720 ( .A(prev_waddr[25]), .Y(n716) );
  INVX2 U721 ( .A(prev_waddr[26]), .Y(n717) );
  INVX2 U722 ( .A(prev_waddr[27]), .Y(n718) );
  INVX2 U723 ( .A(prev_waddr[28]), .Y(n719) );
  INVX2 U724 ( .A(prev_waddr[29]), .Y(n720) );
  INVX2 U725 ( .A(prev_waddr[30]), .Y(n721) );
  INVX2 U726 ( .A(prev_raddr[31]), .Y(n722) );
  INVX2 U727 ( .A(prev_raddr[30]), .Y(n723) );
  INVX2 U728 ( .A(prev_raddr[29]), .Y(n724) );
  INVX2 U729 ( .A(prev_raddr[28]), .Y(n725) );
  INVX2 U730 ( .A(prev_raddr[27]), .Y(n726) );
  INVX2 U731 ( .A(prev_raddr[26]), .Y(n727) );
  INVX2 U732 ( .A(prev_raddr[25]), .Y(n728) );
  INVX2 U733 ( .A(prev_raddr[24]), .Y(n729) );
  INVX2 U734 ( .A(prev_raddr[23]), .Y(n730) );
  INVX2 U735 ( .A(prev_raddr[22]), .Y(n731) );
  INVX2 U736 ( .A(prev_raddr[21]), .Y(n732) );
  INVX2 U737 ( .A(prev_raddr[20]), .Y(n733) );
  INVX2 U738 ( .A(prev_raddr[19]), .Y(n734) );
  INVX2 U739 ( .A(prev_raddr[18]), .Y(n735) );
  INVX2 U740 ( .A(prev_raddr[17]), .Y(n736) );
  INVX2 U741 ( .A(prev_raddr[16]), .Y(n737) );
  INVX2 U742 ( .A(prev_raddr[15]), .Y(n738) );
  INVX2 U743 ( .A(prev_raddr[14]), .Y(n739) );
  INVX2 U744 ( .A(prev_raddr[13]), .Y(n740) );
  INVX2 U745 ( .A(prev_raddr[12]), .Y(n741) );
  INVX2 U746 ( .A(prev_raddr[11]), .Y(n742) );
  INVX2 U747 ( .A(prev_raddr[10]), .Y(n743) );
  INVX2 U748 ( .A(prev_raddr[9]), .Y(n744) );
  INVX2 U749 ( .A(prev_raddr[8]), .Y(n745) );
  INVX2 U750 ( .A(prev_raddr[7]), .Y(n746) );
  INVX2 U751 ( .A(prev_raddr[6]), .Y(n747) );
  INVX2 U752 ( .A(prev_raddr[5]), .Y(n748) );
  INVX2 U753 ( .A(prev_raddr[4]), .Y(n749) );
  INVX2 U754 ( .A(prev_raddr[3]), .Y(n750) );
  INVX2 U755 ( .A(prev_raddr[2]), .Y(n751) );
  INVX2 U756 ( .A(prev_raddr[1]), .Y(n752) );
  INVX2 U757 ( .A(prev_raddr[0]), .Y(n753) );
  INVX2 U758 ( .A(re), .Y(n754) );
  INVX2 U759 ( .A(we), .Y(n755) );
  INVX2 U760 ( .A(hready), .Y(n756) );
endmodule


module AHB_slave ( clk, n_rst, done, haddr, hwrite, hwdata, hrdata, hready, 
        start_waddr, start_raddr, img_width, img_height, boundary_4 );
  input [31:0] haddr;
  input [31:0] hwdata;
  output [31:0] hrdata;
  output [31:0] start_waddr;
  output [31:0] start_raddr;
  output [15:0] img_width;
  output [15:0] img_height;
  output [31:0] boundary_4;
  input clk, n_rst, done, hwrite;
  output hready;
  wire   n594, \n_hready[0] , n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n165, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593;
  wire   [2:0] Q;
  wire   [2:0] nQ;

  DFFSR \Q_reg[2]  ( .D(n231), .CLK(clk), .R(n211), .S(1'b1), .Q(Q[2]) );
  DFFSR \Q_reg[1]  ( .D(nQ[1]), .CLK(clk), .R(n211), .S(1'b1), .Q(Q[1]) );
  DFFSR \Q_reg[0]  ( .D(nQ[0]), .CLK(clk), .R(n211), .S(1'b1), .Q(Q[0]) );
  DFFSR \hrdata_reg[31]  ( .D(n547), .CLK(clk), .R(n211), .S(1'b1), .Q(
        hrdata[31]) );
  DFFSR \hrdata_reg[30]  ( .D(n546), .CLK(clk), .R(n211), .S(1'b1), .Q(
        hrdata[30]) );
  DFFSR \hrdata_reg[29]  ( .D(n545), .CLK(clk), .R(n211), .S(1'b1), .Q(
        hrdata[29]) );
  DFFSR \hrdata_reg[28]  ( .D(n544), .CLK(clk), .R(n211), .S(1'b1), .Q(
        hrdata[28]) );
  DFFSR \hrdata_reg[27]  ( .D(n543), .CLK(clk), .R(n211), .S(1'b1), .Q(
        hrdata[27]) );
  DFFSR \hrdata_reg[26]  ( .D(n542), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[26]) );
  DFFSR \hrdata_reg[25]  ( .D(n541), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[25]) );
  DFFSR \hrdata_reg[24]  ( .D(n540), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[24]) );
  DFFSR \hrdata_reg[23]  ( .D(n539), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[23]) );
  DFFSR \hrdata_reg[22]  ( .D(n538), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[22]) );
  DFFSR \hrdata_reg[21]  ( .D(n537), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[21]) );
  DFFSR \hrdata_reg[20]  ( .D(n536), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[20]) );
  DFFSR \hrdata_reg[19]  ( .D(n535), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[19]) );
  DFFSR \hrdata_reg[18]  ( .D(n534), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[18]) );
  DFFSR \hrdata_reg[17]  ( .D(n533), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[17]) );
  DFFSR \hrdata_reg[16]  ( .D(n532), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[16]) );
  DFFSR \hrdata_reg[15]  ( .D(n531), .CLK(clk), .R(n210), .S(1'b1), .Q(
        hrdata[15]) );
  DFFSR \hrdata_reg[14]  ( .D(n530), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[14]) );
  DFFSR \hrdata_reg[13]  ( .D(n529), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[13]) );
  DFFSR \hrdata_reg[12]  ( .D(n528), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[12]) );
  DFFSR \hrdata_reg[11]  ( .D(n527), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[11]) );
  DFFSR \hrdata_reg[10]  ( .D(n526), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[10]) );
  DFFSR \hrdata_reg[9]  ( .D(n525), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[9]) );
  DFFSR \hrdata_reg[8]  ( .D(n524), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[8]) );
  DFFSR \hrdata_reg[7]  ( .D(n523), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[7]) );
  DFFSR \hrdata_reg[6]  ( .D(n522), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[6]) );
  DFFSR \hrdata_reg[5]  ( .D(n521), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[5]) );
  DFFSR \hrdata_reg[4]  ( .D(n520), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[4]) );
  DFFSR \hrdata_reg[3]  ( .D(n519), .CLK(clk), .R(n209), .S(1'b1), .Q(
        hrdata[3]) );
  DFFSR \hrdata_reg[2]  ( .D(n518), .CLK(clk), .R(n208), .S(1'b1), .Q(
        hrdata[2]) );
  DFFSR \hrdata_reg[1]  ( .D(n517), .CLK(clk), .R(n208), .S(1'b1), .Q(
        hrdata[1]) );
  DFFSR \hrdata_reg[0]  ( .D(n516), .CLK(clk), .R(n208), .S(1'b1), .Q(
        hrdata[0]) );
  DFFSR hready_reg ( .D(\n_hready[0] ), .CLK(clk), .R(n208), .S(1'b1), .Q(
        hready) );
  DFFSR \start_waddr_reg[31]  ( .D(n515), .CLK(clk), .R(n208), .S(1'b1), .Q(
        start_waddr[31]) );
  DFFSR \start_waddr_reg[30]  ( .D(n514), .CLK(clk), .R(n208), .S(1'b1), .Q(
        start_waddr[30]) );
  DFFSR \start_waddr_reg[29]  ( .D(n513), .CLK(clk), .R(n208), .S(1'b1), .Q(
        start_waddr[29]) );
  DFFSR \start_waddr_reg[28]  ( .D(n512), .CLK(clk), .R(n208), .S(1'b1), .Q(
        start_waddr[28]) );
  DFFSR \start_waddr_reg[27]  ( .D(n511), .CLK(clk), .R(n208), .S(1'b1), .Q(
        start_waddr[27]) );
  DFFSR \start_waddr_reg[26]  ( .D(n510), .CLK(clk), .R(n208), .S(1'b1), .Q(
        start_waddr[26]) );
  DFFSR \start_waddr_reg[25]  ( .D(n509), .CLK(clk), .R(n208), .S(1'b1), .Q(
        start_waddr[25]) );
  DFFSR \start_waddr_reg[24]  ( .D(n508), .CLK(clk), .R(n208), .S(1'b1), .Q(
        start_waddr[24]) );
  DFFSR \start_waddr_reg[23]  ( .D(n507), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[23]) );
  DFFSR \start_waddr_reg[22]  ( .D(n506), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[22]) );
  DFFSR \start_waddr_reg[21]  ( .D(n505), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[21]) );
  DFFSR \start_waddr_reg[20]  ( .D(n504), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[20]) );
  DFFSR \start_waddr_reg[19]  ( .D(n503), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[19]) );
  DFFSR \start_waddr_reg[18]  ( .D(n502), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[18]) );
  DFFSR \start_waddr_reg[17]  ( .D(n501), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[17]) );
  DFFSR \start_waddr_reg[16]  ( .D(n500), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[16]) );
  DFFSR \start_waddr_reg[15]  ( .D(n499), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[15]) );
  DFFSR \start_waddr_reg[14]  ( .D(n498), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[14]) );
  DFFSR \start_waddr_reg[13]  ( .D(n497), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[13]) );
  DFFSR \start_waddr_reg[12]  ( .D(n496), .CLK(clk), .R(n207), .S(1'b1), .Q(
        start_waddr[12]) );
  DFFSR \start_waddr_reg[11]  ( .D(n495), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[11]) );
  DFFSR \start_waddr_reg[10]  ( .D(n494), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[10]) );
  DFFSR \start_waddr_reg[9]  ( .D(n493), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[9]) );
  DFFSR \start_waddr_reg[8]  ( .D(n492), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[8]) );
  DFFSR \start_waddr_reg[7]  ( .D(n491), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[7]) );
  DFFSR \start_waddr_reg[6]  ( .D(n490), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[6]) );
  DFFSR \start_waddr_reg[5]  ( .D(n489), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[5]) );
  DFFSR \start_waddr_reg[4]  ( .D(n488), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[4]) );
  DFFSR \start_waddr_reg[3]  ( .D(n487), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[3]) );
  DFFSR \start_waddr_reg[2]  ( .D(n486), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[2]) );
  DFFSR \start_waddr_reg[1]  ( .D(n485), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[1]) );
  DFFSR \start_waddr_reg[0]  ( .D(n484), .CLK(clk), .R(n206), .S(1'b1), .Q(
        start_waddr[0]) );
  DFFSR \start_raddr_reg[31]  ( .D(n483), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[31]) );
  DFFSR \start_raddr_reg[30]  ( .D(n482), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[30]) );
  DFFSR \start_raddr_reg[29]  ( .D(n481), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[29]) );
  DFFSR \start_raddr_reg[28]  ( .D(n480), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[28]) );
  DFFSR \start_raddr_reg[27]  ( .D(n479), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[27]) );
  DFFSR \start_raddr_reg[26]  ( .D(n478), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[26]) );
  DFFSR \start_raddr_reg[25]  ( .D(n477), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[25]) );
  DFFSR \start_raddr_reg[24]  ( .D(n476), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[24]) );
  DFFSR \start_raddr_reg[23]  ( .D(n475), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[23]) );
  DFFSR \start_raddr_reg[22]  ( .D(n474), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[22]) );
  DFFSR \start_raddr_reg[21]  ( .D(n473), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[21]) );
  DFFSR \start_raddr_reg[20]  ( .D(n472), .CLK(clk), .R(n205), .S(1'b1), .Q(
        start_raddr[20]) );
  DFFSR \start_raddr_reg[19]  ( .D(n471), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[19]) );
  DFFSR \start_raddr_reg[18]  ( .D(n470), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[18]) );
  DFFSR \start_raddr_reg[17]  ( .D(n469), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[17]) );
  DFFSR \start_raddr_reg[16]  ( .D(n468), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[16]) );
  DFFSR \start_raddr_reg[15]  ( .D(n467), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[15]) );
  DFFSR \start_raddr_reg[14]  ( .D(n466), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[14]) );
  DFFSR \start_raddr_reg[13]  ( .D(n465), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[13]) );
  DFFSR \start_raddr_reg[12]  ( .D(n464), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[12]) );
  DFFSR \start_raddr_reg[11]  ( .D(n463), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[11]) );
  DFFSR \start_raddr_reg[10]  ( .D(n462), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[10]) );
  DFFSR \start_raddr_reg[9]  ( .D(n461), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[9]) );
  DFFSR \start_raddr_reg[8]  ( .D(n460), .CLK(clk), .R(n204), .S(1'b1), .Q(
        start_raddr[8]) );
  DFFSR \start_raddr_reg[7]  ( .D(n459), .CLK(clk), .R(n203), .S(1'b1), .Q(
        start_raddr[7]) );
  DFFSR \start_raddr_reg[6]  ( .D(n458), .CLK(clk), .R(n203), .S(1'b1), .Q(
        start_raddr[6]) );
  DFFSR \start_raddr_reg[5]  ( .D(n457), .CLK(clk), .R(n203), .S(1'b1), .Q(
        start_raddr[5]) );
  DFFSR \start_raddr_reg[4]  ( .D(n456), .CLK(clk), .R(n203), .S(1'b1), .Q(
        start_raddr[4]) );
  DFFSR \start_raddr_reg[3]  ( .D(n455), .CLK(clk), .R(n203), .S(1'b1), .Q(
        start_raddr[3]) );
  DFFSR \start_raddr_reg[2]  ( .D(n454), .CLK(clk), .R(n203), .S(1'b1), .Q(
        start_raddr[2]) );
  DFFSR \start_raddr_reg[1]  ( .D(n453), .CLK(clk), .R(n203), .S(1'b1), .Q(
        start_raddr[1]) );
  DFFSR \start_raddr_reg[0]  ( .D(n452), .CLK(clk), .R(n203), .S(1'b1), .Q(
        start_raddr[0]) );
  DFFSR \img_height_reg[15]  ( .D(n451), .CLK(clk), .R(n203), .S(1'b1), .Q(
        img_height[15]) );
  DFFSR \img_height_reg[14]  ( .D(n450), .CLK(clk), .R(n203), .S(1'b1), .Q(
        img_height[14]) );
  DFFSR \img_height_reg[13]  ( .D(n449), .CLK(clk), .R(n203), .S(1'b1), .Q(
        img_height[13]) );
  DFFSR \img_height_reg[12]  ( .D(n448), .CLK(clk), .R(n203), .S(1'b1), .Q(
        img_height[12]) );
  DFFSR \img_height_reg[11]  ( .D(n447), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[11]) );
  DFFSR \img_height_reg[10]  ( .D(n446), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[10]) );
  DFFSR \img_height_reg[9]  ( .D(n445), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[9]) );
  DFFSR \img_height_reg[8]  ( .D(n444), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[8]) );
  DFFSR \img_height_reg[7]  ( .D(n443), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[7]) );
  DFFSR \img_height_reg[6]  ( .D(n442), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[6]) );
  DFFSR \img_height_reg[5]  ( .D(n441), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[5]) );
  DFFSR \img_height_reg[4]  ( .D(n440), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[4]) );
  DFFSR \img_height_reg[3]  ( .D(n439), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[3]) );
  DFFSR \img_height_reg[2]  ( .D(n438), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[2]) );
  DFFSR \img_height_reg[1]  ( .D(n437), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[1]) );
  DFFSR \img_height_reg[0]  ( .D(n436), .CLK(clk), .R(n202), .S(1'b1), .Q(
        img_height[0]) );
  DFFSR \img_width_reg[15]  ( .D(n435), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[15]) );
  DFFSR \img_width_reg[14]  ( .D(n434), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[14]) );
  DFFSR \img_width_reg[13]  ( .D(n433), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[13]) );
  DFFSR \img_width_reg[12]  ( .D(n432), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[12]) );
  DFFSR \img_width_reg[11]  ( .D(n431), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[11]) );
  DFFSR \img_width_reg[10]  ( .D(n430), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[10]) );
  DFFSR \img_width_reg[9]  ( .D(n429), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[9]) );
  DFFSR \img_width_reg[8]  ( .D(n428), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[8]) );
  DFFSR \img_width_reg[7]  ( .D(n427), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[7]) );
  DFFSR \img_width_reg[6]  ( .D(n426), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[6]) );
  DFFSR \img_width_reg[5]  ( .D(n425), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[5]) );
  DFFSR \img_width_reg[4]  ( .D(n424), .CLK(clk), .R(n201), .S(1'b1), .Q(
        img_width[4]) );
  DFFSR \img_width_reg[3]  ( .D(n423), .CLK(clk), .R(n200), .S(1'b1), .Q(
        img_width[3]) );
  DFFSR \img_width_reg[2]  ( .D(n422), .CLK(clk), .R(n200), .S(1'b1), .Q(n594)
         );
  DFFSR \img_width_reg[1]  ( .D(n421), .CLK(clk), .R(n200), .S(1'b1), .Q(
        img_width[1]) );
  DFFSR \img_width_reg[0]  ( .D(n420), .CLK(clk), .R(n200), .S(1'b1), .Q(
        img_width[0]) );
  DFFSR \boundary_4_reg[31]  ( .D(n419), .CLK(clk), .R(n200), .S(1'b1), .Q(
        boundary_4[31]) );
  DFFSR \boundary_4_reg[30]  ( .D(n418), .CLK(clk), .R(n200), .S(1'b1), .Q(
        boundary_4[30]) );
  DFFSR \boundary_4_reg[29]  ( .D(n417), .CLK(clk), .R(n200), .S(1'b1), .Q(
        boundary_4[29]) );
  DFFSR \boundary_4_reg[28]  ( .D(n416), .CLK(clk), .R(n200), .S(1'b1), .Q(
        boundary_4[28]) );
  DFFSR \boundary_4_reg[27]  ( .D(n415), .CLK(clk), .R(n200), .S(1'b1), .Q(
        boundary_4[27]) );
  DFFSR \boundary_4_reg[26]  ( .D(n414), .CLK(clk), .R(n200), .S(1'b1), .Q(
        boundary_4[26]) );
  DFFSR \boundary_4_reg[25]  ( .D(n413), .CLK(clk), .R(n200), .S(1'b1), .Q(
        boundary_4[25]) );
  DFFSR \boundary_4_reg[24]  ( .D(n412), .CLK(clk), .R(n200), .S(1'b1), .Q(
        boundary_4[24]) );
  DFFSR \boundary_4_reg[23]  ( .D(n411), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[23]) );
  DFFSR \boundary_4_reg[22]  ( .D(n410), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[22]) );
  DFFSR \boundary_4_reg[21]  ( .D(n409), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[21]) );
  DFFSR \boundary_4_reg[20]  ( .D(n408), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[20]) );
  DFFSR \boundary_4_reg[19]  ( .D(n407), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[19]) );
  DFFSR \boundary_4_reg[18]  ( .D(n406), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[18]) );
  DFFSR \boundary_4_reg[17]  ( .D(n405), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[17]) );
  DFFSR \boundary_4_reg[16]  ( .D(n404), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[16]) );
  DFFSR \boundary_4_reg[15]  ( .D(n403), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[15]) );
  DFFSR \boundary_4_reg[14]  ( .D(n402), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[14]) );
  DFFSR \boundary_4_reg[13]  ( .D(n401), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[13]) );
  DFFSR \boundary_4_reg[12]  ( .D(n400), .CLK(clk), .R(n199), .S(1'b1), .Q(
        boundary_4[12]) );
  DFFSR \boundary_4_reg[11]  ( .D(n399), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[11]) );
  DFFSR \boundary_4_reg[10]  ( .D(n398), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[10]) );
  DFFSR \boundary_4_reg[9]  ( .D(n397), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[9]) );
  DFFSR \boundary_4_reg[8]  ( .D(n396), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[8]) );
  DFFSR \boundary_4_reg[7]  ( .D(n395), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[7]) );
  DFFSR \boundary_4_reg[6]  ( .D(n394), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[6]) );
  DFFSR \boundary_4_reg[5]  ( .D(n393), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[5]) );
  DFFSR \boundary_4_reg[4]  ( .D(n392), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[4]) );
  DFFSR \boundary_4_reg[3]  ( .D(n391), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[3]) );
  DFFSR \boundary_4_reg[2]  ( .D(n390), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[2]) );
  DFFSR \boundary_4_reg[1]  ( .D(n389), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[1]) );
  DFFSR \boundary_4_reg[0]  ( .D(n388), .CLK(clk), .R(n198), .S(1'b1), .Q(
        boundary_4[0]) );
  AND2X2 U167 ( .A(n385), .B(n386), .Y(n384) );
  OAI21X1 U244 ( .A(n189), .B(n593), .C(n242), .Y(n388) );
  NAND2X1 U245 ( .A(boundary_4[0]), .B(n192), .Y(n242) );
  OAI21X1 U246 ( .A(n188), .B(n592), .C(n243), .Y(n389) );
  NAND2X1 U247 ( .A(boundary_4[1]), .B(n192), .Y(n243) );
  OAI21X1 U248 ( .A(n188), .B(n591), .C(n244), .Y(n390) );
  NAND2X1 U249 ( .A(boundary_4[2]), .B(n192), .Y(n244) );
  OAI21X1 U250 ( .A(n188), .B(n590), .C(n245), .Y(n391) );
  NAND2X1 U251 ( .A(boundary_4[3]), .B(n191), .Y(n245) );
  OAI21X1 U252 ( .A(n188), .B(n589), .C(n246), .Y(n392) );
  NAND2X1 U253 ( .A(boundary_4[4]), .B(n191), .Y(n246) );
  OAI21X1 U254 ( .A(n188), .B(n588), .C(n247), .Y(n393) );
  NAND2X1 U255 ( .A(boundary_4[5]), .B(n191), .Y(n247) );
  OAI21X1 U256 ( .A(n188), .B(n587), .C(n248), .Y(n394) );
  NAND2X1 U257 ( .A(boundary_4[6]), .B(n191), .Y(n248) );
  OAI21X1 U258 ( .A(n188), .B(n586), .C(n249), .Y(n395) );
  NAND2X1 U259 ( .A(boundary_4[7]), .B(n191), .Y(n249) );
  OAI21X1 U260 ( .A(n188), .B(n585), .C(n250), .Y(n396) );
  NAND2X1 U261 ( .A(boundary_4[8]), .B(n191), .Y(n250) );
  OAI21X1 U262 ( .A(n188), .B(n584), .C(n251), .Y(n397) );
  NAND2X1 U263 ( .A(boundary_4[9]), .B(n191), .Y(n251) );
  OAI21X1 U264 ( .A(n188), .B(n583), .C(n252), .Y(n398) );
  NAND2X1 U265 ( .A(boundary_4[10]), .B(n191), .Y(n252) );
  OAI21X1 U266 ( .A(n188), .B(n582), .C(n253), .Y(n399) );
  NAND2X1 U267 ( .A(boundary_4[11]), .B(n191), .Y(n253) );
  OAI21X1 U268 ( .A(n188), .B(n581), .C(n254), .Y(n400) );
  NAND2X1 U269 ( .A(boundary_4[12]), .B(n191), .Y(n254) );
  OAI21X1 U270 ( .A(n188), .B(n580), .C(n255), .Y(n401) );
  NAND2X1 U271 ( .A(boundary_4[13]), .B(n191), .Y(n255) );
  OAI21X1 U272 ( .A(n189), .B(n579), .C(n256), .Y(n402) );
  NAND2X1 U273 ( .A(boundary_4[14]), .B(n190), .Y(n256) );
  OAI21X1 U274 ( .A(n189), .B(n578), .C(n257), .Y(n403) );
  NAND2X1 U275 ( .A(boundary_4[15]), .B(n190), .Y(n257) );
  OAI21X1 U276 ( .A(n189), .B(n230), .C(n258), .Y(n404) );
  NAND2X1 U277 ( .A(boundary_4[16]), .B(n191), .Y(n258) );
  OAI21X1 U278 ( .A(n189), .B(n229), .C(n259), .Y(n405) );
  NAND2X1 U279 ( .A(boundary_4[17]), .B(n190), .Y(n259) );
  OAI21X1 U280 ( .A(n189), .B(n228), .C(n260), .Y(n406) );
  NAND2X1 U281 ( .A(boundary_4[18]), .B(n190), .Y(n260) );
  OAI21X1 U282 ( .A(n189), .B(n227), .C(n261), .Y(n407) );
  NAND2X1 U283 ( .A(boundary_4[19]), .B(n190), .Y(n261) );
  OAI21X1 U284 ( .A(n189), .B(n226), .C(n262), .Y(n408) );
  NAND2X1 U285 ( .A(boundary_4[20]), .B(n190), .Y(n262) );
  OAI21X1 U286 ( .A(n189), .B(n225), .C(n263), .Y(n409) );
  NAND2X1 U287 ( .A(boundary_4[21]), .B(n190), .Y(n263) );
  OAI21X1 U288 ( .A(n189), .B(n224), .C(n264), .Y(n410) );
  NAND2X1 U289 ( .A(boundary_4[22]), .B(n191), .Y(n264) );
  OAI21X1 U290 ( .A(n189), .B(n223), .C(n265), .Y(n411) );
  NAND2X1 U291 ( .A(boundary_4[23]), .B(n190), .Y(n265) );
  OAI21X1 U292 ( .A(n189), .B(n222), .C(n266), .Y(n412) );
  NAND2X1 U293 ( .A(boundary_4[24]), .B(n190), .Y(n266) );
  OAI21X1 U294 ( .A(n190), .B(n577), .C(n267), .Y(n413) );
  NAND2X1 U295 ( .A(boundary_4[25]), .B(n191), .Y(n267) );
  OAI21X1 U296 ( .A(n190), .B(n576), .C(n268), .Y(n414) );
  NAND2X1 U297 ( .A(boundary_4[26]), .B(n191), .Y(n268) );
  OAI21X1 U298 ( .A(n189), .B(n575), .C(n269), .Y(n415) );
  NAND2X1 U299 ( .A(boundary_4[27]), .B(n191), .Y(n269) );
  OAI21X1 U300 ( .A(n190), .B(n574), .C(n270), .Y(n416) );
  NAND2X1 U301 ( .A(boundary_4[28]), .B(n191), .Y(n270) );
  OAI21X1 U302 ( .A(n190), .B(n573), .C(n271), .Y(n417) );
  NAND2X1 U303 ( .A(boundary_4[29]), .B(n191), .Y(n271) );
  OAI21X1 U304 ( .A(n190), .B(n572), .C(n272), .Y(n418) );
  NAND2X1 U305 ( .A(boundary_4[30]), .B(n192), .Y(n272) );
  OAI21X1 U306 ( .A(n190), .B(n571), .C(n273), .Y(n419) );
  NAND2X1 U307 ( .A(boundary_4[31]), .B(n192), .Y(n273) );
  NAND3X1 U308 ( .A(n274), .B(n275), .C(n221), .Y(n241) );
  OAI21X1 U327 ( .A(n577), .B(n181), .C(n286), .Y(n429) );
  NAND2X1 U328 ( .A(img_width[9]), .B(n181), .Y(n286) );
  OAI21X1 U329 ( .A(n576), .B(n181), .C(n287), .Y(n430) );
  NAND2X1 U330 ( .A(img_width[10]), .B(n182), .Y(n287) );
  OAI21X1 U331 ( .A(n575), .B(n181), .C(n288), .Y(n431) );
  NAND2X1 U332 ( .A(img_width[11]), .B(n182), .Y(n288) );
  OAI21X1 U333 ( .A(n574), .B(n181), .C(n289), .Y(n432) );
  NAND2X1 U334 ( .A(img_width[12]), .B(n182), .Y(n289) );
  OAI21X1 U335 ( .A(n573), .B(n181), .C(n290), .Y(n433) );
  NAND2X1 U336 ( .A(img_width[13]), .B(n182), .Y(n290) );
  OAI21X1 U337 ( .A(n572), .B(n181), .C(n291), .Y(n434) );
  NAND2X1 U338 ( .A(img_width[14]), .B(n182), .Y(n291) );
  OAI21X1 U339 ( .A(n571), .B(n181), .C(n292), .Y(n435) );
  NAND2X1 U340 ( .A(img_width[15]), .B(n182), .Y(n292) );
  OAI21X1 U341 ( .A(n593), .B(n181), .C(n293), .Y(n436) );
  NAND2X1 U342 ( .A(img_height[0]), .B(n182), .Y(n293) );
  OAI21X1 U343 ( .A(n592), .B(n181), .C(n294), .Y(n437) );
  NAND2X1 U344 ( .A(img_height[1]), .B(n182), .Y(n294) );
  OAI21X1 U345 ( .A(n591), .B(n182), .C(n295), .Y(n438) );
  NAND2X1 U346 ( .A(img_height[2]), .B(n182), .Y(n295) );
  OAI21X1 U347 ( .A(n590), .B(n181), .C(n296), .Y(n439) );
  NAND2X1 U348 ( .A(img_height[3]), .B(n182), .Y(n296) );
  OAI21X1 U349 ( .A(n589), .B(n181), .C(n297), .Y(n440) );
  NAND2X1 U350 ( .A(img_height[4]), .B(n182), .Y(n297) );
  OAI21X1 U351 ( .A(n588), .B(n181), .C(n298), .Y(n441) );
  NAND2X1 U352 ( .A(img_height[5]), .B(n182), .Y(n298) );
  OAI21X1 U353 ( .A(n587), .B(n276), .C(n299), .Y(n442) );
  NAND2X1 U354 ( .A(img_height[6]), .B(n276), .Y(n299) );
  OAI21X1 U355 ( .A(n586), .B(n276), .C(n300), .Y(n443) );
  NAND2X1 U356 ( .A(img_height[7]), .B(n276), .Y(n300) );
  OAI21X1 U357 ( .A(n585), .B(n276), .C(n301), .Y(n444) );
  NAND2X1 U358 ( .A(img_height[8]), .B(n182), .Y(n301) );
  OAI21X1 U359 ( .A(n584), .B(n181), .C(n302), .Y(n445) );
  NAND2X1 U360 ( .A(img_height[9]), .B(n182), .Y(n302) );
  OAI21X1 U361 ( .A(n583), .B(n182), .C(n303), .Y(n446) );
  NAND2X1 U362 ( .A(img_height[10]), .B(n182), .Y(n303) );
  OAI21X1 U363 ( .A(n582), .B(n181), .C(n304), .Y(n447) );
  NAND2X1 U364 ( .A(img_height[11]), .B(n182), .Y(n304) );
  OAI21X1 U365 ( .A(n581), .B(n181), .C(n305), .Y(n448) );
  NAND2X1 U366 ( .A(img_height[12]), .B(n182), .Y(n305) );
  OAI21X1 U367 ( .A(n580), .B(n181), .C(n306), .Y(n449) );
  NAND2X1 U368 ( .A(img_height[13]), .B(n182), .Y(n306) );
  OAI21X1 U369 ( .A(n579), .B(n181), .C(n307), .Y(n450) );
  NAND2X1 U370 ( .A(img_height[14]), .B(n182), .Y(n307) );
  OAI21X1 U371 ( .A(n578), .B(n181), .C(n308), .Y(n451) );
  NAND2X1 U372 ( .A(img_height[15]), .B(n181), .Y(n308) );
  OAI21X1 U374 ( .A(n593), .B(n177), .C(n311), .Y(n452) );
  NAND2X1 U375 ( .A(start_raddr[0]), .B(n180), .Y(n311) );
  OAI21X1 U376 ( .A(n592), .B(n176), .C(n312), .Y(n453) );
  NAND2X1 U377 ( .A(start_raddr[1]), .B(n180), .Y(n312) );
  OAI21X1 U378 ( .A(n591), .B(n176), .C(n313), .Y(n454) );
  NAND2X1 U379 ( .A(start_raddr[2]), .B(n180), .Y(n313) );
  OAI21X1 U380 ( .A(n590), .B(n176), .C(n314), .Y(n455) );
  NAND2X1 U381 ( .A(start_raddr[3]), .B(n179), .Y(n314) );
  OAI21X1 U382 ( .A(n589), .B(n176), .C(n315), .Y(n456) );
  NAND2X1 U383 ( .A(start_raddr[4]), .B(n180), .Y(n315) );
  OAI21X1 U384 ( .A(n588), .B(n176), .C(n316), .Y(n457) );
  NAND2X1 U385 ( .A(start_raddr[5]), .B(n179), .Y(n316) );
  OAI21X1 U386 ( .A(n587), .B(n176), .C(n317), .Y(n458) );
  NAND2X1 U387 ( .A(start_raddr[6]), .B(n179), .Y(n317) );
  OAI21X1 U388 ( .A(n586), .B(n176), .C(n318), .Y(n459) );
  NAND2X1 U389 ( .A(start_raddr[7]), .B(n179), .Y(n318) );
  OAI21X1 U390 ( .A(n585), .B(n176), .C(n319), .Y(n460) );
  NAND2X1 U391 ( .A(start_raddr[8]), .B(n179), .Y(n319) );
  OAI21X1 U392 ( .A(n584), .B(n176), .C(n320), .Y(n461) );
  NAND2X1 U393 ( .A(start_raddr[9]), .B(n179), .Y(n320) );
  OAI21X1 U394 ( .A(n583), .B(n176), .C(n321), .Y(n462) );
  NAND2X1 U395 ( .A(start_raddr[10]), .B(n179), .Y(n321) );
  OAI21X1 U396 ( .A(n582), .B(n176), .C(n322), .Y(n463) );
  NAND2X1 U397 ( .A(start_raddr[11]), .B(n179), .Y(n322) );
  OAI21X1 U398 ( .A(n581), .B(n176), .C(n323), .Y(n464) );
  NAND2X1 U399 ( .A(start_raddr[12]), .B(n179), .Y(n323) );
  OAI21X1 U400 ( .A(n580), .B(n177), .C(n324), .Y(n465) );
  NAND2X1 U401 ( .A(start_raddr[13]), .B(n179), .Y(n324) );
  OAI21X1 U402 ( .A(n579), .B(n177), .C(n325), .Y(n466) );
  NAND2X1 U403 ( .A(start_raddr[14]), .B(n179), .Y(n325) );
  OAI21X1 U404 ( .A(n578), .B(n177), .C(n326), .Y(n467) );
  NAND2X1 U405 ( .A(start_raddr[15]), .B(n178), .Y(n326) );
  OAI21X1 U406 ( .A(n230), .B(n177), .C(n327), .Y(n468) );
  NAND2X1 U407 ( .A(start_raddr[16]), .B(n179), .Y(n327) );
  OAI21X1 U408 ( .A(n229), .B(n177), .C(n328), .Y(n469) );
  NAND2X1 U409 ( .A(start_raddr[17]), .B(n178), .Y(n328) );
  OAI21X1 U410 ( .A(n228), .B(n177), .C(n329), .Y(n470) );
  NAND2X1 U411 ( .A(start_raddr[18]), .B(n178), .Y(n329) );
  OAI21X1 U412 ( .A(n227), .B(n177), .C(n330), .Y(n471) );
  NAND2X1 U413 ( .A(start_raddr[19]), .B(n178), .Y(n330) );
  OAI21X1 U414 ( .A(n226), .B(n177), .C(n331), .Y(n472) );
  NAND2X1 U415 ( .A(start_raddr[20]), .B(n178), .Y(n331) );
  OAI21X1 U416 ( .A(n225), .B(n177), .C(n332), .Y(n473) );
  NAND2X1 U417 ( .A(start_raddr[21]), .B(n178), .Y(n332) );
  OAI21X1 U418 ( .A(n224), .B(n177), .C(n333), .Y(n474) );
  NAND2X1 U419 ( .A(start_raddr[22]), .B(n179), .Y(n333) );
  OAI21X1 U420 ( .A(n223), .B(n178), .C(n334), .Y(n475) );
  NAND2X1 U421 ( .A(start_raddr[23]), .B(n178), .Y(n334) );
  OAI21X1 U422 ( .A(n222), .B(n177), .C(n335), .Y(n476) );
  NAND2X1 U423 ( .A(start_raddr[24]), .B(n179), .Y(n335) );
  OAI21X1 U424 ( .A(n577), .B(n178), .C(n336), .Y(n477) );
  NAND2X1 U425 ( .A(start_raddr[25]), .B(n179), .Y(n336) );
  OAI21X1 U426 ( .A(n576), .B(n178), .C(n337), .Y(n478) );
  NAND2X1 U427 ( .A(start_raddr[26]), .B(n179), .Y(n337) );
  OAI21X1 U428 ( .A(n575), .B(n178), .C(n338), .Y(n479) );
  NAND2X1 U429 ( .A(start_raddr[27]), .B(n179), .Y(n338) );
  OAI21X1 U430 ( .A(n574), .B(n178), .C(n339), .Y(n480) );
  NAND2X1 U431 ( .A(start_raddr[28]), .B(n179), .Y(n339) );
  OAI21X1 U432 ( .A(n573), .B(n178), .C(n340), .Y(n481) );
  NAND2X1 U433 ( .A(start_raddr[29]), .B(n179), .Y(n340) );
  OAI21X1 U434 ( .A(n572), .B(n178), .C(n341), .Y(n482) );
  NAND2X1 U435 ( .A(start_raddr[30]), .B(n180), .Y(n341) );
  OAI21X1 U436 ( .A(n571), .B(n178), .C(n342), .Y(n483) );
  NAND2X1 U437 ( .A(start_raddr[31]), .B(n180), .Y(n342) );
  NAND3X1 U438 ( .A(n309), .B(n275), .C(n221), .Y(n310) );
  NAND3X1 U439 ( .A(n344), .B(n345), .C(n234), .Y(n343) );
  OAI21X1 U440 ( .A(n593), .B(n170), .C(n347), .Y(n484) );
  NAND2X1 U441 ( .A(start_waddr[0]), .B(n173), .Y(n347) );
  OAI21X1 U442 ( .A(n592), .B(n169), .C(n348), .Y(n485) );
  NAND2X1 U443 ( .A(start_waddr[1]), .B(n173), .Y(n348) );
  OAI21X1 U444 ( .A(n591), .B(n169), .C(n349), .Y(n486) );
  NAND2X1 U445 ( .A(start_waddr[2]), .B(n173), .Y(n349) );
  OAI21X1 U446 ( .A(n590), .B(n169), .C(n350), .Y(n487) );
  NAND2X1 U447 ( .A(start_waddr[3]), .B(n172), .Y(n350) );
  OAI21X1 U448 ( .A(n589), .B(n169), .C(n351), .Y(n488) );
  NAND2X1 U449 ( .A(start_waddr[4]), .B(n173), .Y(n351) );
  OAI21X1 U450 ( .A(n588), .B(n169), .C(n352), .Y(n489) );
  NAND2X1 U451 ( .A(start_waddr[5]), .B(n172), .Y(n352) );
  OAI21X1 U452 ( .A(n587), .B(n169), .C(n353), .Y(n490) );
  NAND2X1 U453 ( .A(start_waddr[6]), .B(n172), .Y(n353) );
  OAI21X1 U454 ( .A(n586), .B(n169), .C(n354), .Y(n491) );
  NAND2X1 U455 ( .A(start_waddr[7]), .B(n172), .Y(n354) );
  OAI21X1 U456 ( .A(n585), .B(n169), .C(n355), .Y(n492) );
  NAND2X1 U457 ( .A(start_waddr[8]), .B(n172), .Y(n355) );
  OAI21X1 U458 ( .A(n584), .B(n169), .C(n356), .Y(n493) );
  NAND2X1 U459 ( .A(start_waddr[9]), .B(n172), .Y(n356) );
  OAI21X1 U460 ( .A(n583), .B(n169), .C(n357), .Y(n494) );
  NAND2X1 U461 ( .A(start_waddr[10]), .B(n172), .Y(n357) );
  OAI21X1 U462 ( .A(n582), .B(n169), .C(n358), .Y(n495) );
  NAND2X1 U463 ( .A(start_waddr[11]), .B(n172), .Y(n358) );
  OAI21X1 U464 ( .A(n581), .B(n169), .C(n359), .Y(n496) );
  NAND2X1 U465 ( .A(start_waddr[12]), .B(n172), .Y(n359) );
  OAI21X1 U466 ( .A(n580), .B(n170), .C(n360), .Y(n497) );
  NAND2X1 U467 ( .A(start_waddr[13]), .B(n172), .Y(n360) );
  OAI21X1 U468 ( .A(n579), .B(n170), .C(n361), .Y(n498) );
  NAND2X1 U469 ( .A(start_waddr[14]), .B(n172), .Y(n361) );
  OAI21X1 U470 ( .A(n578), .B(n170), .C(n362), .Y(n499) );
  NAND2X1 U471 ( .A(start_waddr[15]), .B(n171), .Y(n362) );
  OAI21X1 U472 ( .A(n230), .B(n170), .C(n363), .Y(n500) );
  NAND2X1 U473 ( .A(start_waddr[16]), .B(n172), .Y(n363) );
  OAI21X1 U474 ( .A(n229), .B(n170), .C(n364), .Y(n501) );
  NAND2X1 U475 ( .A(start_waddr[17]), .B(n171), .Y(n364) );
  OAI21X1 U476 ( .A(n228), .B(n170), .C(n365), .Y(n502) );
  NAND2X1 U477 ( .A(start_waddr[18]), .B(n171), .Y(n365) );
  OAI21X1 U478 ( .A(n227), .B(n170), .C(n366), .Y(n503) );
  NAND2X1 U479 ( .A(start_waddr[19]), .B(n171), .Y(n366) );
  OAI21X1 U480 ( .A(n226), .B(n170), .C(n367), .Y(n504) );
  NAND2X1 U481 ( .A(start_waddr[20]), .B(n171), .Y(n367) );
  OAI21X1 U482 ( .A(n225), .B(n170), .C(n368), .Y(n505) );
  NAND2X1 U483 ( .A(start_waddr[21]), .B(n171), .Y(n368) );
  OAI21X1 U484 ( .A(n224), .B(n170), .C(n369), .Y(n506) );
  NAND2X1 U485 ( .A(start_waddr[22]), .B(n172), .Y(n369) );
  OAI21X1 U486 ( .A(n223), .B(n171), .C(n370), .Y(n507) );
  NAND2X1 U487 ( .A(start_waddr[23]), .B(n171), .Y(n370) );
  OAI21X1 U488 ( .A(n222), .B(n170), .C(n371), .Y(n508) );
  NAND2X1 U489 ( .A(start_waddr[24]), .B(n172), .Y(n371) );
  OAI21X1 U490 ( .A(n577), .B(n171), .C(n372), .Y(n509) );
  NAND2X1 U491 ( .A(start_waddr[25]), .B(n172), .Y(n372) );
  OAI21X1 U492 ( .A(n576), .B(n171), .C(n373), .Y(n510) );
  NAND2X1 U493 ( .A(start_waddr[26]), .B(n172), .Y(n373) );
  OAI21X1 U494 ( .A(n575), .B(n171), .C(n374), .Y(n511) );
  NAND2X1 U495 ( .A(start_waddr[27]), .B(n172), .Y(n374) );
  OAI21X1 U496 ( .A(n574), .B(n171), .C(n375), .Y(n512) );
  NAND2X1 U497 ( .A(start_waddr[28]), .B(n172), .Y(n375) );
  OAI21X1 U498 ( .A(n573), .B(n171), .C(n376), .Y(n513) );
  NAND2X1 U499 ( .A(start_waddr[29]), .B(n172), .Y(n376) );
  OAI21X1 U500 ( .A(n572), .B(n171), .C(n377), .Y(n514) );
  NAND2X1 U501 ( .A(start_waddr[30]), .B(n173), .Y(n377) );
  OAI21X1 U502 ( .A(n571), .B(n171), .C(n378), .Y(n515) );
  NAND2X1 U503 ( .A(start_waddr[31]), .B(n173), .Y(n378) );
  NAND2X1 U504 ( .A(n168), .B(n344), .Y(n346) );
  NAND2X1 U505 ( .A(n237), .B(n236), .Y(n344) );
  OAI21X1 U506 ( .A(n168), .B(n567), .C(n174), .Y(n516) );
  OAI21X1 U507 ( .A(n168), .B(n566), .C(n174), .Y(n517) );
  OAI21X1 U508 ( .A(n168), .B(n565), .C(n174), .Y(n518) );
  OAI21X1 U509 ( .A(n168), .B(n564), .C(n174), .Y(n519) );
  OAI21X1 U510 ( .A(n168), .B(n563), .C(n174), .Y(n520) );
  OAI21X1 U511 ( .A(n168), .B(n562), .C(n174), .Y(n521) );
  OAI21X1 U512 ( .A(n167), .B(n561), .C(n174), .Y(n522) );
  OAI21X1 U513 ( .A(n167), .B(n560), .C(n174), .Y(n523) );
  OAI21X1 U514 ( .A(n167), .B(n559), .C(n174), .Y(n524) );
  OAI21X1 U515 ( .A(n167), .B(n558), .C(n174), .Y(n525) );
  OAI21X1 U516 ( .A(n167), .B(n557), .C(n174), .Y(n526) );
  OAI21X1 U517 ( .A(n167), .B(n556), .C(n174), .Y(n527) );
  OAI21X1 U518 ( .A(n167), .B(n555), .C(n174), .Y(n528) );
  OAI21X1 U519 ( .A(n167), .B(n554), .C(n174), .Y(n529) );
  OAI21X1 U520 ( .A(n167), .B(n553), .C(n174), .Y(n530) );
  OAI21X1 U521 ( .A(n167), .B(n552), .C(n174), .Y(n531) );
  OAI21X1 U522 ( .A(n167), .B(n551), .C(n174), .Y(n532) );
  OAI21X1 U523 ( .A(n167), .B(n550), .C(n174), .Y(n533) );
  OAI21X1 U524 ( .A(n167), .B(n549), .C(n174), .Y(n534) );
  OAI21X1 U525 ( .A(n167), .B(n548), .C(n174), .Y(n535) );
  OAI21X1 U526 ( .A(n167), .B(n285), .C(n174), .Y(n536) );
  OAI21X1 U527 ( .A(n167), .B(n284), .C(n174), .Y(n537) );
  OAI21X1 U528 ( .A(n167), .B(n283), .C(n174), .Y(n538) );
  OAI21X1 U529 ( .A(n167), .B(n282), .C(n174), .Y(n539) );
  OAI21X1 U530 ( .A(n167), .B(n281), .C(n174), .Y(n540) );
  OAI21X1 U531 ( .A(n167), .B(n280), .C(n174), .Y(n541) );
  OAI21X1 U532 ( .A(n167), .B(n279), .C(n174), .Y(n542) );
  OAI21X1 U533 ( .A(n167), .B(n278), .C(n174), .Y(n543) );
  OAI21X1 U534 ( .A(n167), .B(n277), .C(n174), .Y(n544) );
  OAI21X1 U535 ( .A(n167), .B(n240), .C(n174), .Y(n545) );
  OAI21X1 U536 ( .A(n167), .B(n239), .C(n174), .Y(n546) );
  OAI21X1 U537 ( .A(n167), .B(n238), .C(n174), .Y(n547) );
  NAND3X1 U538 ( .A(n234), .B(n309), .C(n380), .Y(n379) );
  OAI21X1 U539 ( .A(n236), .B(n235), .C(n382), .Y(n381) );
  NAND3X1 U540 ( .A(n236), .B(n235), .C(n237), .Y(n382) );
  NAND3X1 U541 ( .A(n309), .B(n174), .C(n380), .Y(\n_hready[0] ) );
  NOR2X1 U542 ( .A(n232), .B(n233), .Y(n380) );
  NAND3X1 U543 ( .A(n237), .B(n235), .C(Q[1]), .Y(n274) );
  NAND3X1 U544 ( .A(n236), .B(n235), .C(Q[0]), .Y(n275) );
  NAND3X1 U545 ( .A(Q[0]), .B(n235), .C(Q[1]), .Y(n345) );
  NAND3X1 U546 ( .A(Q[0]), .B(n236), .C(Q[2]), .Y(n309) );
  OAI21X1 U547 ( .A(n569), .B(done), .C(n384), .Y(n383) );
  OAI21X1 U548 ( .A(n568), .B(n385), .C(n386), .Y(nQ[1]) );
  NAND3X1 U549 ( .A(hwrite), .B(n568), .C(haddr[0]), .Y(n386) );
  NAND2X1 U550 ( .A(n387), .B(n385), .Y(nQ[0]) );
  NAND2X1 U551 ( .A(hwrite), .B(n570), .Y(n385) );
  NAND2X1 U552 ( .A(haddr[1]), .B(hwrite), .Y(n387) );
  BUFX2 U168 ( .A(n346), .Y(n171) );
  BUFX2 U169 ( .A(n346), .Y(n172) );
  BUFX2 U170 ( .A(n346), .Y(n169) );
  BUFX2 U171 ( .A(n346), .Y(n170) );
  INVX2 U172 ( .A(n184), .Y(n182) );
  BUFX2 U173 ( .A(n346), .Y(n173) );
  INVX2 U174 ( .A(n379), .Y(n168) );
  BUFX2 U175 ( .A(n241), .Y(n188) );
  BUFX2 U176 ( .A(n241), .Y(n189) );
  BUFX2 U177 ( .A(n310), .Y(n178) );
  BUFX2 U178 ( .A(n310), .Y(n179) );
  BUFX2 U179 ( .A(n310), .Y(n176) );
  BUFX2 U180 ( .A(n310), .Y(n177) );
  BUFX2 U181 ( .A(n241), .Y(n191) );
  BUFX2 U182 ( .A(n241), .Y(n190) );
  BUFX2 U183 ( .A(n187), .Y(n183) );
  BUFX2 U184 ( .A(n187), .Y(n184) );
  BUFX2 U185 ( .A(n187), .Y(n185) );
  INVX2 U186 ( .A(n379), .Y(n167) );
  INVX2 U187 ( .A(n186), .Y(n181) );
  BUFX2 U188 ( .A(n187), .Y(n186) );
  BUFX2 U189 ( .A(n310), .Y(n180) );
  BUFX2 U190 ( .A(n241), .Y(n192) );
  BUFX2 U191 ( .A(n193), .Y(n198) );
  BUFX2 U192 ( .A(n193), .Y(n199) );
  BUFX2 U193 ( .A(n193), .Y(n200) );
  BUFX2 U194 ( .A(n194), .Y(n201) );
  BUFX2 U195 ( .A(n194), .Y(n202) );
  BUFX2 U196 ( .A(n194), .Y(n203) );
  BUFX2 U197 ( .A(n195), .Y(n204) );
  BUFX2 U198 ( .A(n195), .Y(n205) );
  BUFX2 U199 ( .A(n195), .Y(n206) );
  BUFX2 U200 ( .A(n196), .Y(n207) );
  BUFX2 U201 ( .A(n196), .Y(n208) );
  BUFX2 U202 ( .A(n196), .Y(n209) );
  BUFX2 U203 ( .A(n197), .Y(n210) );
  BUFX2 U204 ( .A(n197), .Y(n211) );
  INVX2 U205 ( .A(n175), .Y(n174) );
  INVX2 U206 ( .A(n276), .Y(n187) );
  BUFX2 U207 ( .A(n_rst), .Y(n193) );
  BUFX2 U208 ( .A(n_rst), .Y(n194) );
  BUFX2 U209 ( .A(n_rst), .Y(n195) );
  BUFX2 U210 ( .A(n_rst), .Y(n196) );
  BUFX2 U211 ( .A(n_rst), .Y(n197) );
  INVX2 U212 ( .A(n345), .Y(n175) );
  INVX2 U213 ( .A(n594), .Y(n165) );
  INVX4 U214 ( .A(n165), .Y(img_width[2]) );
  INVX1 U215 ( .A(img_width[2]), .Y(n214) );
  INVX2 U216 ( .A(n343), .Y(n221) );
  NAND3X1 U217 ( .A(n309), .B(n274), .C(n221), .Y(n276) );
  INVX2 U218 ( .A(img_width[0]), .Y(n212) );
  INVX2 U219 ( .A(hwdata[16]), .Y(n230) );
  MUX2X1 U220 ( .B(n212), .A(n230), .S(n183), .Y(n420) );
  INVX2 U221 ( .A(img_width[1]), .Y(n213) );
  INVX2 U222 ( .A(hwdata[17]), .Y(n229) );
  MUX2X1 U223 ( .B(n213), .A(n229), .S(n183), .Y(n421) );
  INVX2 U224 ( .A(hwdata[18]), .Y(n228) );
  MUX2X1 U225 ( .B(n214), .A(n228), .S(n183), .Y(n422) );
  INVX2 U226 ( .A(img_width[3]), .Y(n215) );
  INVX2 U227 ( .A(hwdata[19]), .Y(n227) );
  MUX2X1 U228 ( .B(n215), .A(n227), .S(n184), .Y(n423) );
  INVX2 U229 ( .A(img_width[4]), .Y(n216) );
  INVX2 U230 ( .A(hwdata[20]), .Y(n226) );
  MUX2X1 U231 ( .B(n216), .A(n226), .S(n184), .Y(n424) );
  INVX2 U232 ( .A(img_width[5]), .Y(n217) );
  INVX2 U233 ( .A(hwdata[21]), .Y(n225) );
  MUX2X1 U234 ( .B(n217), .A(n225), .S(n184), .Y(n425) );
  INVX2 U235 ( .A(img_width[6]), .Y(n218) );
  INVX2 U236 ( .A(hwdata[22]), .Y(n224) );
  MUX2X1 U237 ( .B(n218), .A(n224), .S(n185), .Y(n426) );
  INVX2 U238 ( .A(img_width[7]), .Y(n219) );
  INVX2 U239 ( .A(hwdata[23]), .Y(n223) );
  MUX2X1 U240 ( .B(n219), .A(n223), .S(n185), .Y(n427) );
  INVX2 U241 ( .A(img_width[8]), .Y(n220) );
  INVX2 U242 ( .A(hwdata[24]), .Y(n222) );
  MUX2X1 U243 ( .B(n220), .A(n222), .S(n185), .Y(n428) );
  INVX2 U309 ( .A(n383), .Y(n231) );
  INVX2 U310 ( .A(n275), .Y(n232) );
  INVX2 U311 ( .A(n274), .Y(n233) );
  INVX2 U312 ( .A(n381), .Y(n234) );
  INVX2 U313 ( .A(Q[2]), .Y(n235) );
  INVX2 U314 ( .A(Q[1]), .Y(n236) );
  INVX2 U315 ( .A(Q[0]), .Y(n237) );
  INVX2 U316 ( .A(hrdata[31]), .Y(n238) );
  INVX2 U317 ( .A(hrdata[30]), .Y(n239) );
  INVX2 U318 ( .A(hrdata[29]), .Y(n240) );
  INVX2 U319 ( .A(hrdata[28]), .Y(n277) );
  INVX2 U320 ( .A(hrdata[27]), .Y(n278) );
  INVX2 U321 ( .A(hrdata[26]), .Y(n279) );
  INVX2 U322 ( .A(hrdata[25]), .Y(n280) );
  INVX2 U323 ( .A(hrdata[24]), .Y(n281) );
  INVX2 U324 ( .A(hrdata[23]), .Y(n282) );
  INVX2 U325 ( .A(hrdata[22]), .Y(n283) );
  INVX2 U326 ( .A(hrdata[21]), .Y(n284) );
  INVX2 U373 ( .A(hrdata[20]), .Y(n285) );
  INVX2 U553 ( .A(hrdata[19]), .Y(n548) );
  INVX2 U554 ( .A(hrdata[18]), .Y(n549) );
  INVX2 U555 ( .A(hrdata[17]), .Y(n550) );
  INVX2 U556 ( .A(hrdata[16]), .Y(n551) );
  INVX2 U557 ( .A(hrdata[15]), .Y(n552) );
  INVX2 U558 ( .A(hrdata[14]), .Y(n553) );
  INVX2 U559 ( .A(hrdata[13]), .Y(n554) );
  INVX2 U560 ( .A(hrdata[12]), .Y(n555) );
  INVX2 U561 ( .A(hrdata[11]), .Y(n556) );
  INVX2 U562 ( .A(hrdata[10]), .Y(n557) );
  INVX2 U563 ( .A(hrdata[9]), .Y(n558) );
  INVX2 U564 ( .A(hrdata[8]), .Y(n559) );
  INVX2 U565 ( .A(hrdata[7]), .Y(n560) );
  INVX2 U566 ( .A(hrdata[6]), .Y(n561) );
  INVX2 U567 ( .A(hrdata[5]), .Y(n562) );
  INVX2 U568 ( .A(hrdata[4]), .Y(n563) );
  INVX2 U569 ( .A(hrdata[3]), .Y(n564) );
  INVX2 U570 ( .A(hrdata[2]), .Y(n565) );
  INVX2 U571 ( .A(hrdata[1]), .Y(n566) );
  INVX2 U572 ( .A(hrdata[0]), .Y(n567) );
  INVX2 U573 ( .A(haddr[1]), .Y(n568) );
  INVX2 U574 ( .A(n387), .Y(n569) );
  INVX2 U575 ( .A(haddr[0]), .Y(n570) );
  INVX2 U576 ( .A(hwdata[31]), .Y(n571) );
  INVX2 U577 ( .A(hwdata[30]), .Y(n572) );
  INVX2 U578 ( .A(hwdata[29]), .Y(n573) );
  INVX2 U579 ( .A(hwdata[28]), .Y(n574) );
  INVX2 U580 ( .A(hwdata[27]), .Y(n575) );
  INVX2 U581 ( .A(hwdata[26]), .Y(n576) );
  INVX2 U582 ( .A(hwdata[25]), .Y(n577) );
  INVX2 U583 ( .A(hwdata[15]), .Y(n578) );
  INVX2 U584 ( .A(hwdata[14]), .Y(n579) );
  INVX2 U585 ( .A(hwdata[13]), .Y(n580) );
  INVX2 U586 ( .A(hwdata[12]), .Y(n581) );
  INVX2 U587 ( .A(hwdata[11]), .Y(n582) );
  INVX2 U588 ( .A(hwdata[10]), .Y(n583) );
  INVX2 U589 ( .A(hwdata[9]), .Y(n584) );
  INVX2 U590 ( .A(hwdata[8]), .Y(n585) );
  INVX2 U591 ( .A(hwdata[7]), .Y(n586) );
  INVX2 U592 ( .A(hwdata[6]), .Y(n587) );
  INVX2 U593 ( .A(hwdata[5]), .Y(n588) );
  INVX2 U594 ( .A(hwdata[4]), .Y(n589) );
  INVX2 U595 ( .A(hwdata[3]), .Y(n590) );
  INVX2 U596 ( .A(hwdata[2]), .Y(n591) );
  INVX2 U597 ( .A(hwdata[1]), .Y(n592) );
  INVX2 U598 ( .A(hwdata[0]), .Y(n593) );
endmodule


module address_counter_DW01_dec_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n10, n13, n14, n15, n16, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75;

  INVX2 U1 ( .A(n74), .Y(SUM[11]) );
  INVX2 U2 ( .A(n71), .Y(SUM[13]) );
  INVX2 U3 ( .A(n68), .Y(SUM[15]) );
  INVX2 U4 ( .A(n65), .Y(SUM[17]) );
  INVX2 U5 ( .A(n62), .Y(SUM[19]) );
  INVX2 U6 ( .A(n57), .Y(SUM[22]) );
  INVX2 U7 ( .A(n54), .Y(SUM[24]) );
  INVX2 U8 ( .A(n51), .Y(SUM[26]) );
  INVX2 U9 ( .A(n48), .Y(SUM[28]) );
  INVX2 U10 ( .A(n59), .Y(n10) );
  INVX2 U11 ( .A(n32), .Y(SUM[9]) );
  INVX2 U12 ( .A(n36), .Y(SUM[7]) );
  INVX2 U13 ( .A(A[6]), .Y(n13) );
  INVX2 U14 ( .A(A[8]), .Y(n14) );
  INVX2 U15 ( .A(A[10]), .Y(n15) );
  INVX2 U16 ( .A(A[16]), .Y(n16) );
  INVX2 U17 ( .A(n61), .Y(SUM[1]) );
  INVX2 U18 ( .A(n39), .Y(SUM[5]) );
  INVX2 U19 ( .A(n42), .Y(SUM[3]) );
  INVX2 U20 ( .A(A[0]), .Y(SUM[0]) );
  INVX2 U21 ( .A(A[2]), .Y(n21) );
  INVX2 U22 ( .A(A[4]), .Y(n22) );
  INVX2 U23 ( .A(A[12]), .Y(n23) );
  INVX2 U24 ( .A(A[14]), .Y(n24) );
  INVX2 U25 ( .A(A[18]), .Y(n25) );
  INVX2 U26 ( .A(A[20]), .Y(n26) );
  INVX2 U27 ( .A(A[21]), .Y(n27) );
  INVX2 U28 ( .A(A[23]), .Y(n28) );
  INVX2 U29 ( .A(A[25]), .Y(n29) );
  INVX2 U30 ( .A(A[27]), .Y(n30) );
  INVX2 U31 ( .A(A[29]), .Y(n31) );
  AOI21X1 U32 ( .A(n33), .B(A[9]), .C(n34), .Y(n32) );
  OAI21X1 U33 ( .A(n35), .B(n14), .C(n33), .Y(SUM[8]) );
  AOI21X1 U34 ( .A(n37), .B(A[7]), .C(n35), .Y(n36) );
  OAI21X1 U35 ( .A(n38), .B(n13), .C(n37), .Y(SUM[6]) );
  AOI21X1 U36 ( .A(n40), .B(A[5]), .C(n38), .Y(n39) );
  OAI21X1 U37 ( .A(n41), .B(n22), .C(n40), .Y(SUM[4]) );
  AOI21X1 U38 ( .A(n43), .B(A[3]), .C(n41), .Y(n42) );
  XOR2X1 U39 ( .A(A[31]), .B(n44), .Y(SUM[31]) );
  NOR2X1 U40 ( .A(A[30]), .B(n45), .Y(n44) );
  XNOR2X1 U41 ( .A(A[30]), .B(n45), .Y(SUM[30]) );
  OAI21X1 U42 ( .A(n46), .B(n21), .C(n43), .Y(SUM[2]) );
  OAI21X1 U43 ( .A(n47), .B(n31), .C(n45), .Y(SUM[29]) );
  NAND2X1 U44 ( .A(n47), .B(n31), .Y(n45) );
  AOI21X1 U45 ( .A(n49), .B(A[28]), .C(n47), .Y(n48) );
  NOR2X1 U46 ( .A(n49), .B(A[28]), .Y(n47) );
  OAI21X1 U47 ( .A(n50), .B(n30), .C(n49), .Y(SUM[27]) );
  NAND2X1 U48 ( .A(n50), .B(n30), .Y(n49) );
  AOI21X1 U49 ( .A(n52), .B(A[26]), .C(n50), .Y(n51) );
  NOR2X1 U50 ( .A(n52), .B(A[26]), .Y(n50) );
  OAI21X1 U51 ( .A(n53), .B(n29), .C(n52), .Y(SUM[25]) );
  NAND2X1 U52 ( .A(n53), .B(n29), .Y(n52) );
  AOI21X1 U53 ( .A(n55), .B(A[24]), .C(n53), .Y(n54) );
  NOR2X1 U54 ( .A(n55), .B(A[24]), .Y(n53) );
  OAI21X1 U55 ( .A(n56), .B(n28), .C(n55), .Y(SUM[23]) );
  NAND2X1 U56 ( .A(n56), .B(n28), .Y(n55) );
  AOI21X1 U57 ( .A(n58), .B(A[22]), .C(n56), .Y(n57) );
  NOR2X1 U58 ( .A(n58), .B(A[22]), .Y(n56) );
  OAI21X1 U59 ( .A(n10), .B(n27), .C(n58), .Y(SUM[21]) );
  NAND2X1 U60 ( .A(n10), .B(n27), .Y(n58) );
  OAI21X1 U61 ( .A(n60), .B(n26), .C(n59), .Y(SUM[20]) );
  NAND2X1 U62 ( .A(n60), .B(n26), .Y(n59) );
  AOI21X1 U63 ( .A(A[0]), .B(A[1]), .C(n46), .Y(n61) );
  AOI21X1 U64 ( .A(n63), .B(A[19]), .C(n60), .Y(n62) );
  NOR2X1 U65 ( .A(n63), .B(A[19]), .Y(n60) );
  OAI21X1 U66 ( .A(n64), .B(n25), .C(n63), .Y(SUM[18]) );
  NAND2X1 U67 ( .A(n64), .B(n25), .Y(n63) );
  AOI21X1 U68 ( .A(n66), .B(A[17]), .C(n64), .Y(n65) );
  NOR2X1 U69 ( .A(n66), .B(A[17]), .Y(n64) );
  OAI21X1 U70 ( .A(n67), .B(n16), .C(n66), .Y(SUM[16]) );
  NAND2X1 U71 ( .A(n67), .B(n16), .Y(n66) );
  AOI21X1 U72 ( .A(n69), .B(A[15]), .C(n67), .Y(n68) );
  NOR2X1 U73 ( .A(n69), .B(A[15]), .Y(n67) );
  OAI21X1 U74 ( .A(n70), .B(n24), .C(n69), .Y(SUM[14]) );
  NAND2X1 U75 ( .A(n70), .B(n24), .Y(n69) );
  AOI21X1 U76 ( .A(n72), .B(A[13]), .C(n70), .Y(n71) );
  NOR2X1 U77 ( .A(n72), .B(A[13]), .Y(n70) );
  OAI21X1 U78 ( .A(n73), .B(n23), .C(n72), .Y(SUM[12]) );
  NAND2X1 U79 ( .A(n73), .B(n23), .Y(n72) );
  AOI21X1 U80 ( .A(n75), .B(A[11]), .C(n73), .Y(n74) );
  NOR2X1 U81 ( .A(n75), .B(A[11]), .Y(n73) );
  OAI21X1 U82 ( .A(n34), .B(n15), .C(n75), .Y(SUM[10]) );
  NAND2X1 U83 ( .A(n34), .B(n15), .Y(n75) );
  NOR2X1 U84 ( .A(n33), .B(A[9]), .Y(n34) );
  NAND2X1 U85 ( .A(n35), .B(n14), .Y(n33) );
  NOR2X1 U86 ( .A(n37), .B(A[7]), .Y(n35) );
  NAND2X1 U87 ( .A(n38), .B(n13), .Y(n37) );
  NOR2X1 U88 ( .A(n40), .B(A[5]), .Y(n38) );
  NAND2X1 U89 ( .A(n41), .B(n22), .Y(n40) );
  NOR2X1 U90 ( .A(n43), .B(A[3]), .Y(n41) );
  NAND2X1 U91 ( .A(n46), .B(n21), .Y(n43) );
  NOR2X1 U92 ( .A(A[1]), .B(A[0]), .Y(n46) );
endmodule


module address_counter_DW01_add_6 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n26, n27, n28, n29, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n47, n49, n50, n51, n54, n56,
         n58, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n149, n150,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n165, n166, n167, n168, n169, n170, n171, n172, n173, n175,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n191, n193, n194, n196, n198, n199, n200, n202, n204, n205, n206,
         n207, n208, n212, n216, n217, n218, n222, n327, n328, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348;
  assign n24 = A[29];
  assign n47 = A[26];
  assign n54 = A[25];
  assign n87 = A[21];
  assign n103 = A[19];
  assign n169 = A[9];

  XOR2X1 U5 ( .A(n14), .B(A[31]), .Y(SUM[31]) );
  XNOR2X1 U6 ( .A(n19), .B(n18), .Y(SUM[30]) );
  MUX2X1 U7 ( .B(n15), .A(n16), .S(n346), .Y(n14) );
  NAND2X1 U8 ( .A(n17), .B(n4), .Y(n15) );
  NAND2X1 U9 ( .A(n17), .B(n343), .Y(n16) );
  NOR2X1 U10 ( .A(n18), .B(n23), .Y(n17) );
  MUX2X1 U13 ( .B(n20), .A(n21), .S(n347), .Y(n19) );
  NAND2X1 U14 ( .A(n22), .B(n4), .Y(n20) );
  NAND2X1 U15 ( .A(n22), .B(n343), .Y(n21) );
  NAND2X1 U17 ( .A(n24), .B(n29), .Y(n23) );
  XNOR2X1 U20 ( .A(n35), .B(n34), .Y(SUM[28]) );
  MUX2X1 U21 ( .B(n27), .A(n28), .S(n347), .Y(n26) );
  NAND2X1 U22 ( .A(n29), .B(n4), .Y(n27) );
  NAND2X1 U23 ( .A(n29), .B(n343), .Y(n28) );
  NOR2X1 U26 ( .A(n44), .B(n330), .Y(n29) );
  XNOR2X1 U30 ( .A(n40), .B(n39), .Y(SUM[27]) );
  MUX2X1 U31 ( .B(n36), .A(n37), .S(n346), .Y(n35) );
  NAND2X1 U32 ( .A(n38), .B(n4), .Y(n36) );
  NAND2X1 U33 ( .A(n38), .B(n343), .Y(n37) );
  NOR2X1 U34 ( .A(n39), .B(n44), .Y(n38) );
  MUX2X1 U37 ( .B(n41), .A(n42), .S(n346), .Y(n40) );
  NAND2X1 U38 ( .A(n43), .B(n4), .Y(n41) );
  NAND2X1 U39 ( .A(n43), .B(n343), .Y(n42) );
  NAND2X1 U43 ( .A(n47), .B(n54), .Y(n44) );
  MUX2X1 U47 ( .B(n50), .A(n51), .S(n346), .Y(n49) );
  NAND2X1 U48 ( .A(n54), .B(n4), .Y(n50) );
  NAND2X1 U49 ( .A(n54), .B(n343), .Y(n51) );
  XNOR2X1 U54 ( .A(n66), .B(n65), .Y(SUM[24]) );
  MUX2X1 U55 ( .B(n328), .A(n58), .S(n347), .Y(n56) );
  NOR2X1 U59 ( .A(n61), .B(n173), .Y(n3) );
  NAND2X1 U60 ( .A(n62), .B(n122), .Y(n61) );
  NOR2X1 U61 ( .A(n63), .B(n93), .Y(n62) );
  NAND2X1 U62 ( .A(n64), .B(n78), .Y(n63) );
  NOR2X1 U63 ( .A(n65), .B(n72), .Y(n64) );
  XNOR2X1 U65 ( .A(n73), .B(n72), .Y(SUM[23]) );
  MUX2X1 U66 ( .B(n67), .A(n68), .S(n346), .Y(n66) );
  NAND2X1 U67 ( .A(n69), .B(n216), .Y(n67) );
  NAND2X1 U68 ( .A(n69), .B(n333), .Y(n68) );
  NOR2X1 U69 ( .A(n70), .B(n123), .Y(n69) );
  NAND2X1 U70 ( .A(n94), .B(n71), .Y(n70) );
  NOR2X1 U71 ( .A(n72), .B(n79), .Y(n71) );
  XNOR2X1 U73 ( .A(n82), .B(n81), .Y(SUM[22]) );
  MUX2X1 U74 ( .B(n74), .A(n75), .S(n346), .Y(n73) );
  NAND2X1 U75 ( .A(n76), .B(n216), .Y(n74) );
  NAND2X1 U76 ( .A(n76), .B(n333), .Y(n75) );
  NOR2X1 U77 ( .A(n77), .B(n123), .Y(n76) );
  NAND2X1 U78 ( .A(n78), .B(n94), .Y(n77) );
  NOR2X1 U81 ( .A(n81), .B(n88), .Y(n78) );
  XNOR2X1 U83 ( .A(n89), .B(n88), .Y(SUM[21]) );
  MUX2X1 U84 ( .B(n83), .A(n84), .S(n346), .Y(n82) );
  NAND2X1 U85 ( .A(n85), .B(n216), .Y(n83) );
  NAND2X1 U86 ( .A(n85), .B(n333), .Y(n84) );
  NOR2X1 U87 ( .A(n86), .B(n123), .Y(n85) );
  NAND2X1 U88 ( .A(n87), .B(n94), .Y(n86) );
  XNOR2X1 U91 ( .A(n98), .B(n97), .Y(SUM[20]) );
  MUX2X1 U92 ( .B(n90), .A(n91), .S(n347), .Y(n89) );
  NAND2X1 U93 ( .A(n92), .B(n216), .Y(n90) );
  NAND2X1 U94 ( .A(n92), .B(n333), .Y(n91) );
  NOR2X1 U95 ( .A(n93), .B(n123), .Y(n92) );
  NAND2X1 U98 ( .A(n96), .B(n110), .Y(n93) );
  NOR2X1 U99 ( .A(n97), .B(n104), .Y(n96) );
  XNOR2X1 U101 ( .A(n105), .B(n104), .Y(SUM[19]) );
  MUX2X1 U102 ( .B(n99), .A(n100), .S(n346), .Y(n98) );
  NAND2X1 U103 ( .A(n101), .B(n216), .Y(n99) );
  NAND2X1 U104 ( .A(n101), .B(n333), .Y(n100) );
  NOR2X1 U105 ( .A(n102), .B(n123), .Y(n101) );
  NAND2X1 U106 ( .A(n103), .B(n110), .Y(n102) );
  XNOR2X1 U109 ( .A(n114), .B(n113), .Y(SUM[18]) );
  MUX2X1 U110 ( .B(n106), .A(n107), .S(n347), .Y(n105) );
  NAND2X1 U111 ( .A(n108), .B(n216), .Y(n106) );
  NAND2X1 U112 ( .A(n108), .B(n333), .Y(n107) );
  NOR2X1 U113 ( .A(n109), .B(n123), .Y(n108) );
  NOR2X1 U117 ( .A(n113), .B(n118), .Y(n110) );
  XNOR2X1 U119 ( .A(n119), .B(n118), .Y(SUM[17]) );
  MUX2X1 U120 ( .B(n115), .A(n116), .S(n347), .Y(n114) );
  NAND2X1 U121 ( .A(n117), .B(n216), .Y(n115) );
  NAND2X1 U122 ( .A(n117), .B(n333), .Y(n116) );
  NOR2X1 U123 ( .A(n118), .B(n123), .Y(n117) );
  XNOR2X1 U125 ( .A(n128), .B(n127), .Y(SUM[16]) );
  MUX2X1 U126 ( .B(n120), .A(n121), .S(n346), .Y(n119) );
  NAND2X1 U127 ( .A(n122), .B(n216), .Y(n120) );
  NAND2X1 U128 ( .A(n338), .B(n333), .Y(n121) );
  NOR2X1 U131 ( .A(n125), .B(n149), .Y(n122) );
  NAND2X1 U132 ( .A(n126), .B(n138), .Y(n125) );
  NOR2X1 U133 ( .A(n127), .B(n132), .Y(n126) );
  XNOR2X1 U135 ( .A(n133), .B(n132), .Y(SUM[15]) );
  MUX2X1 U136 ( .B(n129), .A(n130), .S(n346), .Y(n128) );
  NAND2X1 U137 ( .A(n131), .B(n216), .Y(n129) );
  NAND2X1 U138 ( .A(n131), .B(n333), .Y(n130) );
  NOR2X1 U139 ( .A(n132), .B(n137), .Y(n131) );
  XNOR2X1 U141 ( .A(n140), .B(n139), .Y(SUM[14]) );
  MUX2X1 U142 ( .B(n134), .A(n135), .S(n346), .Y(n133) );
  NAND2X1 U143 ( .A(n136), .B(n216), .Y(n134) );
  NAND2X1 U144 ( .A(n136), .B(n333), .Y(n135) );
  NAND2X1 U146 ( .A(n138), .B(n150), .Y(n137) );
  NOR2X1 U147 ( .A(n139), .B(n144), .Y(n138) );
  XNOR2X1 U149 ( .A(n145), .B(n144), .Y(SUM[13]) );
  MUX2X1 U150 ( .B(n141), .A(n142), .S(n346), .Y(n140) );
  NAND2X1 U151 ( .A(n143), .B(n216), .Y(n141) );
  NAND2X1 U152 ( .A(n143), .B(n333), .Y(n142) );
  NOR2X1 U153 ( .A(n144), .B(n149), .Y(n143) );
  XNOR2X1 U155 ( .A(n154), .B(n153), .Y(SUM[12]) );
  MUX2X1 U156 ( .B(n146), .A(n147), .S(n346), .Y(n145) );
  NAND2X1 U157 ( .A(n150), .B(n216), .Y(n146) );
  NAND2X1 U158 ( .A(n150), .B(n333), .Y(n147) );
  NAND2X1 U162 ( .A(n152), .B(n162), .Y(n149) );
  NOR2X1 U163 ( .A(n153), .B(n158), .Y(n152) );
  XNOR2X1 U165 ( .A(n159), .B(n158), .Y(SUM[11]) );
  MUX2X1 U166 ( .B(n155), .A(n156), .S(n346), .Y(n154) );
  NAND2X1 U167 ( .A(n157), .B(n216), .Y(n155) );
  NAND2X1 U168 ( .A(n157), .B(n333), .Y(n156) );
  NOR2X1 U169 ( .A(n158), .B(n163), .Y(n157) );
  XNOR2X1 U171 ( .A(n166), .B(n165), .Y(SUM[10]) );
  MUX2X1 U172 ( .B(n160), .A(n161), .S(n347), .Y(n159) );
  NAND2X1 U173 ( .A(n162), .B(n216), .Y(n160) );
  NAND2X1 U174 ( .A(n162), .B(n333), .Y(n161) );
  NOR2X1 U177 ( .A(n165), .B(n170), .Y(n162) );
  XNOR2X1 U179 ( .A(n171), .B(n170), .Y(SUM[9]) );
  MUX2X1 U180 ( .B(n167), .A(n168), .S(n346), .Y(n166) );
  NAND2X1 U181 ( .A(n169), .B(n216), .Y(n167) );
  NAND2X1 U182 ( .A(n169), .B(n333), .Y(n168) );
  XOR2X1 U185 ( .A(n347), .B(n5), .Y(SUM[8]) );
  MUX2X1 U186 ( .B(n172), .A(n173), .S(n347), .Y(n171) );
  NAND2X1 U191 ( .A(n173), .B(n216), .Y(n5) );
  NOR2X1 U193 ( .A(B[8]), .B(A[8]), .Y(n172) );
  NAND2X1 U194 ( .A(A[8]), .B(B[8]), .Y(n173) );
  XNOR2X1 U195 ( .A(n183), .B(n6), .Y(SUM[7]) );
  MUX2X1 U196 ( .B(n180), .A(n179), .S(n187), .Y(n2) );
  MUX2X1 U197 ( .B(n181), .A(n182), .S(n184), .Y(n179) );
  MUX2X1 U198 ( .B(n181), .A(n182), .S(n185), .Y(n180) );
  NAND2X1 U199 ( .A(n182), .B(n217), .Y(n6) );
  NOR2X1 U201 ( .A(A[7]), .B(B[7]), .Y(n181) );
  NAND2X1 U202 ( .A(A[7]), .B(B[7]), .Y(n182) );
  XOR2X1 U203 ( .A(n186), .B(n7), .Y(SUM[6]) );
  MUX2X1 U204 ( .B(n184), .A(n185), .S(n186), .Y(n183) );
  NAND2X1 U205 ( .A(n185), .B(n218), .Y(n7) );
  NOR2X1 U207 ( .A(A[6]), .B(B[6]), .Y(n184) );
  NAND2X1 U208 ( .A(A[6]), .B(B[6]), .Y(n185) );
  XOR2X1 U209 ( .A(n194), .B(n8), .Y(SUM[5]) );
  MUX2X1 U211 ( .B(n188), .A(n189), .S(n200), .Y(n187) );
  MUX2X1 U212 ( .B(n191), .A(n340), .S(n339), .Y(n188) );
  MUX2X1 U213 ( .B(n191), .A(n340), .S(n196), .Y(n189) );
  NAND2X1 U216 ( .A(n193), .B(n340), .Y(n8) );
  NAND2X1 U219 ( .A(A[5]), .B(B[5]), .Y(n193) );
  XNOR2X1 U220 ( .A(n199), .B(n9), .Y(SUM[4]) );
  MUX2X1 U221 ( .B(n196), .A(n339), .S(n199), .Y(n194) );
  NAND2X1 U224 ( .A(n198), .B(n339), .Y(n9) );
  NAND2X1 U227 ( .A(A[4]), .B(B[4]), .Y(n198) );
  MUX2X1 U230 ( .B(n202), .A(n341), .S(n205), .Y(n200) );
  NAND2X1 U233 ( .A(n204), .B(n341), .Y(n10) );
  NAND2X1 U236 ( .A(A[3]), .B(B[3]), .Y(n204) );
  XOR2X1 U237 ( .A(n11), .B(n335), .Y(SUM[2]) );
  MUX2X1 U238 ( .B(n206), .A(n207), .S(n208), .Y(n205) );
  NAND2X1 U239 ( .A(n207), .B(n222), .Y(n11) );
  NOR2X1 U241 ( .A(A[2]), .B(B[2]), .Y(n206) );
  NAND2X1 U242 ( .A(A[2]), .B(B[2]), .Y(n207) );
  XNOR2X1 U243 ( .A(n12), .B(n327), .Y(SUM[1]) );
  NAND2X1 U247 ( .A(n212), .B(n342), .Y(n12) );
  INVX4 U260 ( .A(n332), .Y(n333) );
  AND2X2 U261 ( .A(B[0]), .B(A[0]), .Y(n327) );
  OR2X2 U262 ( .A(n61), .B(n172), .Y(n328) );
  INVX2 U263 ( .A(n328), .Y(n4) );
  AND2X2 U264 ( .A(n345), .B(n331), .Y(SUM[0]) );
  OR2X2 U265 ( .A(n34), .B(n39), .Y(n330) );
  OR2X2 U266 ( .A(B[0]), .B(A[0]), .Y(n331) );
  INVX1 U267 ( .A(n87), .Y(n88) );
  INVX1 U268 ( .A(n103), .Y(n104) );
  AND2X2 U269 ( .A(A[1]), .B(B[1]), .Y(n344) );
  MUX2X1 U270 ( .B(n344), .A(n342), .S(n327), .Y(n208) );
  INVX1 U271 ( .A(n181), .Y(n217) );
  INVX2 U272 ( .A(n175), .Y(n332) );
  INVX1 U273 ( .A(n173), .Y(n175) );
  INVX1 U274 ( .A(n184), .Y(n218) );
  INVX1 U275 ( .A(n208), .Y(n334) );
  INVX2 U276 ( .A(n334), .Y(n335) );
  INVX1 U277 ( .A(n205), .Y(n336) );
  INVX2 U278 ( .A(n336), .Y(n337) );
  XNOR2X1 U279 ( .A(n10), .B(n337), .Y(SUM[3]) );
  OR2X2 U280 ( .A(A[4]), .B(B[4]), .Y(n339) );
  OR2X2 U281 ( .A(B[5]), .B(A[5]), .Y(n340) );
  OR2X2 U282 ( .A(A[3]), .B(B[3]), .Y(n341) );
  OR2X2 U283 ( .A(A[1]), .B(B[1]), .Y(n342) );
  NOR2X1 U284 ( .A(n125), .B(n149), .Y(n338) );
  BUFX2 U285 ( .A(n3), .Y(n343) );
  XOR2X1 U286 ( .A(n56), .B(n54), .Y(SUM[25]) );
  XOR2X1 U287 ( .A(n26), .B(n24), .Y(SUM[29]) );
  XOR2X1 U288 ( .A(n49), .B(n47), .Y(SUM[26]) );
  INVX2 U289 ( .A(n172), .Y(n216) );
  INVX1 U290 ( .A(n344), .Y(n212) );
  INVX2 U291 ( .A(n327), .Y(n345) );
  INVX1 U292 ( .A(n343), .Y(n58) );
  INVX1 U293 ( .A(n200), .Y(n199) );
  INVX4 U294 ( .A(n348), .Y(n347) );
  INVX1 U295 ( .A(n187), .Y(n186) );
  INVX4 U296 ( .A(n2), .Y(n348) );
  INVX8 U297 ( .A(n348), .Y(n346) );
  INVX2 U298 ( .A(A[20]), .Y(n97) );
  INVX2 U299 ( .A(n93), .Y(n94) );
  INVX2 U300 ( .A(A[22]), .Y(n81) );
  INVX2 U301 ( .A(n78), .Y(n79) );
  INVX2 U302 ( .A(A[23]), .Y(n72) );
  INVX2 U303 ( .A(A[24]), .Y(n65) );
  INVX2 U304 ( .A(n44), .Y(n43) );
  INVX2 U305 ( .A(A[27]), .Y(n39) );
  INVX2 U306 ( .A(A[28]), .Y(n34) );
  INVX2 U307 ( .A(n206), .Y(n222) );
  INVX2 U308 ( .A(n23), .Y(n22) );
  INVX2 U309 ( .A(n204), .Y(n202) );
  INVX2 U310 ( .A(n198), .Y(n196) );
  INVX2 U311 ( .A(n193), .Y(n191) );
  INVX2 U312 ( .A(A[30]), .Y(n18) );
  INVX2 U313 ( .A(n169), .Y(n170) );
  INVX2 U314 ( .A(A[10]), .Y(n165) );
  INVX2 U315 ( .A(n162), .Y(n163) );
  INVX2 U316 ( .A(A[11]), .Y(n158) );
  INVX2 U317 ( .A(A[12]), .Y(n153) );
  INVX2 U318 ( .A(n149), .Y(n150) );
  INVX2 U319 ( .A(A[13]), .Y(n144) );
  INVX2 U320 ( .A(A[14]), .Y(n139) );
  INVX2 U321 ( .A(n137), .Y(n136) );
  INVX2 U322 ( .A(A[15]), .Y(n132) );
  INVX2 U323 ( .A(A[16]), .Y(n127) );
  INVX2 U324 ( .A(n338), .Y(n123) );
  INVX2 U325 ( .A(A[17]), .Y(n118) );
  INVX2 U326 ( .A(A[18]), .Y(n113) );
  INVX2 U327 ( .A(n110), .Y(n109) );
endmodule


module address_counter_DW01_add_7 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n47, n49, n50, n51, n54,
         n56, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n149, n150,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n165, n166, n167, n168, n169, n170, n171, n172, n173, n175,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n191, n193, n194, n196, n198, n199, n200, n202, n204, n205, n206,
         n207, n208, n212, n213, n214, n215, n216, n217, n218, n222, n327,
         n328, n329, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345;
  assign n24 = A[29];
  assign n47 = A[26];
  assign n54 = A[25];
  assign n87 = A[21];
  assign n103 = A[19];
  assign n169 = A[9];

  XOR2X1 U5 ( .A(n14), .B(A[31]), .Y(SUM[31]) );
  XNOR2X1 U6 ( .A(n19), .B(n18), .Y(SUM[30]) );
  MUX2X1 U7 ( .B(n15), .A(n16), .S(n343), .Y(n14) );
  NAND2X1 U8 ( .A(n17), .B(n4), .Y(n15) );
  NAND2X1 U9 ( .A(n17), .B(n3), .Y(n16) );
  NOR2X1 U10 ( .A(n18), .B(n23), .Y(n17) );
  XNOR2X1 U12 ( .A(n26), .B(n25), .Y(SUM[29]) );
  MUX2X1 U13 ( .B(n20), .A(n21), .S(n343), .Y(n19) );
  NAND2X1 U14 ( .A(n22), .B(n4), .Y(n20) );
  NAND2X1 U15 ( .A(n22), .B(n3), .Y(n21) );
  NAND2X1 U17 ( .A(n24), .B(n29), .Y(n23) );
  XNOR2X1 U20 ( .A(n35), .B(n34), .Y(SUM[28]) );
  MUX2X1 U21 ( .B(n27), .A(n28), .S(n343), .Y(n26) );
  NAND2X1 U22 ( .A(n29), .B(n4), .Y(n27) );
  NAND2X1 U23 ( .A(n29), .B(n3), .Y(n28) );
  NOR2X1 U26 ( .A(n44), .B(n329), .Y(n29) );
  XNOR2X1 U30 ( .A(n40), .B(n39), .Y(SUM[27]) );
  MUX2X1 U31 ( .B(n36), .A(n37), .S(n343), .Y(n35) );
  NAND2X1 U32 ( .A(n38), .B(n4), .Y(n36) );
  NAND2X1 U33 ( .A(n38), .B(n3), .Y(n37) );
  NOR2X1 U34 ( .A(n39), .B(n44), .Y(n38) );
  MUX2X1 U37 ( .B(n41), .A(n42), .S(n343), .Y(n40) );
  NAND2X1 U38 ( .A(n43), .B(n4), .Y(n41) );
  NAND2X1 U39 ( .A(n43), .B(n3), .Y(n42) );
  NAND2X1 U43 ( .A(n47), .B(n54), .Y(n44) );
  MUX2X1 U47 ( .B(n50), .A(n51), .S(n343), .Y(n49) );
  NAND2X1 U48 ( .A(n54), .B(n4), .Y(n50) );
  NAND2X1 U49 ( .A(n54), .B(n3), .Y(n51) );
  XNOR2X1 U54 ( .A(n66), .B(n65), .Y(SUM[24]) );
  MUX2X1 U55 ( .B(n336), .A(n341), .S(n343), .Y(n56) );
  NAND2X1 U60 ( .A(n62), .B(n122), .Y(n61) );
  NOR2X1 U61 ( .A(n63), .B(n93), .Y(n62) );
  NAND2X1 U62 ( .A(n64), .B(n78), .Y(n63) );
  NOR2X1 U63 ( .A(n65), .B(n72), .Y(n64) );
  XNOR2X1 U65 ( .A(n73), .B(n72), .Y(SUM[23]) );
  MUX2X1 U66 ( .B(n67), .A(n68), .S(n343), .Y(n66) );
  NAND2X1 U67 ( .A(n69), .B(n216), .Y(n67) );
  NAND2X1 U68 ( .A(n69), .B(n175), .Y(n68) );
  NOR2X1 U69 ( .A(n70), .B(n123), .Y(n69) );
  NAND2X1 U70 ( .A(n94), .B(n71), .Y(n70) );
  NOR2X1 U71 ( .A(n72), .B(n79), .Y(n71) );
  XNOR2X1 U73 ( .A(n82), .B(n81), .Y(SUM[22]) );
  MUX2X1 U74 ( .B(n74), .A(n75), .S(n343), .Y(n73) );
  NAND2X1 U75 ( .A(n76), .B(n216), .Y(n74) );
  NAND2X1 U76 ( .A(n76), .B(n175), .Y(n75) );
  NOR2X1 U77 ( .A(n77), .B(n123), .Y(n76) );
  NAND2X1 U78 ( .A(n78), .B(n94), .Y(n77) );
  NOR2X1 U81 ( .A(n81), .B(n88), .Y(n78) );
  XNOR2X1 U83 ( .A(n89), .B(n88), .Y(SUM[21]) );
  MUX2X1 U84 ( .B(n83), .A(n84), .S(n343), .Y(n82) );
  NAND2X1 U85 ( .A(n85), .B(n216), .Y(n83) );
  NAND2X1 U86 ( .A(n85), .B(n175), .Y(n84) );
  NOR2X1 U87 ( .A(n86), .B(n123), .Y(n85) );
  NAND2X1 U88 ( .A(n87), .B(n94), .Y(n86) );
  XNOR2X1 U91 ( .A(n98), .B(n97), .Y(SUM[20]) );
  MUX2X1 U92 ( .B(n90), .A(n91), .S(n343), .Y(n89) );
  NAND2X1 U93 ( .A(n92), .B(n216), .Y(n90) );
  NAND2X1 U94 ( .A(n92), .B(n175), .Y(n91) );
  NOR2X1 U95 ( .A(n93), .B(n123), .Y(n92) );
  NAND2X1 U98 ( .A(n96), .B(n110), .Y(n93) );
  NOR2X1 U99 ( .A(n97), .B(n104), .Y(n96) );
  XNOR2X1 U101 ( .A(n105), .B(n104), .Y(SUM[19]) );
  MUX2X1 U102 ( .B(n99), .A(n100), .S(n343), .Y(n98) );
  NAND2X1 U103 ( .A(n101), .B(n216), .Y(n99) );
  NAND2X1 U104 ( .A(n101), .B(n175), .Y(n100) );
  NOR2X1 U105 ( .A(n102), .B(n123), .Y(n101) );
  NAND2X1 U106 ( .A(n103), .B(n110), .Y(n102) );
  XNOR2X1 U109 ( .A(n114), .B(n113), .Y(SUM[18]) );
  MUX2X1 U110 ( .B(n106), .A(n107), .S(n343), .Y(n105) );
  NAND2X1 U111 ( .A(n108), .B(n216), .Y(n106) );
  NAND2X1 U112 ( .A(n108), .B(n175), .Y(n107) );
  NOR2X1 U113 ( .A(n109), .B(n123), .Y(n108) );
  NOR2X1 U117 ( .A(n113), .B(n118), .Y(n110) );
  XNOR2X1 U119 ( .A(n119), .B(n118), .Y(SUM[17]) );
  MUX2X1 U120 ( .B(n115), .A(n116), .S(n343), .Y(n114) );
  NAND2X1 U121 ( .A(n117), .B(n216), .Y(n115) );
  NAND2X1 U122 ( .A(n117), .B(n175), .Y(n116) );
  NOR2X1 U123 ( .A(n118), .B(n123), .Y(n117) );
  XNOR2X1 U125 ( .A(n128), .B(n127), .Y(SUM[16]) );
  MUX2X1 U126 ( .B(n120), .A(n121), .S(n344), .Y(n119) );
  NAND2X1 U127 ( .A(n122), .B(n216), .Y(n120) );
  NAND2X1 U128 ( .A(n122), .B(n175), .Y(n121) );
  NOR2X1 U131 ( .A(n125), .B(n149), .Y(n122) );
  NAND2X1 U132 ( .A(n126), .B(n138), .Y(n125) );
  NOR2X1 U133 ( .A(n127), .B(n132), .Y(n126) );
  XNOR2X1 U135 ( .A(n133), .B(n132), .Y(SUM[15]) );
  MUX2X1 U136 ( .B(n129), .A(n130), .S(n344), .Y(n128) );
  NAND2X1 U137 ( .A(n131), .B(n216), .Y(n129) );
  NAND2X1 U138 ( .A(n131), .B(n175), .Y(n130) );
  NOR2X1 U139 ( .A(n132), .B(n137), .Y(n131) );
  XNOR2X1 U141 ( .A(n140), .B(n139), .Y(SUM[14]) );
  MUX2X1 U142 ( .B(n134), .A(n135), .S(n344), .Y(n133) );
  NAND2X1 U143 ( .A(n136), .B(n216), .Y(n134) );
  NAND2X1 U144 ( .A(n136), .B(n175), .Y(n135) );
  NAND2X1 U146 ( .A(n138), .B(n150), .Y(n137) );
  NOR2X1 U147 ( .A(n139), .B(n144), .Y(n138) );
  XNOR2X1 U149 ( .A(n145), .B(n144), .Y(SUM[13]) );
  MUX2X1 U150 ( .B(n141), .A(n142), .S(n343), .Y(n140) );
  NAND2X1 U151 ( .A(n143), .B(n216), .Y(n141) );
  NAND2X1 U152 ( .A(n143), .B(n175), .Y(n142) );
  NOR2X1 U153 ( .A(n144), .B(n149), .Y(n143) );
  XNOR2X1 U155 ( .A(n154), .B(n153), .Y(SUM[12]) );
  MUX2X1 U156 ( .B(n146), .A(n147), .S(n344), .Y(n145) );
  NAND2X1 U157 ( .A(n150), .B(n216), .Y(n146) );
  NAND2X1 U158 ( .A(n150), .B(n175), .Y(n147) );
  NAND2X1 U162 ( .A(n152), .B(n162), .Y(n149) );
  NOR2X1 U163 ( .A(n153), .B(n158), .Y(n152) );
  XNOR2X1 U165 ( .A(n159), .B(n158), .Y(SUM[11]) );
  MUX2X1 U166 ( .B(n155), .A(n156), .S(n344), .Y(n154) );
  NAND2X1 U167 ( .A(n157), .B(n216), .Y(n155) );
  NAND2X1 U168 ( .A(n157), .B(n175), .Y(n156) );
  NOR2X1 U169 ( .A(n158), .B(n163), .Y(n157) );
  XNOR2X1 U171 ( .A(n166), .B(n165), .Y(SUM[10]) );
  MUX2X1 U172 ( .B(n160), .A(n161), .S(n343), .Y(n159) );
  NAND2X1 U173 ( .A(n335), .B(n216), .Y(n160) );
  NAND2X1 U174 ( .A(n335), .B(n175), .Y(n161) );
  NOR2X1 U177 ( .A(n165), .B(n170), .Y(n162) );
  XNOR2X1 U179 ( .A(n171), .B(n170), .Y(SUM[9]) );
  MUX2X1 U180 ( .B(n167), .A(n168), .S(n343), .Y(n166) );
  NAND2X1 U181 ( .A(n169), .B(n216), .Y(n167) );
  NAND2X1 U182 ( .A(n169), .B(n175), .Y(n168) );
  XOR2X1 U185 ( .A(n343), .B(n5), .Y(SUM[8]) );
  MUX2X1 U186 ( .B(n172), .A(n332), .S(n343), .Y(n171) );
  NAND2X1 U191 ( .A(n332), .B(n216), .Y(n5) );
  NOR2X1 U193 ( .A(A[8]), .B(B[8]), .Y(n172) );
  NAND2X1 U194 ( .A(A[8]), .B(B[8]), .Y(n173) );
  XNOR2X1 U195 ( .A(n183), .B(n6), .Y(SUM[7]) );
  MUX2X1 U196 ( .B(n180), .A(n179), .S(n187), .Y(n2) );
  MUX2X1 U197 ( .B(n181), .A(n182), .S(n184), .Y(n179) );
  MUX2X1 U198 ( .B(n181), .A(n182), .S(n185), .Y(n180) );
  NAND2X1 U199 ( .A(n182), .B(n217), .Y(n6) );
  NOR2X1 U201 ( .A(A[7]), .B(B[7]), .Y(n181) );
  NAND2X1 U202 ( .A(A[7]), .B(B[7]), .Y(n182) );
  XOR2X1 U203 ( .A(n186), .B(n7), .Y(SUM[6]) );
  MUX2X1 U204 ( .B(n327), .A(n328), .S(n186), .Y(n183) );
  NAND2X1 U205 ( .A(n185), .B(n218), .Y(n7) );
  NOR2X1 U207 ( .A(A[6]), .B(B[6]), .Y(n184) );
  NAND2X1 U208 ( .A(A[6]), .B(B[6]), .Y(n185) );
  XOR2X1 U209 ( .A(n194), .B(n8), .Y(SUM[5]) );
  MUX2X1 U211 ( .B(n188), .A(n189), .S(n200), .Y(n187) );
  MUX2X1 U212 ( .B(n191), .A(n339), .S(n338), .Y(n188) );
  MUX2X1 U213 ( .B(n191), .A(n339), .S(n196), .Y(n189) );
  NAND2X1 U216 ( .A(n193), .B(n339), .Y(n8) );
  NAND2X1 U219 ( .A(A[5]), .B(B[5]), .Y(n193) );
  XNOR2X1 U220 ( .A(n199), .B(n9), .Y(SUM[4]) );
  MUX2X1 U221 ( .B(n196), .A(n338), .S(n199), .Y(n194) );
  NAND2X1 U224 ( .A(n198), .B(n338), .Y(n9) );
  NAND2X1 U227 ( .A(A[4]), .B(B[4]), .Y(n198) );
  XNOR2X1 U228 ( .A(n10), .B(n334), .Y(SUM[3]) );
  MUX2X1 U230 ( .B(n202), .A(n340), .S(n205), .Y(n200) );
  NAND2X1 U233 ( .A(n204), .B(n340), .Y(n10) );
  NAND2X1 U236 ( .A(A[3]), .B(B[3]), .Y(n204) );
  XOR2X1 U237 ( .A(n208), .B(n11), .Y(SUM[2]) );
  MUX2X1 U238 ( .B(n206), .A(n207), .S(n208), .Y(n205) );
  NAND2X1 U239 ( .A(n207), .B(n222), .Y(n11) );
  NOR2X1 U241 ( .A(n331), .B(B[2]), .Y(n206) );
  NAND2X1 U242 ( .A(n331), .B(B[2]), .Y(n207) );
  XNOR2X1 U243 ( .A(n12), .B(n213), .Y(SUM[1]) );
  NAND2X1 U247 ( .A(n212), .B(n337), .Y(n12) );
  NOR2X1 U255 ( .A(B[0]), .B(A[0]), .Y(n214) );
  NAND2X1 U256 ( .A(B[0]), .B(A[0]), .Y(n215) );
  INVX4 U260 ( .A(n336), .Y(n4) );
  INVX4 U261 ( .A(n2), .Y(n345) );
  OR2X2 U262 ( .A(A[1]), .B(B[1]), .Y(n337) );
  INVX2 U263 ( .A(n341), .Y(n3) );
  INVX2 U264 ( .A(n218), .Y(n327) );
  BUFX2 U265 ( .A(n185), .Y(n328) );
  OR2X2 U266 ( .A(n34), .B(n39), .Y(n329) );
  NOR2X1 U267 ( .A(n213), .B(n214), .Y(SUM[0]) );
  INVX1 U268 ( .A(n206), .Y(n222) );
  BUFX2 U269 ( .A(A[2]), .Y(n331) );
  INVX2 U270 ( .A(n175), .Y(n332) );
  INVX1 U271 ( .A(n205), .Y(n333) );
  INVX2 U272 ( .A(n333), .Y(n334) );
  OR2X2 U273 ( .A(A[4]), .B(B[4]), .Y(n338) );
  OR2X2 U274 ( .A(B[5]), .B(A[5]), .Y(n339) );
  OR2X2 U275 ( .A(A[3]), .B(B[3]), .Y(n340) );
  NOR2X1 U276 ( .A(n165), .B(n170), .Y(n335) );
  OR2X2 U277 ( .A(n61), .B(n172), .Y(n336) );
  INVX2 U278 ( .A(n345), .Y(n344) );
  XOR2X1 U279 ( .A(n56), .B(n54), .Y(SUM[25]) );
  XOR2X1 U280 ( .A(n49), .B(n47), .Y(SUM[26]) );
  INVX1 U281 ( .A(n184), .Y(n218) );
  OR2X2 U282 ( .A(n61), .B(n173), .Y(n341) );
  INVX1 U283 ( .A(n181), .Y(n217) );
  INVX2 U284 ( .A(n172), .Y(n216) );
  MUX2X1 U285 ( .B(n337), .A(n342), .S(n215), .Y(n208) );
  INVX1 U286 ( .A(n215), .Y(n213) );
  INVX1 U287 ( .A(n187), .Y(n186) );
  AND2X2 U288 ( .A(A[1]), .B(B[1]), .Y(n342) );
  INVX1 U289 ( .A(n342), .Y(n212) );
  INVX2 U290 ( .A(n173), .Y(n175) );
  INVX8 U291 ( .A(n345), .Y(n343) );
  INVX2 U292 ( .A(A[20]), .Y(n97) );
  INVX2 U293 ( .A(n93), .Y(n94) );
  INVX2 U294 ( .A(n87), .Y(n88) );
  INVX2 U295 ( .A(A[22]), .Y(n81) );
  INVX2 U296 ( .A(n78), .Y(n79) );
  INVX2 U297 ( .A(A[23]), .Y(n72) );
  INVX2 U298 ( .A(A[24]), .Y(n65) );
  INVX2 U299 ( .A(n44), .Y(n43) );
  INVX2 U300 ( .A(A[27]), .Y(n39) );
  INVX2 U301 ( .A(A[28]), .Y(n34) );
  INVX2 U302 ( .A(n24), .Y(n25) );
  INVX2 U303 ( .A(n23), .Y(n22) );
  INVX2 U304 ( .A(n204), .Y(n202) );
  INVX2 U305 ( .A(n200), .Y(n199) );
  INVX2 U306 ( .A(n198), .Y(n196) );
  INVX2 U307 ( .A(n193), .Y(n191) );
  INVX2 U308 ( .A(A[30]), .Y(n18) );
  INVX2 U309 ( .A(n169), .Y(n170) );
  INVX2 U310 ( .A(A[10]), .Y(n165) );
  INVX2 U311 ( .A(n335), .Y(n163) );
  INVX2 U312 ( .A(A[11]), .Y(n158) );
  INVX2 U313 ( .A(A[12]), .Y(n153) );
  INVX2 U314 ( .A(n149), .Y(n150) );
  INVX2 U315 ( .A(A[13]), .Y(n144) );
  INVX2 U316 ( .A(A[14]), .Y(n139) );
  INVX2 U317 ( .A(n137), .Y(n136) );
  INVX2 U318 ( .A(A[15]), .Y(n132) );
  INVX2 U319 ( .A(A[16]), .Y(n127) );
  INVX2 U320 ( .A(n122), .Y(n123) );
  INVX2 U321 ( .A(A[17]), .Y(n118) );
  INVX2 U322 ( .A(A[18]), .Y(n113) );
  INVX2 U323 ( .A(n110), .Y(n109) );
  INVX2 U324 ( .A(n103), .Y(n104) );
endmodule


module address_counter_DW01_add_8 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17, n18,
         n19, n20, n21, n22, n23, n24, n26, n27, n28, n29, n30, n31, n32, n33,
         n35, n37, n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n51,
         n52, n53, n55, n56, n58, n59, n60, n62, n64, n65, n66, n67, n68, n69,
         n70, n71, n73, n75, n76, n77, n78, n79, n80, n82, n84, n85, n86, n87,
         n88, n89, n90, n92, n94, n95, n96, n97, n98, n99, n101, n102, n104,
         n105, n106, n107, n108, n110, n111, n113, n114, n115, n117, n119,
         n120, n121, n122, n123, n124, n126, n127, n129, n130, n131, n133,
         n238;
  assign n7 = A[28];
  assign n13 = A[27];
  assign n17 = A[26];
  assign n22 = A[25];
  assign n26 = A[24];
  assign n33 = A[23];
  assign n37 = A[22];
  assign n42 = A[21];
  assign n46 = A[20];
  assign n53 = A[19];
  assign n56 = A[18];
  assign n60 = A[17];
  assign n64 = A[16];
  assign n71 = A[15];
  assign n75 = A[14];
  assign n80 = A[13];
  assign n84 = A[12];
  assign n90 = A[11];
  assign n94 = A[10];
  assign n99 = A[9];
  assign n102 = A[8];
  assign n108 = A[7];
  assign n111 = A[6];
  assign n115 = A[5];
  assign n119 = A[4];
  assign n124 = A[3];
  assign n127 = A[2];
  assign n131 = A[1];
  assign n133 = A[0];

  XOR2X1 U1 ( .A(n2), .B(A[31]), .Y(SUM[31]) );
  HAX1 U2 ( .A(A[30]), .B(n3), .YC(n2), .YS(SUM[30]) );
  HAX1 U3 ( .A(A[29]), .B(n238), .YC(n3), .YS(SUM[29]) );
  XNOR2X1 U5 ( .A(n9), .B(n8), .Y(SUM[28]) );
  NOR2X1 U7 ( .A(n6), .B(n30), .Y(n5) );
  NAND2X1 U8 ( .A(n7), .B(n11), .Y(n6) );
  XNOR2X1 U11 ( .A(n15), .B(n14), .Y(SUM[27]) );
  NOR2X1 U12 ( .A(n10), .B(n28), .Y(n9) );
  NOR2X1 U14 ( .A(n12), .B(n21), .Y(n11) );
  NAND2X1 U15 ( .A(n13), .B(n17), .Y(n12) );
  XOR2X1 U18 ( .A(n19), .B(n18), .Y(SUM[26]) );
  NOR2X1 U19 ( .A(n18), .B(n19), .Y(n15) );
  XNOR2X1 U23 ( .A(n24), .B(n23), .Y(SUM[25]) );
  NAND2X1 U24 ( .A(n20), .B(n29), .Y(n19) );
  NAND2X1 U26 ( .A(n22), .B(n26), .Y(n21) );
  XOR2X1 U29 ( .A(n28), .B(n27), .Y(SUM[24]) );
  NOR2X1 U30 ( .A(n27), .B(n28), .Y(n24) );
  NOR2X1 U36 ( .A(n30), .B(n66), .Y(n29) );
  NAND2X1 U37 ( .A(n31), .B(n51), .Y(n30) );
  NOR2X1 U38 ( .A(n32), .B(n41), .Y(n31) );
  NAND2X1 U39 ( .A(n33), .B(n37), .Y(n32) );
  XOR2X1 U42 ( .A(n39), .B(n38), .Y(SUM[22]) );
  NOR2X1 U43 ( .A(n38), .B(n39), .Y(n35) );
  NAND2X1 U48 ( .A(n40), .B(n49), .Y(n39) );
  NAND2X1 U50 ( .A(n42), .B(n46), .Y(n41) );
  XOR2X1 U53 ( .A(n48), .B(n47), .Y(SUM[20]) );
  NOR2X1 U54 ( .A(n47), .B(n48), .Y(n44) );
  NOR2X1 U60 ( .A(n50), .B(n66), .Y(n49) );
  NOR2X1 U62 ( .A(n52), .B(n59), .Y(n51) );
  NAND2X1 U63 ( .A(n53), .B(n56), .Y(n52) );
  NAND2X1 U67 ( .A(n56), .B(n58), .Y(n55) );
  NOR2X1 U71 ( .A(n59), .B(n66), .Y(n58) );
  NAND2X1 U72 ( .A(n60), .B(n64), .Y(n59) );
  XOR2X1 U75 ( .A(n66), .B(n65), .Y(SUM[16]) );
  NOR2X1 U76 ( .A(n65), .B(n66), .Y(n62) );
  NOR2X1 U82 ( .A(n105), .B(n68), .Y(n67) );
  NAND2X1 U83 ( .A(n69), .B(n88), .Y(n68) );
  NOR2X1 U84 ( .A(n70), .B(n79), .Y(n69) );
  NAND2X1 U85 ( .A(n71), .B(n75), .Y(n70) );
  XOR2X1 U88 ( .A(n77), .B(n76), .Y(SUM[14]) );
  NOR2X1 U89 ( .A(n76), .B(n77), .Y(n73) );
  NAND2X1 U94 ( .A(n78), .B(n86), .Y(n77) );
  NAND2X1 U96 ( .A(n80), .B(n84), .Y(n79) );
  XNOR2X1 U99 ( .A(n86), .B(n85), .Y(SUM[12]) );
  NOR2X1 U100 ( .A(n85), .B(n87), .Y(n82) );
  NAND2X1 U106 ( .A(n88), .B(n104), .Y(n87) );
  NOR2X1 U107 ( .A(n89), .B(n98), .Y(n88) );
  NAND2X1 U108 ( .A(n90), .B(n94), .Y(n89) );
  XOR2X1 U111 ( .A(n96), .B(n95), .Y(SUM[10]) );
  NOR2X1 U112 ( .A(n95), .B(n96), .Y(n92) );
  NAND2X1 U117 ( .A(n97), .B(n104), .Y(n96) );
  NAND2X1 U119 ( .A(n99), .B(n102), .Y(n98) );
  NAND2X1 U123 ( .A(n102), .B(n104), .Y(n101) );
  NAND2X1 U128 ( .A(n122), .B(n106), .Y(n105) );
  NOR2X1 U129 ( .A(n107), .B(n114), .Y(n106) );
  NAND2X1 U130 ( .A(n108), .B(n111), .Y(n107) );
  NAND2X1 U134 ( .A(n111), .B(n113), .Y(n110) );
  NOR2X1 U138 ( .A(n114), .B(n121), .Y(n113) );
  NAND2X1 U139 ( .A(n115), .B(n119), .Y(n114) );
  XOR2X1 U142 ( .A(n121), .B(n120), .Y(SUM[4]) );
  NOR2X1 U143 ( .A(n120), .B(n121), .Y(n117) );
  NOR2X1 U149 ( .A(n130), .B(n123), .Y(n122) );
  NAND2X1 U150 ( .A(n124), .B(n127), .Y(n123) );
  NAND2X1 U154 ( .A(n127), .B(n129), .Y(n126) );
  XNOR2X1 U157 ( .A(n131), .B(n133), .Y(SUM[1]) );
  NOR2X1 U159 ( .A(n131), .B(n133), .Y(n130) );
  AND2X2 U169 ( .A(n67), .B(n5), .Y(n238) );
  XOR2X1 U170 ( .A(n58), .B(n56), .Y(SUM[18]) );
  XOR2X1 U171 ( .A(n35), .B(n33), .Y(SUM[23]) );
  XOR2X1 U172 ( .A(n44), .B(n42), .Y(SUM[21]) );
  XNOR2X1 U173 ( .A(n55), .B(n53), .Y(SUM[19]) );
  XOR2X1 U174 ( .A(n62), .B(n60), .Y(SUM[17]) );
  XOR2X1 U175 ( .A(n73), .B(n71), .Y(SUM[15]) );
  XOR2X1 U176 ( .A(n82), .B(n80), .Y(SUM[13]) );
  XOR2X1 U177 ( .A(n92), .B(n90), .Y(SUM[11]) );
  XNOR2X1 U178 ( .A(n101), .B(n99), .Y(SUM[9]) );
  XOR2X1 U179 ( .A(n104), .B(n102), .Y(SUM[8]) );
  XNOR2X1 U180 ( .A(n110), .B(n108), .Y(SUM[7]) );
  XOR2X1 U181 ( .A(n113), .B(n111), .Y(SUM[6]) );
  XOR2X1 U182 ( .A(n117), .B(n115), .Y(SUM[5]) );
  XNOR2X1 U183 ( .A(n126), .B(n124), .Y(SUM[3]) );
  XOR2X1 U184 ( .A(n129), .B(n127), .Y(SUM[2]) );
  INVX1 U185 ( .A(n133), .Y(SUM[0]) );
  INVX2 U186 ( .A(n98), .Y(n97) );
  INVX2 U187 ( .A(n94), .Y(n95) );
  INVX2 U188 ( .A(n87), .Y(n86) );
  INVX2 U189 ( .A(n84), .Y(n85) );
  INVX2 U190 ( .A(n7), .Y(n8) );
  INVX2 U191 ( .A(n79), .Y(n78) );
  INVX2 U192 ( .A(n75), .Y(n76) );
  INVX2 U193 ( .A(n67), .Y(n66) );
  INVX2 U194 ( .A(n64), .Y(n65) );
  INVX2 U195 ( .A(n51), .Y(n50) );
  INVX2 U196 ( .A(n49), .Y(n48) );
  INVX2 U197 ( .A(n46), .Y(n47) );
  INVX2 U198 ( .A(n41), .Y(n40) );
  INVX2 U199 ( .A(n37), .Y(n38) );
  INVX2 U200 ( .A(n29), .Y(n28) );
  INVX2 U201 ( .A(n26), .Y(n27) );
  INVX2 U202 ( .A(n22), .Y(n23) );
  INVX2 U203 ( .A(n21), .Y(n20) );
  INVX2 U204 ( .A(n17), .Y(n18) );
  INVX2 U205 ( .A(n13), .Y(n14) );
  INVX2 U206 ( .A(n130), .Y(n129) );
  INVX2 U207 ( .A(n122), .Y(n121) );
  INVX2 U208 ( .A(n119), .Y(n120) );
  INVX2 U209 ( .A(n105), .Y(n104) );
  INVX2 U210 ( .A(n11), .Y(n10) );
endmodule


module address_counter_DW01_add_9 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17, n18,
         n19, n20, n21, n22, n23, n24, n26, n27, n28, n29, n30, n31, n32, n33,
         n35, n37, n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n51,
         n52, n53, n55, n56, n58, n59, n60, n62, n64, n65, n66, n67, n68, n69,
         n70, n71, n73, n75, n76, n77, n78, n79, n80, n82, n84, n85, n86, n87,
         n88, n89, n90, n92, n94, n95, n96, n97, n98, n99, n101, n102, n104,
         n105, n106, n107, n108, n110, n111, n113, n114, n115, n117, n119,
         n120, n121, n122, n123, n124, n126, n127, n129, n130, n131, n133,
         n238;
  assign n7 = A[28];
  assign n13 = A[27];
  assign n17 = A[26];
  assign n22 = A[25];
  assign n26 = A[24];
  assign n33 = A[23];
  assign n37 = A[22];
  assign n42 = A[21];
  assign n46 = A[20];
  assign n53 = A[19];
  assign n56 = A[18];
  assign n60 = A[17];
  assign n64 = A[16];
  assign n71 = A[15];
  assign n75 = A[14];
  assign n80 = A[13];
  assign n84 = A[12];
  assign n90 = A[11];
  assign n94 = A[10];
  assign n99 = A[9];
  assign n102 = A[8];
  assign n108 = A[7];
  assign n111 = A[6];
  assign n115 = A[5];
  assign n119 = A[4];
  assign n124 = A[3];
  assign n127 = A[2];
  assign n131 = A[1];
  assign n133 = A[0];

  XOR2X1 U1 ( .A(n2), .B(A[31]), .Y(SUM[31]) );
  HAX1 U2 ( .A(A[30]), .B(n3), .YC(n2), .YS(SUM[30]) );
  HAX1 U3 ( .A(A[29]), .B(n238), .YC(n3), .YS(SUM[29]) );
  XNOR2X1 U5 ( .A(n9), .B(n8), .Y(SUM[28]) );
  NOR2X1 U7 ( .A(n6), .B(n30), .Y(n5) );
  NAND2X1 U8 ( .A(n7), .B(n11), .Y(n6) );
  XNOR2X1 U11 ( .A(n15), .B(n14), .Y(SUM[27]) );
  NOR2X1 U12 ( .A(n10), .B(n28), .Y(n9) );
  NOR2X1 U14 ( .A(n12), .B(n21), .Y(n11) );
  NAND2X1 U15 ( .A(n13), .B(n17), .Y(n12) );
  XOR2X1 U18 ( .A(n19), .B(n18), .Y(SUM[26]) );
  NOR2X1 U19 ( .A(n18), .B(n19), .Y(n15) );
  XNOR2X1 U23 ( .A(n24), .B(n23), .Y(SUM[25]) );
  NAND2X1 U24 ( .A(n20), .B(n29), .Y(n19) );
  NAND2X1 U26 ( .A(n22), .B(n26), .Y(n21) );
  XOR2X1 U29 ( .A(n28), .B(n27), .Y(SUM[24]) );
  NOR2X1 U30 ( .A(n27), .B(n28), .Y(n24) );
  NOR2X1 U36 ( .A(n30), .B(n66), .Y(n29) );
  NAND2X1 U37 ( .A(n31), .B(n51), .Y(n30) );
  NOR2X1 U38 ( .A(n32), .B(n41), .Y(n31) );
  NAND2X1 U39 ( .A(n33), .B(n37), .Y(n32) );
  XOR2X1 U42 ( .A(n39), .B(n38), .Y(SUM[22]) );
  NOR2X1 U43 ( .A(n38), .B(n39), .Y(n35) );
  NAND2X1 U48 ( .A(n40), .B(n49), .Y(n39) );
  NAND2X1 U50 ( .A(n42), .B(n46), .Y(n41) );
  XOR2X1 U53 ( .A(n48), .B(n47), .Y(SUM[20]) );
  NOR2X1 U54 ( .A(n47), .B(n48), .Y(n44) );
  NOR2X1 U60 ( .A(n50), .B(n66), .Y(n49) );
  NOR2X1 U62 ( .A(n52), .B(n59), .Y(n51) );
  NAND2X1 U63 ( .A(n53), .B(n56), .Y(n52) );
  NAND2X1 U67 ( .A(n56), .B(n58), .Y(n55) );
  NOR2X1 U71 ( .A(n59), .B(n66), .Y(n58) );
  NAND2X1 U72 ( .A(n60), .B(n64), .Y(n59) );
  XOR2X1 U75 ( .A(n66), .B(n65), .Y(SUM[16]) );
  NOR2X1 U76 ( .A(n65), .B(n66), .Y(n62) );
  NOR2X1 U82 ( .A(n105), .B(n68), .Y(n67) );
  NAND2X1 U83 ( .A(n69), .B(n88), .Y(n68) );
  NOR2X1 U84 ( .A(n70), .B(n79), .Y(n69) );
  NAND2X1 U85 ( .A(n71), .B(n75), .Y(n70) );
  XOR2X1 U88 ( .A(n77), .B(n76), .Y(SUM[14]) );
  NOR2X1 U89 ( .A(n76), .B(n77), .Y(n73) );
  NAND2X1 U94 ( .A(n78), .B(n86), .Y(n77) );
  NAND2X1 U96 ( .A(n80), .B(n84), .Y(n79) );
  XNOR2X1 U99 ( .A(n86), .B(n85), .Y(SUM[12]) );
  NOR2X1 U100 ( .A(n85), .B(n87), .Y(n82) );
  NAND2X1 U106 ( .A(n88), .B(n104), .Y(n87) );
  NOR2X1 U107 ( .A(n89), .B(n98), .Y(n88) );
  NAND2X1 U108 ( .A(n90), .B(n94), .Y(n89) );
  XOR2X1 U111 ( .A(n96), .B(n95), .Y(SUM[10]) );
  NOR2X1 U112 ( .A(n95), .B(n96), .Y(n92) );
  NAND2X1 U117 ( .A(n97), .B(n104), .Y(n96) );
  NAND2X1 U119 ( .A(n99), .B(n102), .Y(n98) );
  NAND2X1 U123 ( .A(n102), .B(n104), .Y(n101) );
  NAND2X1 U128 ( .A(n122), .B(n106), .Y(n105) );
  NOR2X1 U129 ( .A(n107), .B(n114), .Y(n106) );
  NAND2X1 U130 ( .A(n108), .B(n111), .Y(n107) );
  NAND2X1 U134 ( .A(n111), .B(n113), .Y(n110) );
  NOR2X1 U138 ( .A(n114), .B(n121), .Y(n113) );
  NAND2X1 U139 ( .A(n115), .B(n119), .Y(n114) );
  XOR2X1 U142 ( .A(n121), .B(n120), .Y(SUM[4]) );
  NOR2X1 U143 ( .A(n120), .B(n121), .Y(n117) );
  NOR2X1 U149 ( .A(n130), .B(n123), .Y(n122) );
  NAND2X1 U150 ( .A(n124), .B(n127), .Y(n123) );
  NAND2X1 U154 ( .A(n127), .B(n129), .Y(n126) );
  XNOR2X1 U157 ( .A(n131), .B(n133), .Y(SUM[1]) );
  NOR2X1 U159 ( .A(n131), .B(n133), .Y(n130) );
  AND2X2 U169 ( .A(n67), .B(n5), .Y(n238) );
  XNOR2X1 U170 ( .A(n55), .B(n53), .Y(SUM[19]) );
  XOR2X1 U171 ( .A(n58), .B(n56), .Y(SUM[18]) );
  XOR2X1 U172 ( .A(n44), .B(n42), .Y(SUM[21]) );
  XOR2X1 U173 ( .A(n35), .B(n33), .Y(SUM[23]) );
  XOR2X1 U174 ( .A(n62), .B(n60), .Y(SUM[17]) );
  XOR2X1 U175 ( .A(n73), .B(n71), .Y(SUM[15]) );
  XOR2X1 U176 ( .A(n82), .B(n80), .Y(SUM[13]) );
  XOR2X1 U177 ( .A(n92), .B(n90), .Y(SUM[11]) );
  XOR2X1 U178 ( .A(n129), .B(n127), .Y(SUM[2]) );
  XNOR2X1 U179 ( .A(n101), .B(n99), .Y(SUM[9]) );
  XNOR2X1 U180 ( .A(n110), .B(n108), .Y(SUM[7]) );
  XNOR2X1 U181 ( .A(n126), .B(n124), .Y(SUM[3]) );
  XOR2X1 U182 ( .A(n104), .B(n102), .Y(SUM[8]) );
  XOR2X1 U183 ( .A(n113), .B(n111), .Y(SUM[6]) );
  XOR2X1 U184 ( .A(n117), .B(n115), .Y(SUM[5]) );
  INVX1 U185 ( .A(n133), .Y(SUM[0]) );
  INVX2 U186 ( .A(n98), .Y(n97) );
  INVX2 U187 ( .A(n94), .Y(n95) );
  INVX2 U188 ( .A(n87), .Y(n86) );
  INVX2 U189 ( .A(n84), .Y(n85) );
  INVX2 U190 ( .A(n7), .Y(n8) );
  INVX2 U191 ( .A(n79), .Y(n78) );
  INVX2 U192 ( .A(n75), .Y(n76) );
  INVX2 U193 ( .A(n67), .Y(n66) );
  INVX2 U194 ( .A(n64), .Y(n65) );
  INVX2 U195 ( .A(n51), .Y(n50) );
  INVX2 U196 ( .A(n49), .Y(n48) );
  INVX2 U197 ( .A(n46), .Y(n47) );
  INVX2 U198 ( .A(n41), .Y(n40) );
  INVX2 U199 ( .A(n37), .Y(n38) );
  INVX2 U200 ( .A(n29), .Y(n28) );
  INVX2 U201 ( .A(n26), .Y(n27) );
  INVX2 U202 ( .A(n22), .Y(n23) );
  INVX2 U203 ( .A(n21), .Y(n20) );
  INVX2 U204 ( .A(n17), .Y(n18) );
  INVX2 U205 ( .A(n13), .Y(n14) );
  INVX2 U206 ( .A(n130), .Y(n129) );
  INVX2 U207 ( .A(n122), .Y(n121) );
  INVX2 U208 ( .A(n119), .Y(n120) );
  INVX2 U209 ( .A(n105), .Y(n104) );
  INVX2 U210 ( .A(n11), .Y(n10) );
endmodule


module address_counter_DW01_inc_2 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n1, n2, n3, n5, n7, n8, n9, n10, n11, n12, n14, n15, n17, n18, n19,
         n20, n21, n23, n24, n26, n27, n28, n30, n31, n33, n34, n35, n36, n37,
         n38, n40, n41, n43, n44, n45, n47, n49, n50, n51, n52, n53, n54, n55,
         n56, n58, n60, n61, n62, n63, n64, n65, n67, n69, n70, n71, n72, n73,
         n74, n75, n77, n79, n80, n81, n82, n83, n84, n87, n90, n91, n92, n93,
         n95, n96, n98, n99, n100, n102, n104, n105, n106, n107, n108, n109,
         n111, n112, n114, n115, n116, n118, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199;
  assign n5 = A[27];
  assign n12 = A[25];
  assign n15 = A[24];
  assign n21 = A[23];
  assign n24 = A[22];
  assign n28 = A[21];
  assign n31 = A[20];
  assign n38 = A[19];
  assign n41 = A[18];
  assign n45 = A[17];
  assign n49 = A[16];
  assign n56 = A[15];
  assign n60 = A[14];
  assign n65 = A[13];
  assign n69 = A[12];
  assign n75 = A[11];
  assign n79 = A[10];
  assign n84 = A[9];
  assign n87 = A[8];
  assign n93 = A[7];
  assign n96 = A[6];
  assign n100 = A[5];
  assign n104 = A[4];
  assign n109 = A[3];
  assign n112 = A[2];
  assign n116 = A[1];
  assign n118 = A[0];

  XOR2X1 U1 ( .A(n1), .B(A[31]), .Y(SUM[31]) );
  HAX1 U2 ( .A(A[30]), .B(n2), .YC(n1), .YS(SUM[30]) );
  HAX1 U3 ( .A(A[29]), .B(n3), .YC(n2), .YS(SUM[29]) );
  HAX1 U4 ( .A(A[28]), .B(n196), .YC(n3), .YS(SUM[28]) );
  XNOR2X1 U6 ( .A(n7), .B(n199), .Y(SUM[27]) );
  XOR2X1 U10 ( .A(n9), .B(n8), .Y(SUM[26]) );
  NOR2X1 U11 ( .A(n8), .B(n9), .Y(n7) );
  NAND2X1 U14 ( .A(n194), .B(n189), .Y(n9) );
  NOR2X1 U15 ( .A(n11), .B(n18), .Y(n10) );
  NAND2X1 U16 ( .A(n15), .B(n12), .Y(n11) );
  NAND2X1 U20 ( .A(n15), .B(n17), .Y(n14) );
  NOR2X1 U24 ( .A(n18), .B(n51), .Y(n17) );
  NAND2X1 U25 ( .A(n19), .B(n36), .Y(n18) );
  NOR2X1 U26 ( .A(n20), .B(n27), .Y(n19) );
  NAND2X1 U27 ( .A(n21), .B(n24), .Y(n20) );
  NAND2X1 U31 ( .A(n24), .B(n26), .Y(n23) );
  NOR2X1 U35 ( .A(n190), .B(n33), .Y(n26) );
  NAND2X1 U36 ( .A(n31), .B(n28), .Y(n27) );
  NAND2X1 U40 ( .A(n31), .B(n34), .Y(n30) );
  NOR2X1 U45 ( .A(n35), .B(n51), .Y(n34) );
  NOR2X1 U47 ( .A(n44), .B(n37), .Y(n36) );
  NAND2X1 U48 ( .A(n38), .B(n41), .Y(n37) );
  NAND2X1 U52 ( .A(n41), .B(n43), .Y(n40) );
  NOR2X1 U56 ( .A(n44), .B(n51), .Y(n43) );
  NAND2X1 U57 ( .A(n45), .B(n49), .Y(n44) );
  XOR2X1 U60 ( .A(n195), .B(n50), .Y(SUM[16]) );
  NOR2X1 U61 ( .A(n50), .B(n195), .Y(n47) );
  NOR2X1 U67 ( .A(n90), .B(n53), .Y(n52) );
  NAND2X1 U68 ( .A(n54), .B(n73), .Y(n53) );
  NOR2X1 U69 ( .A(n55), .B(n64), .Y(n54) );
  NAND2X1 U70 ( .A(n56), .B(n60), .Y(n55) );
  XOR2X1 U73 ( .A(n62), .B(n61), .Y(SUM[14]) );
  NOR2X1 U74 ( .A(n61), .B(n62), .Y(n58) );
  NAND2X1 U79 ( .A(n63), .B(n71), .Y(n62) );
  NAND2X1 U81 ( .A(n65), .B(n69), .Y(n64) );
  XNOR2X1 U84 ( .A(n71), .B(n70), .Y(SUM[12]) );
  NOR2X1 U85 ( .A(n70), .B(n72), .Y(n67) );
  NAND2X1 U91 ( .A(n73), .B(n192), .Y(n72) );
  NOR2X1 U92 ( .A(n74), .B(n83), .Y(n73) );
  NAND2X1 U93 ( .A(n75), .B(n79), .Y(n74) );
  XOR2X1 U96 ( .A(n81), .B(n80), .Y(SUM[10]) );
  NOR2X1 U97 ( .A(n80), .B(n81), .Y(n77) );
  NAND2X1 U102 ( .A(n82), .B(n192), .Y(n81) );
  NAND2X1 U104 ( .A(n84), .B(n87), .Y(n83) );
  NAND2X1 U113 ( .A(n107), .B(n91), .Y(n90) );
  NOR2X1 U114 ( .A(n92), .B(n99), .Y(n91) );
  NAND2X1 U115 ( .A(n93), .B(n96), .Y(n92) );
  NAND2X1 U119 ( .A(n96), .B(n98), .Y(n95) );
  NOR2X1 U123 ( .A(n191), .B(n106), .Y(n98) );
  NAND2X1 U124 ( .A(n100), .B(n104), .Y(n99) );
  XOR2X1 U127 ( .A(n106), .B(n105), .Y(SUM[4]) );
  NOR2X1 U128 ( .A(n105), .B(n106), .Y(n102) );
  NOR2X1 U134 ( .A(n115), .B(n108), .Y(n107) );
  NAND2X1 U135 ( .A(n112), .B(n109), .Y(n108) );
  NAND2X1 U139 ( .A(n112), .B(n114), .Y(n111) );
  NAND2X1 U144 ( .A(n118), .B(n116), .Y(n115) );
  INVX1 U151 ( .A(n10), .Y(n188) );
  INVX2 U152 ( .A(n188), .Y(n189) );
  BUFX2 U153 ( .A(n27), .Y(n190) );
  BUFX2 U154 ( .A(n99), .Y(n191) );
  INVX1 U155 ( .A(n36), .Y(n35) );
  INVX1 U156 ( .A(n107), .Y(n106) );
  INVX1 U157 ( .A(n90), .Y(n192) );
  XNOR2X1 U158 ( .A(n193), .B(n84), .Y(SUM[9]) );
  NAND2X1 U159 ( .A(n87), .B(n192), .Y(n193) );
  INVX1 U160 ( .A(n51), .Y(n194) );
  INVX2 U161 ( .A(n194), .Y(n195) );
  NOR2X1 U162 ( .A(n197), .B(n198), .Y(n196) );
  XNOR2X1 U163 ( .A(n14), .B(n12), .Y(SUM[25]) );
  XNOR2X1 U164 ( .A(n40), .B(n38), .Y(SUM[19]) );
  XNOR2X1 U165 ( .A(n30), .B(n28), .Y(SUM[21]) );
  XNOR2X1 U166 ( .A(n33), .B(n31), .Y(SUM[20]) );
  XNOR2X1 U167 ( .A(n95), .B(n93), .Y(SUM[7]) );
  XNOR2X1 U168 ( .A(n23), .B(n21), .Y(SUM[23]) );
  XOR2X1 U169 ( .A(n41), .B(n43), .Y(SUM[18]) );
  XOR2X1 U170 ( .A(n26), .B(n24), .Y(SUM[22]) );
  XOR2X1 U171 ( .A(n17), .B(n15), .Y(SUM[24]) );
  XOR2X1 U172 ( .A(n47), .B(n45), .Y(SUM[17]) );
  XOR2X1 U173 ( .A(n58), .B(n56), .Y(SUM[15]) );
  XOR2X1 U174 ( .A(n67), .B(n65), .Y(SUM[13]) );
  XOR2X1 U175 ( .A(n77), .B(n75), .Y(SUM[11]) );
  XNOR2X1 U176 ( .A(n111), .B(n109), .Y(SUM[3]) );
  XOR2X1 U177 ( .A(n192), .B(n87), .Y(SUM[8]) );
  XOR2X1 U178 ( .A(n98), .B(n96), .Y(SUM[6]) );
  XOR2X1 U179 ( .A(n112), .B(n114), .Y(SUM[2]) );
  XOR2X1 U180 ( .A(n102), .B(n100), .Y(SUM[5]) );
  XOR2X1 U181 ( .A(n116), .B(n118), .Y(SUM[1]) );
  INVX1 U182 ( .A(n52), .Y(n51) );
  NAND2X1 U183 ( .A(n10), .B(n52), .Y(n197) );
  OR2X1 U184 ( .A(n199), .B(n8), .Y(n198) );
  INVX2 U185 ( .A(n5), .Y(n199) );
  INVX1 U186 ( .A(n118), .Y(SUM[0]) );
  INVX1 U187 ( .A(n115), .Y(n114) );
  INVX2 U188 ( .A(n83), .Y(n82) );
  INVX2 U189 ( .A(A[26]), .Y(n8) );
  INVX2 U190 ( .A(n79), .Y(n80) );
  INVX2 U191 ( .A(n72), .Y(n71) );
  INVX2 U192 ( .A(n69), .Y(n70) );
  INVX2 U193 ( .A(n64), .Y(n63) );
  INVX2 U194 ( .A(n60), .Y(n61) );
  INVX2 U195 ( .A(n49), .Y(n50) );
  INVX2 U196 ( .A(n34), .Y(n33) );
  INVX2 U197 ( .A(n104), .Y(n105) );
endmodule


module address_counter_DW01_inc_3 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n2, n3, n4, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n50, n51, n53, n54, n55, n56, n57, n58, n59, n61, n62, n63,
         n64, n65, n66, n67, n68, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n105, n106,
         n107, n108, n110, n112, n113, n114, n117, n119, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202;
  assign n2 = A[30];
  assign n6 = A[28];
  assign n11 = A[26];
  assign n22 = A[23];
  assign n25 = A[22];
  assign n29 = A[21];
  assign n32 = A[20];
  assign n39 = A[19];
  assign n42 = A[18];
  assign n46 = A[17];
  assign n50 = A[16];
  assign n57 = A[15];
  assign n61 = A[14];
  assign n66 = A[13];
  assign n70 = A[12];
  assign n76 = A[11];
  assign n80 = A[10];
  assign n85 = A[9];
  assign n88 = A[8];
  assign n94 = A[7];
  assign n97 = A[6];
  assign n101 = A[5];
  assign n105 = A[4];
  assign n110 = A[3];
  assign n113 = A[2];
  assign n117 = A[1];
  assign n119 = A[0];

  XOR2X1 U1 ( .A(n197), .B(A[31]), .Y(SUM[31]) );
  XNOR2X1 U3 ( .A(n192), .B(n3), .Y(SUM[30]) );
  HAX1 U7 ( .A(A[29]), .B(n194), .YC(n4), .YS(SUM[29]) );
  XNOR2X1 U9 ( .A(n8), .B(n200), .Y(SUM[28]) );
  XOR2X1 U13 ( .A(n10), .B(n9), .Y(SUM[27]) );
  NOR2X1 U14 ( .A(n201), .B(n202), .Y(n8) );
  XNOR2X1 U16 ( .A(n13), .B(n12), .Y(SUM[26]) );
  XOR2X1 U20 ( .A(n15), .B(n14), .Y(SUM[25]) );
  NOR2X1 U21 ( .A(n14), .B(n15), .Y(n13) );
  XNOR2X1 U23 ( .A(n18), .B(n17), .Y(SUM[24]) );
  NAND2X1 U24 ( .A(n53), .B(n16), .Y(n15) );
  NOR2X1 U25 ( .A(n17), .B(n19), .Y(n16) );
  XOR2X1 U27 ( .A(n24), .B(n23), .Y(SUM[23]) );
  NOR2X1 U28 ( .A(n19), .B(n191), .Y(n18) );
  NAND2X1 U29 ( .A(n20), .B(n37), .Y(n19) );
  NOR2X1 U30 ( .A(n21), .B(n28), .Y(n20) );
  NAND2X1 U31 ( .A(n22), .B(n25), .Y(n21) );
  XNOR2X1 U34 ( .A(n27), .B(n26), .Y(SUM[22]) );
  NAND2X1 U35 ( .A(n25), .B(n27), .Y(n24) );
  XOR2X1 U38 ( .A(n31), .B(n30), .Y(SUM[21]) );
  NOR2X1 U39 ( .A(n28), .B(n34), .Y(n27) );
  NAND2X1 U40 ( .A(n32), .B(n29), .Y(n28) );
  XOR2X1 U43 ( .A(n34), .B(n33), .Y(SUM[20]) );
  NAND2X1 U44 ( .A(n32), .B(n35), .Y(n31) );
  XOR2X1 U47 ( .A(n41), .B(n40), .Y(SUM[19]) );
  NOR2X1 U49 ( .A(n36), .B(n191), .Y(n35) );
  NOR2X1 U51 ( .A(n45), .B(n38), .Y(n37) );
  NAND2X1 U52 ( .A(n39), .B(n42), .Y(n38) );
  XNOR2X1 U55 ( .A(n44), .B(n43), .Y(SUM[18]) );
  NAND2X1 U56 ( .A(n42), .B(n44), .Y(n41) );
  XNOR2X1 U59 ( .A(n48), .B(n47), .Y(SUM[17]) );
  NOR2X1 U60 ( .A(n45), .B(n191), .Y(n44) );
  NAND2X1 U61 ( .A(n46), .B(n50), .Y(n45) );
  XOR2X1 U64 ( .A(n191), .B(n51), .Y(SUM[16]) );
  NOR2X1 U65 ( .A(n51), .B(n191), .Y(n48) );
  XNOR2X1 U69 ( .A(n59), .B(n58), .Y(SUM[15]) );
  NOR2X1 U71 ( .A(n91), .B(n54), .Y(n53) );
  NAND2X1 U72 ( .A(n55), .B(n74), .Y(n54) );
  NOR2X1 U73 ( .A(n56), .B(n65), .Y(n55) );
  NAND2X1 U74 ( .A(n57), .B(n61), .Y(n56) );
  XOR2X1 U77 ( .A(n63), .B(n62), .Y(SUM[14]) );
  NOR2X1 U78 ( .A(n62), .B(n63), .Y(n59) );
  XNOR2X1 U82 ( .A(n68), .B(n67), .Y(SUM[13]) );
  NAND2X1 U83 ( .A(n64), .B(n72), .Y(n63) );
  NAND2X1 U85 ( .A(n66), .B(n70), .Y(n65) );
  XNOR2X1 U88 ( .A(n72), .B(n71), .Y(SUM[12]) );
  NOR2X1 U89 ( .A(n71), .B(n73), .Y(n68) );
  XNOR2X1 U93 ( .A(n78), .B(n77), .Y(SUM[11]) );
  NAND2X1 U95 ( .A(n74), .B(n90), .Y(n73) );
  NOR2X1 U96 ( .A(n75), .B(n84), .Y(n74) );
  NAND2X1 U97 ( .A(n76), .B(n80), .Y(n75) );
  XOR2X1 U100 ( .A(n82), .B(n81), .Y(SUM[10]) );
  NOR2X1 U101 ( .A(n81), .B(n82), .Y(n78) );
  XOR2X1 U105 ( .A(n87), .B(n86), .Y(SUM[9]) );
  NAND2X1 U106 ( .A(n83), .B(n90), .Y(n82) );
  NAND2X1 U108 ( .A(n85), .B(n88), .Y(n84) );
  XNOR2X1 U111 ( .A(n90), .B(n89), .Y(SUM[8]) );
  NAND2X1 U112 ( .A(n88), .B(n90), .Y(n87) );
  XOR2X1 U115 ( .A(n96), .B(n95), .Y(SUM[7]) );
  NAND2X1 U117 ( .A(n108), .B(n92), .Y(n91) );
  NOR2X1 U118 ( .A(n93), .B(n100), .Y(n92) );
  NAND2X1 U119 ( .A(n94), .B(n97), .Y(n93) );
  XNOR2X1 U122 ( .A(n99), .B(n98), .Y(SUM[6]) );
  NAND2X1 U123 ( .A(n97), .B(n99), .Y(n96) );
  XNOR2X1 U126 ( .A(n103), .B(n102), .Y(SUM[5]) );
  NOR2X1 U127 ( .A(n100), .B(n107), .Y(n99) );
  NAND2X1 U128 ( .A(n101), .B(n105), .Y(n100) );
  XOR2X1 U131 ( .A(n107), .B(n106), .Y(SUM[4]) );
  NOR2X1 U132 ( .A(n106), .B(n107), .Y(n103) );
  XNOR2X1 U142 ( .A(n114), .B(n190), .Y(SUM[2]) );
  NAND2X1 U143 ( .A(n113), .B(n190), .Y(n112) );
  AND2X2 U155 ( .A(n119), .B(n117), .Y(n190) );
  OR2X2 U156 ( .A(n91), .B(n54), .Y(n191) );
  INVX1 U157 ( .A(n88), .Y(n89) );
  INVX1 U158 ( .A(n84), .Y(n83) );
  AND2X2 U159 ( .A(A[29]), .B(n194), .Y(n192) );
  INVX1 U160 ( .A(n91), .Y(n90) );
  AND2X2 U161 ( .A(n110), .B(n193), .Y(n108) );
  AND2X1 U162 ( .A(n113), .B(n190), .Y(n193) );
  AND2X1 U163 ( .A(n53), .B(n16), .Y(n195) );
  XOR2X1 U164 ( .A(n117), .B(n119), .Y(SUM[1]) );
  NOR2X1 U165 ( .A(n198), .B(n199), .Y(n194) );
  NAND2X1 U166 ( .A(n195), .B(n196), .Y(n198) );
  NOR2X1 U167 ( .A(n12), .B(n14), .Y(n196) );
  AND2X2 U168 ( .A(n2), .B(n4), .Y(n197) );
  XNOR2X1 U169 ( .A(n112), .B(n110), .Y(SUM[3]) );
  INVX1 U170 ( .A(n11), .Y(n12) );
  INVX1 U171 ( .A(n113), .Y(n114) );
  OR2X1 U172 ( .A(n200), .B(n9), .Y(n199) );
  INVX2 U173 ( .A(n6), .Y(n200) );
  OR2X1 U174 ( .A(n12), .B(n9), .Y(n202) );
  INVX1 U175 ( .A(n13), .Y(n201) );
  OR2X2 U176 ( .A(n12), .B(n201), .Y(n10) );
  INVX1 U177 ( .A(n119), .Y(SUM[0]) );
  INVX2 U178 ( .A(n97), .Y(n98) );
  INVX2 U179 ( .A(n94), .Y(n95) );
  INVX2 U180 ( .A(A[27]), .Y(n9) );
  INVX2 U181 ( .A(n85), .Y(n86) );
  INVX2 U182 ( .A(n80), .Y(n81) );
  INVX2 U183 ( .A(n76), .Y(n77) );
  INVX2 U184 ( .A(n73), .Y(n72) );
  INVX2 U185 ( .A(n70), .Y(n71) );
  INVX2 U186 ( .A(n66), .Y(n67) );
  INVX2 U187 ( .A(n65), .Y(n64) );
  INVX2 U188 ( .A(n61), .Y(n62) );
  INVX2 U189 ( .A(n57), .Y(n58) );
  INVX2 U190 ( .A(n50), .Y(n51) );
  INVX2 U191 ( .A(n46), .Y(n47) );
  INVX2 U192 ( .A(n42), .Y(n43) );
  INVX2 U193 ( .A(n39), .Y(n40) );
  INVX2 U194 ( .A(n37), .Y(n36) );
  INVX2 U195 ( .A(n35), .Y(n34) );
  INVX2 U196 ( .A(n32), .Y(n33) );
  INVX2 U197 ( .A(n29), .Y(n30) );
  INVX2 U198 ( .A(n2), .Y(n3) );
  INVX2 U199 ( .A(n25), .Y(n26) );
  INVX2 U200 ( .A(n22), .Y(n23) );
  INVX2 U201 ( .A(A[24]), .Y(n17) );
  INVX2 U202 ( .A(A[25]), .Y(n14) );
  INVX2 U203 ( .A(n108), .Y(n107) );
  INVX2 U204 ( .A(n105), .Y(n106) );
  INVX2 U205 ( .A(n101), .Y(n102) );
endmodule


module address_counter ( clk, n_rst, i_inc_raddr, i_inc_waddr, i_init_raddr, 
        i_init_waddr, i_img_width, i_img_height, i_img_size, o_raddr, o_waddr, 
        o_r_ready, o_w_ready, o_done );
  input [31:0] i_init_raddr;
  input [31:0] i_init_waddr;
  input [8:0] i_img_width;
  input [8:0] i_img_height;
  input [31:0] i_img_size;
  output [31:0] o_raddr;
  output [31:0] o_waddr;
  input clk, n_rst, i_inc_raddr, i_inc_waddr;
  output o_r_ready, o_w_ready, o_done;
  wire   n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351,
         n1352, n1353, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49,
         N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63,
         N64, N65, N66, N67, N68, N69, N70, n_done, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N196,
         N197, N198, N199, N200, N201, N202, N203, N204, N205, N206, N207,
         N208, N209, N210, N211, N212, N213, N214, N215, N216, N217, N218,
         N219, N220, N221, N222, N223, N224, N225, N226, N227, N228, N229,
         N230, N231, N232, N233, N234, N235, N236, N237, N238, N239, N240,
         N241, N242, N243, N244, N245, N249, N250, N251, N252, N253, N254,
         N255, N256, N257, N258, N259, N260, N261, N262, N263, N264, N265,
         N266, N267, N268, N269, N270, N271, N272, N273, N274, N275, N276,
         N277, N278, N279, N280, N598, N599, N600, N601, N602, N603, N604,
         N605, N606, N607, N608, N609, N610, N611, N612, N613, N614, N615,
         N616, N617, N618, N619, N620, N621, N622, N623, N624, N625, N626,
         N627, N628, N629, N630, N631, N632, N633, N634, N635, N636, N637,
         N638, N639, N640, N641, N642, N643, N644, N645, N646, N647, N648,
         N649, N650, N651, N652, N653, N654, N655, N656, N657, N658, N659,
         N660, N661, N697, N698, N699, N700, N701, N702, N703, N704, N705,
         N706, N707, N708, N709, N710, N711, N712, N713, N714, N715, N716,
         N717, N718, N719, N720, N721, N722, N723, N724, N725, N726, N727,
         N728, n489, n494, n501, n633, n635, n636, n637, n654, n657, n658,
         n659, n695, n800, n836, n842, n843, n844, n845, n848, n849, n850,
         n851, n852, n853, n855, n856, n857, n859, n860, n861, n862, n864,
         n865, n866, n867, n869, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n916, n917, n918,
         n919, n920, n921, n924, n925, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n943, n944, n955, n956, n957, n958,
         n959, n970, n971, n977, n978, n981, n982, n983, n986, n989, n992,
         n995, n998, n1001, n1004, n1007, n1010, n1013, n1016, n1019, n1022,
         n1025, n1028, n1031, n1034, n1037, n1040, n1043, n1046, n1049, n1052,
         n1055, n1058, n1061, n1064, n1067, n1070, n1073, n1076, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110,
         n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120,
         n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140,
         n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150,
         n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160,
         n1161, n1162, n1163, n1166, n1169, n1172, n1175, n1178, n1181, n1184,
         n1187, n1190, n1193, n1196, n1199, n1202, n1205, n1208, n1211, n1214,
         n1217, n1220, n1223, n1226, n1229, n1232, n1235, n1238, n1241, n1244,
         n1247, n1250, n1253, n1256, n1259, n1260, n1261, n1262, n1263, n1264,
         n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274,
         n1275, n1276, n1277, n1278, n1279, n1281, n1282, n2, n7, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n32, n33, n34, n35, n37, n38, n39, n40, n42, n43,
         n44, n45, n46, n47, n49, n50, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n70, n72, n73, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n125, n126, n157, n158, n160, n161, n163, n164, n166, n167, n169,
         n170, n172, n173, n175, n176, n178, n179, n181, n182, n184, n185,
         n187, n188, n190, n191, n193, n194, n196, n197, n199, n200, n202,
         n203, n205, n206, n208, n209, n211, n212, n214, n215, n217, n218,
         n220, n221, n223, n224, n226, n227, n229, n230, n232, n233, n235,
         n236, n238, n239, n241, n242, n243, n244, n245, n246, n278, n279,
         n304, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n490, n491, n492, n493, n495, n496,
         n497, n498, n499, n500, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n634, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n655, n656,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n837, n838,
         n839, n840, n841, n846, n847, n854, n858, n863, n868, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881, n882,
         n883, n884, n885, n886, n887, n888, n889, n890, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n922, n923, n926, n938,
         n939, n940, n941, n942, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n972, n973, n974, n975, n976, n979, n980, n984, n985,
         n987, n988, n990, n991, n993, n994, n996, n997, n999, n1000, n1002,
         n1003, n1005, n1006, n1008, n1009, n1011, n1012, n1014, n1015, n1017,
         n1018, n1020, n1021, n1023, n1024, n1026, n1027, n1029, n1030, n1032,
         n1033, n1035, n1036, n1038, n1039, n1041, n1042, n1044, n1045, n1047,
         n1048, n1050, n1051, n1053, n1054, n1056, n1057, n1059, n1060, n1062,
         n1063, n1065, n1066, n1068, n1069, n1071, n1072, n1074, n1075, n1077,
         n1078, n1164, n1165, n1167, n1168, n1170, n1171, n1173, n1174, n1176,
         n1177, n1179, n1180, n1182, n1183, n1185, n1186, n1188, n1189, n1191,
         n1192, n1194, n1195, n1197, n1198, n1200, n1201, n1203, n1204, n1206,
         n1207, n1209, n1210, n1212, n1213, n1215, n1216, n1218, n1219, n1221,
         n1222, n1224, n1225, n1227, n1228, n1230, n1231, n1233, n1234, n1236,
         n1237, n1239, n1240, n1242, n1243, n1245, n1246, n1248, n1249, n1251,
         n1252, n1254, n1255, n1257, n1258, n1280, n1283, n1284, n1285, n1286,
         n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296,
         n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306,
         n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316,
         n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326,
         n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336,
         n1337, n1338, n1339, n1340, n1341;
  wire   [8:0] boundary_2;
  wire   [31:0] rrowpt;
  wire   [31:0] rcolpt;
  wire   [31:0] wpt;
  wire   [2:0] rct1;
  wire   [2:0] rct2;
  wire   [15:0] rct3;
  wire   [1:0] wct1;
  wire   [1:0] wct2;
  wire   [15:0] wct3;
  wire   [4:0] curr_read_state;
  wire   [4:0] curr_write_state;
  wire   [4:0] next_write_state;
  assign boundary_2[1] = i_img_width[1];
  assign boundary_2[0] = i_img_width[0];

  DFFSR \curr_read_state_reg[0]  ( .D(n1282), .CLK(clk), .R(n173), .S(1'b1), 
        .Q(curr_read_state[0]) );
  DFFSR \rct2_reg[2]  ( .D(n1259), .CLK(clk), .R(n164), .S(1'b1), .Q(rct2[2])
         );
  DFFSR \curr_read_state_reg[2]  ( .D(n17), .CLK(clk), .R(n164), .S(1'b1), .Q(
        curr_read_state[2]) );
  DFFSR o_r_ready_reg ( .D(n988), .CLK(clk), .R(n164), .S(1'b1), .Q(o_r_ready)
         );
  DFFSR \curr_read_state_reg[1]  ( .D(n1281), .CLK(clk), .R(n164), .S(1'b1), 
        .Q(curr_read_state[1]) );
  DFFSR \curr_read_state_reg[3]  ( .D(n1279), .CLK(clk), .R(n164), .S(1'b1), 
        .Q(curr_read_state[3]) );
  DFFSR \rct2_reg[0]  ( .D(n1260), .CLK(clk), .R(1'b1), .S(n164), .Q(rct2[0])
         );
  DFFSR \rct2_reg[1]  ( .D(n1009), .CLK(clk), .R(n164), .S(1'b1), .Q(rct2[1])
         );
  DFFSR \rct3_reg[0]  ( .D(n1278), .CLK(clk), .R(1'b1), .S(n176), .Q(rct3[0])
         );
  DFFSR \rct3_reg[1]  ( .D(n1277), .CLK(clk), .R(1'b1), .S(n181), .Q(rct3[1])
         );
  DFFSR \rct3_reg[2]  ( .D(n1276), .CLK(clk), .R(n164), .S(1'b1), .Q(rct3[2])
         );
  DFFSR \rct3_reg[3]  ( .D(n1275), .CLK(clk), .R(n164), .S(1'b1), .Q(rct3[3])
         );
  DFFSR \rct3_reg[4]  ( .D(n1274), .CLK(clk), .R(n164), .S(1'b1), .Q(rct3[4])
         );
  DFFSR \rct3_reg[5]  ( .D(n1273), .CLK(clk), .R(n164), .S(1'b1), .Q(rct3[5])
         );
  DFFSR \rct3_reg[6]  ( .D(n1272), .CLK(clk), .R(n164), .S(1'b1), .Q(rct3[6])
         );
  DFFSR \rct3_reg[7]  ( .D(n1271), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[7])
         );
  DFFSR \rct3_reg[8]  ( .D(n1270), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[8])
         );
  DFFSR \rct3_reg[9]  ( .D(n1269), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[9])
         );
  DFFSR \rct3_reg[10]  ( .D(n1268), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[10]) );
  DFFSR \rct3_reg[11]  ( .D(n1267), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[11]) );
  DFFSR \rct3_reg[12]  ( .D(n1266), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[12]) );
  DFFSR \rct3_reg[13]  ( .D(n1265), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[13]) );
  DFFSR \rct3_reg[14]  ( .D(n1264), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[14]) );
  DFFSR \rct3_reg[15]  ( .D(n1263), .CLK(clk), .R(n166), .S(1'b1), .Q(rct3[15]) );
  DFFSR \rct1_reg[0]  ( .D(n1262), .CLK(clk), .R(n166), .S(1'b1), .Q(rct1[0])
         );
  DFFSR \rct1_reg[1]  ( .D(n1008), .CLK(clk), .R(n166), .S(1'b1), .Q(rct1[1])
         );
  DFFSR \rct1_reg[2]  ( .D(n1261), .CLK(clk), .R(n166), .S(1'b1), .Q(rct1[2])
         );
  DFFSR \rcolpt_reg[31]  ( .D(n1131), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[31]) );
  DFFSR \o_raddr_reg[31]  ( .D(n1163), .CLK(clk), .R(n1075), .S(n1074), .Q(
        o_raddr[31]) );
  DFFSR \rcolpt_reg[0]  ( .D(n1162), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[0]) );
  DFFSR \rcolpt_reg[1]  ( .D(n1161), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[1]) );
  DFFSR \rcolpt_reg[2]  ( .D(n1160), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[2]) );
  DFFSR \rcolpt_reg[3]  ( .D(n1159), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[3]) );
  DFFSR \rcolpt_reg[4]  ( .D(n1158), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[4]) );
  DFFSR \rcolpt_reg[5]  ( .D(n1157), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[5]) );
  DFFSR \rcolpt_reg[6]  ( .D(n1156), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[6]) );
  DFFSR \rcolpt_reg[7]  ( .D(n1155), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[7]) );
  DFFSR \rcolpt_reg[8]  ( .D(n1154), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[8]) );
  DFFSR \rcolpt_reg[9]  ( .D(n1153), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[9]) );
  DFFSR \rcolpt_reg[10]  ( .D(n1152), .CLK(clk), .R(n167), .S(1'b1), .Q(
        rcolpt[10]) );
  DFFSR \rcolpt_reg[11]  ( .D(n1151), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[11]) );
  DFFSR \rcolpt_reg[12]  ( .D(n1150), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[12]) );
  DFFSR \rcolpt_reg[13]  ( .D(n1149), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[13]) );
  DFFSR \rcolpt_reg[14]  ( .D(n1148), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[14]) );
  DFFSR \rcolpt_reg[15]  ( .D(n1147), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[15]) );
  DFFSR \rcolpt_reg[16]  ( .D(n1146), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[16]) );
  DFFSR \rcolpt_reg[17]  ( .D(n1145), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[17]) );
  DFFSR \rcolpt_reg[18]  ( .D(n1144), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[18]) );
  DFFSR \rcolpt_reg[19]  ( .D(n1143), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[19]) );
  DFFSR \rcolpt_reg[20]  ( .D(n1142), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[20]) );
  DFFSR \rcolpt_reg[21]  ( .D(n1141), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[21]) );
  DFFSR \rcolpt_reg[22]  ( .D(n1140), .CLK(clk), .R(n169), .S(1'b1), .Q(
        rcolpt[22]) );
  DFFSR \rcolpt_reg[23]  ( .D(n1139), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rcolpt[23]) );
  DFFSR \rcolpt_reg[24]  ( .D(n1138), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rcolpt[24]) );
  DFFSR \rcolpt_reg[25]  ( .D(n1137), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rcolpt[25]) );
  DFFSR \rcolpt_reg[26]  ( .D(n1136), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rcolpt[26]) );
  DFFSR \rcolpt_reg[27]  ( .D(n1135), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rcolpt[27]) );
  DFFSR \rcolpt_reg[28]  ( .D(n1134), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rcolpt[28]) );
  DFFSR \rcolpt_reg[29]  ( .D(n1133), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rcolpt[29]) );
  DFFSR \rcolpt_reg[30]  ( .D(n1132), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rcolpt[30]) );
  DFFSR \o_raddr_reg[30]  ( .D(n1166), .CLK(clk), .R(n1078), .S(n1077), .Q(
        o_raddr[30]) );
  DFFSR \o_raddr_reg[29]  ( .D(n1169), .CLK(clk), .R(n1165), .S(n1164), .Q(
        o_raddr[29]) );
  DFFSR \o_raddr_reg[0]  ( .D(n1256), .CLK(clk), .R(n1252), .S(n1251), .Q(
        n1348) );
  DFFSR \rrowpt_reg[0]  ( .D(n1014), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rrowpt[0]) );
  DFFSR \o_raddr_reg[1]  ( .D(n1253), .CLK(clk), .R(n1249), .S(n1248), .Q(
        n1347) );
  DFFSR \rrowpt_reg[1]  ( .D(n1015), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rrowpt[1]) );
  DFFSR \o_raddr_reg[2]  ( .D(n1250), .CLK(clk), .R(n1246), .S(n1245), .Q(
        n1346) );
  DFFSR \rrowpt_reg[2]  ( .D(n1017), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rrowpt[2]) );
  DFFSR \o_raddr_reg[3]  ( .D(n1247), .CLK(clk), .R(n1243), .S(n1242), .Q(
        o_raddr[3]) );
  DFFSR \rrowpt_reg[3]  ( .D(n1018), .CLK(clk), .R(n170), .S(1'b1), .Q(
        rrowpt[3]) );
  DFFSR \o_raddr_reg[4]  ( .D(n1244), .CLK(clk), .R(n1240), .S(n1239), .Q(
        o_raddr[4]) );
  DFFSR \rrowpt_reg[4]  ( .D(n1020), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[4]) );
  DFFSR \o_raddr_reg[5]  ( .D(n1241), .CLK(clk), .R(n1237), .S(n1236), .Q(
        o_raddr[5]) );
  DFFSR \rrowpt_reg[5]  ( .D(n1021), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[5]) );
  DFFSR \o_raddr_reg[6]  ( .D(n1238), .CLK(clk), .R(n1234), .S(n1233), .Q(
        n1345) );
  DFFSR \rrowpt_reg[6]  ( .D(n1023), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[6]) );
  DFFSR \o_raddr_reg[7]  ( .D(n1235), .CLK(clk), .R(n1231), .S(n1230), .Q(
        o_raddr[7]) );
  DFFSR \rrowpt_reg[7]  ( .D(n1024), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[7]) );
  DFFSR \o_raddr_reg[8]  ( .D(n1232), .CLK(clk), .R(n1228), .S(n1227), .Q(
        n1344) );
  DFFSR \rrowpt_reg[8]  ( .D(n1026), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[8]) );
  DFFSR \o_raddr_reg[9]  ( .D(n1229), .CLK(clk), .R(n1225), .S(n1224), .Q(
        n1343) );
  DFFSR \rrowpt_reg[9]  ( .D(n1027), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[9]) );
  DFFSR \o_raddr_reg[10]  ( .D(n1226), .CLK(clk), .R(n1222), .S(n1221), .Q(
        o_raddr[10]) );
  DFFSR \rrowpt_reg[10]  ( .D(n1029), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[10]) );
  DFFSR \o_raddr_reg[11]  ( .D(n1223), .CLK(clk), .R(n1219), .S(n1218), .Q(
        o_raddr[11]) );
  DFFSR \rrowpt_reg[11]  ( .D(n1030), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[11]) );
  DFFSR \o_raddr_reg[12]  ( .D(n1220), .CLK(clk), .R(n1216), .S(n1215), .Q(
        o_raddr[12]) );
  DFFSR \rrowpt_reg[12]  ( .D(n1032), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[12]) );
  DFFSR \o_raddr_reg[13]  ( .D(n1217), .CLK(clk), .R(n1213), .S(n1212), .Q(
        o_raddr[13]) );
  DFFSR \rrowpt_reg[13]  ( .D(n1033), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[13]) );
  DFFSR \o_raddr_reg[14]  ( .D(n1214), .CLK(clk), .R(n1210), .S(n1209), .Q(
        o_raddr[14]) );
  DFFSR \rrowpt_reg[14]  ( .D(n1035), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[14]) );
  DFFSR \o_raddr_reg[15]  ( .D(n1211), .CLK(clk), .R(n1207), .S(n1206), .Q(
        o_raddr[15]) );
  DFFSR \rrowpt_reg[15]  ( .D(n1036), .CLK(clk), .R(n172), .S(1'b1), .Q(
        rrowpt[15]) );
  DFFSR \o_raddr_reg[16]  ( .D(n1208), .CLK(clk), .R(n1204), .S(n1203), .Q(
        o_raddr[16]) );
  DFFSR \rrowpt_reg[16]  ( .D(n1038), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[16]) );
  DFFSR \o_raddr_reg[17]  ( .D(n1205), .CLK(clk), .R(n1201), .S(n1200), .Q(
        n1342) );
  DFFSR \rrowpt_reg[17]  ( .D(n1039), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[17]) );
  DFFSR \o_raddr_reg[18]  ( .D(n1202), .CLK(clk), .R(n1198), .S(n1197), .Q(
        o_raddr[18]) );
  DFFSR \rrowpt_reg[18]  ( .D(n1041), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[18]) );
  DFFSR \o_raddr_reg[19]  ( .D(n1199), .CLK(clk), .R(n1195), .S(n1194), .Q(
        o_raddr[19]) );
  DFFSR \rrowpt_reg[19]  ( .D(n1042), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[19]) );
  DFFSR \o_raddr_reg[20]  ( .D(n1196), .CLK(clk), .R(n1192), .S(n1191), .Q(
        o_raddr[20]) );
  DFFSR \rrowpt_reg[20]  ( .D(n1044), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[20]) );
  DFFSR \o_raddr_reg[21]  ( .D(n1193), .CLK(clk), .R(n1189), .S(n1188), .Q(
        o_raddr[21]) );
  DFFSR \rrowpt_reg[21]  ( .D(n1045), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[21]) );
  DFFSR \o_raddr_reg[22]  ( .D(n1190), .CLK(clk), .R(n1186), .S(n1185), .Q(
        o_raddr[22]) );
  DFFSR \rrowpt_reg[22]  ( .D(n1047), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[22]) );
  DFFSR \o_raddr_reg[23]  ( .D(n1187), .CLK(clk), .R(n1183), .S(n1182), .Q(
        o_raddr[23]) );
  DFFSR \rrowpt_reg[23]  ( .D(n1048), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[23]) );
  DFFSR \o_raddr_reg[24]  ( .D(n1184), .CLK(clk), .R(n1180), .S(n1179), .Q(
        o_raddr[24]) );
  DFFSR \rrowpt_reg[24]  ( .D(n1050), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[24]) );
  DFFSR \o_raddr_reg[25]  ( .D(n1181), .CLK(clk), .R(n1177), .S(n1176), .Q(
        o_raddr[25]) );
  DFFSR \rrowpt_reg[25]  ( .D(n1051), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[25]) );
  DFFSR \o_raddr_reg[26]  ( .D(n1178), .CLK(clk), .R(n1174), .S(n1173), .Q(
        o_raddr[26]) );
  DFFSR \rrowpt_reg[26]  ( .D(n1053), .CLK(clk), .R(n173), .S(1'b1), .Q(
        rrowpt[26]) );
  DFFSR \o_raddr_reg[27]  ( .D(n1175), .CLK(clk), .R(n1171), .S(n1170), .Q(
        o_raddr[27]) );
  DFFSR \rrowpt_reg[27]  ( .D(n1054), .CLK(clk), .R(n175), .S(1'b1), .Q(
        rrowpt[27]) );
  DFFSR \o_raddr_reg[28]  ( .D(n1172), .CLK(clk), .R(n1168), .S(n1167), .Q(
        o_raddr[28]) );
  DFFSR \rrowpt_reg[28]  ( .D(n1056), .CLK(clk), .R(n175), .S(1'b1), .Q(
        rrowpt[28]) );
  DFFSR \rrowpt_reg[29]  ( .D(n1057), .CLK(clk), .R(n175), .S(1'b1), .Q(
        rrowpt[29]) );
  DFFSR \rrowpt_reg[30]  ( .D(n1059), .CLK(clk), .R(n175), .S(1'b1), .Q(
        rrowpt[30]) );
  DFFSR \rrowpt_reg[31]  ( .D(n1060), .CLK(clk), .R(n175), .S(1'b1), .Q(
        rrowpt[31]) );
  DFFSR \curr_write_state_reg[0]  ( .D(next_write_state[0]), .CLK(clk), .R(
        1'b1), .S(n172), .Q(curr_write_state[0]) );
  DFFSR \curr_write_state_reg[4]  ( .D(next_write_state[4]), .CLK(clk), .R(
        n175), .S(1'b1), .Q(curr_write_state[4]) );
  DFFSR \wct3_reg[15]  ( .D(n1113), .CLK(clk), .R(n175), .S(1'b1), .Q(wct3[15]) );
  DFFSR \curr_write_state_reg[3]  ( .D(next_write_state[3]), .CLK(clk), .R(
        1'b1), .S(n181), .Q(curr_write_state[3]) );
  DFFSR \wct3_reg[0]  ( .D(n1128), .CLK(clk), .R(1'b1), .S(n175), .Q(wct3[0])
         );
  DFFSR \wct3_reg[1]  ( .D(n1127), .CLK(clk), .R(1'b1), .S(n181), .Q(wct3[1])
         );
  DFFSR \wct3_reg[2]  ( .D(n1126), .CLK(clk), .R(n175), .S(1'b1), .Q(wct3[2])
         );
  DFFSR \wct3_reg[3]  ( .D(n1125), .CLK(clk), .R(n175), .S(1'b1), .Q(wct3[3])
         );
  DFFSR \wct3_reg[4]  ( .D(n1124), .CLK(clk), .R(n175), .S(1'b1), .Q(wct3[4])
         );
  DFFSR \wct3_reg[5]  ( .D(n1123), .CLK(clk), .R(n176), .S(1'b1), .Q(wct3[5])
         );
  DFFSR \wct3_reg[6]  ( .D(n1122), .CLK(clk), .R(n175), .S(1'b1), .Q(wct3[6])
         );
  DFFSR \wct3_reg[7]  ( .D(n1121), .CLK(clk), .R(n176), .S(1'b1), .Q(wct3[7])
         );
  DFFSR \wct3_reg[8]  ( .D(n1120), .CLK(clk), .R(n176), .S(1'b1), .Q(wct3[8])
         );
  DFFSR \wct3_reg[9]  ( .D(n1119), .CLK(clk), .R(n176), .S(1'b1), .Q(wct3[9])
         );
  DFFSR \wct3_reg[10]  ( .D(n1118), .CLK(clk), .R(n176), .S(1'b1), .Q(wct3[10]) );
  DFFSR \wct3_reg[11]  ( .D(n1117), .CLK(clk), .R(n175), .S(1'b1), .Q(wct3[11]) );
  DFFSR \wct3_reg[12]  ( .D(n1116), .CLK(clk), .R(n176), .S(1'b1), .Q(wct3[12]) );
  DFFSR \wct3_reg[13]  ( .D(n1115), .CLK(clk), .R(n176), .S(1'b1), .Q(wct3[13]) );
  DFFSR \wct3_reg[14]  ( .D(n1114), .CLK(clk), .R(n176), .S(1'b1), .Q(wct3[14]) );
  DFFSR o_w_ready_reg ( .D(n996), .CLK(clk), .R(n176), .S(1'b1), .Q(o_w_ready)
         );
  DFFSR \curr_write_state_reg[1]  ( .D(next_write_state[1]), .CLK(clk), .R(
        n176), .S(1'b1), .Q(curr_write_state[1]) );
  DFFSR \curr_write_state_reg[2]  ( .D(next_write_state[2]), .CLK(clk), .R(
        n178), .S(1'b1), .Q(curr_write_state[2]) );
  DFFSR \wct1_reg[0]  ( .D(n1112), .CLK(clk), .R(n176), .S(1'b1), .Q(wct1[0])
         );
  DFFSR \wct1_reg[1]  ( .D(n1111), .CLK(clk), .R(n178), .S(1'b1), .Q(wct1[1])
         );
  DFFSR \wct2_reg[0]  ( .D(n1130), .CLK(clk), .R(1'b1), .S(n178), .Q(wct2[0])
         );
  DFFSR \wct2_reg[1]  ( .D(n1129), .CLK(clk), .R(n178), .S(1'b1), .Q(wct2[1])
         );
  DFFSR \o_waddr_reg[31]  ( .D(n983), .CLK(clk), .R(n1321), .S(n1320), .Q(
        o_waddr[31]) );
  DFFSR \wpt_reg[0]  ( .D(n1110), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[0]) );
  DFFSR \wpt_reg[1]  ( .D(n1109), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[1]) );
  DFFSR \wpt_reg[2]  ( .D(n1108), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[2]) );
  DFFSR \wpt_reg[3]  ( .D(n1107), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[3]) );
  DFFSR \wpt_reg[4]  ( .D(n1106), .CLK(clk), .R(n176), .S(1'b1), .Q(wpt[4]) );
  DFFSR \wpt_reg[5]  ( .D(n1105), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[5]) );
  DFFSR \wpt_reg[6]  ( .D(n1104), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[6]) );
  DFFSR \wpt_reg[7]  ( .D(n1103), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[7]) );
  DFFSR \wpt_reg[8]  ( .D(n1102), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[8]) );
  DFFSR \wpt_reg[9]  ( .D(n1101), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[9]) );
  DFFSR \wpt_reg[10]  ( .D(n1100), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[10])
         );
  DFFSR \wpt_reg[11]  ( .D(n1099), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[11])
         );
  DFFSR \wpt_reg[12]  ( .D(n1098), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[12])
         );
  DFFSR \wpt_reg[13]  ( .D(n1097), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[13])
         );
  DFFSR \wpt_reg[14]  ( .D(n1096), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[14])
         );
  DFFSR \wpt_reg[15]  ( .D(n1095), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[15])
         );
  DFFSR \wpt_reg[16]  ( .D(n1094), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[16])
         );
  DFFSR \wpt_reg[17]  ( .D(n1093), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[17])
         );
  DFFSR \wpt_reg[18]  ( .D(n1092), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[18])
         );
  DFFSR \wpt_reg[19]  ( .D(n1091), .CLK(clk), .R(n178), .S(1'b1), .Q(wpt[19])
         );
  DFFSR \wpt_reg[20]  ( .D(n1090), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[20])
         );
  DFFSR \wpt_reg[21]  ( .D(n1089), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[21])
         );
  DFFSR \wpt_reg[22]  ( .D(n1088), .CLK(clk), .R(n179), .S(1'b1), .Q(wpt[22])
         );
  DFFSR \wpt_reg[23]  ( .D(n1087), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[23])
         );
  DFFSR \wpt_reg[24]  ( .D(n1086), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[24])
         );
  DFFSR \wpt_reg[25]  ( .D(n1085), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[25])
         );
  DFFSR \wpt_reg[26]  ( .D(n1084), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[26])
         );
  DFFSR \wpt_reg[27]  ( .D(n1083), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[27])
         );
  DFFSR \wpt_reg[28]  ( .D(n1082), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[28])
         );
  DFFSR \wpt_reg[29]  ( .D(n1081), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[29])
         );
  DFFSR \wpt_reg[30]  ( .D(n1080), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[30])
         );
  DFFSR \o_waddr_reg[30]  ( .D(n986), .CLK(clk), .R(n1319), .S(n1318), .Q(
        o_waddr[30]) );
  DFFSR \o_waddr_reg[29]  ( .D(n989), .CLK(clk), .R(n1317), .S(n1316), .Q(
        o_waddr[29]) );
  DFFSR \o_waddr_reg[0]  ( .D(n1076), .CLK(clk), .R(n1341), .S(n1340), .Q(
        n1353) );
  DFFSR \o_waddr_reg[1]  ( .D(n1073), .CLK(clk), .R(n1331), .S(n1330), .Q(
        n1352) );
  DFFSR \o_waddr_reg[2]  ( .D(n1070), .CLK(clk), .R(n1339), .S(n1338), .Q(
        n1351) );
  DFFSR \o_waddr_reg[3]  ( .D(n1067), .CLK(clk), .R(n1337), .S(n1336), .Q(
        n1350) );
  DFFSR \o_waddr_reg[4]  ( .D(n1064), .CLK(clk), .R(n1335), .S(n1334), .Q(
        o_waddr[4]) );
  DFFSR \o_waddr_reg[5]  ( .D(n1061), .CLK(clk), .R(n1333), .S(n1332), .Q(
        o_waddr[5]) );
  DFFSR \o_waddr_reg[6]  ( .D(n1058), .CLK(clk), .R(n1329), .S(n1328), .Q(
        o_waddr[6]) );
  DFFSR \o_waddr_reg[7]  ( .D(n1055), .CLK(clk), .R(n1327), .S(n1326), .Q(
        o_waddr[7]) );
  DFFSR \o_waddr_reg[8]  ( .D(n1052), .CLK(clk), .R(n1325), .S(n1324), .Q(
        o_waddr[8]) );
  DFFSR \o_waddr_reg[9]  ( .D(n1049), .CLK(clk), .R(n1323), .S(n1322), .Q(
        n1349) );
  DFFSR \o_waddr_reg[10]  ( .D(n1046), .CLK(clk), .R(n1255), .S(n1254), .Q(
        o_waddr[10]) );
  DFFSR \o_waddr_reg[11]  ( .D(n1043), .CLK(clk), .R(n1258), .S(n1257), .Q(
        o_waddr[11]) );
  DFFSR \o_waddr_reg[12]  ( .D(n1040), .CLK(clk), .R(n1283), .S(n1280), .Q(
        o_waddr[12]) );
  DFFSR \o_waddr_reg[13]  ( .D(n1037), .CLK(clk), .R(n1285), .S(n1284), .Q(
        o_waddr[13]) );
  DFFSR \o_waddr_reg[14]  ( .D(n1034), .CLK(clk), .R(n1287), .S(n1286), .Q(
        o_waddr[14]) );
  DFFSR \o_waddr_reg[15]  ( .D(n1031), .CLK(clk), .R(n1289), .S(n1288), .Q(
        o_waddr[15]) );
  DFFSR \o_waddr_reg[16]  ( .D(n1028), .CLK(clk), .R(n1291), .S(n1290), .Q(
        o_waddr[16]) );
  DFFSR \o_waddr_reg[17]  ( .D(n1025), .CLK(clk), .R(n1293), .S(n1292), .Q(
        o_waddr[17]) );
  DFFSR \o_waddr_reg[18]  ( .D(n1022), .CLK(clk), .R(n1295), .S(n1294), .Q(
        o_waddr[18]) );
  DFFSR \o_waddr_reg[19]  ( .D(n1019), .CLK(clk), .R(n1297), .S(n1296), .Q(
        o_waddr[19]) );
  DFFSR \o_waddr_reg[20]  ( .D(n1016), .CLK(clk), .R(n1299), .S(n1298), .Q(
        o_waddr[20]) );
  DFFSR \o_waddr_reg[21]  ( .D(n1013), .CLK(clk), .R(n1301), .S(n1300), .Q(
        o_waddr[21]) );
  DFFSR \o_waddr_reg[22]  ( .D(n1010), .CLK(clk), .R(n1303), .S(n1302), .Q(
        o_waddr[22]) );
  DFFSR \o_waddr_reg[23]  ( .D(n1007), .CLK(clk), .R(n1305), .S(n1304), .Q(
        o_waddr[23]) );
  DFFSR \o_waddr_reg[24]  ( .D(n1004), .CLK(clk), .R(n1307), .S(n1306), .Q(
        o_waddr[24]) );
  DFFSR \o_waddr_reg[25]  ( .D(n1001), .CLK(clk), .R(n1309), .S(n1308), .Q(
        o_waddr[25]) );
  DFFSR \o_waddr_reg[26]  ( .D(n998), .CLK(clk), .R(n1311), .S(n1310), .Q(
        o_waddr[26]) );
  DFFSR \o_waddr_reg[27]  ( .D(n995), .CLK(clk), .R(n1313), .S(n1312), .Q(
        o_waddr[27]) );
  DFFSR \o_waddr_reg[28]  ( .D(n992), .CLK(clk), .R(n1315), .S(n1314), .Q(
        o_waddr[28]) );
  DFFSR \wpt_reg[31]  ( .D(n1079), .CLK(clk), .R(n181), .S(1'b1), .Q(wpt[31])
         );
  DFFSR o_done_reg ( .D(n_done), .CLK(clk), .R(n164), .S(1'b1), .Q(o_done) );
  AND2X2 U360 ( .A(n10), .B(n20), .Y(n900) );
  AOI21X1 U777 ( .A(n635), .B(n636), .C(n494), .Y(n633) );
  NOR2X1 U778 ( .A(n160), .B(n993), .Y(n635) );
  OAI21X1 U780 ( .A(n997), .B(n993), .C(n636), .Y(n637) );
  OAI21X1 U818 ( .A(n657), .B(n1005), .C(n658), .Y(n1129) );
  NAND3X1 U819 ( .A(n994), .B(n1005), .C(wct2[0]), .Y(n658) );
  AOI21X1 U820 ( .A(n636), .B(n489), .C(n501), .Y(n657) );
  NAND2X1 U821 ( .A(n636), .B(n659), .Y(n1130) );
  AOI21X1 U822 ( .A(n489), .B(wct2[0]), .C(n501), .Y(n659) );
  NOR2X1 U825 ( .A(n157), .B(n654), .Y(n636) );
  NOR2X1 U1098 ( .A(rct3[6]), .B(rct3[5]), .Y(n843) );
  NOR2X1 U1099 ( .A(rct3[9]), .B(rct3[8]), .Y(n842) );
  NOR2X1 U1100 ( .A(n844), .B(n845), .Y(n836) );
  NAND2X1 U1101 ( .A(n1063), .B(n985), .Y(n845) );
  NAND3X1 U1107 ( .A(rct1[0]), .B(n1071), .C(n849), .Y(n695) );
  NOR2X1 U1108 ( .A(rct2[1]), .B(rct1[2]), .Y(n849) );
  NAND3X1 U1110 ( .A(n21), .B(n990), .C(rct2[1]), .Y(n851) );
  AOI21X1 U1111 ( .A(n1011), .B(n1065), .C(n852), .Y(n850) );
  AOI22X1 U1112 ( .A(n852), .B(rct2[1]), .C(n1065), .D(n21), .Y(n853) );
  OAI21X1 U1114 ( .A(rct2[0]), .B(n855), .C(n856), .Y(n852) );
  XNOR2X1 U1117 ( .A(rct2[0]), .B(n1011), .Y(n857) );
  OAI21X1 U1119 ( .A(n859), .B(n1072), .C(n860), .Y(n1261) );
  NAND3X1 U1120 ( .A(n22), .B(n1072), .C(rct1[1]), .Y(n860) );
  AOI21X1 U1121 ( .A(n1012), .B(n1071), .C(n861), .Y(n859) );
  AOI22X1 U1122 ( .A(n861), .B(rct1[1]), .C(n1071), .D(n22), .Y(n862) );
  OAI21X1 U1124 ( .A(rct1[0]), .B(n864), .C(n23), .Y(n861) );
  OAI21X1 U1125 ( .A(n23), .B(n1068), .C(n865), .Y(n1262) );
  OAI21X1 U1127 ( .A(rct1[0]), .B(n864), .C(n800), .Y(n867) );
  NAND2X1 U1129 ( .A(n864), .B(n800), .Y(n869) );
  OAI22X1 U1167 ( .A(n1003), .B(n893), .C(n1069), .D(n864), .Y(n892) );
  OAI21X1 U1168 ( .A(n1062), .B(n855), .C(n77), .Y(n891) );
  OAI21X1 U1171 ( .A(n855), .B(n895), .C(n77), .Y(n898) );
  NAND3X1 U1172 ( .A(rct2[0]), .B(n1065), .C(rct2[2]), .Y(n895) );
  NOR2X1 U1173 ( .A(n864), .B(n894), .Y(n897) );
  NAND3X1 U1174 ( .A(rct1[0]), .B(n1071), .C(rct1[2]), .Y(n894) );
  AOI21X1 U1176 ( .A(n900), .B(i_inc_raddr), .C(n901), .Y(n899) );
  OAI21X1 U1177 ( .A(n902), .B(n903), .C(n855), .Y(n901) );
  OR2X1 U1178 ( .A(n904), .B(n905), .Y(n903) );
  NAND3X1 U1191 ( .A(n916), .B(n917), .C(n918), .Y(n902) );
  NOR2X1 U1192 ( .A(n919), .B(n920), .Y(n918) );
  NOR2X1 U1195 ( .A(rct3[11]), .B(rct3[10]), .Y(n917) );
  NOR2X1 U1196 ( .A(n77), .B(n921), .Y(n916) );
  NAND3X1 U1198 ( .A(n163), .B(n864), .C(n924), .Y(n893) );
  NOR2X1 U1199 ( .A(n987), .B(n925), .Y(n924) );
  NAND2X1 U1200 ( .A(n855), .B(n848), .Y(n925) );
  NAND3X1 U1202 ( .A(curr_read_state[1]), .B(n1002), .C(n20), .Y(n855) );
  NAND3X1 U1204 ( .A(curr_read_state[0]), .B(n1000), .C(n20), .Y(n864) );
  NOR2X1 U1214 ( .A(n927), .B(n928), .Y(n_done) );
  NAND2X1 U1215 ( .A(n929), .B(n930), .Y(n928) );
  NOR2X1 U1216 ( .A(n931), .B(n932), .Y(n930) );
  NAND3X1 U1217 ( .A(n933), .B(n934), .C(n935), .Y(n932) );
  NOR2X1 U1218 ( .A(n936), .B(n937), .Y(n935) );
  NOR2X1 U1229 ( .A(n943), .B(n944), .Y(n929) );
  NAND3X1 U1242 ( .A(n955), .B(n956), .C(n957), .Y(n927) );
  NOR2X1 U1243 ( .A(n958), .B(n959), .Y(n957) );
  NOR2X1 U1256 ( .A(n970), .B(n971), .Y(n956) );
  NOR2X1 U1266 ( .A(n977), .B(n978), .Y(n955) );
  NAND2X1 U1270 ( .A(n981), .B(n982), .Y(n977) );
  address_counter_DW01_dec_0 sub_86 ( .A(i_init_waddr), .SUM({N70, N69, N68, 
        N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, 
        N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, 
        N39}) );
  address_counter_DW01_add_6 add_238 ( .A({o_raddr[31:10], n1343, n1344, 
        o_raddr[7:0]}), .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, n991, n57, boundary_2[6:3], n1006, n72, 
        boundary_2[0]}), .CI(1'b0), .SUM({N245, N244, N243, N242, N241, N240, 
        N239, N238, N237, N236, N235, N234, N233, N232, N231, N230, N229, N228, 
        N227, N226, N225, N224, N223, N222, N221, N220, N219, N218, N217, N216, 
        N215, N214}) );
  address_counter_DW01_add_7 add_368 ( .A(o_waddr), .B({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, n991, n57, boundary_2[6:3], 
        n1006, n72, boundary_2[0]}), .CI(1'b0), .SUM({N661, N660, N659, N658, 
        N657, N656, N655, N654, N653, N652, N651, N650, N649, N648, N647, N646, 
        N645, N644, N643, N642, N641, N640, N639, N638, N637, N636, N635, N634, 
        N633, N632, N631, N630}) );
  address_counter_DW01_add_8 add_387 ( .A(o_waddr), .B({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b1}), .CI(1'b0), .SUM({N728, N727, N726, N725, 
        N724, N723, N722, N721, N720, N719, N718, N717, N716, N715, N714, N713, 
        N712, N711, N710, N709, N708, N707, N706, N705, N704, N703, N702, N701, 
        N700, N699, N698, N697}) );
  address_counter_DW01_add_9 add_257 ( .A({o_raddr[31:9], n1344, o_raddr[7:0]}), .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1}), .CI(1'b0), .SUM({
        N280, N279, N278, N277, N276, N275, N274, N273, N272, N271, N270, N269, 
        N268, N267, N266, N265, N264, N263, N262, N261, N260, N259, N258, N257, 
        N256, N255, N254, N253, N252, N251, N250, N249}) );
  address_counter_DW01_inc_2 add_234 ( .A({o_raddr[31:10], n1343, n1344, 
        o_raddr[7:0]}), .SUM({N213, N212, N211, N210, N209, N208, N207, N206, 
        N205, N204, N203, N202, N201, N200, N199, N198, N197, N196, N195, N194, 
        N193, N192, N191, N190, N189, N188, N187, N186, N185, N184, N183, N182}) );
  address_counter_DW01_inc_3 r362 ( .A(o_waddr), .SUM({N629, N628, N627, N626, 
        N625, N624, N623, N622, N621, N620, N619, N618, N617, N616, N615, N614, 
        N613, N612, N611, N610, N609, N608, N607, N606, N605, N604, N603, N602, 
        N601, N600, N599, N598}) );
  BUFX2 U5 ( .A(n1350), .Y(o_waddr[3]) );
  INVX1 U6 ( .A(boundary_2[1]), .Y(n350) );
  INVX4 U7 ( .A(n68), .Y(o_waddr[1]) );
  INVX2 U8 ( .A(i_img_width[8]), .Y(n32) );
  INVX4 U9 ( .A(n73), .Y(o_waddr[0]) );
  INVX2 U10 ( .A(n323), .Y(n2) );
  BUFX2 U13 ( .A(n1345), .Y(o_raddr[6]) );
  INVX2 U14 ( .A(n26), .Y(n29) );
  BUFX2 U15 ( .A(n1342), .Y(o_raddr[17]) );
  AND2X2 U18 ( .A(curr_read_state[2]), .B(n557), .Y(n7) );
  AND2X2 U19 ( .A(n1002), .B(n1000), .Y(n10) );
  AND2X2 U20 ( .A(curr_read_state[1]), .B(curr_read_state[0]), .Y(n11) );
  AND2X2 U21 ( .A(n404), .B(n215), .Y(n12) );
  AND2X2 U22 ( .A(n668), .B(n667), .Y(n13) );
  AND2X2 U23 ( .A(n697), .B(n696), .Y(n14) );
  AND2X2 U24 ( .A(n767), .B(n766), .Y(n15) );
  AND2X2 U25 ( .A(n711), .B(n710), .Y(n16) );
  OR2X2 U26 ( .A(n891), .B(n892), .Y(n17) );
  AND2X2 U27 ( .A(n632), .B(n631), .Y(n18) );
  AND2X2 U28 ( .A(n718), .B(n717), .Y(n19) );
  INVX2 U29 ( .A(rct3[3]), .Y(n40) );
  AND2X2 U30 ( .A(n557), .B(n1003), .Y(n20) );
  AND2X2 U31 ( .A(rct2[0]), .B(n1011), .Y(n21) );
  AND2X2 U32 ( .A(rct1[0]), .B(n1012), .Y(n22) );
  OR2X2 U33 ( .A(n866), .B(n869), .Y(n23) );
  AND2X2 U34 ( .A(curr_write_state[2]), .B(curr_write_state[1]), .Y(n24) );
  AND2X2 U35 ( .A(n615), .B(n614), .Y(n25) );
  INVX1 U36 ( .A(o_raddr[17]), .Y(n721) );
  INVX1 U37 ( .A(o_raddr[23]), .Y(n678) );
  NAND3X1 U38 ( .A(rct3[12]), .B(rct3[11]), .C(n44), .Y(n26) );
  INVX1 U39 ( .A(n44), .Y(n37) );
  INVX1 U40 ( .A(o_raddr[19]), .Y(n707) );
  AND2X2 U41 ( .A(n345), .B(n544), .Y(n27) );
  INVX1 U42 ( .A(n27), .Y(n344) );
  NAND3X1 U43 ( .A(rct3[3]), .B(rct3[4]), .C(n573), .Y(n28) );
  INVX2 U44 ( .A(n28), .Y(n39) );
  INVX2 U45 ( .A(n569), .Y(n573) );
  INVX2 U46 ( .A(n37), .Y(n38) );
  XNOR2X1 U47 ( .A(n33), .B(n32), .Y(n954) );
  OR2X2 U48 ( .A(n65), .B(n66), .Y(n33) );
  OR2X2 U49 ( .A(n46), .B(i_img_width[4]), .Y(n543) );
  INVX2 U50 ( .A(n46), .Y(n49) );
  INVX1 U51 ( .A(o_raddr[7]), .Y(n791) );
  AND2X2 U52 ( .A(wct3[2]), .B(n230), .Y(n34) );
  INVX1 U53 ( .A(n34), .Y(n235) );
  INVX1 U54 ( .A(o_raddr[5]), .Y(n806) );
  INVX2 U55 ( .A(n1346), .Y(n35) );
  INVX2 U56 ( .A(n35), .Y(o_raddr[2]) );
  INVX1 U57 ( .A(o_raddr[3]), .Y(n820) );
  BUFX2 U58 ( .A(n1351), .Y(o_waddr[2]) );
  NAND3X1 U59 ( .A(rct3[6]), .B(rct3[5]), .C(n39), .Y(n42) );
  INVX2 U60 ( .A(n42), .Y(n43) );
  INVX1 U61 ( .A(n340), .Y(n337) );
  INVX1 U62 ( .A(o_raddr[18]), .Y(n714) );
  NOR3X1 U63 ( .A(n951), .B(n985), .C(n588), .Y(n44) );
  INVX1 U64 ( .A(n588), .Y(n592) );
  INVX1 U65 ( .A(o_raddr[6]), .Y(n798) );
  NOR2X1 U66 ( .A(i_img_width[5]), .B(n543), .Y(n45) );
  INVX1 U67 ( .A(n45), .Y(n540) );
  INVX1 U68 ( .A(n543), .Y(n542) );
  INVX1 U69 ( .A(n605), .Y(n602) );
  OR2X2 U70 ( .A(i_img_width[2]), .B(i_img_width[3]), .Y(n46) );
  INVX2 U71 ( .A(n1347), .Y(n47) );
  INVX2 U72 ( .A(n47), .Y(o_raddr[1]) );
  NAND2X1 U73 ( .A(n765), .B(n15), .Y(n1223) );
  NAND2X1 U74 ( .A(n18), .B(n630), .Y(n1169) );
  NAND2X1 U106 ( .A(n709), .B(n16), .Y(n1199) );
  NAND2X1 U107 ( .A(n694), .B(n14), .Y(n1193) );
  NAND2X1 U138 ( .A(n666), .B(n13), .Y(n1181) );
  NAND2X1 U139 ( .A(n716), .B(n19), .Y(n1202) );
  INVX1 U141 ( .A(i_img_width[2]), .Y(n1006) );
  INVX1 U142 ( .A(i_img_width[3]), .Y(n545) );
  AND2X2 U144 ( .A(n386), .B(n385), .Y(n50) );
  BUFX2 U145 ( .A(n1349), .Y(o_waddr[9]) );
  INVX2 U147 ( .A(n784), .Y(o_raddr[8]) );
  XOR2X1 U148 ( .A(n537), .B(i_img_width[8]), .Y(n991) );
  OR2X2 U150 ( .A(wct3[0]), .B(wct3[1]), .Y(n230) );
  INVX2 U151 ( .A(n777), .Y(o_raddr[9]) );
  INVX2 U153 ( .A(n388), .Y(n83) );
  INVX2 U154 ( .A(n388), .Y(n82) );
  INVX2 U156 ( .A(n414), .Y(n157) );
  INVX2 U157 ( .A(n414), .Y(n126) );
  INVX2 U159 ( .A(n627), .Y(n89) );
  INVX2 U160 ( .A(n627), .Y(n88) );
  INVX2 U162 ( .A(n629), .Y(n93) );
  INVX2 U163 ( .A(n413), .Y(n158) );
  INVX2 U165 ( .A(n77), .Y(n987) );
  INVX2 U166 ( .A(n413), .Y(n160) );
  INVX2 U168 ( .A(n629), .Y(n125) );
  INVX2 U169 ( .A(n182), .Y(n179) );
  INVX2 U171 ( .A(n184), .Y(n178) );
  INVX2 U172 ( .A(n184), .Y(n176) );
  INVX2 U174 ( .A(n184), .Y(n175) );
  INVX2 U175 ( .A(n185), .Y(n172) );
  INVX2 U177 ( .A(n185), .Y(n170) );
  INVX2 U178 ( .A(n187), .Y(n169) );
  INVX2 U180 ( .A(n187), .Y(n167) );
  INVX2 U181 ( .A(n187), .Y(n166) );
  INVX2 U183 ( .A(n185), .Y(n173) );
  INVX2 U184 ( .A(n188), .Y(n164) );
  INVX2 U186 ( .A(n182), .Y(n181) );
  INVX2 U187 ( .A(n209), .Y(n163) );
  INVX2 U189 ( .A(n621), .Y(n86) );
  INVX2 U190 ( .A(n621), .Y(n87) );
  INVX2 U192 ( .A(n54), .Y(n81) );
  INVX2 U193 ( .A(n54), .Y(n80) );
  INVX2 U195 ( .A(n800), .Y(n92) );
  INVX2 U196 ( .A(n800), .Y(n91) );
  INVX2 U198 ( .A(n209), .Y(n161) );
  INVX2 U199 ( .A(n56), .Y(n77) );
  INVX2 U201 ( .A(n76), .Y(n386) );
  INVX2 U202 ( .A(n628), .Y(n90) );
  BUFX2 U204 ( .A(n208), .Y(n187) );
  BUFX2 U205 ( .A(n187), .Y(n185) );
  BUFX2 U207 ( .A(n208), .Y(n184) );
  BUFX2 U208 ( .A(n187), .Y(n182) );
  BUFX2 U210 ( .A(n208), .Y(n188) );
  BUFX2 U211 ( .A(n208), .Y(n190) );
  BUFX2 U213 ( .A(n184), .Y(n191) );
  BUFX2 U214 ( .A(n208), .Y(n193) );
  BUFX2 U216 ( .A(n208), .Y(n194) );
  BUFX2 U217 ( .A(n208), .Y(n196) );
  BUFX2 U219 ( .A(n208), .Y(n199) );
  BUFX2 U220 ( .A(n184), .Y(n200) );
  BUFX2 U222 ( .A(n208), .Y(n202) );
  BUFX2 U223 ( .A(n187), .Y(n203) );
  BUFX2 U224 ( .A(n184), .Y(n205) );
  BUFX2 U225 ( .A(n208), .Y(n197) );
  BUFX2 U226 ( .A(n208), .Y(n206) );
  AND2X2 U227 ( .A(n382), .B(n979), .Y(n54) );
  INVX2 U259 ( .A(n75), .Y(n76) );
  XNOR2X1 U260 ( .A(n350), .B(i_img_width[2]), .Y(n55) );
  AND2X2 U285 ( .A(n20), .B(n11), .Y(n56) );
  INVX2 U290 ( .A(n555), .Y(n84) );
  INVX2 U291 ( .A(n555), .Y(n85) );
  INVX2 U292 ( .A(n411), .Y(n78) );
  INVX2 U293 ( .A(n411), .Y(n79) );
  INVX2 U294 ( .A(n_rst), .Y(n208) );
  INVX2 U295 ( .A(n384), .Y(n75) );
  XNOR2X1 U296 ( .A(n538), .B(i_img_width[7]), .Y(n57) );
  XNOR2X1 U297 ( .A(wct3[6]), .B(n966), .Y(n349) );
  XNOR2X1 U298 ( .A(n364), .B(i_img_width[7]), .Y(n58) );
  AND2X2 U299 ( .A(n781), .B(n780), .Y(n59) );
  NOR2X1 U300 ( .A(n60), .B(n61), .Y(n347) );
  XOR2X1 U301 ( .A(n58), .B(wct3[7]), .Y(n60) );
  XOR2X1 U302 ( .A(wct3[0]), .B(n67), .Y(n61) );
  INVX2 U303 ( .A(n359), .Y(n62) );
  OR2X2 U304 ( .A(n63), .B(n360), .Y(n385) );
  NAND2X1 U305 ( .A(n370), .B(n62), .Y(n63) );
  BUFX2 U306 ( .A(n45), .Y(n64) );
  NAND2X1 U307 ( .A(n27), .B(n541), .Y(n65) );
  OR2X1 U308 ( .A(i_img_width[7]), .B(i_img_width[6]), .Y(n66) );
  BUFX2 U309 ( .A(boundary_2[0]), .Y(n67) );
  INVX2 U310 ( .A(n1352), .Y(n68) );
  INVX2 U311 ( .A(n1348), .Y(n70) );
  INVX4 U312 ( .A(n70), .Y(o_raddr[0]) );
  BUFX4 U313 ( .A(boundary_2[1]), .Y(n72) );
  OR2X2 U314 ( .A(n351), .B(i_img_width[6]), .Y(n364) );
  INVX1 U315 ( .A(n351), .Y(n343) );
  NAND2X1 U316 ( .A(n779), .B(n59), .Y(n1229) );
  INVX1 U317 ( .A(o_raddr[0]), .Y(n873) );
  INVX2 U318 ( .A(n1353), .Y(n73) );
  INVX2 U319 ( .A(curr_read_state[0]), .Y(n1002) );
  OAI21X1 U320 ( .A(n893), .B(n1002), .C(n899), .Y(n1282) );
  INVX2 U321 ( .A(curr_read_state[1]), .Y(n1000) );
  OAI21X1 U322 ( .A(n893), .B(n1000), .C(n896), .Y(n1281) );
  INVX2 U323 ( .A(curr_read_state[3]), .Y(n557) );
  NAND3X1 U324 ( .A(curr_read_state[1]), .B(n1002), .C(n7), .Y(n628) );
  NAND2X1 U325 ( .A(n11), .B(n7), .Y(n629) );
  NAND2X1 U326 ( .A(n628), .B(n629), .Y(n866) );
  NAND3X1 U327 ( .A(curr_read_state[0]), .B(n1000), .C(n7), .Y(n800) );
  INVX2 U328 ( .A(n866), .Y(n999) );
  NAND2X1 U329 ( .A(n7), .B(n10), .Y(n627) );
  NAND3X1 U330 ( .A(n800), .B(n999), .C(n627), .Y(n209) );
  INVX2 U331 ( .A(curr_write_state[4]), .Y(n373) );
  INVX2 U332 ( .A(curr_write_state[0]), .Y(n372) );
  NAND3X1 U333 ( .A(curr_write_state[3]), .B(n373), .C(n372), .Y(n211) );
  INVX2 U334 ( .A(n211), .Y(n218) );
  NAND2X1 U335 ( .A(n24), .B(n218), .Y(n413) );
  INVX2 U336 ( .A(curr_write_state[2]), .Y(n404) );
  NAND3X1 U337 ( .A(curr_write_state[1]), .B(n218), .C(n404), .Y(n400) );
  INVX2 U338 ( .A(n400), .Y(n993) );
  INVX2 U339 ( .A(wct1[0]), .Y(n997) );
  NAND2X1 U340 ( .A(n993), .B(n997), .Y(n984) );
  INVX2 U341 ( .A(n637), .Y(n212) );
  NAND3X1 U342 ( .A(n413), .B(n984), .C(n212), .Y(n1112) );
  NAND2X1 U343 ( .A(n993), .B(wct1[0]), .Y(n214) );
  MUX2X1 U344 ( .B(n214), .A(n633), .S(wct1[1]), .Y(n1111) );
  NOR2X1 U345 ( .A(curr_write_state[0]), .B(n373), .Y(n217) );
  INVX2 U346 ( .A(curr_write_state[1]), .Y(n376) );
  INVX2 U347 ( .A(curr_write_state[3]), .Y(n215) );
  NAND3X1 U348 ( .A(n217), .B(n376), .C(n12), .Y(n979) );
  NAND3X1 U349 ( .A(curr_write_state[2]), .B(n218), .C(n376), .Y(n384) );
  NAND2X1 U350 ( .A(n76), .B(n979), .Y(n379) );
  INVX2 U351 ( .A(n379), .Y(n221) );
  MUX2X1 U352 ( .B(n386), .A(n221), .S(wct3[0]), .Y(n220) );
  NAND2X1 U353 ( .A(n979), .B(n220), .Y(n1128) );
  OAI21X1 U354 ( .A(wct3[0]), .B(n221), .C(wct3[1]), .Y(n224) );
  INVX2 U355 ( .A(n230), .Y(n223) );
  NAND2X1 U356 ( .A(n223), .B(n386), .Y(n226) );
  NAND3X1 U357 ( .A(n224), .B(n979), .C(n226), .Y(n1127) );
  NAND2X1 U358 ( .A(n386), .B(n230), .Y(n229) );
  AND2X2 U359 ( .A(n226), .B(n379), .Y(n227) );
  MUX2X1 U361 ( .B(n229), .A(n227), .S(wct3[2]), .Y(n1126) );
  NAND2X1 U362 ( .A(n34), .B(n386), .Y(n233) );
  OAI21X1 U363 ( .A(n34), .B(n384), .C(n379), .Y(n238) );
  INVX2 U364 ( .A(n238), .Y(n232) );
  MUX2X1 U365 ( .B(n233), .A(n232), .S(wct3[3]), .Y(n1125) );
  NOR2X1 U366 ( .A(wct3[4]), .B(n235), .Y(n236) );
  MUX2X1 U367 ( .B(wct3[4]), .A(n236), .S(wct3[3]), .Y(n241) );
  NAND2X1 U368 ( .A(wct3[4]), .B(n238), .Y(n239) );
  OAI21X1 U369 ( .A(n76), .B(n241), .C(n239), .Y(n1124) );
  NAND3X1 U370 ( .A(wct3[4]), .B(wct3[3]), .C(n34), .Y(n244) );
  INVX2 U371 ( .A(n244), .Y(n304) );
  NAND2X1 U372 ( .A(n304), .B(n386), .Y(n243) );
  OAI21X1 U373 ( .A(n304), .B(n384), .C(n379), .Y(n246) );
  INVX2 U374 ( .A(n246), .Y(n242) );
  MUX2X1 U375 ( .B(n243), .A(n242), .S(wct3[5]), .Y(n1123) );
  NOR2X1 U376 ( .A(wct3[6]), .B(n244), .Y(n245) );
  MUX2X1 U377 ( .B(wct3[6]), .A(n245), .S(wct3[5]), .Y(n279) );
  NAND2X1 U378 ( .A(wct3[6]), .B(n246), .Y(n278) );
  OAI21X1 U379 ( .A(n76), .B(n279), .C(n278), .Y(n1122) );
  NAND3X1 U380 ( .A(wct3[6]), .B(wct3[5]), .C(n304), .Y(n311) );
  INVX2 U381 ( .A(n311), .Y(n316) );
  NAND2X1 U382 ( .A(n316), .B(n386), .Y(n310) );
  OAI21X1 U383 ( .A(n316), .B(n384), .C(n379), .Y(n313) );
  INVX2 U384 ( .A(n313), .Y(n309) );
  MUX2X1 U385 ( .B(n310), .A(n309), .S(wct3[7]), .Y(n1121) );
  NOR2X1 U386 ( .A(wct3[8]), .B(n311), .Y(n312) );
  MUX2X1 U387 ( .B(wct3[8]), .A(n312), .S(wct3[7]), .Y(n315) );
  NAND2X1 U388 ( .A(wct3[8]), .B(n313), .Y(n314) );
  OAI21X1 U389 ( .A(n76), .B(n315), .C(n314), .Y(n1120) );
  NAND3X1 U390 ( .A(wct3[8]), .B(wct3[7]), .C(n316), .Y(n319) );
  INVX2 U391 ( .A(n319), .Y(n323) );
  NAND2X1 U392 ( .A(n323), .B(n386), .Y(n318) );
  OAI21X1 U393 ( .A(n323), .B(n384), .C(n379), .Y(n317) );
  INVX2 U394 ( .A(n317), .Y(n321) );
  MUX2X1 U395 ( .B(n318), .A(n321), .S(wct3[9]), .Y(n1119) );
  NOR2X1 U396 ( .A(wct3[10]), .B(n2), .Y(n320) );
  MUX2X1 U397 ( .B(wct3[10]), .A(n320), .S(wct3[9]), .Y(n322) );
  INVX2 U398 ( .A(wct3[10]), .Y(n363) );
  OAI22X1 U399 ( .A(n322), .B(n76), .C(n321), .D(n363), .Y(n1118) );
  NAND3X1 U400 ( .A(wct3[10]), .B(wct3[9]), .C(n323), .Y(n326) );
  INVX2 U401 ( .A(n326), .Y(n331) );
  NAND2X1 U402 ( .A(n331), .B(n386), .Y(n325) );
  OAI21X1 U403 ( .A(n331), .B(n384), .C(n379), .Y(n328) );
  INVX2 U404 ( .A(n328), .Y(n324) );
  MUX2X1 U405 ( .B(n325), .A(n324), .S(wct3[11]), .Y(n1117) );
  NOR2X1 U406 ( .A(wct3[12]), .B(n326), .Y(n327) );
  MUX2X1 U407 ( .B(wct3[12]), .A(n327), .S(wct3[11]), .Y(n330) );
  NAND2X1 U408 ( .A(wct3[12]), .B(n328), .Y(n329) );
  OAI21X1 U409 ( .A(n76), .B(n330), .C(n329), .Y(n1116) );
  NAND3X1 U410 ( .A(wct3[12]), .B(wct3[11]), .C(n331), .Y(n332) );
  INVX2 U411 ( .A(n332), .Y(n335) );
  NAND2X1 U412 ( .A(n335), .B(n386), .Y(n334) );
  OAI21X1 U413 ( .A(n335), .B(n76), .C(n379), .Y(n333) );
  INVX2 U414 ( .A(n333), .Y(n336) );
  MUX2X1 U415 ( .B(n334), .A(n336), .S(wct3[13]), .Y(n1115) );
  NAND3X1 U416 ( .A(wct3[13]), .B(n335), .C(n386), .Y(n338) );
  OAI21X1 U417 ( .A(wct3[13]), .B(n76), .C(n336), .Y(n340) );
  MUX2X1 U418 ( .B(n338), .A(n337), .S(wct3[14]), .Y(n1114) );
  INVX2 U419 ( .A(n338), .Y(n339) );
  NAND2X1 U420 ( .A(wct3[14]), .B(n339), .Y(n342) );
  INVX2 U421 ( .A(wct3[14]), .Y(n366) );
  AOI21X1 U422 ( .A(n386), .B(n366), .C(n340), .Y(n341) );
  MUX2X1 U423 ( .B(n342), .A(n341), .S(wct3[15]), .Y(n1113) );
  NAND2X1 U424 ( .A(n49), .B(n350), .Y(n352) );
  INVX2 U425 ( .A(n352), .Y(n345) );
  INVX2 U426 ( .A(i_img_width[4]), .Y(n544) );
  INVX2 U427 ( .A(i_img_width[5]), .Y(n541) );
  NAND2X1 U428 ( .A(n27), .B(n541), .Y(n351) );
  INVX2 U429 ( .A(i_img_width[6]), .Y(n539) );
  OAI21X1 U430 ( .A(n343), .B(n539), .C(n364), .Y(n966) );
  OAI21X1 U431 ( .A(n345), .B(n544), .C(n344), .Y(n950) );
  INVX2 U432 ( .A(n950), .Y(n346) );
  XOR2X1 U433 ( .A(wct3[4]), .B(n346), .Y(n348) );
  NAND3X1 U434 ( .A(n349), .B(n348), .C(n347), .Y(n360) );
  XOR2X1 U435 ( .A(wct3[2]), .B(n55), .Y(n358) );
  XOR2X1 U436 ( .A(n72), .B(wct3[1]), .Y(n357) );
  OAI21X1 U437 ( .A(n27), .B(n541), .C(n351), .Y(n962) );
  XOR2X1 U438 ( .A(n962), .B(wct3[5]), .Y(n355) );
  OAI21X1 U439 ( .A(i_img_width[2]), .B(n72), .C(i_img_width[3]), .Y(n353) );
  NAND2X1 U440 ( .A(n353), .B(n352), .Y(n969) );
  XOR2X1 U441 ( .A(n969), .B(wct3[3]), .Y(n354) );
  NOR2X1 U442 ( .A(n355), .B(n354), .Y(n356) );
  NAND3X1 U443 ( .A(n358), .B(n357), .C(n356), .Y(n359) );
  INVX2 U444 ( .A(wct3[11]), .Y(n362) );
  NOR2X1 U445 ( .A(wct3[15]), .B(wct3[9]), .Y(n361) );
  NAND3X1 U446 ( .A(n363), .B(n362), .C(n361), .Y(n369) );
  XOR2X1 U447 ( .A(n954), .B(wct3[8]), .Y(n367) );
  NOR2X1 U448 ( .A(wct3[13]), .B(wct3[12]), .Y(n365) );
  NAND3X1 U449 ( .A(n367), .B(n366), .C(n365), .Y(n368) );
  NOR2X1 U450 ( .A(n369), .B(n368), .Y(n370) );
  NAND3X1 U451 ( .A(curr_write_state[3]), .B(curr_write_state[0]), .C(n373), 
        .Y(n371) );
  INVX2 U452 ( .A(n371), .Y(n377) );
  NAND3X1 U453 ( .A(n377), .B(n376), .C(n404), .Y(n398) );
  NAND3X1 U454 ( .A(n377), .B(curr_write_state[1]), .C(n404), .Y(n489) );
  NOR2X1 U455 ( .A(n373), .B(n372), .Y(n374) );
  NAND3X1 U456 ( .A(n374), .B(n376), .C(n12), .Y(n408) );
  NAND3X1 U457 ( .A(n398), .B(n489), .C(n408), .Y(n375) );
  NOR2X1 U458 ( .A(n993), .B(n375), .Y(n381) );
  NAND3X1 U459 ( .A(n377), .B(curr_write_state[2]), .C(n376), .Y(n382) );
  NAND2X1 U460 ( .A(n377), .B(n24), .Y(n414) );
  NAND3X1 U461 ( .A(n382), .B(n413), .C(n414), .Y(n378) );
  NOR2X1 U462 ( .A(n379), .B(n378), .Y(n380) );
  NAND2X1 U463 ( .A(n381), .B(n380), .Y(n403) );
  INVX2 U464 ( .A(n403), .Y(n396) );
  NAND3X1 U465 ( .A(n54), .B(n414), .C(n413), .Y(n388) );
  AOI21X1 U466 ( .A(n396), .B(curr_write_state[4]), .C(n388), .Y(n383) );
  OAI21X1 U467 ( .A(n76), .B(n385), .C(n383), .Y(next_write_state[4]) );
  NAND2X1 U468 ( .A(n386), .B(n385), .Y(n401) );
  NAND3X1 U469 ( .A(n401), .B(n400), .C(n408), .Y(n387) );
  INVX2 U470 ( .A(n387), .Y(n399) );
  INVX2 U471 ( .A(n398), .Y(n391) );
  INVX2 U472 ( .A(i_inc_waddr), .Y(n389) );
  AOI22X1 U473 ( .A(n396), .B(curr_write_state[0]), .C(n391), .D(n389), .Y(
        n390) );
  NAND3X1 U474 ( .A(n399), .B(n82), .C(n390), .Y(next_write_state[0]) );
  INVX2 U475 ( .A(n489), .Y(n994) );
  INVX2 U476 ( .A(wct2[1]), .Y(n1005) );
  AOI22X1 U477 ( .A(i_inc_waddr), .B(n391), .C(n994), .D(n1005), .Y(n395) );
  INVX2 U478 ( .A(wct2[0]), .Y(n407) );
  NAND2X1 U479 ( .A(n994), .B(n407), .Y(n980) );
  NAND2X1 U480 ( .A(wct1[1]), .B(wct1[0]), .Y(n392) );
  OAI21X1 U481 ( .A(n400), .B(n392), .C(n401), .Y(n393) );
  AOI21X1 U482 ( .A(n396), .B(curr_write_state[1]), .C(n393), .Y(n394) );
  NAND3X1 U483 ( .A(n395), .B(n980), .C(n394), .Y(next_write_state[1]) );
  AOI21X1 U484 ( .A(n396), .B(curr_write_state[3]), .C(n994), .Y(n397) );
  NAND3X1 U485 ( .A(n399), .B(n398), .C(n397), .Y(next_write_state[3]) );
  OAI21X1 U486 ( .A(wct1[1]), .B(n400), .C(n984), .Y(n406) );
  NOR2X1 U487 ( .A(n994), .B(n50), .Y(n402) );
  OAI21X1 U488 ( .A(n404), .B(n403), .C(n402), .Y(n405) );
  OR2X1 U489 ( .A(n405), .B(n406), .Y(next_write_state[2]) );
  NOR2X1 U490 ( .A(n997), .B(n407), .Y(n410) );
  INVX2 U491 ( .A(n408), .Y(n996) );
  NOR2X1 U492 ( .A(wct2[1]), .B(wct1[1]), .Y(n409) );
  NAND3X1 U493 ( .A(n410), .B(n996), .C(n409), .Y(n411) );
  MUX2X1 U494 ( .B(wpt[29]), .A(N726), .S(n78), .Y(n412) );
  INVX2 U495 ( .A(n412), .Y(n1081) );
  AOI22X1 U496 ( .A(o_waddr[29]), .B(n83), .C(N627), .D(n80), .Y(n416) );
  AOI22X1 U497 ( .A(N659), .B(n158), .C(wpt[29]), .D(n126), .Y(n415) );
  NAND2X1 U498 ( .A(n416), .B(n415), .Y(n989) );
  INVX2 U499 ( .A(N68), .Y(n417) );
  NAND2X1 U500 ( .A(n417), .B(n182), .Y(n1317) );
  NAND2X1 U501 ( .A(N68), .B(n184), .Y(n1316) );
  MUX2X1 U502 ( .B(wpt[28]), .A(N725), .S(n78), .Y(n418) );
  INVX2 U503 ( .A(n418), .Y(n1082) );
  AOI22X1 U504 ( .A(o_waddr[28]), .B(n83), .C(N626), .D(n80), .Y(n420) );
  AOI22X1 U505 ( .A(N658), .B(n158), .C(wpt[28]), .D(n126), .Y(n419) );
  NAND2X1 U506 ( .A(n420), .B(n419), .Y(n992) );
  INVX2 U507 ( .A(N67), .Y(n421) );
  NAND2X1 U508 ( .A(n421), .B(n185), .Y(n1315) );
  NAND2X1 U509 ( .A(N67), .B(n187), .Y(n1314) );
  MUX2X1 U510 ( .B(wpt[27]), .A(N724), .S(n78), .Y(n422) );
  INVX2 U511 ( .A(n422), .Y(n1083) );
  AOI22X1 U512 ( .A(o_waddr[27]), .B(n82), .C(N625), .D(n80), .Y(n424) );
  AOI22X1 U513 ( .A(N657), .B(n158), .C(wpt[27]), .D(n126), .Y(n423) );
  NAND2X1 U514 ( .A(n424), .B(n423), .Y(n995) );
  INVX2 U515 ( .A(N66), .Y(n425) );
  NAND2X1 U516 ( .A(n425), .B(n188), .Y(n1313) );
  NAND2X1 U517 ( .A(N66), .B(n188), .Y(n1312) );
  MUX2X1 U518 ( .B(wpt[26]), .A(N723), .S(n78), .Y(n426) );
  INVX2 U519 ( .A(n426), .Y(n1084) );
  AOI22X1 U520 ( .A(o_waddr[26]), .B(n82), .C(N624), .D(n80), .Y(n428) );
  AOI22X1 U521 ( .A(N656), .B(n158), .C(wpt[26]), .D(n126), .Y(n427) );
  NAND2X1 U522 ( .A(n428), .B(n427), .Y(n998) );
  INVX2 U523 ( .A(N65), .Y(n429) );
  NAND2X1 U524 ( .A(n429), .B(n188), .Y(n1311) );
  NAND2X1 U525 ( .A(N65), .B(n188), .Y(n1310) );
  MUX2X1 U526 ( .B(wpt[25]), .A(N722), .S(n78), .Y(n430) );
  INVX2 U527 ( .A(n430), .Y(n1085) );
  AOI22X1 U528 ( .A(o_waddr[25]), .B(n83), .C(N623), .D(n80), .Y(n432) );
  AOI22X1 U529 ( .A(N655), .B(n158), .C(wpt[25]), .D(n126), .Y(n431) );
  NAND2X1 U530 ( .A(n432), .B(n431), .Y(n1001) );
  INVX2 U531 ( .A(N64), .Y(n433) );
  NAND2X1 U532 ( .A(n433), .B(n188), .Y(n1309) );
  NAND2X1 U533 ( .A(N64), .B(n188), .Y(n1308) );
  MUX2X1 U534 ( .B(wpt[24]), .A(N721), .S(n78), .Y(n434) );
  INVX2 U535 ( .A(n434), .Y(n1086) );
  AOI22X1 U536 ( .A(o_waddr[24]), .B(n82), .C(N622), .D(n80), .Y(n436) );
  AOI22X1 U537 ( .A(N654), .B(n158), .C(wpt[24]), .D(n126), .Y(n435) );
  NAND2X1 U538 ( .A(n436), .B(n435), .Y(n1004) );
  INVX2 U539 ( .A(N63), .Y(n437) );
  NAND2X1 U540 ( .A(n437), .B(n188), .Y(n1307) );
  NAND2X1 U541 ( .A(N63), .B(n190), .Y(n1306) );
  MUX2X1 U542 ( .B(wpt[23]), .A(N720), .S(n78), .Y(n438) );
  INVX2 U543 ( .A(n438), .Y(n1087) );
  AOI22X1 U544 ( .A(o_waddr[23]), .B(n83), .C(N621), .D(n80), .Y(n440) );
  AOI22X1 U545 ( .A(N653), .B(n158), .C(wpt[23]), .D(n126), .Y(n439) );
  NAND2X1 U546 ( .A(n440), .B(n439), .Y(n1007) );
  INVX2 U547 ( .A(N62), .Y(n441) );
  NAND2X1 U548 ( .A(n441), .B(n190), .Y(n1305) );
  NAND2X1 U549 ( .A(N62), .B(n190), .Y(n1304) );
  MUX2X1 U550 ( .B(wpt[22]), .A(N719), .S(n78), .Y(n442) );
  INVX2 U551 ( .A(n442), .Y(n1088) );
  AOI22X1 U552 ( .A(o_waddr[22]), .B(n83), .C(N620), .D(n80), .Y(n444) );
  AOI22X1 U553 ( .A(N652), .B(n158), .C(wpt[22]), .D(n126), .Y(n443) );
  NAND2X1 U554 ( .A(n444), .B(n443), .Y(n1010) );
  INVX2 U555 ( .A(N61), .Y(n445) );
  NAND2X1 U556 ( .A(n445), .B(n190), .Y(n1303) );
  NAND2X1 U557 ( .A(N61), .B(n190), .Y(n1302) );
  MUX2X1 U558 ( .B(wpt[21]), .A(N718), .S(n78), .Y(n446) );
  INVX2 U559 ( .A(n446), .Y(n1089) );
  AOI22X1 U560 ( .A(o_waddr[21]), .B(n83), .C(N619), .D(n80), .Y(n448) );
  AOI22X1 U561 ( .A(N651), .B(n158), .C(wpt[21]), .D(n126), .Y(n447) );
  NAND2X1 U562 ( .A(n448), .B(n447), .Y(n1013) );
  INVX2 U563 ( .A(N60), .Y(n449) );
  NAND2X1 U564 ( .A(n449), .B(n190), .Y(n1301) );
  NAND2X1 U565 ( .A(N60), .B(n190), .Y(n1300) );
  MUX2X1 U566 ( .B(wpt[20]), .A(N717), .S(n78), .Y(n450) );
  INVX2 U567 ( .A(n450), .Y(n1090) );
  AOI22X1 U568 ( .A(o_waddr[20]), .B(n83), .C(N618), .D(n80), .Y(n452) );
  AOI22X1 U569 ( .A(N650), .B(n158), .C(wpt[20]), .D(n126), .Y(n451) );
  NAND2X1 U570 ( .A(n452), .B(n451), .Y(n1016) );
  INVX2 U571 ( .A(N59), .Y(n453) );
  NAND2X1 U572 ( .A(n453), .B(n190), .Y(n1299) );
  NAND2X1 U573 ( .A(N59), .B(n190), .Y(n1298) );
  MUX2X1 U574 ( .B(wpt[19]), .A(N716), .S(n78), .Y(n454) );
  INVX2 U575 ( .A(n454), .Y(n1091) );
  AOI22X1 U576 ( .A(o_waddr[19]), .B(n83), .C(N617), .D(n80), .Y(n456) );
  AOI22X1 U577 ( .A(N649), .B(n158), .C(wpt[19]), .D(n126), .Y(n455) );
  NAND2X1 U578 ( .A(n456), .B(n455), .Y(n1019) );
  INVX2 U579 ( .A(N58), .Y(n457) );
  NAND2X1 U580 ( .A(n457), .B(n190), .Y(n1297) );
  NAND2X1 U581 ( .A(N58), .B(n191), .Y(n1296) );
  MUX2X1 U582 ( .B(wpt[18]), .A(N715), .S(n78), .Y(n458) );
  INVX2 U583 ( .A(n458), .Y(n1092) );
  AOI22X1 U584 ( .A(o_waddr[18]), .B(n83), .C(N616), .D(n80), .Y(n460) );
  AOI22X1 U585 ( .A(N648), .B(n158), .C(wpt[18]), .D(n126), .Y(n459) );
  NAND2X1 U586 ( .A(n460), .B(n459), .Y(n1022) );
  INVX2 U587 ( .A(N57), .Y(n461) );
  NAND2X1 U588 ( .A(n461), .B(n191), .Y(n1295) );
  NAND2X1 U589 ( .A(N57), .B(n191), .Y(n1294) );
  MUX2X1 U590 ( .B(wpt[17]), .A(N714), .S(n78), .Y(n462) );
  INVX2 U591 ( .A(n462), .Y(n1093) );
  AOI22X1 U592 ( .A(o_waddr[17]), .B(n83), .C(N615), .D(n80), .Y(n464) );
  AOI22X1 U593 ( .A(N647), .B(n158), .C(wpt[17]), .D(n126), .Y(n463) );
  NAND2X1 U594 ( .A(n464), .B(n463), .Y(n1025) );
  INVX2 U595 ( .A(N56), .Y(n465) );
  NAND2X1 U596 ( .A(n465), .B(n191), .Y(n1293) );
  NAND2X1 U597 ( .A(N56), .B(n191), .Y(n1292) );
  MUX2X1 U598 ( .B(wpt[16]), .A(N713), .S(n79), .Y(n466) );
  INVX2 U599 ( .A(n466), .Y(n1094) );
  AOI22X1 U600 ( .A(o_waddr[16]), .B(n83), .C(N614), .D(n81), .Y(n468) );
  AOI22X1 U601 ( .A(N646), .B(n160), .C(wpt[16]), .D(n157), .Y(n467) );
  NAND2X1 U602 ( .A(n468), .B(n467), .Y(n1028) );
  INVX2 U603 ( .A(N55), .Y(n469) );
  NAND2X1 U604 ( .A(n469), .B(n191), .Y(n1291) );
  NAND2X1 U605 ( .A(N55), .B(n191), .Y(n1290) );
  MUX2X1 U606 ( .B(wpt[15]), .A(N712), .S(n79), .Y(n470) );
  INVX2 U607 ( .A(n470), .Y(n1095) );
  AOI22X1 U608 ( .A(o_waddr[15]), .B(n83), .C(N613), .D(n81), .Y(n472) );
  AOI22X1 U609 ( .A(N645), .B(n158), .C(wpt[15]), .D(n157), .Y(n471) );
  NAND2X1 U610 ( .A(n472), .B(n471), .Y(n1031) );
  INVX2 U611 ( .A(N54), .Y(n473) );
  NAND2X1 U612 ( .A(n473), .B(n191), .Y(n1289) );
  NAND2X1 U613 ( .A(N54), .B(n191), .Y(n1288) );
  MUX2X1 U614 ( .B(wpt[14]), .A(N711), .S(n79), .Y(n474) );
  INVX2 U615 ( .A(n474), .Y(n1096) );
  AOI22X1 U616 ( .A(o_waddr[14]), .B(n83), .C(N612), .D(n81), .Y(n476) );
  AOI22X1 U617 ( .A(N644), .B(n158), .C(wpt[14]), .D(n157), .Y(n475) );
  NAND2X1 U618 ( .A(n476), .B(n475), .Y(n1034) );
  INVX2 U619 ( .A(N53), .Y(n477) );
  NAND2X1 U620 ( .A(n477), .B(n191), .Y(n1287) );
  NAND2X1 U621 ( .A(N53), .B(n193), .Y(n1286) );
  MUX2X1 U622 ( .B(wpt[13]), .A(N710), .S(n79), .Y(n478) );
  INVX2 U623 ( .A(n478), .Y(n1097) );
  AOI22X1 U624 ( .A(o_waddr[13]), .B(n83), .C(N611), .D(n81), .Y(n480) );
  AOI22X1 U625 ( .A(N643), .B(n160), .C(wpt[13]), .D(n157), .Y(n479) );
  NAND2X1 U626 ( .A(n480), .B(n479), .Y(n1037) );
  INVX2 U627 ( .A(N52), .Y(n481) );
  NAND2X1 U628 ( .A(n481), .B(n193), .Y(n1285) );
  NAND2X1 U629 ( .A(N52), .B(n193), .Y(n1284) );
  MUX2X1 U630 ( .B(wpt[12]), .A(N709), .S(n79), .Y(n482) );
  INVX2 U631 ( .A(n482), .Y(n1098) );
  AOI22X1 U632 ( .A(o_waddr[12]), .B(n83), .C(N610), .D(n81), .Y(n484) );
  AOI22X1 U633 ( .A(N642), .B(n160), .C(wpt[12]), .D(n157), .Y(n483) );
  NAND2X1 U634 ( .A(n484), .B(n483), .Y(n1040) );
  INVX2 U635 ( .A(N51), .Y(n485) );
  NAND2X1 U636 ( .A(n485), .B(n193), .Y(n1283) );
  NAND2X1 U637 ( .A(N51), .B(n193), .Y(n1280) );
  MUX2X1 U638 ( .B(wpt[11]), .A(N708), .S(n79), .Y(n486) );
  INVX2 U639 ( .A(n486), .Y(n1099) );
  AOI22X1 U640 ( .A(o_waddr[11]), .B(n83), .C(N609), .D(n81), .Y(n488) );
  AOI22X1 U641 ( .A(N641), .B(n158), .C(wpt[11]), .D(n157), .Y(n487) );
  NAND2X1 U642 ( .A(n488), .B(n487), .Y(n1043) );
  INVX2 U643 ( .A(N50), .Y(n490) );
  NAND2X1 U644 ( .A(n490), .B(n193), .Y(n1258) );
  NAND2X1 U645 ( .A(N50), .B(n193), .Y(n1257) );
  MUX2X1 U646 ( .B(wpt[10]), .A(N707), .S(n79), .Y(n491) );
  INVX2 U647 ( .A(n491), .Y(n1100) );
  AOI22X1 U648 ( .A(o_waddr[10]), .B(n82), .C(N608), .D(n81), .Y(n493) );
  AOI22X1 U649 ( .A(N640), .B(n158), .C(wpt[10]), .D(n157), .Y(n492) );
  NAND2X1 U650 ( .A(n493), .B(n492), .Y(n1046) );
  INVX2 U651 ( .A(N49), .Y(n495) );
  NAND2X1 U652 ( .A(n495), .B(n193), .Y(n1255) );
  NAND2X1 U653 ( .A(N49), .B(n193), .Y(n1254) );
  MUX2X1 U654 ( .B(wpt[9]), .A(N706), .S(n79), .Y(n496) );
  INVX2 U655 ( .A(n496), .Y(n1101) );
  AOI22X1 U656 ( .A(o_waddr[9]), .B(n82), .C(N607), .D(n81), .Y(n498) );
  AOI22X1 U657 ( .A(N639), .B(n158), .C(wpt[9]), .D(n157), .Y(n497) );
  NAND2X1 U658 ( .A(n498), .B(n497), .Y(n1049) );
  INVX2 U659 ( .A(N48), .Y(n499) );
  NAND2X1 U660 ( .A(n499), .B(n193), .Y(n1323) );
  NAND2X1 U661 ( .A(N48), .B(n194), .Y(n1322) );
  MUX2X1 U662 ( .B(wpt[8]), .A(N705), .S(n79), .Y(n500) );
  INVX2 U663 ( .A(n500), .Y(n1102) );
  AOI22X1 U664 ( .A(o_waddr[8]), .B(n82), .C(N606), .D(n81), .Y(n503) );
  AOI22X1 U665 ( .A(N638), .B(n160), .C(wpt[8]), .D(n157), .Y(n502) );
  NAND2X1 U666 ( .A(n503), .B(n502), .Y(n1052) );
  INVX2 U667 ( .A(N47), .Y(n504) );
  NAND2X1 U668 ( .A(n504), .B(n194), .Y(n1325) );
  NAND2X1 U669 ( .A(N47), .B(n194), .Y(n1324) );
  MUX2X1 U670 ( .B(wpt[7]), .A(N704), .S(n79), .Y(n505) );
  INVX2 U671 ( .A(n505), .Y(n1103) );
  AOI22X1 U672 ( .A(o_waddr[7]), .B(n82), .C(N605), .D(n81), .Y(n507) );
  AOI22X1 U673 ( .A(N637), .B(n160), .C(wpt[7]), .D(n157), .Y(n506) );
  NAND2X1 U674 ( .A(n507), .B(n506), .Y(n1055) );
  INVX2 U675 ( .A(N46), .Y(n508) );
  NAND2X1 U676 ( .A(n508), .B(n194), .Y(n1327) );
  NAND2X1 U677 ( .A(N46), .B(n194), .Y(n1326) );
  MUX2X1 U678 ( .B(wpt[6]), .A(N703), .S(n79), .Y(n509) );
  INVX2 U679 ( .A(n509), .Y(n1104) );
  AOI22X1 U680 ( .A(o_waddr[6]), .B(n82), .C(N604), .D(n81), .Y(n511) );
  AOI22X1 U681 ( .A(N636), .B(n158), .C(wpt[6]), .D(n157), .Y(n510) );
  NAND2X1 U682 ( .A(n511), .B(n510), .Y(n1058) );
  INVX2 U683 ( .A(N45), .Y(n512) );
  NAND2X1 U684 ( .A(n512), .B(n194), .Y(n1329) );
  NAND2X1 U685 ( .A(N45), .B(n194), .Y(n1328) );
  MUX2X1 U686 ( .B(wpt[5]), .A(N702), .S(n79), .Y(n513) );
  INVX2 U687 ( .A(n513), .Y(n1105) );
  AOI22X1 U688 ( .A(o_waddr[5]), .B(n82), .C(N603), .D(n81), .Y(n515) );
  AOI22X1 U689 ( .A(N635), .B(n158), .C(wpt[5]), .D(n157), .Y(n514) );
  NAND2X1 U690 ( .A(n515), .B(n514), .Y(n1061) );
  INVX2 U691 ( .A(N44), .Y(n516) );
  NAND2X1 U692 ( .A(n516), .B(n194), .Y(n1333) );
  NAND2X1 U693 ( .A(N44), .B(n194), .Y(n1332) );
  MUX2X1 U694 ( .B(wpt[4]), .A(N701), .S(n79), .Y(n517) );
  INVX2 U695 ( .A(n517), .Y(n1106) );
  AOI22X1 U696 ( .A(o_waddr[4]), .B(n82), .C(N602), .D(n81), .Y(n519) );
  AOI22X1 U697 ( .A(N634), .B(n160), .C(wpt[4]), .D(n157), .Y(n518) );
  NAND2X1 U698 ( .A(n519), .B(n518), .Y(n1064) );
  INVX2 U699 ( .A(N43), .Y(n520) );
  NAND2X1 U700 ( .A(n520), .B(n194), .Y(n1335) );
  NAND2X1 U701 ( .A(N43), .B(n196), .Y(n1334) );
  MUX2X1 U702 ( .B(wpt[3]), .A(N700), .S(n79), .Y(n521) );
  INVX2 U703 ( .A(n521), .Y(n1107) );
  AOI22X1 U704 ( .A(o_waddr[3]), .B(n82), .C(N601), .D(n80), .Y(n523) );
  AOI22X1 U705 ( .A(N633), .B(n160), .C(wpt[3]), .D(n126), .Y(n522) );
  NAND2X1 U706 ( .A(n523), .B(n522), .Y(n1067) );
  INVX2 U707 ( .A(N42), .Y(n524) );
  NAND2X1 U708 ( .A(n524), .B(n196), .Y(n1337) );
  NAND2X1 U709 ( .A(N42), .B(n196), .Y(n1336) );
  MUX2X1 U710 ( .B(wpt[2]), .A(N699), .S(n78), .Y(n525) );
  INVX2 U711 ( .A(n525), .Y(n1108) );
  AOI22X1 U712 ( .A(o_waddr[2]), .B(n82), .C(N600), .D(n81), .Y(n527) );
  AOI22X1 U713 ( .A(N632), .B(n160), .C(wpt[2]), .D(n126), .Y(n526) );
  NAND2X1 U714 ( .A(n527), .B(n526), .Y(n1070) );
  INVX2 U715 ( .A(N41), .Y(n528) );
  NAND2X1 U716 ( .A(n528), .B(n196), .Y(n1339) );
  NAND2X1 U717 ( .A(N41), .B(n196), .Y(n1338) );
  MUX2X1 U718 ( .B(wpt[1]), .A(N698), .S(n79), .Y(n529) );
  INVX2 U719 ( .A(n529), .Y(n1109) );
  AOI22X1 U720 ( .A(o_waddr[1]), .B(n82), .C(N599), .D(n80), .Y(n531) );
  AOI22X1 U721 ( .A(N631), .B(n160), .C(wpt[1]), .D(n126), .Y(n530) );
  NAND2X1 U722 ( .A(n531), .B(n530), .Y(n1073) );
  INVX2 U723 ( .A(N40), .Y(n532) );
  NAND2X1 U724 ( .A(n532), .B(n196), .Y(n1331) );
  NAND2X1 U725 ( .A(N40), .B(n196), .Y(n1330) );
  MUX2X1 U726 ( .B(wpt[30]), .A(N727), .S(n78), .Y(n533) );
  INVX2 U727 ( .A(n533), .Y(n1080) );
  AOI22X1 U728 ( .A(o_waddr[30]), .B(n82), .C(N628), .D(n81), .Y(n535) );
  AOI22X1 U729 ( .A(N660), .B(n160), .C(wpt[30]), .D(n126), .Y(n534) );
  NAND2X1 U730 ( .A(n535), .B(n534), .Y(n986) );
  INVX2 U731 ( .A(N69), .Y(n536) );
  NAND2X1 U732 ( .A(n536), .B(n196), .Y(n1319) );
  NAND2X1 U733 ( .A(N69), .B(n196), .Y(n1318) );
  NAND2X1 U734 ( .A(n539), .B(n45), .Y(n538) );
  NOR2X1 U735 ( .A(i_img_width[7]), .B(n538), .Y(n537) );
  OAI21X1 U736 ( .A(n64), .B(n539), .C(n538), .Y(boundary_2[6]) );
  OAI21X1 U737 ( .A(n542), .B(n541), .C(n540), .Y(boundary_2[5]) );
  OAI21X1 U738 ( .A(n49), .B(n544), .C(n543), .Y(boundary_2[4]) );
  OAI21X1 U739 ( .A(n1006), .B(n545), .C(n46), .Y(boundary_2[3]) );
  MUX2X1 U740 ( .B(wpt[31]), .A(N728), .S(n79), .Y(n546) );
  INVX2 U741 ( .A(n546), .Y(n1079) );
  AOI22X1 U742 ( .A(o_waddr[31]), .B(n82), .C(N629), .D(n80), .Y(n548) );
  AOI22X1 U743 ( .A(N661), .B(n160), .C(wpt[31]), .D(n126), .Y(n547) );
  NAND2X1 U744 ( .A(n547), .B(n548), .Y(n983) );
  INVX2 U745 ( .A(N70), .Y(n549) );
  NAND2X1 U746 ( .A(n549), .B(n196), .Y(n1321) );
  NAND2X1 U747 ( .A(N70), .B(n197), .Y(n1320) );
  MUX2X1 U748 ( .B(wpt[0]), .A(N697), .S(n78), .Y(n550) );
  INVX2 U749 ( .A(n550), .Y(n1110) );
  AOI22X1 U750 ( .A(o_waddr[0]), .B(n82), .C(N598), .D(n81), .Y(n552) );
  AOI22X1 U751 ( .A(N630), .B(n160), .C(wpt[0]), .D(n126), .Y(n551) );
  NAND2X1 U752 ( .A(n552), .B(n551), .Y(n1076) );
  INVX2 U753 ( .A(N39), .Y(n553) );
  NAND2X1 U754 ( .A(n553), .B(n197), .Y(n1341) );
  NAND2X1 U755 ( .A(N39), .B(n197), .Y(n1340) );
  INVX2 U756 ( .A(rct2[2]), .Y(n990) );
  OAI21X1 U757 ( .A(n850), .B(n990), .C(n851), .Y(n1259) );
  INVX2 U758 ( .A(curr_read_state[2]), .Y(n1003) );
  NAND3X1 U759 ( .A(curr_read_state[3]), .B(n10), .C(n1003), .Y(n848) );
  NOR2X1 U760 ( .A(n695), .B(n848), .Y(n554) );
  NAND3X1 U761 ( .A(rct2[0]), .B(n990), .C(n554), .Y(n555) );
  MUX2X1 U762 ( .B(rcolpt[30]), .A(N279), .S(n84), .Y(n556) );
  INVX2 U763 ( .A(n556), .Y(n1132) );
  NAND2X1 U764 ( .A(n77), .B(n629), .Y(n598) );
  INVX2 U765 ( .A(n598), .Y(n559) );
  MUX2X1 U766 ( .B(n987), .A(n559), .S(rct3[0]), .Y(n558) );
  NAND2X1 U767 ( .A(n629), .B(n558), .Y(n1278) );
  OAI21X1 U768 ( .A(rct3[0]), .B(n559), .C(rct3[1]), .Y(n562) );
  INVX2 U769 ( .A(rct3[0]), .Y(n608) );
  INVX2 U770 ( .A(rct3[1]), .Y(n560) );
  NAND2X1 U771 ( .A(n608), .B(n560), .Y(n566) );
  INVX2 U772 ( .A(n566), .Y(n561) );
  NAND2X1 U773 ( .A(n561), .B(n987), .Y(n563) );
  NAND3X1 U774 ( .A(n562), .B(n629), .C(n563), .Y(n1277) );
  NAND2X1 U775 ( .A(n566), .B(n987), .Y(n565) );
  AND2X2 U776 ( .A(n563), .B(n598), .Y(n564) );
  MUX2X1 U779 ( .B(n565), .A(n564), .S(rct3[2]), .Y(n1276) );
  NAND2X1 U781 ( .A(rct3[2]), .B(n566), .Y(n569) );
  NAND2X1 U782 ( .A(n573), .B(n987), .Y(n568) );
  OAI21X1 U783 ( .A(n77), .B(n573), .C(n598), .Y(n567) );
  INVX2 U784 ( .A(n567), .Y(n571) );
  MUX2X1 U785 ( .B(n568), .A(n571), .S(rct3[3]), .Y(n1275) );
  NOR2X1 U786 ( .A(rct3[4]), .B(n569), .Y(n570) );
  MUX2X1 U787 ( .B(rct3[4]), .A(n570), .S(rct3[3]), .Y(n572) );
  INVX2 U788 ( .A(rct3[4]), .Y(n616) );
  OAI22X1 U789 ( .A(n77), .B(n572), .C(n571), .D(n616), .Y(n1274) );
  NAND2X1 U790 ( .A(n39), .B(n987), .Y(n575) );
  OAI21X1 U791 ( .A(n77), .B(n39), .C(n598), .Y(n577) );
  INVX2 U792 ( .A(n577), .Y(n574) );
  MUX2X1 U793 ( .B(n575), .A(n574), .S(rct3[5]), .Y(n1273) );
  NOR2X1 U794 ( .A(rct3[6]), .B(n28), .Y(n576) );
  MUX2X1 U795 ( .B(rct3[6]), .A(n576), .S(rct3[5]), .Y(n579) );
  NAND2X1 U796 ( .A(rct3[6]), .B(n577), .Y(n578) );
  OAI21X1 U797 ( .A(n77), .B(n579), .C(n578), .Y(n1272) );
  NAND2X1 U798 ( .A(n43), .B(n987), .Y(n581) );
  OAI21X1 U799 ( .A(n77), .B(n43), .C(n598), .Y(n583) );
  INVX2 U800 ( .A(n583), .Y(n580) );
  MUX2X1 U801 ( .B(n581), .A(n580), .S(rct3[7]), .Y(n1271) );
  NOR2X1 U802 ( .A(rct3[8]), .B(n42), .Y(n582) );
  MUX2X1 U803 ( .B(rct3[8]), .A(n582), .S(rct3[7]), .Y(n585) );
  NAND2X1 U804 ( .A(rct3[8]), .B(n583), .Y(n584) );
  OAI21X1 U805 ( .A(n77), .B(n585), .C(n584), .Y(n1270) );
  NAND3X1 U806 ( .A(rct3[8]), .B(rct3[7]), .C(n43), .Y(n588) );
  NAND2X1 U807 ( .A(n592), .B(n987), .Y(n587) );
  OAI21X1 U808 ( .A(n77), .B(n592), .C(n598), .Y(n586) );
  INVX2 U809 ( .A(n586), .Y(n590) );
  MUX2X1 U810 ( .B(n587), .A(n590), .S(rct3[9]), .Y(n1269) );
  NOR2X1 U811 ( .A(rct3[10]), .B(n588), .Y(n589) );
  MUX2X1 U812 ( .B(rct3[10]), .A(n589), .S(rct3[9]), .Y(n591) );
  INVX2 U813 ( .A(rct3[10]), .Y(n985) );
  OAI22X1 U814 ( .A(n77), .B(n591), .C(n985), .D(n590), .Y(n1268) );
  NAND2X1 U815 ( .A(n38), .B(n987), .Y(n594) );
  OAI21X1 U816 ( .A(n77), .B(n38), .C(n598), .Y(n593) );
  INVX2 U817 ( .A(n593), .Y(n596) );
  MUX2X1 U823 ( .B(n594), .A(n596), .S(rct3[11]), .Y(n1267) );
  NOR2X1 U824 ( .A(rct3[12]), .B(n37), .Y(n595) );
  MUX2X1 U826 ( .B(rct3[12]), .A(n595), .S(rct3[11]), .Y(n597) );
  INVX2 U827 ( .A(rct3[12]), .Y(n953) );
  OAI22X1 U828 ( .A(n77), .B(n597), .C(n596), .D(n953), .Y(n1266) );
  NAND2X1 U829 ( .A(n29), .B(n987), .Y(n600) );
  OAI21X1 U830 ( .A(n77), .B(n29), .C(n598), .Y(n599) );
  INVX2 U831 ( .A(n599), .Y(n601) );
  MUX2X1 U832 ( .B(n600), .A(n601), .S(rct3[13]), .Y(n1265) );
  NAND3X1 U833 ( .A(rct3[13]), .B(n29), .C(n987), .Y(n603) );
  OAI21X1 U834 ( .A(rct3[13]), .B(n77), .C(n601), .Y(n605) );
  MUX2X1 U835 ( .B(n603), .A(n602), .S(rct3[14]), .Y(n1264) );
  INVX2 U836 ( .A(n603), .Y(n604) );
  NAND2X1 U837 ( .A(rct3[14]), .B(n604), .Y(n607) );
  INVX2 U838 ( .A(rct3[14]), .Y(n615) );
  AOI21X1 U839 ( .A(n987), .B(n615), .C(n605), .Y(n606) );
  MUX2X1 U840 ( .B(n607), .A(n606), .S(rct3[15]), .Y(n1263) );
  INVX2 U841 ( .A(rrowpt[30]), .Y(n623) );
  INVX2 U842 ( .A(o_raddr[30]), .Y(n622) );
  NAND3X1 U843 ( .A(n836), .B(n842), .C(n1066), .Y(n611) );
  NOR2X1 U844 ( .A(n990), .B(n608), .Y(n609) );
  NAND3X1 U845 ( .A(n843), .B(rct3[1]), .C(n609), .Y(n610) );
  NOR2X1 U846 ( .A(n611), .B(n610), .Y(n620) );
  INVX2 U847 ( .A(rct3[7]), .Y(n613) );
  INVX2 U848 ( .A(rct3[2]), .Y(n612) );
  NAND3X1 U849 ( .A(n40), .B(n613), .C(n612), .Y(n618) );
  INVX2 U850 ( .A(n848), .Y(n988) );
  INVX2 U851 ( .A(rct3[15]), .Y(n614) );
  NAND3X1 U852 ( .A(n988), .B(n616), .C(n25), .Y(n617) );
  NOR2X1 U853 ( .A(n618), .B(n617), .Y(n619) );
  NAND2X1 U854 ( .A(n620), .B(n619), .Y(n621) );
  MUX2X1 U855 ( .B(n623), .A(n622), .S(n86), .Y(n1059) );
  MUX2X1 U856 ( .B(rcolpt[29]), .A(N278), .S(n84), .Y(n624) );
  INVX2 U857 ( .A(n624), .Y(n1133) );
  INVX2 U858 ( .A(rrowpt[29]), .Y(n626) );
  INVX2 U859 ( .A(o_raddr[29]), .Y(n625) );
  MUX2X1 U860 ( .B(n626), .A(n625), .S(n86), .Y(n1057) );
  AOI22X1 U861 ( .A(o_raddr[29]), .B(n161), .C(N211), .D(n88), .Y(n632) );
  NAND2X1 U862 ( .A(rcolpt[29]), .B(n90), .Y(n631) );
  AOI22X1 U863 ( .A(rrowpt[29]), .B(n93), .C(N243), .D(n91), .Y(n630) );
  INVX2 U864 ( .A(i_init_raddr[29]), .Y(n634) );
  NAND2X1 U865 ( .A(n634), .B(n197), .Y(n1165) );
  NAND2X1 U866 ( .A(i_init_raddr[29]), .B(n197), .Y(n1164) );
  MUX2X1 U867 ( .B(rcolpt[28]), .A(N277), .S(n84), .Y(n638) );
  INVX2 U868 ( .A(n638), .Y(n1134) );
  INVX2 U869 ( .A(rrowpt[28]), .Y(n640) );
  INVX2 U870 ( .A(o_raddr[28]), .Y(n639) );
  MUX2X1 U871 ( .B(n640), .A(n639), .S(n86), .Y(n1056) );
  AOI22X1 U872 ( .A(o_raddr[28]), .B(n161), .C(N210), .D(n88), .Y(n643) );
  NAND2X1 U873 ( .A(rcolpt[28]), .B(n90), .Y(n642) );
  AOI22X1 U874 ( .A(rrowpt[28]), .B(n93), .C(N242), .D(n91), .Y(n641) );
  NAND3X1 U875 ( .A(n643), .B(n642), .C(n641), .Y(n1172) );
  INVX2 U876 ( .A(i_init_raddr[28]), .Y(n644) );
  NAND2X1 U877 ( .A(n644), .B(n197), .Y(n1168) );
  NAND2X1 U878 ( .A(i_init_raddr[28]), .B(n197), .Y(n1167) );
  MUX2X1 U879 ( .B(rcolpt[27]), .A(N276), .S(n84), .Y(n645) );
  INVX2 U880 ( .A(n645), .Y(n1135) );
  INVX2 U881 ( .A(rrowpt[27]), .Y(n647) );
  INVX2 U882 ( .A(o_raddr[27]), .Y(n646) );
  MUX2X1 U883 ( .B(n647), .A(n646), .S(n86), .Y(n1054) );
  AOI22X1 U884 ( .A(o_raddr[27]), .B(n161), .C(N209), .D(n88), .Y(n650) );
  NAND2X1 U885 ( .A(rcolpt[27]), .B(n90), .Y(n649) );
  AOI22X1 U886 ( .A(rrowpt[27]), .B(n93), .C(N241), .D(n91), .Y(n648) );
  NAND3X1 U887 ( .A(n650), .B(n649), .C(n648), .Y(n1175) );
  INVX2 U888 ( .A(i_init_raddr[27]), .Y(n651) );
  NAND2X1 U889 ( .A(n651), .B(n197), .Y(n1171) );
  NAND2X1 U890 ( .A(i_init_raddr[27]), .B(n197), .Y(n1170) );
  MUX2X1 U891 ( .B(rcolpt[26]), .A(N275), .S(n84), .Y(n652) );
  INVX2 U892 ( .A(n652), .Y(n1136) );
  INVX2 U893 ( .A(rrowpt[26]), .Y(n655) );
  INVX2 U894 ( .A(o_raddr[26]), .Y(n653) );
  MUX2X1 U895 ( .B(n655), .A(n653), .S(n86), .Y(n1053) );
  AOI22X1 U896 ( .A(o_raddr[26]), .B(n161), .C(N208), .D(n88), .Y(n661) );
  NAND2X1 U897 ( .A(rcolpt[26]), .B(n90), .Y(n660) );
  AOI22X1 U898 ( .A(rrowpt[26]), .B(n93), .C(N240), .D(n91), .Y(n656) );
  NAND3X1 U899 ( .A(n661), .B(n660), .C(n656), .Y(n1178) );
  INVX2 U900 ( .A(i_init_raddr[26]), .Y(n662) );
  NAND2X1 U901 ( .A(n662), .B(n197), .Y(n1174) );
  NAND2X1 U902 ( .A(i_init_raddr[26]), .B(n199), .Y(n1173) );
  MUX2X1 U903 ( .B(rcolpt[25]), .A(N274), .S(n84), .Y(n663) );
  INVX2 U904 ( .A(n663), .Y(n1137) );
  INVX2 U905 ( .A(rrowpt[25]), .Y(n665) );
  INVX2 U906 ( .A(o_raddr[25]), .Y(n664) );
  MUX2X1 U907 ( .B(n665), .A(n664), .S(n86), .Y(n1051) );
  AOI22X1 U908 ( .A(o_raddr[25]), .B(n161), .C(N207), .D(n88), .Y(n668) );
  NAND2X1 U909 ( .A(rcolpt[25]), .B(n90), .Y(n667) );
  AOI22X1 U910 ( .A(rrowpt[25]), .B(n93), .C(N239), .D(n91), .Y(n666) );
  INVX2 U911 ( .A(i_init_raddr[25]), .Y(n669) );
  NAND2X1 U912 ( .A(n669), .B(n199), .Y(n1177) );
  NAND2X1 U913 ( .A(i_init_raddr[25]), .B(n199), .Y(n1176) );
  MUX2X1 U914 ( .B(rcolpt[24]), .A(N273), .S(n84), .Y(n670) );
  INVX2 U915 ( .A(n670), .Y(n1138) );
  INVX2 U916 ( .A(rrowpt[24]), .Y(n672) );
  INVX2 U917 ( .A(o_raddr[24]), .Y(n671) );
  MUX2X1 U918 ( .B(n672), .A(n671), .S(n86), .Y(n1050) );
  AOI22X1 U919 ( .A(o_raddr[24]), .B(n161), .C(N206), .D(n88), .Y(n675) );
  NAND2X1 U920 ( .A(rcolpt[24]), .B(n90), .Y(n674) );
  AOI22X1 U921 ( .A(rrowpt[24]), .B(n93), .C(N238), .D(n91), .Y(n673) );
  NAND3X1 U922 ( .A(n675), .B(n674), .C(n673), .Y(n1184) );
  INVX2 U923 ( .A(i_init_raddr[24]), .Y(n676) );
  NAND2X1 U924 ( .A(n676), .B(n199), .Y(n1180) );
  NAND2X1 U925 ( .A(i_init_raddr[24]), .B(n199), .Y(n1179) );
  MUX2X1 U926 ( .B(rcolpt[23]), .A(N272), .S(n84), .Y(n677) );
  INVX2 U927 ( .A(n677), .Y(n1139) );
  INVX2 U928 ( .A(rrowpt[23]), .Y(n679) );
  MUX2X1 U929 ( .B(n679), .A(n678), .S(n86), .Y(n1048) );
  AOI22X1 U930 ( .A(o_raddr[23]), .B(n161), .C(N205), .D(n88), .Y(n682) );
  NAND2X1 U931 ( .A(rcolpt[23]), .B(n90), .Y(n681) );
  AOI22X1 U932 ( .A(rrowpt[23]), .B(n93), .C(N237), .D(n91), .Y(n680) );
  NAND3X1 U933 ( .A(n682), .B(n681), .C(n680), .Y(n1187) );
  INVX2 U934 ( .A(i_init_raddr[23]), .Y(n683) );
  NAND2X1 U935 ( .A(n683), .B(n199), .Y(n1183) );
  NAND2X1 U936 ( .A(i_init_raddr[23]), .B(n199), .Y(n1182) );
  MUX2X1 U937 ( .B(rcolpt[22]), .A(N271), .S(n84), .Y(n684) );
  INVX2 U938 ( .A(n684), .Y(n1140) );
  INVX2 U939 ( .A(rrowpt[22]), .Y(n686) );
  INVX2 U940 ( .A(o_raddr[22]), .Y(n685) );
  MUX2X1 U941 ( .B(n686), .A(n685), .S(n86), .Y(n1047) );
  AOI22X1 U942 ( .A(o_raddr[22]), .B(n161), .C(N204), .D(n88), .Y(n689) );
  NAND2X1 U943 ( .A(rcolpt[22]), .B(n90), .Y(n688) );
  AOI22X1 U944 ( .A(rrowpt[22]), .B(n93), .C(N236), .D(n91), .Y(n687) );
  NAND3X1 U945 ( .A(n689), .B(n688), .C(n687), .Y(n1190) );
  INVX2 U946 ( .A(i_init_raddr[22]), .Y(n690) );
  NAND2X1 U947 ( .A(n690), .B(n199), .Y(n1186) );
  NAND2X1 U948 ( .A(i_init_raddr[22]), .B(n199), .Y(n1185) );
  MUX2X1 U949 ( .B(rcolpt[21]), .A(N270), .S(n84), .Y(n691) );
  INVX2 U950 ( .A(n691), .Y(n1141) );
  INVX2 U951 ( .A(rrowpt[21]), .Y(n693) );
  INVX2 U952 ( .A(o_raddr[21]), .Y(n692) );
  MUX2X1 U953 ( .B(n693), .A(n692), .S(n86), .Y(n1045) );
  AOI22X1 U954 ( .A(o_raddr[21]), .B(n161), .C(N203), .D(n88), .Y(n697) );
  NAND2X1 U955 ( .A(rcolpt[21]), .B(n90), .Y(n696) );
  AOI22X1 U956 ( .A(rrowpt[21]), .B(n93), .C(N235), .D(n91), .Y(n694) );
  INVX2 U957 ( .A(i_init_raddr[21]), .Y(n698) );
  NAND2X1 U958 ( .A(n698), .B(n199), .Y(n1189) );
  NAND2X1 U959 ( .A(i_init_raddr[21]), .B(n200), .Y(n1188) );
  MUX2X1 U960 ( .B(rcolpt[20]), .A(N269), .S(n84), .Y(n699) );
  INVX2 U961 ( .A(n699), .Y(n1142) );
  INVX2 U962 ( .A(rrowpt[20]), .Y(n701) );
  INVX2 U963 ( .A(o_raddr[20]), .Y(n700) );
  MUX2X1 U964 ( .B(n701), .A(n700), .S(n86), .Y(n1044) );
  AOI22X1 U965 ( .A(o_raddr[20]), .B(n161), .C(N202), .D(n88), .Y(n704) );
  NAND2X1 U966 ( .A(rcolpt[20]), .B(n90), .Y(n703) );
  AOI22X1 U967 ( .A(rrowpt[20]), .B(n93), .C(N234), .D(n91), .Y(n702) );
  NAND3X1 U968 ( .A(n704), .B(n703), .C(n702), .Y(n1196) );
  INVX2 U969 ( .A(i_init_raddr[20]), .Y(n705) );
  NAND2X1 U970 ( .A(n705), .B(n200), .Y(n1192) );
  NAND2X1 U971 ( .A(i_init_raddr[20]), .B(n200), .Y(n1191) );
  MUX2X1 U972 ( .B(rcolpt[19]), .A(N268), .S(n84), .Y(n706) );
  INVX2 U973 ( .A(n706), .Y(n1143) );
  INVX2 U974 ( .A(rrowpt[19]), .Y(n708) );
  MUX2X1 U975 ( .B(n708), .A(n707), .S(n86), .Y(n1042) );
  AOI22X1 U976 ( .A(o_raddr[19]), .B(n161), .C(N201), .D(n88), .Y(n711) );
  NAND2X1 U977 ( .A(rcolpt[19]), .B(n90), .Y(n710) );
  AOI22X1 U978 ( .A(rrowpt[19]), .B(n93), .C(N233), .D(n91), .Y(n709) );
  INVX2 U979 ( .A(i_init_raddr[19]), .Y(n712) );
  NAND2X1 U980 ( .A(n712), .B(n200), .Y(n1195) );
  NAND2X1 U981 ( .A(i_init_raddr[19]), .B(n200), .Y(n1194) );
  MUX2X1 U982 ( .B(rcolpt[18]), .A(N267), .S(n84), .Y(n713) );
  INVX2 U983 ( .A(n713), .Y(n1144) );
  INVX2 U984 ( .A(rrowpt[18]), .Y(n715) );
  MUX2X1 U985 ( .B(n715), .A(n714), .S(n86), .Y(n1041) );
  AOI22X1 U986 ( .A(o_raddr[18]), .B(n161), .C(N200), .D(n88), .Y(n718) );
  NAND2X1 U987 ( .A(rcolpt[18]), .B(n90), .Y(n717) );
  AOI22X1 U988 ( .A(rrowpt[18]), .B(n93), .C(N232), .D(n91), .Y(n716) );
  INVX2 U989 ( .A(i_init_raddr[18]), .Y(n719) );
  NAND2X1 U990 ( .A(n719), .B(n200), .Y(n1198) );
  NAND2X1 U991 ( .A(i_init_raddr[18]), .B(n200), .Y(n1197) );
  MUX2X1 U992 ( .B(rcolpt[17]), .A(N266), .S(n85), .Y(n720) );
  INVX2 U993 ( .A(n720), .Y(n1145) );
  INVX2 U994 ( .A(rrowpt[17]), .Y(n722) );
  MUX2X1 U995 ( .B(n722), .A(n721), .S(n87), .Y(n1039) );
  AOI22X1 U996 ( .A(o_raddr[17]), .B(n161), .C(N199), .D(n88), .Y(n725) );
  NAND2X1 U997 ( .A(rcolpt[17]), .B(n90), .Y(n724) );
  AOI22X1 U998 ( .A(rrowpt[17]), .B(n93), .C(N231), .D(n91), .Y(n723) );
  NAND3X1 U999 ( .A(n725), .B(n724), .C(n723), .Y(n1205) );
  INVX2 U1000 ( .A(i_init_raddr[17]), .Y(n726) );
  NAND2X1 U1001 ( .A(n726), .B(n200), .Y(n1201) );
  NAND2X1 U1002 ( .A(i_init_raddr[17]), .B(n200), .Y(n1200) );
  MUX2X1 U1003 ( .B(rcolpt[16]), .A(N265), .S(n85), .Y(n727) );
  INVX2 U1004 ( .A(n727), .Y(n1146) );
  INVX2 U1005 ( .A(rrowpt[16]), .Y(n729) );
  INVX2 U1006 ( .A(o_raddr[16]), .Y(n728) );
  MUX2X1 U1007 ( .B(n729), .A(n728), .S(n87), .Y(n1038) );
  AOI22X1 U1008 ( .A(o_raddr[16]), .B(n161), .C(N198), .D(n89), .Y(n732) );
  NAND2X1 U1009 ( .A(rcolpt[16]), .B(n90), .Y(n731) );
  AOI22X1 U1010 ( .A(rrowpt[16]), .B(n93), .C(N230), .D(n92), .Y(n730) );
  NAND3X1 U1011 ( .A(n732), .B(n731), .C(n730), .Y(n1208) );
  INVX2 U1012 ( .A(i_init_raddr[16]), .Y(n733) );
  NAND2X1 U1013 ( .A(n733), .B(n200), .Y(n1204) );
  NAND2X1 U1014 ( .A(i_init_raddr[16]), .B(n202), .Y(n1203) );
  MUX2X1 U1015 ( .B(rcolpt[15]), .A(N264), .S(n85), .Y(n734) );
  INVX2 U1016 ( .A(n734), .Y(n1147) );
  INVX2 U1017 ( .A(rrowpt[15]), .Y(n736) );
  INVX2 U1018 ( .A(o_raddr[15]), .Y(n735) );
  MUX2X1 U1019 ( .B(n736), .A(n735), .S(n87), .Y(n1036) );
  AOI22X1 U1020 ( .A(o_raddr[15]), .B(n163), .C(N197), .D(n89), .Y(n739) );
  NAND2X1 U1021 ( .A(rcolpt[15]), .B(n90), .Y(n738) );
  AOI22X1 U1022 ( .A(rrowpt[15]), .B(n125), .C(N229), .D(n92), .Y(n737) );
  NAND3X1 U1023 ( .A(n739), .B(n738), .C(n737), .Y(n1211) );
  INVX2 U1024 ( .A(i_init_raddr[15]), .Y(n740) );
  NAND2X1 U1025 ( .A(n740), .B(n202), .Y(n1207) );
  NAND2X1 U1026 ( .A(i_init_raddr[15]), .B(n202), .Y(n1206) );
  MUX2X1 U1027 ( .B(rcolpt[14]), .A(N263), .S(n85), .Y(n741) );
  INVX2 U1028 ( .A(n741), .Y(n1148) );
  INVX2 U1029 ( .A(rrowpt[14]), .Y(n743) );
  INVX2 U1030 ( .A(o_raddr[14]), .Y(n742) );
  MUX2X1 U1031 ( .B(n743), .A(n742), .S(n87), .Y(n1035) );
  AOI22X1 U1032 ( .A(o_raddr[14]), .B(n163), .C(N196), .D(n89), .Y(n746) );
  NAND2X1 U1033 ( .A(rcolpt[14]), .B(n90), .Y(n745) );
  AOI22X1 U1034 ( .A(rrowpt[14]), .B(n125), .C(N228), .D(n92), .Y(n744) );
  NAND3X1 U1035 ( .A(n746), .B(n745), .C(n744), .Y(n1214) );
  INVX2 U1036 ( .A(i_init_raddr[14]), .Y(n747) );
  NAND2X1 U1037 ( .A(n747), .B(n202), .Y(n1210) );
  NAND2X1 U1038 ( .A(i_init_raddr[14]), .B(n202), .Y(n1209) );
  MUX2X1 U1039 ( .B(rcolpt[13]), .A(N262), .S(n85), .Y(n748) );
  INVX2 U1040 ( .A(n748), .Y(n1149) );
  INVX2 U1041 ( .A(rrowpt[13]), .Y(n750) );
  INVX2 U1042 ( .A(o_raddr[13]), .Y(n749) );
  MUX2X1 U1043 ( .B(n750), .A(n749), .S(n87), .Y(n1033) );
  AOI22X1 U1044 ( .A(o_raddr[13]), .B(n161), .C(N195), .D(n89), .Y(n753) );
  NAND2X1 U1045 ( .A(rcolpt[13]), .B(n90), .Y(n752) );
  AOI22X1 U1046 ( .A(rrowpt[13]), .B(n125), .C(N227), .D(n92), .Y(n751) );
  NAND3X1 U1047 ( .A(n753), .B(n752), .C(n751), .Y(n1217) );
  INVX2 U1048 ( .A(i_init_raddr[13]), .Y(n754) );
  NAND2X1 U1049 ( .A(n754), .B(n202), .Y(n1213) );
  NAND2X1 U1050 ( .A(i_init_raddr[13]), .B(n202), .Y(n1212) );
  MUX2X1 U1051 ( .B(rcolpt[12]), .A(N261), .S(n85), .Y(n755) );
  INVX2 U1052 ( .A(n755), .Y(n1150) );
  INVX2 U1053 ( .A(rrowpt[12]), .Y(n757) );
  INVX2 U1054 ( .A(o_raddr[12]), .Y(n756) );
  MUX2X1 U1055 ( .B(n757), .A(n756), .S(n87), .Y(n1032) );
  AOI22X1 U1056 ( .A(o_raddr[12]), .B(n161), .C(N194), .D(n89), .Y(n760) );
  NAND2X1 U1057 ( .A(rcolpt[12]), .B(n90), .Y(n759) );
  AOI22X1 U1058 ( .A(rrowpt[12]), .B(n93), .C(N226), .D(n92), .Y(n758) );
  NAND3X1 U1059 ( .A(n760), .B(n759), .C(n758), .Y(n1220) );
  INVX2 U1060 ( .A(i_init_raddr[12]), .Y(n761) );
  NAND2X1 U1061 ( .A(n761), .B(n202), .Y(n1216) );
  NAND2X1 U1062 ( .A(i_init_raddr[12]), .B(n202), .Y(n1215) );
  MUX2X1 U1063 ( .B(rcolpt[11]), .A(N260), .S(n85), .Y(n762) );
  INVX2 U1064 ( .A(n762), .Y(n1151) );
  INVX2 U1065 ( .A(rrowpt[11]), .Y(n764) );
  INVX2 U1066 ( .A(o_raddr[11]), .Y(n763) );
  MUX2X1 U1067 ( .B(n764), .A(n763), .S(n87), .Y(n1030) );
  AOI22X1 U1068 ( .A(o_raddr[11]), .B(n163), .C(N193), .D(n89), .Y(n767) );
  NAND2X1 U1069 ( .A(rcolpt[11]), .B(n90), .Y(n766) );
  AOI22X1 U1070 ( .A(rrowpt[11]), .B(n125), .C(N225), .D(n92), .Y(n765) );
  INVX2 U1071 ( .A(i_init_raddr[11]), .Y(n768) );
  NAND2X1 U1072 ( .A(n768), .B(n202), .Y(n1219) );
  NAND2X1 U1073 ( .A(i_init_raddr[11]), .B(n203), .Y(n1218) );
  MUX2X1 U1074 ( .B(rcolpt[10]), .A(N259), .S(n85), .Y(n769) );
  INVX2 U1075 ( .A(n769), .Y(n1152) );
  INVX2 U1076 ( .A(rrowpt[10]), .Y(n771) );
  INVX2 U1077 ( .A(o_raddr[10]), .Y(n770) );
  MUX2X1 U1078 ( .B(n771), .A(n770), .S(n87), .Y(n1029) );
  AOI22X1 U1079 ( .A(o_raddr[10]), .B(n163), .C(N192), .D(n89), .Y(n774) );
  NAND2X1 U1080 ( .A(rcolpt[10]), .B(n90), .Y(n773) );
  AOI22X1 U1081 ( .A(rrowpt[10]), .B(n125), .C(N224), .D(n92), .Y(n772) );
  NAND3X1 U1082 ( .A(n774), .B(n773), .C(n772), .Y(n1226) );
  INVX2 U1083 ( .A(i_init_raddr[10]), .Y(n775) );
  NAND2X1 U1084 ( .A(n775), .B(n203), .Y(n1222) );
  NAND2X1 U1085 ( .A(i_init_raddr[10]), .B(n203), .Y(n1221) );
  MUX2X1 U1086 ( .B(rcolpt[9]), .A(N258), .S(n85), .Y(n776) );
  INVX2 U1087 ( .A(n776), .Y(n1153) );
  INVX2 U1088 ( .A(rrowpt[9]), .Y(n778) );
  INVX2 U1089 ( .A(n1343), .Y(n777) );
  MUX2X1 U1090 ( .B(n778), .A(n777), .S(n87), .Y(n1027) );
  AOI22X1 U1091 ( .A(o_raddr[9]), .B(n161), .C(N191), .D(n89), .Y(n781) );
  NAND2X1 U1092 ( .A(rcolpt[9]), .B(n90), .Y(n780) );
  AOI22X1 U1093 ( .A(rrowpt[9]), .B(n93), .C(N223), .D(n92), .Y(n779) );
  INVX2 U1094 ( .A(i_init_raddr[9]), .Y(n782) );
  NAND2X1 U1095 ( .A(n782), .B(n203), .Y(n1225) );
  NAND2X1 U1096 ( .A(i_init_raddr[9]), .B(n203), .Y(n1224) );
  MUX2X1 U1097 ( .B(rcolpt[8]), .A(N257), .S(n85), .Y(n783) );
  INVX2 U1102 ( .A(n783), .Y(n1154) );
  INVX2 U1103 ( .A(rrowpt[8]), .Y(n785) );
  INVX2 U1104 ( .A(n1344), .Y(n784) );
  MUX2X1 U1105 ( .B(n785), .A(n784), .S(n87), .Y(n1026) );
  AOI22X1 U1106 ( .A(o_raddr[8]), .B(n163), .C(N190), .D(n89), .Y(n788) );
  NAND2X1 U1109 ( .A(rcolpt[8]), .B(n90), .Y(n787) );
  AOI22X1 U1113 ( .A(rrowpt[8]), .B(n125), .C(N222), .D(n92), .Y(n786) );
  NAND3X1 U1115 ( .A(n788), .B(n787), .C(n786), .Y(n1232) );
  INVX2 U1116 ( .A(i_init_raddr[8]), .Y(n789) );
  NAND2X1 U1118 ( .A(n789), .B(n203), .Y(n1228) );
  NAND2X1 U1123 ( .A(i_init_raddr[8]), .B(n203), .Y(n1227) );
  MUX2X1 U1126 ( .B(rcolpt[7]), .A(N256), .S(n85), .Y(n790) );
  INVX2 U1128 ( .A(n790), .Y(n1155) );
  INVX2 U1130 ( .A(rrowpt[7]), .Y(n792) );
  MUX2X1 U1131 ( .B(n792), .A(n791), .S(n87), .Y(n1024) );
  AOI22X1 U1132 ( .A(o_raddr[7]), .B(n163), .C(N189), .D(n89), .Y(n795) );
  NAND2X1 U1133 ( .A(rcolpt[7]), .B(n90), .Y(n794) );
  AOI22X1 U1134 ( .A(rrowpt[7]), .B(n125), .C(N221), .D(n92), .Y(n793) );
  NAND3X1 U1135 ( .A(n795), .B(n794), .C(n793), .Y(n1235) );
  INVX2 U1136 ( .A(i_init_raddr[7]), .Y(n796) );
  NAND2X1 U1137 ( .A(n796), .B(n203), .Y(n1231) );
  NAND2X1 U1138 ( .A(i_init_raddr[7]), .B(n203), .Y(n1230) );
  MUX2X1 U1139 ( .B(rcolpt[6]), .A(N255), .S(n85), .Y(n797) );
  INVX2 U1140 ( .A(n797), .Y(n1156) );
  INVX2 U1141 ( .A(rrowpt[6]), .Y(n799) );
  MUX2X1 U1142 ( .B(n799), .A(n798), .S(n87), .Y(n1023) );
  AOI22X1 U1143 ( .A(o_raddr[6]), .B(n163), .C(N188), .D(n89), .Y(n803) );
  NAND2X1 U1144 ( .A(rcolpt[6]), .B(n90), .Y(n802) );
  AOI22X1 U1145 ( .A(rrowpt[6]), .B(n125), .C(N220), .D(n92), .Y(n801) );
  NAND3X1 U1146 ( .A(n803), .B(n802), .C(n801), .Y(n1238) );
  INVX2 U1147 ( .A(i_init_raddr[6]), .Y(n804) );
  NAND2X1 U1148 ( .A(n804), .B(n203), .Y(n1234) );
  NAND2X1 U1149 ( .A(i_init_raddr[6]), .B(n205), .Y(n1233) );
  MUX2X1 U1150 ( .B(rcolpt[5]), .A(N254), .S(n85), .Y(n805) );
  INVX2 U1151 ( .A(n805), .Y(n1157) );
  INVX2 U1152 ( .A(rrowpt[5]), .Y(n807) );
  MUX2X1 U1153 ( .B(n807), .A(n806), .S(n87), .Y(n1021) );
  AOI22X1 U1154 ( .A(o_raddr[5]), .B(n161), .C(N187), .D(n89), .Y(n810) );
  NAND2X1 U1155 ( .A(rcolpt[5]), .B(n90), .Y(n809) );
  AOI22X1 U1156 ( .A(rrowpt[5]), .B(n125), .C(N219), .D(n92), .Y(n808) );
  NAND3X1 U1157 ( .A(n810), .B(n809), .C(n808), .Y(n1241) );
  INVX2 U1158 ( .A(i_init_raddr[5]), .Y(n811) );
  NAND2X1 U1159 ( .A(n811), .B(n205), .Y(n1237) );
  NAND2X1 U1160 ( .A(i_init_raddr[5]), .B(n205), .Y(n1236) );
  MUX2X1 U1161 ( .B(rcolpt[4]), .A(N253), .S(n85), .Y(n812) );
  INVX2 U1162 ( .A(n812), .Y(n1158) );
  INVX2 U1163 ( .A(rrowpt[4]), .Y(n814) );
  INVX2 U1164 ( .A(o_raddr[4]), .Y(n813) );
  MUX2X1 U1165 ( .B(n814), .A(n813), .S(n86), .Y(n1020) );
  AOI22X1 U1166 ( .A(o_raddr[4]), .B(n161), .C(N186), .D(n89), .Y(n817) );
  NAND2X1 U1169 ( .A(rcolpt[4]), .B(n90), .Y(n816) );
  AOI22X1 U1170 ( .A(rrowpt[4]), .B(n125), .C(N218), .D(n92), .Y(n815) );
  NAND3X1 U1175 ( .A(n817), .B(n816), .C(n815), .Y(n1244) );
  INVX2 U1179 ( .A(i_init_raddr[4]), .Y(n818) );
  NAND2X1 U1180 ( .A(n818), .B(n205), .Y(n1240) );
  NAND2X1 U1181 ( .A(i_init_raddr[4]), .B(n205), .Y(n1239) );
  MUX2X1 U1182 ( .B(rcolpt[3]), .A(N252), .S(n84), .Y(n819) );
  INVX2 U1183 ( .A(n819), .Y(n1159) );
  INVX2 U1184 ( .A(rrowpt[3]), .Y(n821) );
  MUX2X1 U1185 ( .B(n821), .A(n820), .S(n86), .Y(n1018) );
  AOI22X1 U1186 ( .A(o_raddr[3]), .B(n163), .C(N185), .D(n89), .Y(n824) );
  NAND2X1 U1187 ( .A(rcolpt[3]), .B(n90), .Y(n823) );
  AOI22X1 U1188 ( .A(rrowpt[3]), .B(n125), .C(N217), .D(n92), .Y(n822) );
  NAND3X1 U1189 ( .A(n824), .B(n823), .C(n822), .Y(n1247) );
  INVX2 U1190 ( .A(i_init_raddr[3]), .Y(n825) );
  NAND2X1 U1193 ( .A(n825), .B(n205), .Y(n1243) );
  NAND2X1 U1194 ( .A(i_init_raddr[3]), .B(n205), .Y(n1242) );
  MUX2X1 U1197 ( .B(rcolpt[2]), .A(N251), .S(n84), .Y(n826) );
  INVX2 U1201 ( .A(n826), .Y(n1160) );
  INVX2 U1203 ( .A(rrowpt[2]), .Y(n827) );
  MUX2X1 U1205 ( .B(n827), .A(n35), .S(n87), .Y(n1017) );
  AOI22X1 U1206 ( .A(o_raddr[2]), .B(n163), .C(N184), .D(n89), .Y(n830) );
  NAND2X1 U1207 ( .A(rcolpt[2]), .B(n90), .Y(n829) );
  AOI22X1 U1208 ( .A(rrowpt[2]), .B(n125), .C(N216), .D(n92), .Y(n828) );
  NAND3X1 U1209 ( .A(n830), .B(n829), .C(n828), .Y(n1250) );
  INVX2 U1210 ( .A(i_init_raddr[2]), .Y(n831) );
  NAND2X1 U1211 ( .A(n831), .B(n205), .Y(n1246) );
  NAND2X1 U1212 ( .A(i_init_raddr[2]), .B(n205), .Y(n1245) );
  MUX2X1 U1213 ( .B(rcolpt[1]), .A(N250), .S(n85), .Y(n832) );
  INVX2 U1219 ( .A(n832), .Y(n1161) );
  INVX2 U1220 ( .A(rrowpt[1]), .Y(n833) );
  MUX2X1 U1221 ( .B(n833), .A(n47), .S(n86), .Y(n1015) );
  AOI22X1 U1222 ( .A(o_raddr[1]), .B(n163), .C(N183), .D(n88), .Y(n837) );
  NAND2X1 U1223 ( .A(rcolpt[1]), .B(n90), .Y(n835) );
  AOI22X1 U1224 ( .A(rrowpt[1]), .B(n125), .C(N215), .D(n91), .Y(n834) );
  NAND3X1 U1225 ( .A(n837), .B(n835), .C(n834), .Y(n1253) );
  INVX2 U1226 ( .A(i_init_raddr[1]), .Y(n838) );
  NAND2X1 U1227 ( .A(n838), .B(n205), .Y(n1249) );
  NAND2X1 U1228 ( .A(i_init_raddr[1]), .B(n206), .Y(n1248) );
  AOI22X1 U1230 ( .A(o_raddr[30]), .B(n163), .C(N212), .D(n88), .Y(n841) );
  NAND2X1 U1231 ( .A(rcolpt[30]), .B(n90), .Y(n840) );
  AOI22X1 U1232 ( .A(rrowpt[30]), .B(n125), .C(N244), .D(n91), .Y(n839) );
  NAND3X1 U1233 ( .A(n841), .B(n840), .C(n839), .Y(n1166) );
  INVX2 U1234 ( .A(i_init_raddr[30]), .Y(n846) );
  NAND2X1 U1235 ( .A(n846), .B(n206), .Y(n1078) );
  NAND2X1 U1236 ( .A(i_init_raddr[30]), .B(n206), .Y(n1077) );
  MUX2X1 U1237 ( .B(rcolpt[31]), .A(N280), .S(n85), .Y(n847) );
  INVX2 U1238 ( .A(n847), .Y(n1131) );
  INVX2 U1239 ( .A(rrowpt[31]), .Y(n858) );
  INVX2 U1240 ( .A(o_raddr[31]), .Y(n854) );
  MUX2X1 U1241 ( .B(n858), .A(n854), .S(n87), .Y(n1060) );
  AOI22X1 U1244 ( .A(o_raddr[31]), .B(n163), .C(N213), .D(n88), .Y(n870) );
  NAND2X1 U1245 ( .A(rcolpt[31]), .B(n90), .Y(n868) );
  AOI22X1 U1246 ( .A(rrowpt[31]), .B(n125), .C(N245), .D(n91), .Y(n863) );
  NAND3X1 U1247 ( .A(n868), .B(n863), .C(n870), .Y(n1163) );
  INVX2 U1248 ( .A(i_init_raddr[31]), .Y(n871) );
  NAND2X1 U1249 ( .A(n871), .B(n206), .Y(n1075) );
  NAND2X1 U1250 ( .A(i_init_raddr[31]), .B(n206), .Y(n1074) );
  MUX2X1 U1251 ( .B(rcolpt[0]), .A(N249), .S(n84), .Y(n872) );
  INVX2 U1252 ( .A(n872), .Y(n1162) );
  INVX2 U1253 ( .A(rrowpt[0]), .Y(n874) );
  MUX2X1 U1254 ( .B(n874), .A(n873), .S(n87), .Y(n1014) );
  AOI22X1 U1255 ( .A(o_raddr[0]), .B(n163), .C(N182), .D(n89), .Y(n877) );
  NAND2X1 U1257 ( .A(rcolpt[0]), .B(n90), .Y(n876) );
  AOI22X1 U1258 ( .A(rrowpt[0]), .B(n125), .C(N214), .D(n92), .Y(n875) );
  NAND3X1 U1259 ( .A(n877), .B(n876), .C(n875), .Y(n1256) );
  INVX2 U1260 ( .A(i_init_raddr[0]), .Y(n878) );
  NAND2X1 U1261 ( .A(n878), .B(n206), .Y(n1252) );
  NAND2X1 U1262 ( .A(i_init_raddr[0]), .B(n206), .Y(n1251) );
  INVX2 U1263 ( .A(o_waddr[29]), .Y(n879) );
  XOR2X1 U1264 ( .A(n879), .B(i_img_size[29]), .Y(n981) );
  INVX2 U1265 ( .A(o_waddr[28]), .Y(n880) );
  XOR2X1 U1267 ( .A(n880), .B(i_img_size[28]), .Y(n982) );
  XNOR2X1 U1268 ( .A(o_waddr[25]), .B(i_img_size[25]), .Y(n882) );
  XNOR2X1 U1269 ( .A(o_waddr[24]), .B(i_img_size[24]), .Y(n881) );
  NAND2X1 U1271 ( .A(n882), .B(n881), .Y(n978) );
  XNOR2X1 U1272 ( .A(o_waddr[20]), .B(i_img_size[20]), .Y(n884) );
  XNOR2X1 U1273 ( .A(o_waddr[21]), .B(i_img_size[21]), .Y(n883) );
  NAND3X1 U1274 ( .A(n884), .B(n883), .C(n996), .Y(n970) );
  XNOR2X1 U1275 ( .A(o_waddr[17]), .B(i_img_size[17]), .Y(n886) );
  XNOR2X1 U1276 ( .A(o_waddr[16]), .B(i_img_size[16]), .Y(n885) );
  NAND2X1 U1277 ( .A(n886), .B(n885), .Y(n971) );
  XOR2X1 U1278 ( .A(i_img_size[0]), .B(o_waddr[0]), .Y(n888) );
  XOR2X1 U1279 ( .A(i_img_size[1]), .B(o_waddr[1]), .Y(n887) );
  NOR2X1 U1280 ( .A(n888), .B(n887), .Y(n906) );
  XNOR2X1 U1281 ( .A(o_waddr[5]), .B(i_img_size[5]), .Y(n890) );
  XNOR2X1 U1282 ( .A(o_waddr[4]), .B(i_img_size[4]), .Y(n889) );
  NAND3X1 U1283 ( .A(n906), .B(n890), .C(n889), .Y(n958) );
  XOR2X1 U1284 ( .A(i_img_size[8]), .B(o_waddr[8]), .Y(n908) );
  XOR2X1 U1285 ( .A(i_img_size[9]), .B(o_waddr[9]), .Y(n907) );
  NOR2X1 U1286 ( .A(n908), .B(n907), .Y(n911) );
  XNOR2X1 U1287 ( .A(o_waddr[13]), .B(i_img_size[13]), .Y(n910) );
  XNOR2X1 U1288 ( .A(o_waddr[12]), .B(i_img_size[12]), .Y(n909) );
  NAND3X1 U1289 ( .A(n911), .B(n910), .C(n909), .Y(n959) );
  XOR2X1 U1290 ( .A(i_img_size[3]), .B(o_waddr[3]), .Y(n913) );
  XOR2X1 U1291 ( .A(i_img_size[2]), .B(o_waddr[2]), .Y(n912) );
  NOR2X1 U1292 ( .A(n913), .B(n912), .Y(n922) );
  XNOR2X1 U1293 ( .A(o_waddr[6]), .B(i_img_size[6]), .Y(n915) );
  XNOR2X1 U1294 ( .A(o_waddr[7]), .B(i_img_size[7]), .Y(n914) );
  NAND3X1 U1295 ( .A(n922), .B(n915), .C(n914), .Y(n943) );
  XOR2X1 U1296 ( .A(i_img_size[11]), .B(o_waddr[11]), .Y(n926) );
  XOR2X1 U1297 ( .A(i_img_size[10]), .B(o_waddr[10]), .Y(n923) );
  NOR2X1 U1298 ( .A(n926), .B(n923), .Y(n940) );
  XNOR2X1 U1299 ( .A(o_waddr[14]), .B(i_img_size[14]), .Y(n939) );
  XNOR2X1 U1300 ( .A(o_waddr[15]), .B(i_img_size[15]), .Y(n938) );
  NAND3X1 U1301 ( .A(n940), .B(n939), .C(n938), .Y(n944) );
  XOR2X1 U1302 ( .A(i_img_size[31]), .B(o_waddr[31]), .Y(n936) );
  XOR2X1 U1303 ( .A(i_img_size[30]), .B(o_waddr[30]), .Y(n937) );
  INVX2 U1304 ( .A(o_waddr[26]), .Y(n941) );
  XOR2X1 U1305 ( .A(n941), .B(i_img_size[26]), .Y(n933) );
  INVX2 U1306 ( .A(o_waddr[27]), .Y(n942) );
  XOR2X1 U1307 ( .A(n942), .B(i_img_size[27]), .Y(n934) );
  XOR2X1 U1308 ( .A(i_img_size[19]), .B(o_waddr[19]), .Y(n946) );
  XOR2X1 U1309 ( .A(i_img_size[18]), .B(o_waddr[18]), .Y(n945) );
  NOR2X1 U1310 ( .A(n946), .B(n945), .Y(n949) );
  XNOR2X1 U1311 ( .A(o_waddr[22]), .B(i_img_size[22]), .Y(n948) );
  XNOR2X1 U1312 ( .A(o_waddr[23]), .B(i_img_size[23]), .Y(n947) );
  NAND3X1 U1313 ( .A(n949), .B(n948), .C(n947), .Y(n931) );
  XOR2X1 U1314 ( .A(n950), .B(rct3[4]), .Y(n921) );
  INVX2 U1315 ( .A(rct3[9]), .Y(n951) );
  NAND2X1 U1316 ( .A(n951), .B(n25), .Y(n919) );
  INVX2 U1317 ( .A(rct3[13]), .Y(n952) );
  NAND2X1 U1318 ( .A(n953), .B(n952), .Y(n920) );
  XOR2X1 U1319 ( .A(rct3[1]), .B(n72), .Y(n965) );
  XNOR2X1 U1320 ( .A(rct3[8]), .B(n954), .Y(n961) );
  XOR2X1 U1321 ( .A(rct3[0]), .B(n67), .Y(n960) );
  NOR2X1 U1322 ( .A(n961), .B(n960), .Y(n964) );
  XNOR2X1 U1323 ( .A(rct3[5]), .B(n962), .Y(n963) );
  NAND3X1 U1324 ( .A(n965), .B(n964), .C(n963), .Y(n904) );
  XOR2X1 U1325 ( .A(rct3[2]), .B(n55), .Y(n974) );
  XOR2X1 U1326 ( .A(rct3[7]), .B(n58), .Y(n968) );
  XOR2X1 U1327 ( .A(n966), .B(rct3[6]), .Y(n967) );
  NOR2X1 U1328 ( .A(n968), .B(n967), .Y(n973) );
  XNOR2X1 U1329 ( .A(rct3[3]), .B(n969), .Y(n972) );
  NAND3X1 U1330 ( .A(n974), .B(n973), .C(n972), .Y(n905) );
  INVX2 U1331 ( .A(rct2[0]), .Y(n1063) );
  INVX2 U1332 ( .A(rct3[11]), .Y(n976) );
  INVX2 U1333 ( .A(n920), .Y(n975) );
  NAND2X1 U1334 ( .A(n976), .B(n975), .Y(n844) );
  INVX2 U1335 ( .A(n979), .Y(n654) );
  INVX2 U1336 ( .A(n980), .Y(n501) );
  INVX2 U1337 ( .A(n984), .Y(n494) );
  INVX2 U1338 ( .A(n862), .Y(n1008) );
  INVX2 U1339 ( .A(n853), .Y(n1009) );
  INVX2 U1340 ( .A(n855), .Y(n1011) );
  INVX2 U1341 ( .A(n864), .Y(n1012) );
  INVX2 U1342 ( .A(n895), .Y(n1062) );
  INVX2 U1343 ( .A(rct2[1]), .Y(n1065) );
  INVX2 U1344 ( .A(n695), .Y(n1066) );
  INVX2 U1345 ( .A(rct1[0]), .Y(n1068) );
  INVX2 U1346 ( .A(n894), .Y(n1069) );
  INVX2 U1347 ( .A(rct1[1]), .Y(n1071) );
  INVX2 U1348 ( .A(rct1[2]), .Y(n1072) );
  NOR2X1 U1349 ( .A(n897), .B(n898), .Y(n896) );
  NOR2X1 U1350 ( .A(n866), .B(n867), .Y(n865) );
  OAI21X1 U1351 ( .A(n893), .B(n557), .C(n163), .Y(n1279) );
  NAND2X1 U1352 ( .A(n999), .B(n857), .Y(n1260) );
  NAND2X1 U1353 ( .A(n999), .B(n855), .Y(n856) );
endmodule


module AHB_wrapper ( clk, n_rst, done, s_haddr, m_haddr, s_hrdata, m_hrdata, 
        m_hwdata, s_hwdata, s_hwrite, m_hwrite, s_hready, m_hready, re, we, 
        buffer2_data, greyscale_data, read_complete, write_complete );
  input [31:0] s_haddr;
  output [31:0] m_haddr;
  output [31:0] s_hrdata;
  input [31:0] m_hrdata;
  output [31:0] m_hwdata;
  input [31:0] s_hwdata;
  input [31:0] buffer2_data;
  output [31:0] greyscale_data;
  input clk, n_rst, s_hwrite, m_hready, re, we;
  output done, m_hwrite, s_hready, read_complete, write_complete;
  wire   raddr_ready, waddr_ready, inc_raddr, inc_waddr, n1;
  wire   [31:0] waddr;
  wire   [31:0] raddr;
  wire   [31:0] start_raddr;
  wire   [15:0] img_width;
  wire   [31:0] boundary_4;
  wire   [15:0] img_height;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13;

  AHB I ( .clk(clk), .n_rst(n_rst), .hready(m_hready), .re(re), .we(we), 
        .stop(n1), .raddr_ready(raddr_ready), .waddr_ready(waddr_ready), 
        .waddr(waddr), .raddr(raddr), .buffer2_data(buffer2_data), .hrdata(
        m_hrdata), .greyscale_data(greyscale_data), .haddr(m_haddr), .hwdata(
        m_hwdata), .hwrite(m_hwrite), .read_complete(read_complete), 
        .write_complete(write_complete), .inc_raddr(inc_raddr), .inc_waddr(
        inc_waddr) );
  AHB_slave II ( .clk(clk), .n_rst(n_rst), .done(done), .haddr(s_haddr), 
        .hwrite(s_hwrite), .hwdata(s_hwdata), .hrdata(s_hrdata), .hready(
        s_hready), .start_raddr(start_raddr), .img_width({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, img_width[8:0]}), .img_height({
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, img_height[8:0]}), .boundary_4(boundary_4)
         );
  address_counter III ( .clk(clk), .n_rst(n_rst), .i_inc_raddr(inc_raddr), 
        .i_inc_waddr(inc_waddr), .i_init_raddr(start_raddr), .i_init_waddr({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .i_img_width(
        img_width[8:0]), .i_img_height(img_height[8:0]), .i_img_size(
        boundary_4), .o_raddr(raddr), .o_waddr(waddr), .o_r_ready(raddr_ready), 
        .o_w_ready(waddr_ready), .o_done(done) );
  INVX2 U3 ( .A(s_hrdata[0]), .Y(n1) );
endmodule


module grayscale_DW01_add_1 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n55;

  FAX1 U2 ( .A(B[7]), .B(A[7]), .C(n5), .YC(SUM[8]), .YS(SUM[7]) );
  FAX1 U3 ( .A(B[6]), .B(A[6]), .C(n6), .YC(n5), .YS(SUM[6]) );
  FAX1 U4 ( .A(B[5]), .B(A[5]), .C(n7), .YC(n6), .YS(SUM[5]) );
  FAX1 U5 ( .A(B[4]), .B(A[4]), .C(n8), .YC(n7), .YS(SUM[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(SUM[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(B[3]), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(B[3]), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(SUM[2]) );
  AOI21X1 U13 ( .A(n55), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n55), .Y(n2) );
  NAND2X1 U19 ( .A(B[2]), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(SUM[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(B[1]), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(B[1]), .B(A[1]), .Y(n18) );
  NAND2X1 U26 ( .A(A[0]), .B(B[0]), .Y(n19) );
  OR2X1 U30 ( .A(B[2]), .B(A[2]), .Y(n55) );
  INVX2 U31 ( .A(n17), .Y(n22) );
  INVX2 U32 ( .A(n9), .Y(n20) );
  INVX2 U33 ( .A(n15), .Y(n13) );
endmodule


module grayscale ( clk, n_rst, i_grayscale_start, i_RGB, 
        o_grayscale_data_ready, o_gray );
  input [31:0] i_RGB;
  output [7:0] o_gray;
  input clk, n_rst, i_grayscale_start;
  output o_grayscale_data_ready;
  wire   N129, N130, N131, N132, N133, N134, N135, N136, n181, n184, n187,
         n190, n193, n196, n199, n202, n205, n206, n207, n208, n209, n210,
         n211, n212, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n42, n43, n46, n47, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n182, n183, n185, n186, n188, n189, n191,
         n192, n194, n195, n197, n198, n200, n201, n203, n204, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331;
  wire   [7:0] min;
  wire   [7:0] max;
  wire   [8:1] total;
  wire   [7:0] average;
  wire   [7:0] n_average;
  wire   [3:0] curr;
  wire   [3:0] next;
  wire   SYNOPSYS_UNCONNECTED__0;

  DFFSR \o_gray_reg[7]  ( .D(n_average[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[7]) );
  DFFSR \o_gray_reg[6]  ( .D(n_average[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[6]) );
  DFFSR \o_gray_reg[5]  ( .D(n_average[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[5]) );
  DFFSR \o_gray_reg[4]  ( .D(n_average[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[4]) );
  DFFSR \o_gray_reg[3]  ( .D(n_average[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[3]) );
  DFFSR \o_gray_reg[2]  ( .D(n_average[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[2]) );
  DFFSR \o_gray_reg[1]  ( .D(n_average[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[1]) );
  DFFSR \o_gray_reg[0]  ( .D(n_average[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[0]) );
  DFFSR \average_reg[7]  ( .D(n_average[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[7]) );
  DFFSR \average_reg[6]  ( .D(n_average[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[6]) );
  DFFSR \average_reg[5]  ( .D(n_average[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[5]) );
  DFFSR \average_reg[4]  ( .D(n_average[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[4]) );
  DFFSR \average_reg[3]  ( .D(n_average[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[3]) );
  DFFSR \average_reg[2]  ( .D(n_average[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[2]) );
  DFFSR \average_reg[1]  ( .D(n_average[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[1]) );
  DFFSR \average_reg[0]  ( .D(n_average[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[0]) );
  DFFSR \curr_reg[0]  ( .D(next[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[0]) );
  DFFSR \min_reg[7]  ( .D(n205), .CLK(clk), .R(n308), .S(n307), .Q(min[7]) );
  DFFSR \curr_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[1]) );
  DFFSR \curr_reg[3]  ( .D(next[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[3]) );
  DFFSR \min_reg[6]  ( .D(n206), .CLK(clk), .R(n310), .S(n309), .Q(min[6]) );
  DFFSR \curr_reg[2]  ( .D(next[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[2]) );
  DFFSR \min_reg[0]  ( .D(n212), .CLK(clk), .R(n322), .S(n321), .Q(min[0]) );
  DFFSR \min_reg[1]  ( .D(n211), .CLK(clk), .R(n320), .S(n319), .Q(min[1]) );
  DFFSR \min_reg[2]  ( .D(n210), .CLK(clk), .R(n318), .S(n317), .Q(min[2]) );
  DFFSR \min_reg[3]  ( .D(n209), .CLK(clk), .R(n316), .S(n315), .Q(min[3]) );
  DFFSR \min_reg[4]  ( .D(n208), .CLK(clk), .R(n314), .S(n313), .Q(min[4]) );
  DFFSR \min_reg[5]  ( .D(n207), .CLK(clk), .R(n312), .S(n311), .Q(min[5]) );
  DFFSR o_grayscale_data_ready_reg ( .D(n323), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_grayscale_data_ready) );
  DFFSR \max_reg[0]  ( .D(n202), .CLK(clk), .R(n322), .S(n321), .Q(max[0]) );
  DFFSR \max_reg[1]  ( .D(n199), .CLK(clk), .R(n320), .S(n319), .Q(max[1]) );
  DFFSR \max_reg[2]  ( .D(n196), .CLK(clk), .R(n318), .S(n317), .Q(max[2]) );
  DFFSR \max_reg[3]  ( .D(n193), .CLK(clk), .R(n316), .S(n315), .Q(max[3]) );
  DFFSR \max_reg[4]  ( .D(n190), .CLK(clk), .R(n314), .S(n313), .Q(max[4]) );
  DFFSR \max_reg[5]  ( .D(n187), .CLK(clk), .R(n312), .S(n311), .Q(max[5]) );
  DFFSR \max_reg[6]  ( .D(n184), .CLK(clk), .R(n310), .S(n309), .Q(max[6]) );
  DFFSR \max_reg[7]  ( .D(n181), .CLK(clk), .R(n308), .S(n307), .Q(max[7]) );
  DFFSR \total_reg[1]  ( .D(n324), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[1]) );
  DFFSR \total_reg[2]  ( .D(n325), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[2]) );
  DFFSR \total_reg[3]  ( .D(n326), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[3]) );
  DFFSR \total_reg[4]  ( .D(n327), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[4]) );
  DFFSR \total_reg[5]  ( .D(n328), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[5]) );
  DFFSR \total_reg[6]  ( .D(n329), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[6]) );
  DFFSR \total_reg[7]  ( .D(n330), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[7]) );
  DFFSR \total_reg[8]  ( .D(n331), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[8]) );
  grayscale_DW01_add_1 add_184 ( .A({1'b0, min}), .B({1'b0, max}), .CI(1'b0), 
        .SUM({N136, N135, N134, N133, N132, N131, N130, N129, 
        SYNOPSYS_UNCONNECTED__0}) );
  AND2X2 U4 ( .A(curr[1]), .B(n77), .Y(n2) );
  INVX2 U7 ( .A(n147), .Y(n108) );
  INVX2 U8 ( .A(n305), .Y(n3) );
  INVX2 U9 ( .A(n_rst), .Y(n4) );
  INVX2 U10 ( .A(curr[3]), .Y(n119) );
  INVX2 U11 ( .A(n234), .Y(n35) );
  OAI21X1 U12 ( .A(n296), .B(n195), .C(n295), .Y(n5) );
  AOI21X1 U13 ( .A(i_RGB[23]), .B(n35), .C(n5), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n205) );
  INVX2 U22 ( .A(i_RGB[31]), .Y(n7) );
  NAND2X1 U23 ( .A(n7), .B(n4), .Y(n308) );
  NAND2X1 U24 ( .A(i_RGB[31]), .B(n4), .Y(n307) );
  INVX2 U25 ( .A(min[6]), .Y(n8) );
  OAI21X1 U26 ( .A(n296), .B(n8), .C(n294), .Y(n9) );
  AOI21X1 U27 ( .A(i_RGB[22]), .B(n35), .C(n9), .Y(n10) );
  INVX2 U28 ( .A(n10), .Y(n206) );
  INVX2 U29 ( .A(i_RGB[30]), .Y(n11) );
  NAND2X1 U30 ( .A(n11), .B(n4), .Y(n310) );
  NAND2X1 U31 ( .A(i_RGB[30]), .B(n4), .Y(n309) );
  OAI21X1 U32 ( .A(n296), .B(n226), .C(n293), .Y(n12) );
  AOI21X1 U33 ( .A(i_RGB[21]), .B(n35), .C(n12), .Y(n13) );
  INVX2 U35 ( .A(n13), .Y(n207) );
  INVX2 U36 ( .A(i_RGB[29]), .Y(n14) );
  NAND2X1 U39 ( .A(n14), .B(n4), .Y(n312) );
  NAND2X1 U40 ( .A(i_RGB[29]), .B(n4), .Y(n311) );
  OAI21X1 U58 ( .A(n296), .B(n215), .C(n292), .Y(n15) );
  AOI21X1 U59 ( .A(i_RGB[20]), .B(n35), .C(n15), .Y(n16) );
  INVX2 U60 ( .A(n16), .Y(n208) );
  INVX2 U61 ( .A(i_RGB[28]), .Y(n17) );
  NAND2X1 U62 ( .A(n17), .B(n4), .Y(n314) );
  NAND2X1 U63 ( .A(i_RGB[28]), .B(n4), .Y(n313) );
  OAI21X1 U64 ( .A(n296), .B(n218), .C(n291), .Y(n18) );
  AOI21X1 U65 ( .A(i_RGB[19]), .B(n35), .C(n18), .Y(n19) );
  INVX2 U66 ( .A(n19), .Y(n209) );
  INVX2 U67 ( .A(i_RGB[27]), .Y(n29) );
  NAND2X1 U68 ( .A(n29), .B(n4), .Y(n316) );
  NAND2X1 U69 ( .A(i_RGB[27]), .B(n4), .Y(n315) );
  INVX2 U70 ( .A(min[2]), .Y(n30) );
  OAI21X1 U71 ( .A(n296), .B(n30), .C(n290), .Y(n31) );
  AOI21X1 U72 ( .A(i_RGB[18]), .B(n35), .C(n31), .Y(n32) );
  INVX2 U73 ( .A(n32), .Y(n210) );
  INVX2 U74 ( .A(i_RGB[26]), .Y(n33) );
  NAND2X1 U75 ( .A(n33), .B(n4), .Y(n318) );
  NAND2X1 U76 ( .A(i_RGB[26]), .B(n4), .Y(n317) );
  INVX2 U77 ( .A(min[1]), .Y(n95) );
  OAI21X1 U78 ( .A(n296), .B(n95), .C(n289), .Y(n34) );
  AOI21X1 U79 ( .A(i_RGB[17]), .B(n35), .C(n34), .Y(n36) );
  INVX2 U80 ( .A(n36), .Y(n211) );
  INVX2 U81 ( .A(i_RGB[25]), .Y(n37) );
  NAND2X1 U82 ( .A(n37), .B(n4), .Y(n320) );
  NAND2X1 U83 ( .A(i_RGB[25]), .B(n4), .Y(n319) );
  NAND3X1 U84 ( .A(curr[3]), .B(curr[0]), .C(n237), .Y(n144) );
  INVX2 U85 ( .A(i_RGB[16]), .Y(n79) );
  NAND2X1 U86 ( .A(i_RGB[24]), .B(n108), .Y(n78) );
  OAI21X1 U87 ( .A(n234), .B(n79), .C(n78), .Y(n39) );
  INVX2 U88 ( .A(min[0]), .Y(n92) );
  INVX2 U89 ( .A(i_RGB[8]), .Y(n97) );
  OAI22X1 U90 ( .A(n296), .B(n92), .C(n144), .D(n97), .Y(n38) );
  OR2X1 U91 ( .A(n39), .B(n38), .Y(n212) );
  INVX2 U92 ( .A(i_RGB[24]), .Y(n40) );
  NAND2X1 U93 ( .A(n40), .B(n4), .Y(n322) );
  NAND2X1 U94 ( .A(i_RGB[24]), .B(n4), .Y(n321) );
  INVX2 U95 ( .A(n146), .Y(n109) );
  OAI21X1 U96 ( .A(n305), .B(n165), .C(n304), .Y(n42) );
  AOI21X1 U97 ( .A(i_RGB[15]), .B(n109), .C(n42), .Y(n43) );
  INVX2 U98 ( .A(n43), .Y(n181) );
  INVX2 U99 ( .A(max[6]), .Y(n46) );
  OAI21X1 U100 ( .A(n305), .B(n46), .C(n303), .Y(n47) );
  AOI21X1 U101 ( .A(i_RGB[14]), .B(n109), .C(n47), .Y(n65) );
  INVX2 U102 ( .A(n65), .Y(n184) );
  OAI21X1 U103 ( .A(n305), .B(n175), .C(n302), .Y(n66) );
  AOI21X1 U104 ( .A(i_RGB[13]), .B(n109), .C(n66), .Y(n67) );
  INVX2 U105 ( .A(n67), .Y(n187) );
  OAI21X1 U106 ( .A(n305), .B(n171), .C(n301), .Y(n68) );
  AOI21X1 U107 ( .A(i_RGB[12]), .B(n109), .C(n68), .Y(n69) );
  INVX2 U108 ( .A(n69), .Y(n190) );
  OAI21X1 U109 ( .A(n305), .B(n183), .C(n300), .Y(n70) );
  AOI21X1 U110 ( .A(i_RGB[11]), .B(n109), .C(n70), .Y(n71) );
  INVX2 U111 ( .A(n71), .Y(n193) );
  INVX2 U112 ( .A(max[2]), .Y(n99) );
  OAI21X1 U113 ( .A(n305), .B(n99), .C(n299), .Y(n72) );
  AOI21X1 U114 ( .A(i_RGB[10]), .B(n109), .C(n72), .Y(n73) );
  INVX2 U115 ( .A(n73), .Y(n196) );
  INVX2 U116 ( .A(max[1]), .Y(n74) );
  OAI21X1 U117 ( .A(n305), .B(n74), .C(n298), .Y(n75) );
  AOI21X1 U118 ( .A(i_RGB[9]), .B(n109), .C(n75), .Y(n76) );
  INVX2 U119 ( .A(n76), .Y(n199) );
  INVX2 U120 ( .A(curr[2]), .Y(n77) );
  NAND2X1 U121 ( .A(n297), .B(n2), .Y(n306) );
  OAI21X1 U122 ( .A(n146), .B(n97), .C(n78), .Y(n81) );
  INVX2 U123 ( .A(max[0]), .Y(n89) );
  OAI22X1 U124 ( .A(n305), .B(n89), .C(n306), .D(n79), .Y(n80) );
  OR2X1 U125 ( .A(n81), .B(n80), .Y(n202) );
  INVX2 U126 ( .A(curr[0]), .Y(n106) );
  NAND3X1 U127 ( .A(curr[3]), .B(n106), .C(n2), .Y(n159) );
  MUX2X1 U128 ( .B(total[1]), .A(N129), .S(n232), .Y(n82) );
  INVX2 U129 ( .A(n82), .Y(n324) );
  NAND3X1 U130 ( .A(curr[1]), .B(curr[0]), .C(n110), .Y(n117) );
  INVX2 U131 ( .A(n117), .Y(n103) );
  MUX2X1 U132 ( .B(total[2]), .A(N130), .S(n232), .Y(n83) );
  INVX2 U133 ( .A(n83), .Y(n325) );
  MUX2X1 U134 ( .B(total[3]), .A(N131), .S(n232), .Y(n84) );
  INVX2 U135 ( .A(n84), .Y(n326) );
  MUX2X1 U136 ( .B(total[4]), .A(N132), .S(n232), .Y(n85) );
  INVX2 U137 ( .A(n85), .Y(n327) );
  MUX2X1 U138 ( .B(total[5]), .A(N133), .S(n232), .Y(n86) );
  INVX2 U139 ( .A(n86), .Y(n328) );
  MUX2X1 U140 ( .B(total[6]), .A(N134), .S(n232), .Y(n87) );
  INVX2 U141 ( .A(n87), .Y(n329) );
  MUX2X1 U142 ( .B(total[8]), .A(N136), .S(n232), .Y(n88) );
  INVX2 U143 ( .A(n88), .Y(n331) );
  INVX2 U144 ( .A(n306), .Y(n104) );
  NAND2X1 U145 ( .A(i_RGB[16]), .B(n89), .Y(n91) );
  INVX2 U146 ( .A(n91), .Y(n90) );
  OAI22X1 U147 ( .A(n90), .B(i_RGB[17]), .C(n99), .D(i_RGB[18]), .Y(n179) );
  OAI21X1 U148 ( .A(n188), .B(n91), .C(max[1]), .Y(n189) );
  OAI22X1 U149 ( .A(n95), .B(i_RGB[17]), .C(i_RGB[16]), .D(n92), .Y(n93) );
  OAI21X1 U150 ( .A(min[1]), .B(n188), .C(n93), .Y(n201) );
  NAND2X1 U151 ( .A(min[0]), .B(n97), .Y(n96) );
  INVX2 U152 ( .A(n96), .Y(n94) );
  OAI22X1 U153 ( .A(n265), .B(n94), .C(n263), .D(min[2]), .Y(n259) );
  OAI21X1 U154 ( .A(i_RGB[9]), .B(n96), .C(n95), .Y(n266) );
  INVX2 U155 ( .A(curr[1]), .Y(n107) );
  OAI21X1 U156 ( .A(max[0]), .B(n97), .C(n265), .Y(n98) );
  OAI21X1 U157 ( .A(n99), .B(i_RGB[10]), .C(n98), .Y(n281) );
  NAND2X1 U158 ( .A(i_RGB[8]), .B(i_RGB[9]), .Y(n100) );
  OAI21X1 U159 ( .A(max[0]), .B(n100), .C(max[1]), .Y(n285) );
  INVX2 U160 ( .A(n144), .Y(n105) );
  MUX2X1 U161 ( .B(total[7]), .A(N135), .S(n232), .Y(n101) );
  INVX2 U162 ( .A(n101), .Y(n330) );
  MUX2X1 U163 ( .B(average[6]), .A(total[7]), .S(n103), .Y(n102) );
  INVX2 U164 ( .A(n102), .Y(n_average[6]) );
  NOR2X1 U165 ( .A(curr[2]), .B(n119), .Y(n110) );
  AOI22X1 U166 ( .A(total[1]), .B(n103), .C(average[0]), .D(n117), .Y(n111) );
  AOI22X1 U167 ( .A(total[2]), .B(n103), .C(average[1]), .D(n117), .Y(n112) );
  AOI22X1 U168 ( .A(total[3]), .B(n103), .C(average[2]), .D(n117), .Y(n113) );
  AOI22X1 U169 ( .A(total[4]), .B(n103), .C(average[3]), .D(n117), .Y(n114) );
  AOI22X1 U170 ( .A(total[5]), .B(n103), .C(average[4]), .D(n117), .Y(n115) );
  AOI22X1 U171 ( .A(total[6]), .B(n103), .C(average[5]), .D(n117), .Y(n116) );
  AOI22X1 U172 ( .A(total[8]), .B(n103), .C(average[7]), .D(n117), .Y(n118) );
  INVX2 U173 ( .A(n111), .Y(n_average[0]) );
  INVX2 U174 ( .A(n112), .Y(n_average[1]) );
  INVX2 U175 ( .A(n113), .Y(n_average[2]) );
  INVX2 U176 ( .A(n114), .Y(n_average[3]) );
  INVX2 U177 ( .A(n115), .Y(n_average[4]) );
  INVX2 U178 ( .A(n116), .Y(n_average[5]) );
  INVX2 U179 ( .A(n118), .Y(n_average[7]) );
  OR2X1 U180 ( .A(n120), .B(n121), .Y(next[3]) );
  OAI21X1 U181 ( .A(n122), .B(n123), .C(n124), .Y(n121) );
  NAND3X1 U182 ( .A(n125), .B(n126), .C(n127), .Y(next[2]) );
  AOI21X1 U183 ( .A(n128), .B(n122), .C(n129), .Y(n127) );
  OAI21X1 U184 ( .A(n130), .B(n131), .C(n124), .Y(n129) );
  OR2X1 U185 ( .A(n132), .B(n133), .Y(n131) );
  INVX1 U186 ( .A(n134), .Y(n122) );
  NOR2X1 U187 ( .A(n104), .B(n109), .Y(n126) );
  AND2X1 U188 ( .A(n135), .B(n136), .Y(n125) );
  NAND3X1 U189 ( .A(n137), .B(n138), .C(n139), .Y(next[1]) );
  NOR2X1 U190 ( .A(n140), .B(n141), .Y(n139) );
  OAI21X1 U191 ( .A(n142), .B(n143), .C(n144), .Y(n141) );
  OR2X1 U192 ( .A(n135), .B(n145), .Y(n143) );
  NAND2X1 U193 ( .A(n146), .B(n147), .Y(n140) );
  AOI22X1 U194 ( .A(n148), .B(n149), .C(n150), .D(curr[1]), .Y(n137) );
  INVX1 U195 ( .A(n151), .Y(n149) );
  NOR2X1 U196 ( .A(n152), .B(n153), .Y(n148) );
  OR2X1 U197 ( .A(n154), .B(n155), .Y(next[0]) );
  OAI21X1 U198 ( .A(n106), .B(n124), .C(n138), .Y(n155) );
  INVX1 U199 ( .A(n156), .Y(n138) );
  OAI21X1 U200 ( .A(n134), .B(n123), .C(n157), .Y(n156) );
  AND2X1 U201 ( .A(n158), .B(n159), .Y(n157) );
  OAI21X1 U202 ( .A(n133), .B(n130), .C(n160), .Y(n158) );
  INVX1 U203 ( .A(n132), .Y(n160) );
  OAI21X1 U204 ( .A(n161), .B(n162), .C(n163), .Y(n130) );
  AOI22X1 U205 ( .A(n164), .B(i_RGB[22]), .C(i_RGB[23]), .D(n165), .Y(n163) );
  NOR2X1 U206 ( .A(max[6]), .B(n166), .Y(n164) );
  OAI21X1 U207 ( .A(i_RGB[21]), .B(n167), .C(n168), .Y(n162) );
  OAI21X1 U208 ( .A(n169), .B(n170), .C(max[5]), .Y(n168) );
  INVX1 U209 ( .A(n170), .Y(n167) );
  NAND2X1 U210 ( .A(i_RGB[20]), .B(n171), .Y(n170) );
  INVX1 U211 ( .A(n172), .Y(n161) );
  NOR2X1 U212 ( .A(n173), .B(n174), .Y(n133) );
  OAI21X1 U213 ( .A(i_RGB[21]), .B(n175), .C(n172), .Y(n174) );
  AOI21X1 U214 ( .A(n176), .B(max[6]), .C(n166), .Y(n172) );
  NOR2X1 U215 ( .A(n165), .B(i_RGB[23]), .Y(n166) );
  OAI21X1 U216 ( .A(i_RGB[20]), .B(n171), .C(n177), .Y(n173) );
  OAI21X1 U217 ( .A(n178), .B(n179), .C(n180), .Y(n177) );
  AOI22X1 U218 ( .A(n182), .B(i_RGB[18]), .C(i_RGB[19]), .D(n183), .Y(n180) );
  NOR2X1 U219 ( .A(max[2]), .B(n185), .Y(n182) );
  NAND2X1 U220 ( .A(n189), .B(n191), .Y(n178) );
  INVX1 U221 ( .A(n185), .Y(n191) );
  NOR2X1 U222 ( .A(n183), .B(i_RGB[19]), .Y(n185) );
  NOR2X1 U223 ( .A(n192), .B(n194), .Y(n134) );
  OAI22X1 U224 ( .A(i_RGB[23]), .B(n195), .C(n197), .D(n198), .Y(n194) );
  INVX1 U225 ( .A(n200), .Y(n198) );
  AOI21X1 U226 ( .A(n201), .B(n203), .C(n204), .Y(n200) );
  INVX1 U227 ( .A(i_RGB[17]), .Y(n188) );
  OAI21X1 U228 ( .A(min[5]), .B(n169), .C(n213), .Y(n197) );
  AOI22X1 U229 ( .A(n203), .B(n214), .C(i_RGB[20]), .D(n215), .Y(n213) );
  OAI21X1 U230 ( .A(min[2]), .B(n186), .C(n216), .Y(n214) );
  INVX1 U231 ( .A(n217), .Y(n203) );
  OAI21X1 U232 ( .A(i_RGB[19]), .B(n218), .C(n219), .Y(n217) );
  NAND3X1 U233 ( .A(n216), .B(n186), .C(min[2]), .Y(n219) );
  INVX1 U234 ( .A(i_RGB[18]), .Y(n186) );
  NAND2X1 U235 ( .A(i_RGB[19]), .B(n218), .Y(n216) );
  OAI21X1 U236 ( .A(n204), .B(n220), .C(n221), .Y(n192) );
  NAND3X1 U237 ( .A(n222), .B(n176), .C(min[6]), .Y(n221) );
  OAI21X1 U238 ( .A(n223), .B(n169), .C(n224), .Y(n220) );
  OAI21X1 U239 ( .A(i_RGB[21]), .B(n225), .C(n226), .Y(n224) );
  INVX1 U240 ( .A(n223), .Y(n225) );
  INVX1 U241 ( .A(i_RGB[21]), .Y(n169) );
  NOR2X1 U242 ( .A(n215), .B(i_RGB[20]), .Y(n223) );
  OAI21X1 U243 ( .A(min[6]), .B(n176), .C(n222), .Y(n204) );
  NAND2X1 U244 ( .A(i_RGB[23]), .B(n195), .Y(n222) );
  INVX1 U245 ( .A(i_RGB[22]), .Y(n176) );
  INVX1 U246 ( .A(n150), .Y(n124) );
  NOR2X1 U247 ( .A(n227), .B(n228), .Y(n150) );
  NAND3X1 U248 ( .A(n229), .B(n132), .C(n3), .Y(n228) );
  NAND2X1 U249 ( .A(n230), .B(n2), .Y(n132) );
  INVX1 U250 ( .A(n120), .Y(n229) );
  NAND3X1 U251 ( .A(n136), .B(n153), .C(n231), .Y(n120) );
  NOR2X1 U252 ( .A(n232), .B(n233), .Y(n231) );
  NAND2X1 U253 ( .A(n234), .B(n144), .Y(n233) );
  INVX1 U254 ( .A(n159), .Y(n232) );
  NAND3X1 U255 ( .A(curr[3]), .B(curr[0]), .C(n2), .Y(n136) );
  NAND3X1 U256 ( .A(n135), .B(n235), .C(n236), .Y(n227) );
  NOR2X1 U257 ( .A(n323), .B(n128), .Y(n236) );
  INVX1 U258 ( .A(n123), .Y(n128) );
  NAND3X1 U259 ( .A(curr[2]), .B(curr[1]), .C(n230), .Y(n123) );
  INVX1 U260 ( .A(n237), .Y(n235) );
  NAND3X1 U261 ( .A(n238), .B(n239), .C(n240), .Y(n154) );
  OAI21X1 U262 ( .A(n152), .B(n151), .C(n241), .Y(n240) );
  INVX1 U263 ( .A(n153), .Y(n241) );
  NAND3X1 U264 ( .A(n237), .B(n106), .C(curr[3]), .Y(n153) );
  OAI21X1 U265 ( .A(n242), .B(n243), .C(n244), .Y(n151) );
  AOI22X1 U266 ( .A(n245), .B(min[6]), .C(min[7]), .D(n246), .Y(n244) );
  INVX1 U267 ( .A(i_RGB[15]), .Y(n246) );
  AND2X1 U268 ( .A(n247), .B(n248), .Y(n245) );
  OAI21X1 U269 ( .A(n249), .B(n250), .C(n251), .Y(n243) );
  OAI21X1 U270 ( .A(i_RGB[13]), .B(n252), .C(n226), .Y(n251) );
  INVX1 U271 ( .A(min[5]), .Y(n226) );
  INVX1 U272 ( .A(n249), .Y(n252) );
  NOR2X1 U273 ( .A(n215), .B(i_RGB[12]), .Y(n249) );
  INVX1 U274 ( .A(min[4]), .Y(n215) );
  NOR2X1 U275 ( .A(n253), .B(n254), .Y(n152) );
  OAI21X1 U276 ( .A(min[5]), .B(n250), .C(n255), .Y(n254) );
  INVX1 U277 ( .A(n242), .Y(n255) );
  OAI21X1 U278 ( .A(min[6]), .B(n247), .C(n248), .Y(n242) );
  NAND2X1 U279 ( .A(i_RGB[15]), .B(n195), .Y(n248) );
  INVX1 U280 ( .A(min[7]), .Y(n195) );
  OAI21X1 U281 ( .A(min[4]), .B(n256), .C(n257), .Y(n253) );
  OAI21X1 U282 ( .A(n258), .B(n259), .C(n260), .Y(n257) );
  AOI22X1 U283 ( .A(n261), .B(min[2]), .C(min[3]), .D(n262), .Y(n260) );
  INVX1 U284 ( .A(i_RGB[11]), .Y(n262) );
  AND2X1 U285 ( .A(n263), .B(n264), .Y(n261) );
  NAND2X1 U286 ( .A(n266), .B(n264), .Y(n258) );
  NAND2X1 U287 ( .A(i_RGB[11]), .B(n218), .Y(n264) );
  INVX1 U288 ( .A(min[3]), .Y(n218) );
  NAND3X1 U289 ( .A(n230), .B(n237), .C(i_grayscale_start), .Y(n239) );
  OAI21X1 U290 ( .A(n145), .B(n142), .C(n267), .Y(n238) );
  INVX1 U291 ( .A(n135), .Y(n267) );
  NAND3X1 U292 ( .A(curr[2]), .B(n107), .C(n230), .Y(n135) );
  NOR2X1 U293 ( .A(curr[3]), .B(curr[0]), .Y(n230) );
  OAI21X1 U294 ( .A(n268), .B(n269), .C(n270), .Y(n142) );
  AOI22X1 U295 ( .A(n271), .B(i_RGB[14]), .C(i_RGB[15]), .D(n165), .Y(n270) );
  NOR2X1 U296 ( .A(max[6]), .B(n272), .Y(n271) );
  OAI21X1 U297 ( .A(i_RGB[13]), .B(n273), .C(n274), .Y(n269) );
  OAI21X1 U298 ( .A(n275), .B(n250), .C(max[5]), .Y(n274) );
  INVX1 U299 ( .A(i_RGB[13]), .Y(n250) );
  INVX1 U300 ( .A(n273), .Y(n275) );
  NOR2X1 U301 ( .A(n256), .B(max[4]), .Y(n273) );
  INVX1 U302 ( .A(i_RGB[12]), .Y(n256) );
  INVX1 U303 ( .A(n276), .Y(n268) );
  NOR2X1 U304 ( .A(n277), .B(n278), .Y(n145) );
  OAI21X1 U305 ( .A(i_RGB[13]), .B(n175), .C(n276), .Y(n278) );
  AOI21X1 U306 ( .A(n247), .B(max[6]), .C(n272), .Y(n276) );
  NOR2X1 U307 ( .A(n165), .B(i_RGB[15]), .Y(n272) );
  INVX1 U308 ( .A(max[7]), .Y(n165) );
  INVX1 U309 ( .A(i_RGB[14]), .Y(n247) );
  INVX1 U310 ( .A(max[5]), .Y(n175) );
  OAI21X1 U311 ( .A(i_RGB[12]), .B(n171), .C(n279), .Y(n277) );
  OAI21X1 U312 ( .A(n280), .B(n281), .C(n282), .Y(n279) );
  AOI22X1 U313 ( .A(n283), .B(i_RGB[10]), .C(i_RGB[11]), .D(n183), .Y(n282) );
  NOR2X1 U314 ( .A(max[2]), .B(n284), .Y(n283) );
  INVX1 U315 ( .A(i_RGB[10]), .Y(n263) );
  NAND2X1 U316 ( .A(n285), .B(n286), .Y(n280) );
  INVX1 U317 ( .A(n284), .Y(n286) );
  NOR2X1 U318 ( .A(n183), .B(i_RGB[11]), .Y(n284) );
  INVX1 U319 ( .A(max[3]), .Y(n183) );
  INVX1 U320 ( .A(i_RGB[9]), .Y(n265) );
  INVX1 U321 ( .A(max[4]), .Y(n171) );
  INVX1 U322 ( .A(n287), .Y(n323) );
  NAND3X1 U323 ( .A(curr[2]), .B(curr[3]), .C(n288), .Y(n287) );
  NOR2X1 U324 ( .A(curr[1]), .B(curr[0]), .Y(n288) );
  AOI22X1 U325 ( .A(n105), .B(i_RGB[9]), .C(n108), .D(i_RGB[25]), .Y(n289) );
  AOI22X1 U326 ( .A(n105), .B(i_RGB[10]), .C(n108), .D(i_RGB[26]), .Y(n290) );
  AOI22X1 U327 ( .A(n105), .B(i_RGB[11]), .C(n108), .D(i_RGB[27]), .Y(n291) );
  AOI22X1 U328 ( .A(n105), .B(i_RGB[12]), .C(n108), .D(i_RGB[28]), .Y(n292) );
  AOI22X1 U329 ( .A(n105), .B(i_RGB[13]), .C(n108), .D(i_RGB[29]), .Y(n293) );
  AOI22X1 U330 ( .A(n105), .B(i_RGB[14]), .C(n108), .D(i_RGB[30]), .Y(n294) );
  NAND3X1 U331 ( .A(n144), .B(n147), .C(n234), .Y(n296) );
  NAND3X1 U332 ( .A(curr[1]), .B(n297), .C(curr[2]), .Y(n234) );
  AOI22X1 U333 ( .A(n105), .B(i_RGB[15]), .C(n108), .D(i_RGB[31]), .Y(n295) );
  AOI22X1 U334 ( .A(n104), .B(i_RGB[17]), .C(n108), .D(i_RGB[25]), .Y(n298) );
  AOI22X1 U335 ( .A(n104), .B(i_RGB[18]), .C(n108), .D(i_RGB[26]), .Y(n299) );
  AOI22X1 U336 ( .A(n104), .B(i_RGB[19]), .C(n108), .D(i_RGB[27]), .Y(n300) );
  AOI22X1 U337 ( .A(n104), .B(i_RGB[20]), .C(n108), .D(i_RGB[28]), .Y(n301) );
  AOI22X1 U338 ( .A(n104), .B(i_RGB[21]), .C(n108), .D(i_RGB[29]), .Y(n302) );
  AOI22X1 U339 ( .A(n104), .B(i_RGB[22]), .C(n108), .D(i_RGB[30]), .Y(n303) );
  NAND3X1 U340 ( .A(n306), .B(n147), .C(n146), .Y(n305) );
  NAND3X1 U341 ( .A(n297), .B(n107), .C(curr[2]), .Y(n146) );
  AOI22X1 U342 ( .A(n104), .B(i_RGB[23]), .C(n108), .D(i_RGB[31]), .Y(n304) );
  NAND2X1 U343 ( .A(n297), .B(n237), .Y(n147) );
  NOR2X1 U344 ( .A(curr[2]), .B(curr[1]), .Y(n237) );
  NOR2X1 U345 ( .A(n106), .B(curr[3]), .Y(n297) );
endmodule


module buffer_window ( clk, n_rst, i_data_in, i_save, i_clear, o_full, o_empty, 
        o_m1, o_m2, o_m3, o_m4, o_m5, o_m6, o_m7, o_m8, o_m9, o_m10, o_m11, 
        o_m12, o_m13, o_m14, o_m15, o_m16, o_m17, o_m18, o_m19, o_m20, o_m21, 
        o_m22, o_m23, o_m24, o_m25 );
  input [7:0] i_data_in;
  output [7:0] o_m1;
  output [7:0] o_m2;
  output [7:0] o_m3;
  output [7:0] o_m4;
  output [7:0] o_m5;
  output [7:0] o_m6;
  output [7:0] o_m7;
  output [7:0] o_m8;
  output [7:0] o_m9;
  output [7:0] o_m10;
  output [7:0] o_m11;
  output [7:0] o_m12;
  output [7:0] o_m13;
  output [7:0] o_m14;
  output [7:0] o_m15;
  output [7:0] o_m16;
  output [7:0] o_m17;
  output [7:0] o_m18;
  output [7:0] o_m19;
  output [7:0] o_m20;
  output [7:0] o_m21;
  output [7:0] o_m22;
  output [7:0] o_m23;
  output [7:0] o_m24;
  output [7:0] o_m25;
  input clk, n_rst, i_save, i_clear;
  output o_full, o_empty;
  wire   n930, n931, n932, n933, n934, n935, n936, n937, n938, n939, n940,
         n941, n942, n943, n944, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n955, n956, n957, n958, n959, n960, n961, n962,
         n963, n964, n965, n966, n967, n968, n969, n970, n971, next_empty,
         next_full, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n267, n268, n269, n270,
         n271, n272, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n321, n322, n323, n324, n325, n326, n327, n328, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n368, n369, n370, n371, n372, n373, n375, n378, n380,
         n382, n384, n386, n390, n391, n392, n394, n395, n396, n397, n398,
         n400, n401, n402, n403, n405, n406, n407, n408, n409, n411, n412,
         n413, n415, n416, n417, n418, n421, n422, n423, n425, n426, n427,
         n428, n429, n431, n432, n434, n435, n436, n437, n438, n440, n441,
         n443, n444, n445, n446, n447, n449, n450, n452, n453, n454, n455,
         n458, n459, n461, n462, n463, n464, n467, n468, n469, n471, n472,
         n473, n474, n477, n478, n480, n481, n482, n483, n484, n486, n487,
         n488, n490, n491, n492, n493, n496, n497, n498, n500, n501, n502,
         n503, n506, n507, n509, n510, n511, n512, n515, n516, n518, n519,
         n520, n521, n522, n525, n527, n528, n529, n530, n531, n534, n536,
         n537, n538, n539, n540, n542, n543, n545, n546, n547, n548, n549,
         n551, n552, n554, n555, n556, n557, n560, n561, n563, n564, n565,
         n566, n569, n570, n571, n573, n574, n575, n576, n577, n579, n580,
         n582, n583, n584, n585, n586, n588, n589, n590, n592, n593, n594,
         n595, n596, n598, n599, n601, n602, n603, n604, n607, n608, n610,
         n611, n612, n613, n614, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n221, n223, n225, n341,
         n367, n374, n376, n377, n379, n381, n383, n385, n389, n442, n451,
         n457, n465, n470, n476, n485, n494, n499, n504, n505, n508, n513,
         n514, n517, n523, n524, n526, n532, n533, n535, n541, n544, n550,
         n553, n558, n559, n562, n567, n568, n572, n578, n581, n587, n591,
         n597, n600, n605, n606, n609, n615, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929;
  wire   [5:0] curr;
  wire   [5:0] next;

  DFFSR \curr_reg[0]  ( .D(next[0]), .CLK(clk), .R(n609), .S(1'b1), .Q(curr[0]) );
  DFFSR \curr_reg[1]  ( .D(next[1]), .CLK(clk), .R(n609), .S(1'b1), .Q(curr[1]) );
  DFFSR \curr_reg[2]  ( .D(next[2]), .CLK(clk), .R(n609), .S(1'b1), .Q(curr[2]) );
  DFFSR \o_m4_reg[7]  ( .D(n793), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m4[7])
         );
  DFFSR \o_m4_reg[5]  ( .D(n794), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m4[5])
         );
  DFFSR \o_m4_reg[4]  ( .D(n795), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m4[4])
         );
  DFFSR \o_m4_reg[3]  ( .D(n796), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m4[3])
         );
  DFFSR \o_m4_reg[2]  ( .D(n797), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m4[2])
         );
  DFFSR \o_m4_reg[1]  ( .D(n798), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m4[1])
         );
  DFFSR \o_m4_reg[0]  ( .D(n799), .CLK(clk), .R(n606), .S(1'b1), .Q(n937) );
  DFFSR \o_m4_reg[6]  ( .D(n800), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m4[6])
         );
  DFFSR \curr_reg[3]  ( .D(next[3]), .CLK(clk), .R(n606), .S(1'b1), .Q(curr[3]) );
  DFFSR \o_m13_reg[7]  ( .D(n721), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m13[7])
         );
  DFFSR \o_m13_reg[5]  ( .D(n722), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m13[5])
         );
  DFFSR \o_m13_reg[4]  ( .D(n723), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m13[4])
         );
  DFFSR \o_m13_reg[3]  ( .D(n724), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m13[3])
         );
  DFFSR \o_m13_reg[2]  ( .D(n725), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m13[2])
         );
  DFFSR \o_m13_reg[1]  ( .D(n726), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m13[1])
         );
  DFFSR \o_m13_reg[0]  ( .D(n727), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m13[0])
         );
  DFFSR \o_m13_reg[6]  ( .D(n728), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m13[6])
         );
  DFFSR \o_m15_reg[7]  ( .D(n705), .CLK(clk), .R(n605), .S(1'b1), .Q(n961) );
  DFFSR \o_m15_reg[5]  ( .D(n706), .CLK(clk), .R(n605), .S(1'b1), .Q(n963) );
  DFFSR \o_m15_reg[4]  ( .D(n707), .CLK(clk), .R(n605), .S(1'b1), .Q(n964) );
  DFFSR \o_m15_reg[3]  ( .D(n708), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m15[3])
         );
  DFFSR \o_m15_reg[2]  ( .D(n709), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m15[2])
         );
  DFFSR \o_m15_reg[1]  ( .D(n710), .CLK(clk), .R(n605), .S(1'b1), .Q(n965) );
  DFFSR \o_m15_reg[0]  ( .D(n711), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m15[0])
         );
  DFFSR \o_m15_reg[6]  ( .D(n712), .CLK(clk), .R(n605), .S(1'b1), .Q(n962) );
  DFFSR \o_m11_reg[7]  ( .D(n737), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m11[7])
         );
  DFFSR \o_m11_reg[6]  ( .D(n738), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m11[6])
         );
  DFFSR \o_m11_reg[5]  ( .D(n739), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m11[5])
         );
  DFFSR \o_m11_reg[4]  ( .D(n740), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m11[4])
         );
  DFFSR \o_m11_reg[3]  ( .D(n741), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m11[3])
         );
  DFFSR \o_m11_reg[2]  ( .D(n742), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m11[2])
         );
  DFFSR \o_m11_reg[0]  ( .D(n743), .CLK(clk), .R(n600), .S(1'b1), .Q(n952) );
  DFFSR \o_m11_reg[1]  ( .D(n744), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m11[1])
         );
  DFFSR \curr_reg[4]  ( .D(next[4]), .CLK(clk), .R(n600), .S(1'b1), .Q(curr[4]) );
  DFFSR \curr_reg[5]  ( .D(n910), .CLK(clk), .R(n600), .S(1'b1), .Q(curr[5])
         );
  DFFSR \o_m6_reg[7]  ( .D(n777), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m6[7])
         );
  DFFSR \o_m6_reg[5]  ( .D(n778), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m6[5])
         );
  DFFSR \o_m6_reg[4]  ( .D(n779), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m6[4])
         );
  DFFSR \o_m6_reg[3]  ( .D(n780), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m6[3])
         );
  DFFSR \o_m6_reg[2]  ( .D(n781), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m6[2])
         );
  DFFSR \o_m6_reg[1]  ( .D(n782), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m6[1])
         );
  DFFSR \o_m6_reg[0]  ( .D(n783), .CLK(clk), .R(n597), .S(1'b1), .Q(n938) );
  DFFSR \o_m6_reg[6]  ( .D(n784), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m6[6])
         );
  DFFSR \o_m5_reg[7]  ( .D(n785), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m5[7])
         );
  DFFSR \o_m5_reg[5]  ( .D(n786), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m5[5])
         );
  DFFSR \o_m5_reg[4]  ( .D(n787), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m5[4])
         );
  DFFSR \o_m5_reg[3]  ( .D(n788), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m5[3])
         );
  DFFSR \o_m5_reg[2]  ( .D(n789), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m5[2])
         );
  DFFSR \o_m5_reg[1]  ( .D(n790), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m5[1])
         );
  DFFSR \o_m5_reg[0]  ( .D(n791), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m5[0])
         );
  DFFSR \o_m5_reg[6]  ( .D(n792), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m5[6])
         );
  DFFSR o_empty_reg ( .D(next_empty), .CLK(clk), .R(1'b1), .S(n824), .Q(
        o_empty) );
  DFFSR \o_m1_reg[7]  ( .D(n617), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m1[7])
         );
  DFFSR \o_m1_reg[6]  ( .D(n618), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m1[6])
         );
  DFFSR \o_m1_reg[4]  ( .D(n619), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m1[4])
         );
  DFFSR \o_m1_reg[3]  ( .D(n620), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m1[3])
         );
  DFFSR \o_m1_reg[2]  ( .D(n621), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m1[2])
         );
  DFFSR \o_m1_reg[1]  ( .D(n622), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m1[1])
         );
  DFFSR \o_m1_reg[0]  ( .D(n623), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m1[0])
         );
  DFFSR \o_m1_reg[5]  ( .D(n624), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m1[5])
         );
  DFFSR \o_m2_reg[7]  ( .D(n809), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m2[7])
         );
  DFFSR \o_m2_reg[5]  ( .D(n810), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m2[5])
         );
  DFFSR \o_m2_reg[4]  ( .D(n811), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m2[4])
         );
  DFFSR \o_m2_reg[3]  ( .D(n812), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m2[3])
         );
  DFFSR \o_m2_reg[2]  ( .D(n813), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m2[2])
         );
  DFFSR \o_m2_reg[1]  ( .D(n814), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m2[1])
         );
  DFFSR \o_m2_reg[0]  ( .D(n815), .CLK(clk), .R(n587), .S(1'b1), .Q(n930) );
  DFFSR \o_m2_reg[6]  ( .D(n816), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m2[6])
         );
  DFFSR \o_m25_reg[7]  ( .D(n625), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m25[7])
         );
  DFFSR \o_m25_reg[6]  ( .D(n626), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m25[6])
         );
  DFFSR \o_m25_reg[4]  ( .D(n627), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m25[4])
         );
  DFFSR \o_m25_reg[3]  ( .D(n628), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m25[3])
         );
  DFFSR \o_m25_reg[2]  ( .D(n629), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m25[2])
         );
  DFFSR \o_m25_reg[1]  ( .D(n630), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m25[1])
         );
  DFFSR \o_m25_reg[0]  ( .D(n631), .CLK(clk), .R(n587), .S(1'b1), .Q(n971) );
  DFFSR \o_m25_reg[5]  ( .D(n632), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m25[5])
         );
  DFFSR \o_m24_reg[7]  ( .D(n633), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m24[7])
         );
  DFFSR \o_m24_reg[5]  ( .D(n634), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m24[5])
         );
  DFFSR \o_m24_reg[4]  ( .D(n635), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m24[4])
         );
  DFFSR \o_m24_reg[3]  ( .D(n636), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m24[3])
         );
  DFFSR \o_m24_reg[2]  ( .D(n637), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m24[2])
         );
  DFFSR \o_m24_reg[1]  ( .D(n638), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m24[1])
         );
  DFFSR \o_m24_reg[0]  ( .D(n639), .CLK(clk), .R(n581), .S(1'b1), .Q(n970) );
  DFFSR \o_m24_reg[6]  ( .D(n640), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m24[6])
         );
  DFFSR \o_m22_reg[7]  ( .D(n649), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m22[7])
         );
  DFFSR \o_m22_reg[5]  ( .D(n650), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m22[5])
         );
  DFFSR \o_m22_reg[4]  ( .D(n651), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m22[4])
         );
  DFFSR \o_m22_reg[3]  ( .D(n652), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m22[3])
         );
  DFFSR \o_m22_reg[2]  ( .D(n653), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m22[2])
         );
  DFFSR \o_m22_reg[1]  ( .D(n654), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m22[1])
         );
  DFFSR \o_m22_reg[0]  ( .D(n655), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m22[0])
         );
  DFFSR \o_m22_reg[6]  ( .D(n656), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m22[6])
         );
  DFFSR \o_m20_reg[7]  ( .D(n665), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m20[7])
         );
  DFFSR \o_m20_reg[5]  ( .D(n666), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m20[5])
         );
  DFFSR \o_m20_reg[4]  ( .D(n667), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m20[4])
         );
  DFFSR \o_m20_reg[3]  ( .D(n668), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m20[3])
         );
  DFFSR \o_m20_reg[2]  ( .D(n669), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m20[2])
         );
  DFFSR \o_m20_reg[1]  ( .D(n670), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m20[1])
         );
  DFFSR \o_m20_reg[0]  ( .D(n671), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m20[0])
         );
  DFFSR \o_m20_reg[6]  ( .D(n672), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m20[6])
         );
  DFFSR \o_m18_reg[7]  ( .D(n681), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m18[7])
         );
  DFFSR \o_m18_reg[5]  ( .D(n682), .CLK(clk), .R(n824), .S(1'b1), .Q(o_m18[5])
         );
  DFFSR \o_m18_reg[4]  ( .D(n683), .CLK(clk), .R(n824), .S(1'b1), .Q(o_m18[4])
         );
  DFFSR \o_m18_reg[3]  ( .D(n684), .CLK(clk), .R(n824), .S(1'b1), .Q(o_m18[3])
         );
  DFFSR \o_m18_reg[2]  ( .D(n685), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m18[2])
         );
  DFFSR \o_m18_reg[1]  ( .D(n686), .CLK(clk), .R(n823), .S(1'b1), .Q(n966) );
  DFFSR \o_m18_reg[0]  ( .D(n687), .CLK(clk), .R(n823), .S(1'b1), .Q(n967) );
  DFFSR \o_m18_reg[6]  ( .D(n688), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m18[6])
         );
  DFFSR \o_m23_reg[7]  ( .D(n641), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m23[7])
         );
  DFFSR \o_m23_reg[5]  ( .D(n642), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m23[5])
         );
  DFFSR \o_m23_reg[4]  ( .D(n643), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m23[4])
         );
  DFFSR \o_m23_reg[3]  ( .D(n644), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m23[3])
         );
  DFFSR \o_m23_reg[2]  ( .D(n645), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m23[2])
         );
  DFFSR \o_m23_reg[1]  ( .D(n646), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m23[1])
         );
  DFFSR \o_m23_reg[0]  ( .D(n647), .CLK(clk), .R(n823), .S(1'b1), .Q(n969) );
  DFFSR \o_m23_reg[6]  ( .D(n648), .CLK(clk), .R(n823), .S(1'b1), .Q(o_m23[6])
         );
  DFFSR \o_m21_reg[7]  ( .D(n657), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m21[7])
         );
  DFFSR \o_m21_reg[5]  ( .D(n658), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m21[5])
         );
  DFFSR \o_m21_reg[4]  ( .D(n659), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m21[4])
         );
  DFFSR \o_m21_reg[3]  ( .D(n660), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m21[3])
         );
  DFFSR \o_m21_reg[2]  ( .D(n661), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m21[2])
         );
  DFFSR \o_m21_reg[1]  ( .D(n662), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m21[1])
         );
  DFFSR \o_m21_reg[0]  ( .D(n663), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m21[0])
         );
  DFFSR \o_m21_reg[6]  ( .D(n664), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m21[6])
         );
  DFFSR \o_m19_reg[7]  ( .D(n673), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m19[7])
         );
  DFFSR \o_m19_reg[5]  ( .D(n674), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m19[5])
         );
  DFFSR \o_m19_reg[4]  ( .D(n675), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m19[4])
         );
  DFFSR \o_m19_reg[3]  ( .D(n676), .CLK(clk), .R(n822), .S(1'b1), .Q(o_m19[3])
         );
  DFFSR \o_m19_reg[2]  ( .D(n677), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m19[2])
         );
  DFFSR \o_m19_reg[1]  ( .D(n678), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m19[1])
         );
  DFFSR \o_m19_reg[0]  ( .D(n679), .CLK(clk), .R(n821), .S(1'b1), .Q(n968) );
  DFFSR \o_m19_reg[6]  ( .D(n680), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m19[6])
         );
  DFFSR \o_m17_reg[7]  ( .D(n689), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m17[7])
         );
  DFFSR \o_m17_reg[5]  ( .D(n690), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m17[5])
         );
  DFFSR \o_m17_reg[4]  ( .D(n691), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m17[4])
         );
  DFFSR \o_m17_reg[3]  ( .D(n692), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m17[3])
         );
  DFFSR \o_m17_reg[2]  ( .D(n693), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m17[2])
         );
  DFFSR \o_m17_reg[1]  ( .D(n694), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m17[1])
         );
  DFFSR \o_m17_reg[0]  ( .D(n695), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m17[0])
         );
  DFFSR \o_m17_reg[6]  ( .D(n696), .CLK(clk), .R(n821), .S(1'b1), .Q(o_m17[6])
         );
  DFFSR \o_m16_reg[7]  ( .D(n697), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m16[7])
         );
  DFFSR \o_m16_reg[5]  ( .D(n698), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m16[5])
         );
  DFFSR \o_m16_reg[4]  ( .D(n699), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m16[4])
         );
  DFFSR \o_m16_reg[3]  ( .D(n700), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m16[3])
         );
  DFFSR \o_m16_reg[2]  ( .D(n701), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m16[2])
         );
  DFFSR \o_m16_reg[1]  ( .D(n702), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m16[1])
         );
  DFFSR \o_m16_reg[0]  ( .D(n703), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m16[0])
         );
  DFFSR \o_m16_reg[6]  ( .D(n704), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m16[6])
         );
  DFFSR \o_m14_reg[7]  ( .D(n713), .CLK(clk), .R(n820), .S(1'b1), .Q(n955) );
  DFFSR \o_m14_reg[5]  ( .D(n714), .CLK(clk), .R(n820), .S(1'b1), .Q(n957) );
  DFFSR \o_m14_reg[4]  ( .D(n715), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m14[4])
         );
  DFFSR \o_m14_reg[3]  ( .D(n716), .CLK(clk), .R(n820), .S(1'b1), .Q(o_m14[3])
         );
  DFFSR \o_m14_reg[2]  ( .D(n717), .CLK(clk), .R(n819), .S(1'b1), .Q(n958) );
  DFFSR \o_m14_reg[1]  ( .D(n718), .CLK(clk), .R(n819), .S(1'b1), .Q(n959) );
  DFFSR \o_m14_reg[0]  ( .D(n719), .CLK(clk), .R(n819), .S(1'b1), .Q(n960) );
  DFFSR \o_m14_reg[6]  ( .D(n720), .CLK(clk), .R(n819), .S(1'b1), .Q(n956) );
  DFFSR \o_m12_reg[7]  ( .D(n729), .CLK(clk), .R(n819), .S(1'b1), .Q(o_m12[7])
         );
  DFFSR \o_m12_reg[6]  ( .D(n730), .CLK(clk), .R(n819), .S(1'b1), .Q(o_m12[6])
         );
  DFFSR \o_m12_reg[5]  ( .D(n731), .CLK(clk), .R(n819), .S(1'b1), .Q(o_m12[5])
         );
  DFFSR \o_m12_reg[4]  ( .D(n732), .CLK(clk), .R(n819), .S(1'b1), .Q(o_m12[4])
         );
  DFFSR \o_m12_reg[3]  ( .D(n733), .CLK(clk), .R(n819), .S(1'b1), .Q(o_m12[3])
         );
  DFFSR \o_m12_reg[2]  ( .D(n734), .CLK(clk), .R(n819), .S(1'b1), .Q(o_m12[2])
         );
  DFFSR \o_m12_reg[0]  ( .D(n735), .CLK(clk), .R(n819), .S(1'b1), .Q(n954) );
  DFFSR \o_m12_reg[1]  ( .D(n736), .CLK(clk), .R(n818), .S(1'b1), .Q(n953) );
  DFFSR \o_m10_reg[7]  ( .D(n745), .CLK(clk), .R(n818), .S(1'b1), .Q(o_m10[7])
         );
  DFFSR \o_m10_reg[5]  ( .D(n746), .CLK(clk), .R(n818), .S(1'b1), .Q(o_m10[5])
         );
  DFFSR \o_m10_reg[4]  ( .D(n747), .CLK(clk), .R(n818), .S(1'b1), .Q(o_m10[4])
         );
  DFFSR \o_m10_reg[3]  ( .D(n748), .CLK(clk), .R(n818), .S(1'b1), .Q(o_m10[3])
         );
  DFFSR \o_m10_reg[2]  ( .D(n749), .CLK(clk), .R(n818), .S(1'b1), .Q(o_m10[2])
         );
  DFFSR \o_m10_reg[1]  ( .D(n750), .CLK(clk), .R(n818), .S(1'b1), .Q(o_m10[1])
         );
  DFFSR \o_m10_reg[0]  ( .D(n751), .CLK(clk), .R(n818), .S(1'b1), .Q(n951) );
  DFFSR \o_m10_reg[6]  ( .D(n752), .CLK(clk), .R(n818), .S(1'b1), .Q(o_m10[6])
         );
  DFFSR \o_m8_reg[7]  ( .D(n761), .CLK(clk), .R(n818), .S(1'b1), .Q(n940) );
  DFFSR \o_m8_reg[5]  ( .D(n762), .CLK(clk), .R(n818), .S(1'b1), .Q(n942) );
  DFFSR \o_m8_reg[4]  ( .D(n763), .CLK(clk), .R(n818), .S(1'b1), .Q(o_m8[4])
         );
  DFFSR \o_m8_reg[3]  ( .D(n764), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m8[3])
         );
  DFFSR \o_m8_reg[2]  ( .D(n765), .CLK(clk), .R(n817), .S(1'b1), .Q(n943) );
  DFFSR \o_m8_reg[1]  ( .D(n766), .CLK(clk), .R(n817), .S(1'b1), .Q(n944) );
  DFFSR \o_m8_reg[0]  ( .D(n767), .CLK(clk), .R(n817), .S(1'b1), .Q(n945) );
  DFFSR \o_m8_reg[6]  ( .D(n768), .CLK(clk), .R(n817), .S(1'b1), .Q(n941) );
  DFFSR \o_m7_reg[7]  ( .D(n769), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m7[7])
         );
  DFFSR \o_m7_reg[5]  ( .D(n770), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m7[5])
         );
  DFFSR \o_m7_reg[4]  ( .D(n771), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m7[4])
         );
  DFFSR \o_m7_reg[3]  ( .D(n772), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m7[3])
         );
  DFFSR \o_m7_reg[2]  ( .D(n773), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m7[2])
         );
  DFFSR \o_m7_reg[1]  ( .D(n774), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m7[1])
         );
  DFFSR \o_m7_reg[0]  ( .D(n775), .CLK(clk), .R(n817), .S(1'b1), .Q(n939) );
  DFFSR \o_m7_reg[6]  ( .D(n776), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m7[6])
         );
  DFFSR \o_m3_reg[7]  ( .D(n801), .CLK(clk), .R(n615), .S(1'b1), .Q(n931) );
  DFFSR \o_m3_reg[5]  ( .D(n802), .CLK(clk), .R(n615), .S(1'b1), .Q(n933) );
  DFFSR \o_m3_reg[4]  ( .D(n803), .CLK(clk), .R(n615), .S(1'b1), .Q(n934) );
  DFFSR \o_m3_reg[3]  ( .D(n804), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m3[3])
         );
  DFFSR \o_m3_reg[2]  ( .D(n805), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m3[2])
         );
  DFFSR \o_m3_reg[1]  ( .D(n806), .CLK(clk), .R(n615), .S(1'b1), .Q(n935) );
  DFFSR \o_m3_reg[0]  ( .D(n807), .CLK(clk), .R(n615), .S(1'b1), .Q(n936) );
  DFFSR \o_m3_reg[6]  ( .D(n808), .CLK(clk), .R(n615), .S(1'b1), .Q(n932) );
  DFFSR \o_m9_reg[7]  ( .D(n753), .CLK(clk), .R(n615), .S(1'b1), .Q(n946) );
  DFFSR \o_m9_reg[5]  ( .D(n754), .CLK(clk), .R(n615), .S(1'b1), .Q(n948) );
  DFFSR \o_m9_reg[4]  ( .D(n755), .CLK(clk), .R(n615), .S(1'b1), .Q(n949) );
  DFFSR \o_m9_reg[3]  ( .D(n756), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m9[3])
         );
  DFFSR \o_m9_reg[2]  ( .D(n757), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m9[2])
         );
  DFFSR \o_m9_reg[1]  ( .D(n758), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m9[1])
         );
  DFFSR \o_m9_reg[0]  ( .D(n759), .CLK(clk), .R(n609), .S(1'b1), .Q(n950) );
  DFFSR \o_m9_reg[6]  ( .D(n760), .CLK(clk), .R(n819), .S(1'b1), .Q(n947) );
  DFFSR o_full_reg ( .D(next_full), .CLK(clk), .R(n578), .S(1'b1), .Q(o_full)
         );
  AND2X2 U211 ( .A(n252), .B(n253), .Y(n251) );
  AND2X2 U212 ( .A(n526), .B(n241), .Y(next[4]) );
  AND2X2 U213 ( .A(n526), .B(n240), .Y(next[1]) );
  AND2X2 U215 ( .A(n318), .B(n331), .Y(n330) );
  AND2X2 U216 ( .A(n242), .B(n306), .Y(n362) );
  AND2X2 U217 ( .A(n290), .B(n323), .Y(n253) );
  AND2X2 U218 ( .A(n369), .B(n309), .Y(n246) );
  AND2X2 U228 ( .A(n360), .B(n468), .Y(n412) );
  AND2X2 U236 ( .A(n361), .B(n468), .Y(n487) );
  AND2X2 U238 ( .A(n361), .B(n391), .Y(n497) );
  AND2X2 U239 ( .A(curr[4]), .B(n929), .Y(n361) );
  AND2X2 U242 ( .A(n570), .B(curr[3]), .Y(n353) );
  AND2X2 U244 ( .A(n589), .B(n225), .Y(n354) );
  AND2X2 U247 ( .A(n570), .B(n928), .Y(n364) );
  AND2X2 U248 ( .A(n589), .B(curr[2]), .Y(n570) );
  AND2X2 U250 ( .A(n589), .B(n402), .Y(n363) );
  NOR2X1 U280 ( .A(n238), .B(n239), .Y(next_full) );
  NAND3X1 U281 ( .A(n915), .B(n913), .C(n910), .Y(n239) );
  NAND3X1 U282 ( .A(n240), .B(n241), .C(n911), .Y(n238) );
  NAND2X1 U283 ( .A(n526), .B(n242), .Y(next_empty) );
  OAI21X1 U284 ( .A(n244), .B(n245), .C(n526), .Y(n243) );
  NAND3X1 U285 ( .A(n923), .B(n246), .C(n917), .Y(n245) );
  NAND3X1 U286 ( .A(n249), .B(n389), .C(n251), .Y(n244) );
  NAND3X1 U287 ( .A(n254), .B(n255), .C(n256), .Y(n241) );
  NOR2X1 U288 ( .A(n257), .B(n258), .Y(n256) );
  NAND2X1 U289 ( .A(n259), .B(n260), .Y(n258) );
  NAND3X1 U290 ( .A(n249), .B(n389), .C(n261), .Y(n257) );
  NOR2X1 U291 ( .A(n262), .B(n263), .Y(n255) );
  NOR2X1 U292 ( .A(n912), .B(n264), .Y(n254) );
  NOR2X1 U293 ( .A(i_clear), .B(n915), .Y(next[3]) );
  NOR2X1 U295 ( .A(n270), .B(n271), .Y(n269) );
  OAI21X1 U296 ( .A(n928), .B(n389), .C(n272), .Y(n271) );
  NAND2X1 U297 ( .A(n517), .B(n274), .Y(n270) );
  NOR2X1 U298 ( .A(n275), .B(n276), .Y(n268) );
  NOR2X1 U299 ( .A(n277), .B(n247), .Y(n267) );
  NAND3X1 U300 ( .A(n278), .B(n279), .C(n918), .Y(n247) );
  NOR2X1 U301 ( .A(i_clear), .B(n913), .Y(next[2]) );
  NAND3X1 U302 ( .A(n282), .B(n283), .C(n284), .Y(n281) );
  NOR2X1 U303 ( .A(n285), .B(n286), .Y(n284) );
  NAND3X1 U304 ( .A(n287), .B(n288), .C(n924), .Y(n286) );
  NAND3X1 U305 ( .A(n290), .B(n279), .C(n505), .Y(n285) );
  NOR2X1 U306 ( .A(n213), .B(n292), .Y(n283) );
  OAI21X1 U307 ( .A(n293), .B(n294), .C(n295), .Y(n292) );
  NOR2X1 U308 ( .A(n296), .B(n297), .Y(n282) );
  OAI21X1 U309 ( .A(n218), .B(n389), .C(n265), .Y(n297) );
  NOR2X1 U310 ( .A(n212), .B(n298), .Y(n265) );
  OAI21X1 U311 ( .A(n293), .B(n261), .C(n299), .Y(n298) );
  NAND3X1 U312 ( .A(n300), .B(n301), .C(n302), .Y(n240) );
  NOR2X1 U313 ( .A(n303), .B(n304), .Y(n302) );
  NAND2X1 U314 ( .A(n305), .B(n306), .Y(n304) );
  NAND3X1 U315 ( .A(n499), .B(n308), .C(n309), .Y(n303) );
  AOI21X1 U316 ( .A(n914), .B(n341), .C(n310), .Y(n301) );
  NAND2X1 U317 ( .A(n311), .B(n367), .Y(n310) );
  NOR2X1 U318 ( .A(n264), .B(n296), .Y(n300) );
  NAND3X1 U319 ( .A(n313), .B(n314), .C(n315), .Y(n296) );
  NOR2X1 U320 ( .A(n316), .B(n317), .Y(n315) );
  OAI21X1 U321 ( .A(n293), .B(n318), .C(n319), .Y(n317) );
  NAND3X1 U322 ( .A(n278), .B(n322), .C(n323), .Y(n316) );
  NOR2X1 U323 ( .A(n324), .B(n325), .Y(n314) );
  NAND2X1 U324 ( .A(n326), .B(n327), .Y(n325) );
  NOR2X1 U325 ( .A(n214), .B(n328), .Y(n313) );
  OAI21X1 U326 ( .A(n293), .B(n367), .C(n274), .Y(n328) );
  NAND3X1 U327 ( .A(n508), .B(n252), .C(n330), .Y(n264) );
  NOR2X1 U328 ( .A(i_clear), .B(n911), .Y(next[0]) );
  OAI21X1 U329 ( .A(n920), .B(n389), .C(n333), .Y(n332) );
  NAND2X1 U330 ( .A(i_save), .B(n921), .Y(n333) );
  NAND3X1 U331 ( .A(n335), .B(n336), .C(n337), .Y(n250) );
  NOR2X1 U332 ( .A(n338), .B(n339), .Y(n337) );
  NAND3X1 U333 ( .A(n334), .B(n919), .C(n340), .Y(n339) );
  NOR2X1 U334 ( .A(n275), .B(n263), .Y(n340) );
  NAND2X1 U335 ( .A(n513), .B(n272), .Y(n263) );
  NAND2X1 U336 ( .A(n916), .B(n508), .Y(n275) );
  NAND2X1 U337 ( .A(n505), .B(n504), .Y(n262) );
  NAND2X1 U338 ( .A(n342), .B(n311), .Y(n276) );
  NOR2X1 U339 ( .A(n343), .B(n344), .Y(n334) );
  NAND3X1 U340 ( .A(n318), .B(n261), .C(n345), .Y(n344) );
  NOR2X1 U341 ( .A(n248), .B(n277), .Y(n345) );
  NAND3X1 U342 ( .A(n346), .B(n347), .C(n348), .Y(n277) );
  NOR2X1 U343 ( .A(n349), .B(n350), .Y(n348) );
  NAND2X1 U344 ( .A(n351), .B(n299), .Y(n350) );
  NAND2X1 U345 ( .A(n922), .B(n909), .Y(n299) );
  AOI22X1 U346 ( .A(n922), .B(n225), .C(n925), .D(n225), .Y(n351) );
  NAND3X1 U347 ( .A(n287), .B(n305), .C(n327), .Y(n349) );
  NAND2X1 U348 ( .A(n352), .B(n353), .Y(n327) );
  NAND2X1 U349 ( .A(n352), .B(n354), .Y(n305) );
  NAND2X1 U350 ( .A(n355), .B(n353), .Y(n287) );
  NOR2X1 U351 ( .A(n289), .B(n356), .Y(n347) );
  OAI21X1 U352 ( .A(n357), .B(n367), .C(n326), .Y(n356) );
  NAND2X1 U353 ( .A(n925), .B(n909), .Y(n326) );
  NOR2X1 U354 ( .A(n294), .B(n358), .Y(n289) );
  AOI21X1 U355 ( .A(n355), .B(n354), .C(n359), .Y(n346) );
  OAI21X1 U356 ( .A(n357), .B(n294), .C(n926), .Y(n359) );
  NOR2X1 U357 ( .A(n312), .B(n358), .Y(n324) );
  NAND3X1 U358 ( .A(n294), .B(n367), .C(n260), .Y(n248) );
  NAND2X1 U359 ( .A(n355), .B(n908), .Y(n260) );
  NAND2X1 U360 ( .A(n352), .B(n360), .Y(n312) );
  NAND2X1 U361 ( .A(n355), .B(n360), .Y(n294) );
  NAND2X1 U362 ( .A(n355), .B(n361), .Y(n261) );
  NAND2X1 U363 ( .A(n352), .B(n361), .Y(n318) );
  NAND3X1 U364 ( .A(n321), .B(n288), .C(n362), .Y(n343) );
  NAND2X1 U365 ( .A(n352), .B(n363), .Y(n306) );
  NAND2X1 U366 ( .A(n355), .B(n363), .Y(n242) );
  NAND2X1 U367 ( .A(n355), .B(n364), .Y(n288) );
  NOR2X1 U368 ( .A(curr[0]), .B(curr[1]), .Y(n355) );
  NAND2X1 U369 ( .A(n352), .B(n364), .Y(n321) );
  NOR2X1 U370 ( .A(n927), .B(curr[0]), .Y(n352) );
  NAND3X1 U371 ( .A(n246), .B(n253), .C(n365), .Y(n338) );
  NOR2X1 U372 ( .A(n280), .B(n366), .Y(n365) );
  NAND2X1 U373 ( .A(n514), .B(n331), .Y(n366) );
  NAND2X1 U374 ( .A(n368), .B(n499), .Y(n280) );
  NOR2X1 U375 ( .A(n370), .B(n371), .Y(n336) );
  NAND2X1 U376 ( .A(n279), .B(n322), .Y(n371) );
  NAND3X1 U377 ( .A(n252), .B(n249), .C(n308), .Y(n370) );
  NOR2X1 U378 ( .A(n372), .B(n373), .Y(n335) );
  NAND2X1 U379 ( .A(n259), .B(n517), .Y(n373) );
  NAND3X1 U380 ( .A(n295), .B(n278), .C(n274), .Y(n372) );
  OAI21X1 U381 ( .A(n308), .B(n553), .C(n375), .Y(n617) );
  NAND2X1 U382 ( .A(o_m1[7]), .B(n883), .Y(n375) );
  OAI21X1 U383 ( .A(n308), .B(n550), .C(n378), .Y(n618) );
  NAND2X1 U384 ( .A(o_m1[6]), .B(n883), .Y(n378) );
  OAI21X1 U385 ( .A(n308), .B(n544), .C(n380), .Y(n619) );
  NAND2X1 U386 ( .A(o_m1[4]), .B(n883), .Y(n380) );
  OAI21X1 U387 ( .A(n308), .B(n541), .C(n382), .Y(n620) );
  NAND2X1 U388 ( .A(o_m1[3]), .B(n883), .Y(n382) );
  OAI21X1 U389 ( .A(n308), .B(n535), .C(n384), .Y(n621) );
  NAND2X1 U390 ( .A(o_m1[2]), .B(n883), .Y(n384) );
  OAI21X1 U391 ( .A(n308), .B(n533), .C(n386), .Y(n622) );
  NAND2X1 U392 ( .A(o_m1[1]), .B(n883), .Y(n386) );
  OAI21X1 U395 ( .A(n308), .B(n532), .C(n390), .Y(n624) );
  NAND2X1 U396 ( .A(o_m1[5]), .B(n883), .Y(n390) );
  OAI21X1 U398 ( .A(n553), .B(n252), .C(n392), .Y(n625) );
  NAND2X1 U399 ( .A(o_m25[7]), .B(n907), .Y(n392) );
  OAI21X1 U400 ( .A(n550), .B(n252), .C(n394), .Y(n626) );
  NAND2X1 U401 ( .A(o_m25[6]), .B(n907), .Y(n394) );
  OAI21X1 U402 ( .A(n544), .B(n252), .C(n395), .Y(n627) );
  NAND2X1 U403 ( .A(o_m25[4]), .B(n907), .Y(n395) );
  OAI21X1 U404 ( .A(n541), .B(n252), .C(n396), .Y(n628) );
  NAND2X1 U405 ( .A(o_m25[3]), .B(n907), .Y(n396) );
  OAI21X1 U406 ( .A(n535), .B(n252), .C(n397), .Y(n629) );
  NAND2X1 U407 ( .A(o_m25[2]), .B(n907), .Y(n397) );
  OAI21X1 U408 ( .A(n533), .B(n252), .C(n398), .Y(n630) );
  NAND2X1 U409 ( .A(o_m25[1]), .B(n907), .Y(n398) );
  OAI21X1 U412 ( .A(n532), .B(n252), .C(n400), .Y(n632) );
  NAND2X1 U413 ( .A(o_m25[5]), .B(n907), .Y(n400) );
  NAND3X1 U415 ( .A(n402), .B(curr[5]), .C(curr[4]), .Y(n401) );
  OAI21X1 U416 ( .A(n553), .B(n249), .C(n403), .Y(n633) );
  NAND2X1 U417 ( .A(o_m24[7]), .B(n906), .Y(n403) );
  OAI21X1 U418 ( .A(n532), .B(n249), .C(n405), .Y(n634) );
  NAND2X1 U419 ( .A(o_m24[5]), .B(n906), .Y(n405) );
  OAI21X1 U420 ( .A(n544), .B(n249), .C(n406), .Y(n635) );
  NAND2X1 U421 ( .A(o_m24[4]), .B(n906), .Y(n406) );
  OAI21X1 U422 ( .A(n541), .B(n249), .C(n407), .Y(n636) );
  NAND2X1 U423 ( .A(o_m24[3]), .B(n906), .Y(n407) );
  OAI21X1 U424 ( .A(n535), .B(n249), .C(n408), .Y(n637) );
  NAND2X1 U425 ( .A(o_m24[2]), .B(n906), .Y(n408) );
  OAI21X1 U426 ( .A(n533), .B(n249), .C(n409), .Y(n638) );
  NAND2X1 U427 ( .A(o_m24[1]), .B(n906), .Y(n409) );
  OAI21X1 U430 ( .A(n550), .B(n249), .C(n411), .Y(n640) );
  NAND2X1 U431 ( .A(o_m24[6]), .B(n906), .Y(n411) );
  OAI21X1 U433 ( .A(n553), .B(n278), .C(n413), .Y(n641) );
  NAND2X1 U434 ( .A(o_m23[7]), .B(n905), .Y(n413) );
  OAI21X1 U435 ( .A(n532), .B(n278), .C(n415), .Y(n642) );
  NAND2X1 U436 ( .A(o_m23[5]), .B(n905), .Y(n415) );
  OAI21X1 U437 ( .A(n544), .B(n278), .C(n416), .Y(n643) );
  NAND2X1 U438 ( .A(o_m23[4]), .B(n905), .Y(n416) );
  OAI21X1 U439 ( .A(n541), .B(n278), .C(n417), .Y(n644) );
  NAND2X1 U440 ( .A(o_m23[3]), .B(n905), .Y(n417) );
  OAI21X1 U441 ( .A(n535), .B(n278), .C(n418), .Y(n645) );
  NAND2X1 U442 ( .A(o_m23[2]), .B(n905), .Y(n418) );
  OAI21X1 U447 ( .A(n550), .B(n278), .C(n421), .Y(n648) );
  NAND2X1 U448 ( .A(o_m23[6]), .B(n905), .Y(n421) );
  OAI21X1 U450 ( .A(n553), .B(n279), .C(n423), .Y(n649) );
  NAND2X1 U451 ( .A(o_m22[7]), .B(n904), .Y(n423) );
  OAI21X1 U452 ( .A(n532), .B(n279), .C(n425), .Y(n650) );
  NAND2X1 U453 ( .A(o_m22[5]), .B(n904), .Y(n425) );
  OAI21X1 U454 ( .A(n544), .B(n279), .C(n426), .Y(n651) );
  NAND2X1 U455 ( .A(o_m22[4]), .B(n904), .Y(n426) );
  OAI21X1 U456 ( .A(n541), .B(n279), .C(n427), .Y(n652) );
  NAND2X1 U457 ( .A(o_m22[3]), .B(n904), .Y(n427) );
  OAI21X1 U458 ( .A(n535), .B(n279), .C(n428), .Y(n653) );
  NAND2X1 U459 ( .A(o_m22[2]), .B(n904), .Y(n428) );
  OAI21X1 U460 ( .A(n533), .B(n279), .C(n429), .Y(n654) );
  NAND2X1 U461 ( .A(o_m22[1]), .B(n904), .Y(n429) );
  OAI21X1 U464 ( .A(n550), .B(n279), .C(n431), .Y(n656) );
  NAND2X1 U465 ( .A(o_m22[6]), .B(n904), .Y(n431) );
  OAI21X1 U467 ( .A(n553), .B(n499), .C(n432), .Y(n657) );
  NAND2X1 U468 ( .A(o_m21[7]), .B(n903), .Y(n432) );
  OAI21X1 U469 ( .A(n532), .B(n499), .C(n434), .Y(n658) );
  NAND2X1 U470 ( .A(o_m21[5]), .B(n903), .Y(n434) );
  OAI21X1 U471 ( .A(n544), .B(n499), .C(n435), .Y(n659) );
  NAND2X1 U472 ( .A(o_m21[4]), .B(n903), .Y(n435) );
  OAI21X1 U473 ( .A(n541), .B(n499), .C(n436), .Y(n660) );
  NAND2X1 U474 ( .A(o_m21[3]), .B(n903), .Y(n436) );
  OAI21X1 U475 ( .A(n535), .B(n499), .C(n437), .Y(n661) );
  NAND2X1 U476 ( .A(o_m21[2]), .B(n903), .Y(n437) );
  OAI21X1 U477 ( .A(n533), .B(n499), .C(n438), .Y(n662) );
  NAND2X1 U478 ( .A(o_m21[1]), .B(n903), .Y(n438) );
  OAI21X1 U481 ( .A(n550), .B(n499), .C(n440), .Y(n664) );
  NAND2X1 U482 ( .A(o_m21[6]), .B(n903), .Y(n440) );
  OAI21X1 U484 ( .A(n553), .B(n368), .C(n441), .Y(n665) );
  NAND2X1 U485 ( .A(o_m20[7]), .B(n902), .Y(n441) );
  OAI21X1 U486 ( .A(n532), .B(n368), .C(n443), .Y(n666) );
  NAND2X1 U487 ( .A(o_m20[5]), .B(n902), .Y(n443) );
  OAI21X1 U488 ( .A(n544), .B(n368), .C(n444), .Y(n667) );
  NAND2X1 U489 ( .A(o_m20[4]), .B(n902), .Y(n444) );
  OAI21X1 U490 ( .A(n541), .B(n368), .C(n445), .Y(n668) );
  NAND2X1 U491 ( .A(o_m20[3]), .B(n902), .Y(n445) );
  OAI21X1 U492 ( .A(n535), .B(n368), .C(n446), .Y(n669) );
  NAND2X1 U493 ( .A(o_m20[2]), .B(n902), .Y(n446) );
  OAI21X1 U494 ( .A(n533), .B(n368), .C(n447), .Y(n670) );
  NAND2X1 U495 ( .A(o_m20[1]), .B(n902), .Y(n447) );
  OAI21X1 U498 ( .A(n550), .B(n368), .C(n449), .Y(n672) );
  NAND2X1 U499 ( .A(o_m20[6]), .B(n902), .Y(n449) );
  OAI21X1 U501 ( .A(n553), .B(n323), .C(n450), .Y(n673) );
  NAND2X1 U502 ( .A(o_m19[7]), .B(n901), .Y(n450) );
  OAI21X1 U503 ( .A(n532), .B(n323), .C(n452), .Y(n674) );
  NAND2X1 U504 ( .A(o_m19[5]), .B(n901), .Y(n452) );
  OAI21X1 U505 ( .A(n544), .B(n323), .C(n453), .Y(n675) );
  NAND2X1 U506 ( .A(o_m19[4]), .B(n901), .Y(n453) );
  OAI21X1 U507 ( .A(n541), .B(n323), .C(n454), .Y(n676) );
  NAND2X1 U508 ( .A(o_m19[3]), .B(n901), .Y(n454) );
  OAI21X1 U509 ( .A(n535), .B(n323), .C(n455), .Y(n677) );
  NAND2X1 U510 ( .A(o_m19[2]), .B(n901), .Y(n455) );
  OAI21X1 U515 ( .A(n550), .B(n323), .C(n458), .Y(n680) );
  NAND2X1 U516 ( .A(o_m19[6]), .B(n901), .Y(n458) );
  OAI21X1 U518 ( .A(n553), .B(n290), .C(n459), .Y(n681) );
  NAND2X1 U519 ( .A(o_m18[7]), .B(n900), .Y(n459) );
  OAI21X1 U520 ( .A(n532), .B(n290), .C(n461), .Y(n682) );
  NAND2X1 U521 ( .A(o_m18[5]), .B(n900), .Y(n461) );
  OAI21X1 U522 ( .A(n544), .B(n290), .C(n462), .Y(n683) );
  NAND2X1 U523 ( .A(o_m18[4]), .B(n900), .Y(n462) );
  OAI21X1 U524 ( .A(n541), .B(n290), .C(n463), .Y(n684) );
  NAND2X1 U525 ( .A(o_m18[3]), .B(n900), .Y(n463) );
  OAI21X1 U526 ( .A(n535), .B(n290), .C(n464), .Y(n685) );
  NAND2X1 U527 ( .A(o_m18[2]), .B(n900), .Y(n464) );
  OAI21X1 U532 ( .A(n550), .B(n290), .C(n467), .Y(n688) );
  NAND2X1 U533 ( .A(o_m18[6]), .B(n900), .Y(n467) );
  OAI21X1 U535 ( .A(n553), .B(n309), .C(n469), .Y(n689) );
  NAND2X1 U536 ( .A(o_m17[7]), .B(n899), .Y(n469) );
  OAI21X1 U537 ( .A(n532), .B(n309), .C(n471), .Y(n690) );
  NAND2X1 U538 ( .A(o_m17[5]), .B(n899), .Y(n471) );
  OAI21X1 U539 ( .A(n544), .B(n309), .C(n472), .Y(n691) );
  NAND2X1 U540 ( .A(o_m17[4]), .B(n899), .Y(n472) );
  OAI21X1 U541 ( .A(n541), .B(n309), .C(n473), .Y(n692) );
  NAND2X1 U542 ( .A(o_m17[3]), .B(n899), .Y(n473) );
  OAI21X1 U543 ( .A(n535), .B(n309), .C(n474), .Y(n693) );
  NAND2X1 U544 ( .A(o_m17[2]), .B(n899), .Y(n474) );
  OAI21X1 U549 ( .A(n550), .B(n309), .C(n477), .Y(n696) );
  NAND2X1 U550 ( .A(o_m17[6]), .B(n899), .Y(n477) );
  NOR2X1 U552 ( .A(n929), .B(curr[4]), .Y(n360) );
  OAI21X1 U553 ( .A(n553), .B(n369), .C(n478), .Y(n697) );
  NAND2X1 U554 ( .A(o_m16[7]), .B(n898), .Y(n478) );
  OAI21X1 U555 ( .A(n532), .B(n369), .C(n480), .Y(n698) );
  NAND2X1 U556 ( .A(o_m16[5]), .B(n898), .Y(n480) );
  OAI21X1 U557 ( .A(n544), .B(n369), .C(n481), .Y(n699) );
  NAND2X1 U558 ( .A(o_m16[4]), .B(n898), .Y(n481) );
  OAI21X1 U559 ( .A(n541), .B(n369), .C(n482), .Y(n700) );
  NAND2X1 U560 ( .A(o_m16[3]), .B(n898), .Y(n482) );
  OAI21X1 U561 ( .A(n535), .B(n369), .C(n483), .Y(n701) );
  NAND2X1 U562 ( .A(o_m16[2]), .B(n898), .Y(n483) );
  OAI21X1 U563 ( .A(n533), .B(n369), .C(n484), .Y(n702) );
  NAND2X1 U564 ( .A(o_m16[1]), .B(n898), .Y(n484) );
  OAI21X1 U567 ( .A(n550), .B(n369), .C(n486), .Y(n704) );
  NAND2X1 U568 ( .A(o_m16[6]), .B(n898), .Y(n486) );
  OAI21X1 U570 ( .A(n553), .B(n504), .C(n488), .Y(n705) );
  NAND2X1 U571 ( .A(o_m15[7]), .B(n897), .Y(n488) );
  OAI21X1 U572 ( .A(n532), .B(n504), .C(n490), .Y(n706) );
  NAND2X1 U573 ( .A(o_m15[5]), .B(n897), .Y(n490) );
  OAI21X1 U574 ( .A(n544), .B(n504), .C(n491), .Y(n707) );
  NAND2X1 U575 ( .A(o_m15[4]), .B(n897), .Y(n491) );
  OAI21X1 U576 ( .A(n541), .B(n504), .C(n492), .Y(n708) );
  NAND2X1 U577 ( .A(o_m15[3]), .B(n897), .Y(n492) );
  OAI21X1 U578 ( .A(n535), .B(n504), .C(n493), .Y(n709) );
  NAND2X1 U579 ( .A(o_m15[2]), .B(n897), .Y(n493) );
  OAI21X1 U584 ( .A(n550), .B(n504), .C(n496), .Y(n712) );
  NAND2X1 U585 ( .A(o_m15[6]), .B(n897), .Y(n496) );
  NAND2X1 U587 ( .A(curr[2]), .B(curr[3]), .Y(n358) );
  OAI21X1 U588 ( .A(n553), .B(n505), .C(n498), .Y(n713) );
  NAND2X1 U589 ( .A(o_m14[7]), .B(n896), .Y(n498) );
  OAI21X1 U590 ( .A(n532), .B(n505), .C(n500), .Y(n714) );
  NAND2X1 U591 ( .A(o_m14[5]), .B(n896), .Y(n500) );
  OAI21X1 U592 ( .A(n544), .B(n505), .C(n501), .Y(n715) );
  NAND2X1 U593 ( .A(o_m14[4]), .B(n896), .Y(n501) );
  OAI21X1 U594 ( .A(n541), .B(n505), .C(n502), .Y(n716) );
  NAND2X1 U595 ( .A(o_m14[3]), .B(n896), .Y(n502) );
  OAI21X1 U596 ( .A(n535), .B(n505), .C(n503), .Y(n717) );
  NAND2X1 U597 ( .A(o_m14[2]), .B(n896), .Y(n503) );
  OAI21X1 U602 ( .A(n550), .B(n505), .C(n506), .Y(n720) );
  NAND2X1 U603 ( .A(o_m14[6]), .B(n896), .Y(n506) );
  OAI21X1 U605 ( .A(n553), .B(n508), .C(n507), .Y(n721) );
  NAND2X1 U606 ( .A(o_m13[7]), .B(n895), .Y(n507) );
  OAI21X1 U607 ( .A(n532), .B(n508), .C(n509), .Y(n722) );
  NAND2X1 U608 ( .A(o_m13[5]), .B(n895), .Y(n509) );
  OAI21X1 U609 ( .A(n544), .B(n508), .C(n510), .Y(n723) );
  NAND2X1 U610 ( .A(o_m13[4]), .B(n895), .Y(n510) );
  OAI21X1 U611 ( .A(n541), .B(n508), .C(n511), .Y(n724) );
  NAND2X1 U612 ( .A(o_m13[3]), .B(n895), .Y(n511) );
  OAI21X1 U613 ( .A(n535), .B(n508), .C(n512), .Y(n725) );
  NAND2X1 U614 ( .A(o_m13[2]), .B(n895), .Y(n512) );
  OAI21X1 U619 ( .A(n550), .B(n508), .C(n515), .Y(n728) );
  NAND2X1 U620 ( .A(o_m13[6]), .B(n895), .Y(n515) );
  OAI21X1 U622 ( .A(n553), .B(n272), .C(n516), .Y(n729) );
  NAND2X1 U623 ( .A(o_m12[7]), .B(n894), .Y(n516) );
  OAI21X1 U624 ( .A(n550), .B(n272), .C(n518), .Y(n730) );
  NAND2X1 U625 ( .A(o_m12[6]), .B(n894), .Y(n518) );
  OAI21X1 U626 ( .A(n532), .B(n272), .C(n519), .Y(n731) );
  NAND2X1 U627 ( .A(o_m12[5]), .B(n894), .Y(n519) );
  OAI21X1 U628 ( .A(n544), .B(n272), .C(n520), .Y(n732) );
  NAND2X1 U629 ( .A(o_m12[4]), .B(n894), .Y(n520) );
  OAI21X1 U630 ( .A(n541), .B(n272), .C(n521), .Y(n733) );
  NAND2X1 U631 ( .A(o_m12[3]), .B(n894), .Y(n521) );
  OAI21X1 U632 ( .A(n535), .B(n272), .C(n522), .Y(n734) );
  NAND2X1 U633 ( .A(o_m12[2]), .B(n894), .Y(n522) );
  OAI21X1 U639 ( .A(n553), .B(n513), .C(n525), .Y(n737) );
  NAND2X1 U640 ( .A(o_m11[7]), .B(n893), .Y(n525) );
  OAI21X1 U641 ( .A(n550), .B(n513), .C(n527), .Y(n738) );
  NAND2X1 U642 ( .A(o_m11[6]), .B(n893), .Y(n527) );
  OAI21X1 U643 ( .A(n532), .B(n513), .C(n528), .Y(n739) );
  NAND2X1 U644 ( .A(o_m11[5]), .B(n893), .Y(n528) );
  OAI21X1 U645 ( .A(n544), .B(n513), .C(n529), .Y(n740) );
  NAND2X1 U646 ( .A(o_m11[4]), .B(n893), .Y(n529) );
  OAI21X1 U647 ( .A(n541), .B(n513), .C(n530), .Y(n741) );
  NAND2X1 U648 ( .A(o_m11[3]), .B(n893), .Y(n530) );
  OAI21X1 U649 ( .A(n535), .B(n513), .C(n531), .Y(n742) );
  NAND2X1 U650 ( .A(o_m11[2]), .B(n893), .Y(n531) );
  NAND2X1 U657 ( .A(curr[2]), .B(n928), .Y(n293) );
  OAI21X1 U658 ( .A(n553), .B(n514), .C(n534), .Y(n745) );
  NAND2X1 U659 ( .A(o_m10[7]), .B(n892), .Y(n534) );
  OAI21X1 U660 ( .A(n532), .B(n514), .C(n536), .Y(n746) );
  NAND2X1 U661 ( .A(o_m10[5]), .B(n892), .Y(n536) );
  OAI21X1 U662 ( .A(n544), .B(n514), .C(n537), .Y(n747) );
  NAND2X1 U663 ( .A(o_m10[4]), .B(n892), .Y(n537) );
  OAI21X1 U664 ( .A(n541), .B(n514), .C(n538), .Y(n748) );
  NAND2X1 U665 ( .A(o_m10[3]), .B(n892), .Y(n538) );
  OAI21X1 U666 ( .A(n535), .B(n514), .C(n539), .Y(n749) );
  NAND2X1 U667 ( .A(o_m10[2]), .B(n892), .Y(n539) );
  OAI21X1 U668 ( .A(n533), .B(n514), .C(n540), .Y(n750) );
  NAND2X1 U669 ( .A(o_m10[1]), .B(n892), .Y(n540) );
  OAI21X1 U672 ( .A(n550), .B(n514), .C(n542), .Y(n752) );
  NAND2X1 U673 ( .A(o_m10[6]), .B(n892), .Y(n542) );
  OAI21X1 U676 ( .A(n553), .B(n331), .C(n543), .Y(n753) );
  NAND2X1 U677 ( .A(o_m9[7]), .B(n891), .Y(n543) );
  OAI21X1 U678 ( .A(n532), .B(n331), .C(n545), .Y(n754) );
  NAND2X1 U679 ( .A(o_m9[5]), .B(n891), .Y(n545) );
  OAI21X1 U680 ( .A(n544), .B(n331), .C(n546), .Y(n755) );
  NAND2X1 U681 ( .A(o_m9[4]), .B(n891), .Y(n546) );
  OAI21X1 U682 ( .A(n541), .B(n331), .C(n547), .Y(n756) );
  NAND2X1 U683 ( .A(o_m9[3]), .B(n891), .Y(n547) );
  OAI21X1 U684 ( .A(n535), .B(n331), .C(n548), .Y(n757) );
  NAND2X1 U685 ( .A(o_m9[2]), .B(n891), .Y(n548) );
  OAI21X1 U686 ( .A(n533), .B(n331), .C(n549), .Y(n758) );
  NAND2X1 U687 ( .A(o_m9[1]), .B(n891), .Y(n549) );
  OAI21X1 U690 ( .A(n550), .B(n331), .C(n551), .Y(n760) );
  NAND2X1 U691 ( .A(o_m9[6]), .B(n891), .Y(n551) );
  OAI21X1 U693 ( .A(n553), .B(n259), .C(n552), .Y(n761) );
  NAND2X1 U694 ( .A(o_m8[7]), .B(n890), .Y(n552) );
  OAI21X1 U695 ( .A(n532), .B(n259), .C(n554), .Y(n762) );
  NAND2X1 U696 ( .A(o_m8[5]), .B(n890), .Y(n554) );
  OAI21X1 U697 ( .A(n544), .B(n259), .C(n555), .Y(n763) );
  NAND2X1 U698 ( .A(o_m8[4]), .B(n890), .Y(n555) );
  OAI21X1 U699 ( .A(n541), .B(n259), .C(n556), .Y(n764) );
  NAND2X1 U700 ( .A(o_m8[3]), .B(n890), .Y(n556) );
  OAI21X1 U701 ( .A(n535), .B(n259), .C(n557), .Y(n765) );
  NAND2X1 U702 ( .A(o_m8[2]), .B(n890), .Y(n557) );
  OAI21X1 U707 ( .A(n550), .B(n259), .C(n560), .Y(n768) );
  NAND2X1 U708 ( .A(o_m8[6]), .B(n890), .Y(n560) );
  OAI21X1 U710 ( .A(n553), .B(n274), .C(n561), .Y(n769) );
  NAND2X1 U711 ( .A(o_m7[7]), .B(n889), .Y(n561) );
  OAI21X1 U712 ( .A(n532), .B(n274), .C(n563), .Y(n770) );
  NAND2X1 U713 ( .A(o_m7[5]), .B(n889), .Y(n563) );
  OAI21X1 U714 ( .A(n544), .B(n274), .C(n564), .Y(n771) );
  NAND2X1 U715 ( .A(o_m7[4]), .B(n889), .Y(n564) );
  OAI21X1 U716 ( .A(n541), .B(n274), .C(n565), .Y(n772) );
  NAND2X1 U717 ( .A(o_m7[3]), .B(n889), .Y(n565) );
  OAI21X1 U718 ( .A(n535), .B(n274), .C(n566), .Y(n773) );
  NAND2X1 U719 ( .A(o_m7[2]), .B(n889), .Y(n566) );
  OAI21X1 U724 ( .A(n550), .B(n274), .C(n569), .Y(n776) );
  NAND2X1 U725 ( .A(o_m7[6]), .B(n889), .Y(n569) );
  OAI21X1 U727 ( .A(n553), .B(n517), .C(n571), .Y(n777) );
  NAND2X1 U728 ( .A(o_m6[7]), .B(n888), .Y(n571) );
  OAI21X1 U729 ( .A(n532), .B(n517), .C(n573), .Y(n778) );
  NAND2X1 U730 ( .A(o_m6[5]), .B(n888), .Y(n573) );
  OAI21X1 U731 ( .A(n544), .B(n517), .C(n574), .Y(n779) );
  NAND2X1 U732 ( .A(o_m6[4]), .B(n888), .Y(n574) );
  OAI21X1 U733 ( .A(n541), .B(n517), .C(n575), .Y(n780) );
  NAND2X1 U734 ( .A(o_m6[3]), .B(n888), .Y(n575) );
  OAI21X1 U735 ( .A(n535), .B(n517), .C(n576), .Y(n781) );
  NAND2X1 U736 ( .A(o_m6[2]), .B(n888), .Y(n576) );
  OAI21X1 U737 ( .A(n533), .B(n517), .C(n577), .Y(n782) );
  NAND2X1 U738 ( .A(o_m6[1]), .B(n888), .Y(n577) );
  OAI21X1 U741 ( .A(n550), .B(n517), .C(n579), .Y(n784) );
  NAND2X1 U742 ( .A(o_m6[6]), .B(n888), .Y(n579) );
  OAI21X1 U745 ( .A(n553), .B(n311), .C(n580), .Y(n785) );
  NAND2X1 U746 ( .A(o_m5[7]), .B(n887), .Y(n580) );
  OAI21X1 U747 ( .A(n532), .B(n311), .C(n582), .Y(n786) );
  NAND2X1 U748 ( .A(o_m5[5]), .B(n887), .Y(n582) );
  OAI21X1 U749 ( .A(n544), .B(n311), .C(n583), .Y(n787) );
  NAND2X1 U750 ( .A(o_m5[4]), .B(n887), .Y(n583) );
  OAI21X1 U751 ( .A(n541), .B(n311), .C(n584), .Y(n788) );
  NAND2X1 U752 ( .A(o_m5[3]), .B(n887), .Y(n584) );
  OAI21X1 U753 ( .A(n535), .B(n311), .C(n585), .Y(n789) );
  NAND2X1 U754 ( .A(o_m5[2]), .B(n887), .Y(n585) );
  OAI21X1 U755 ( .A(n533), .B(n311), .C(n586), .Y(n790) );
  NAND2X1 U756 ( .A(o_m5[1]), .B(n887), .Y(n586) );
  OAI21X1 U759 ( .A(n550), .B(n311), .C(n588), .Y(n792) );
  NAND2X1 U760 ( .A(o_m5[6]), .B(n887), .Y(n588) );
  OAI21X1 U763 ( .A(n553), .B(n342), .C(n590), .Y(n793) );
  NAND2X1 U764 ( .A(o_m4[7]), .B(n886), .Y(n590) );
  OAI21X1 U765 ( .A(n532), .B(n342), .C(n592), .Y(n794) );
  NAND2X1 U766 ( .A(o_m4[5]), .B(n886), .Y(n592) );
  OAI21X1 U767 ( .A(n544), .B(n342), .C(n593), .Y(n795) );
  NAND2X1 U768 ( .A(o_m4[4]), .B(n886), .Y(n593) );
  OAI21X1 U769 ( .A(n541), .B(n342), .C(n594), .Y(n796) );
  NAND2X1 U770 ( .A(o_m4[3]), .B(n886), .Y(n594) );
  OAI21X1 U771 ( .A(n535), .B(n342), .C(n595), .Y(n797) );
  NAND2X1 U772 ( .A(o_m4[2]), .B(n886), .Y(n595) );
  OAI21X1 U773 ( .A(n533), .B(n342), .C(n596), .Y(n798) );
  NAND2X1 U774 ( .A(o_m4[1]), .B(n886), .Y(n596) );
  OAI21X1 U777 ( .A(n550), .B(n342), .C(n598), .Y(n800) );
  NAND2X1 U778 ( .A(o_m4[6]), .B(n886), .Y(n598) );
  OAI21X1 U780 ( .A(n553), .B(n322), .C(n599), .Y(n801) );
  NAND2X1 U781 ( .A(o_m3[7]), .B(n885), .Y(n599) );
  OAI21X1 U782 ( .A(n532), .B(n322), .C(n601), .Y(n802) );
  NAND2X1 U783 ( .A(o_m3[5]), .B(n885), .Y(n601) );
  OAI21X1 U784 ( .A(n544), .B(n322), .C(n602), .Y(n803) );
  NAND2X1 U785 ( .A(o_m3[4]), .B(n885), .Y(n602) );
  OAI21X1 U786 ( .A(n541), .B(n322), .C(n603), .Y(n804) );
  NAND2X1 U787 ( .A(o_m3[3]), .B(n885), .Y(n603) );
  OAI21X1 U788 ( .A(n535), .B(n322), .C(n604), .Y(n805) );
  NAND2X1 U789 ( .A(o_m3[2]), .B(n885), .Y(n604) );
  OAI21X1 U794 ( .A(n550), .B(n322), .C(n607), .Y(n808) );
  NAND2X1 U795 ( .A(o_m3[6]), .B(n885), .Y(n607) );
  NOR2X1 U797 ( .A(n920), .B(n341), .Y(n391) );
  OAI21X1 U798 ( .A(n553), .B(n295), .C(n608), .Y(n809) );
  NAND2X1 U799 ( .A(o_m2[7]), .B(n884), .Y(n608) );
  OAI21X1 U801 ( .A(n532), .B(n295), .C(n610), .Y(n810) );
  NAND2X1 U802 ( .A(o_m2[5]), .B(n884), .Y(n610) );
  OAI21X1 U804 ( .A(n544), .B(n295), .C(n611), .Y(n811) );
  NAND2X1 U805 ( .A(o_m2[4]), .B(n884), .Y(n611) );
  OAI21X1 U807 ( .A(n541), .B(n295), .C(n612), .Y(n812) );
  NAND2X1 U808 ( .A(o_m2[3]), .B(n884), .Y(n612) );
  OAI21X1 U810 ( .A(n535), .B(n295), .C(n613), .Y(n813) );
  NAND2X1 U811 ( .A(o_m2[2]), .B(n884), .Y(n613) );
  OAI21X1 U813 ( .A(n533), .B(n295), .C(n614), .Y(n814) );
  NAND2X1 U814 ( .A(o_m2[1]), .B(n884), .Y(n614) );
  OAI21X1 U819 ( .A(n550), .B(n295), .C(n616), .Y(n816) );
  NAND2X1 U820 ( .A(o_m2[6]), .B(n884), .Y(n616) );
  NOR2X1 U822 ( .A(n927), .B(n920), .Y(n468) );
  NOR2X1 U823 ( .A(curr[3]), .B(curr[2]), .Y(n402) );
  NOR2X1 U824 ( .A(curr[5]), .B(curr[4]), .Y(n589) );
  INVX8 U214 ( .A(n470), .Y(o_m18[0]) );
  INVX1 U219 ( .A(o_m18[1]), .Y(n833) );
  BUFX4 U220 ( .A(n944), .Y(o_m8[1]) );
  INVX4 U221 ( .A(n442), .Y(o_m7[0]) );
  BUFX2 U222 ( .A(n948), .Y(o_m9[5]) );
  INVX2 U223 ( .A(n210), .Y(n505) );
  BUFX2 U224 ( .A(n966), .Y(o_m18[1]) );
  BUFX2 U225 ( .A(n964), .Y(o_m15[4]) );
  BUFX2 U226 ( .A(n963), .Y(o_m15[5]) );
  BUFX2 U227 ( .A(n937), .Y(o_m4[0]) );
  AND2X2 U229 ( .A(n422), .B(n225), .Y(n209) );
  AND2X2 U230 ( .A(n487), .B(n225), .Y(n210) );
  AND2X2 U231 ( .A(n497), .B(n225), .Y(n211) );
  AND2X2 U232 ( .A(n487), .B(n402), .Y(n212) );
  AND2X2 U233 ( .A(n354), .B(n468), .Y(n213) );
  AND2X2 U234 ( .A(n497), .B(n844), .Y(n214) );
  AND2X2 U235 ( .A(n497), .B(n909), .Y(n215) );
  AND2X2 U237 ( .A(n267), .B(n268), .Y(n216) );
  INVX2 U240 ( .A(n219), .Y(o_m25[0]) );
  INVX1 U241 ( .A(n262), .Y(n916) );
  AND2X1 U243 ( .A(n504), .B(n321), .Y(n319) );
  AND2X1 U245 ( .A(n391), .B(n360), .Y(n422) );
  BUFX4 U246 ( .A(n930), .Y(o_m2[0]) );
  AND2X2 U249 ( .A(n216), .B(n269), .Y(n915) );
  INVX1 U251 ( .A(n357), .Y(n217) );
  INVX2 U252 ( .A(curr[2]), .Y(n218) );
  INVX1 U253 ( .A(o_m16[0]), .Y(n836) );
  INVX8 U254 ( .A(n476), .Y(o_m12[0]) );
  INVX1 U255 ( .A(o_m22[0]), .Y(n828) );
  INVX2 U256 ( .A(n971), .Y(n219) );
  INVX8 U257 ( .A(n494), .Y(o_m8[0]) );
  INVX1 U258 ( .A(o_m17[0]), .Y(n834) );
  INVX2 U259 ( .A(n952), .Y(n221) );
  INVX2 U260 ( .A(n221), .Y(o_m11[0]) );
  INVX2 U261 ( .A(n951), .Y(n223) );
  INVX2 U262 ( .A(n223), .Y(o_m10[0]) );
  AND2X2 U263 ( .A(curr[3]), .B(n218), .Y(n225) );
  INVX1 U264 ( .A(n225), .Y(n357) );
  BUFX2 U265 ( .A(n949), .Y(o_m9[4]) );
  BUFX2 U266 ( .A(n946), .Y(o_m9[7]) );
  BUFX2 U267 ( .A(n947), .Y(o_m9[6]) );
  BUFX2 U268 ( .A(n961), .Y(o_m15[7]) );
  BUFX2 U269 ( .A(n962), .Y(o_m15[6]) );
  BUFX2 U270 ( .A(n933), .Y(o_m3[5]) );
  BUFX2 U271 ( .A(n934), .Y(o_m3[4]) );
  BUFX2 U272 ( .A(n932), .Y(o_m3[6]) );
  BUFX2 U273 ( .A(n931), .Y(o_m3[7]) );
  BUFX2 U274 ( .A(n955), .Y(o_m14[7]) );
  BUFX2 U275 ( .A(n956), .Y(o_m14[6]) );
  BUFX2 U276 ( .A(n940), .Y(o_m8[7]) );
  BUFX2 U277 ( .A(n941), .Y(o_m8[6]) );
  BUFX2 U278 ( .A(n942), .Y(o_m8[5]) );
  BUFX2 U279 ( .A(n957), .Y(o_m14[5]) );
  INVX1 U294 ( .A(n927), .Y(n341) );
  BUFX2 U393 ( .A(n312), .Y(n367) );
  INVX2 U394 ( .A(n214), .Y(n513) );
  INVX2 U397 ( .A(n211), .Y(n508) );
  INVX2 U410 ( .A(n209), .Y(n499) );
  INVX2 U411 ( .A(n213), .Y(n517) );
  INVX4 U414 ( .A(n215), .Y(n504) );
  INVX2 U428 ( .A(n212), .Y(n514) );
  BUFX2 U429 ( .A(n857), .Y(n523) );
  BUFX2 U432 ( .A(n857), .Y(n524) );
  INVX2 U443 ( .A(n376), .Y(n533) );
  INVX2 U444 ( .A(n374), .Y(n550) );
  INVX2 U445 ( .A(n377), .Y(n535) );
  INVX2 U446 ( .A(n379), .Y(n541) );
  INVX2 U449 ( .A(n381), .Y(n544) );
  INVX2 U462 ( .A(n383), .Y(n532) );
  INVX2 U463 ( .A(n385), .Y(n553) );
  INVX2 U466 ( .A(i_clear), .Y(n526) );
  BUFX2 U479 ( .A(n567), .Y(n615) );
  BUFX2 U480 ( .A(n567), .Y(n817) );
  BUFX2 U483 ( .A(n567), .Y(n818) );
  BUFX2 U496 ( .A(n568), .Y(n819) );
  BUFX2 U497 ( .A(n568), .Y(n820) );
  BUFX2 U500 ( .A(n568), .Y(n821) );
  BUFX2 U511 ( .A(n572), .Y(n822) );
  BUFX2 U512 ( .A(n572), .Y(n823) );
  BUFX2 U513 ( .A(n558), .Y(n578) );
  BUFX2 U514 ( .A(n558), .Y(n581) );
  BUFX2 U517 ( .A(n558), .Y(n587) );
  BUFX2 U528 ( .A(n559), .Y(n591) );
  BUFX2 U529 ( .A(n559), .Y(n597) );
  BUFX2 U530 ( .A(n559), .Y(n600) );
  BUFX2 U531 ( .A(n562), .Y(n605) );
  BUFX2 U534 ( .A(n562), .Y(n606) );
  BUFX2 U545 ( .A(n562), .Y(n609) );
  BUFX2 U546 ( .A(n572), .Y(n824) );
  INVX2 U547 ( .A(n960), .Y(n485) );
  BUFX2 U548 ( .A(n970), .Y(o_m24[0]) );
  AND2X2 U551 ( .A(i_data_in[6]), .B(n526), .Y(n374) );
  AND2X2 U565 ( .A(i_data_in[1]), .B(n526), .Y(n376) );
  AND2X2 U566 ( .A(i_data_in[2]), .B(n526), .Y(n377) );
  AND2X2 U569 ( .A(i_data_in[3]), .B(n526), .Y(n379) );
  AND2X2 U580 ( .A(i_data_in[4]), .B(n526), .Y(n381) );
  AND2X2 U581 ( .A(i_data_in[5]), .B(n526), .Y(n383) );
  AND2X2 U582 ( .A(i_data_in[7]), .B(n526), .Y(n385) );
  BUFX2 U583 ( .A(n_rst), .Y(n567) );
  BUFX2 U586 ( .A(n_rst), .Y(n568) );
  BUFX2 U598 ( .A(n_rst), .Y(n558) );
  BUFX2 U599 ( .A(n_rst), .Y(n572) );
  BUFX2 U600 ( .A(n_rst), .Y(n559) );
  BUFX2 U601 ( .A(n_rst), .Y(n562) );
  BUFX2 U604 ( .A(n943), .Y(o_m8[2]) );
  BUFX2 U615 ( .A(n958), .Y(o_m14[2]) );
  BUFX4 U616 ( .A(n250), .Y(n389) );
  BUFX4 U617 ( .A(n969), .Y(o_m23[0]) );
  BUFX2 U618 ( .A(n950), .Y(o_m9[0]) );
  BUFX2 U621 ( .A(n935), .Y(o_m3[1]) );
  BUFX2 U634 ( .A(n953), .Y(o_m12[1]) );
  BUFX4 U635 ( .A(n938), .Y(o_m6[0]) );
  INVX2 U636 ( .A(n838), .Y(o_m15[1]) );
  INVX1 U637 ( .A(n334), .Y(n921) );
  INVX2 U638 ( .A(n939), .Y(n442) );
  INVX1 U651 ( .A(o_m23[0]), .Y(n826) );
  INVX1 U652 ( .A(o_m12[1]), .Y(n843) );
  INVX2 U653 ( .A(n959), .Y(n451) );
  INVX2 U654 ( .A(n451), .Y(o_m14[1]) );
  INVX1 U655 ( .A(o_m13[0]), .Y(n840) );
  INVX1 U656 ( .A(o_m2[0]), .Y(n855) );
  INVX1 U670 ( .A(o_m11[0]), .Y(n845) );
  INVX2 U671 ( .A(n968), .Y(n457) );
  INVX4 U674 ( .A(n457), .Y(o_m19[0]) );
  INVX1 U675 ( .A(o_m9[0]), .Y(n847) );
  INVX1 U688 ( .A(o_m8[1]), .Y(n848) );
  INVX1 U689 ( .A(o_m14[1]), .Y(n839) );
  INVX2 U692 ( .A(n936), .Y(n465) );
  INVX4 U703 ( .A(n465), .Y(o_m3[0]) );
  INVX1 U704 ( .A(o_m4[0]), .Y(n852) );
  INVX2 U705 ( .A(n967), .Y(n470) );
  INVX2 U706 ( .A(n954), .Y(n476) );
  INVX1 U709 ( .A(o_m18[0]), .Y(n832) );
  INVX1 U720 ( .A(o_m15[0]), .Y(n837) );
  INVX1 U721 ( .A(o_m12[0]), .Y(n842) );
  INVX1 U722 ( .A(o_m3[0]), .Y(n853) );
  INVX8 U723 ( .A(n485), .Y(o_m14[0]) );
  INVX2 U726 ( .A(n945), .Y(n494) );
  INVX2 U739 ( .A(n401), .Y(n908) );
  NAND2X1 U740 ( .A(n391), .B(n908), .Y(n252) );
  NAND2X1 U743 ( .A(i_data_in[0]), .B(n526), .Y(n857) );
  NAND2X1 U744 ( .A(n252), .B(n526), .Y(n881) );
  OAI22X1 U757 ( .A(n252), .B(n523), .C(n881), .D(n219), .Y(n631) );
  INVX2 U758 ( .A(n358), .Y(n909) );
  NAND2X1 U761 ( .A(n412), .B(n909), .Y(n249) );
  NAND2X1 U762 ( .A(n249), .B(n526), .Y(n880) );
  INVX2 U775 ( .A(o_m24[0]), .Y(n825) );
  OAI22X1 U776 ( .A(n249), .B(n523), .C(n880), .D(n825), .Y(n639) );
  NAND2X1 U779 ( .A(n422), .B(n909), .Y(n278) );
  NAND2X1 U790 ( .A(n278), .B(n526), .Y(n879) );
  OAI22X1 U791 ( .A(n278), .B(n523), .C(n879), .D(n826), .Y(n647) );
  INVX2 U792 ( .A(o_m23[1]), .Y(n827) );
  OAI22X1 U793 ( .A(n879), .B(n827), .C(n533), .D(n278), .Y(n646) );
  NAND2X1 U796 ( .A(n412), .B(n217), .Y(n279) );
  NAND2X1 U800 ( .A(n279), .B(n526), .Y(n878) );
  OAI22X1 U803 ( .A(n279), .B(n523), .C(n878), .D(n828), .Y(n655) );
  NAND2X1 U806 ( .A(n499), .B(n526), .Y(n877) );
  INVX2 U809 ( .A(o_m21[0]), .Y(n829) );
  OAI22X1 U812 ( .A(n499), .B(n523), .C(n877), .D(n829), .Y(n663) );
  INVX2 U815 ( .A(n293), .Y(n844) );
  NAND2X1 U816 ( .A(n412), .B(n844), .Y(n368) );
  NAND2X1 U817 ( .A(n368), .B(n526), .Y(n876) );
  INVX2 U818 ( .A(o_m20[0]), .Y(n830) );
  OAI22X1 U821 ( .A(n368), .B(n523), .C(n876), .D(n830), .Y(n671) );
  NAND2X1 U825 ( .A(n422), .B(n844), .Y(n323) );
  NAND2X1 U826 ( .A(n323), .B(n526), .Y(n875) );
  OAI22X1 U827 ( .A(n323), .B(n523), .C(n875), .D(n457), .Y(n679) );
  INVX2 U828 ( .A(o_m19[1]), .Y(n831) );
  OAI22X1 U829 ( .A(n875), .B(n831), .C(n323), .D(n533), .Y(n678) );
  NAND2X1 U830 ( .A(n412), .B(n402), .Y(n290) );
  NAND2X1 U831 ( .A(n290), .B(n526), .Y(n874) );
  OAI22X1 U832 ( .A(n290), .B(n523), .C(n874), .D(n832), .Y(n687) );
  OAI22X1 U833 ( .A(n874), .B(n833), .C(n290), .D(n533), .Y(n686) );
  NAND2X1 U834 ( .A(n422), .B(n402), .Y(n309) );
  NAND2X1 U835 ( .A(n309), .B(n526), .Y(n873) );
  OAI22X1 U836 ( .A(n309), .B(n523), .C(n873), .D(n834), .Y(n695) );
  INVX2 U837 ( .A(o_m17[1]), .Y(n835) );
  OAI22X1 U838 ( .A(n873), .B(n835), .C(n309), .D(n533), .Y(n694) );
  NAND2X1 U839 ( .A(n487), .B(n909), .Y(n369) );
  NAND2X1 U840 ( .A(n369), .B(n526), .Y(n872) );
  OAI22X1 U841 ( .A(n369), .B(n523), .C(n872), .D(n836), .Y(n703) );
  NAND2X1 U842 ( .A(n504), .B(n526), .Y(n871) );
  OAI22X1 U843 ( .A(n504), .B(n523), .C(n871), .D(n837), .Y(n711) );
  INVX2 U844 ( .A(n965), .Y(n838) );
  OAI22X1 U845 ( .A(n871), .B(n838), .C(n504), .D(n533), .Y(n710) );
  NAND2X1 U846 ( .A(n505), .B(n526), .Y(n870) );
  OAI22X1 U847 ( .A(n505), .B(n523), .C(n870), .D(n485), .Y(n719) );
  OAI22X1 U848 ( .A(n870), .B(n839), .C(n505), .D(n533), .Y(n718) );
  NAND2X1 U849 ( .A(n508), .B(n526), .Y(n869) );
  OAI22X1 U850 ( .A(n508), .B(n524), .C(n869), .D(n840), .Y(n727) );
  INVX2 U851 ( .A(o_m13[1]), .Y(n841) );
  OAI22X1 U852 ( .A(n869), .B(n841), .C(n508), .D(n533), .Y(n726) );
  NAND2X1 U853 ( .A(n487), .B(n844), .Y(n272) );
  NAND2X1 U854 ( .A(n272), .B(n526), .Y(n868) );
  OAI22X1 U855 ( .A(n272), .B(n524), .C(n868), .D(n842), .Y(n735) );
  OAI22X1 U856 ( .A(n868), .B(n843), .C(n272), .D(n533), .Y(n736) );
  NAND2X1 U857 ( .A(n513), .B(n526), .Y(n867) );
  OAI22X1 U858 ( .A(n513), .B(n524), .C(n867), .D(n845), .Y(n743) );
  INVX2 U859 ( .A(o_m11[1]), .Y(n846) );
  OAI22X1 U860 ( .A(n867), .B(n846), .C(n513), .D(n533), .Y(n744) );
  NAND2X1 U861 ( .A(n514), .B(n526), .Y(n866) );
  OAI22X1 U862 ( .A(n514), .B(n524), .C(n866), .D(n223), .Y(n751) );
  NAND2X1 U863 ( .A(n497), .B(n402), .Y(n331) );
  NAND2X1 U864 ( .A(n331), .B(n526), .Y(n865) );
  OAI22X1 U865 ( .A(n331), .B(n524), .C(n865), .D(n847), .Y(n759) );
  NAND2X1 U866 ( .A(n353), .B(n468), .Y(n259) );
  NAND2X1 U867 ( .A(n259), .B(n526), .Y(n864) );
  OAI22X1 U868 ( .A(n259), .B(n524), .C(n864), .D(n494), .Y(n767) );
  OAI22X1 U869 ( .A(n864), .B(n848), .C(n259), .D(n533), .Y(n766) );
  NAND2X1 U870 ( .A(n353), .B(n391), .Y(n274) );
  NAND2X1 U871 ( .A(n274), .B(n526), .Y(n863) );
  OAI22X1 U872 ( .A(n274), .B(n524), .C(n863), .D(n442), .Y(n775) );
  INVX2 U873 ( .A(o_m7[1]), .Y(n849) );
  OAI22X1 U874 ( .A(n863), .B(n849), .C(n274), .D(n533), .Y(n774) );
  NAND2X1 U875 ( .A(n517), .B(n526), .Y(n862) );
  INVX2 U876 ( .A(o_m6[0]), .Y(n850) );
  OAI22X1 U877 ( .A(n517), .B(n524), .C(n862), .D(n850), .Y(n783) );
  NAND2X1 U878 ( .A(n391), .B(n354), .Y(n311) );
  NAND2X1 U879 ( .A(n311), .B(n526), .Y(n861) );
  INVX2 U880 ( .A(o_m5[0]), .Y(n851) );
  OAI22X1 U881 ( .A(n311), .B(n524), .C(n861), .D(n851), .Y(n791) );
  NAND2X1 U882 ( .A(n364), .B(n468), .Y(n342) );
  NAND2X1 U883 ( .A(n342), .B(n526), .Y(n860) );
  OAI22X1 U884 ( .A(n342), .B(n524), .C(n860), .D(n852), .Y(n799) );
  NAND2X1 U885 ( .A(n364), .B(n391), .Y(n322) );
  NAND2X1 U886 ( .A(n322), .B(n526), .Y(n859) );
  OAI22X1 U887 ( .A(n322), .B(n524), .C(n859), .D(n853), .Y(n807) );
  INVX2 U888 ( .A(o_m3[1]), .Y(n854) );
  OAI22X1 U889 ( .A(n859), .B(n854), .C(n322), .D(n533), .Y(n806) );
  NAND2X1 U890 ( .A(n363), .B(n468), .Y(n295) );
  NAND2X1 U891 ( .A(n295), .B(n526), .Y(n858) );
  OAI22X1 U892 ( .A(n295), .B(n524), .C(n858), .D(n855), .Y(n815) );
  NAND2X1 U893 ( .A(n363), .B(n391), .Y(n308) );
  NAND2X1 U894 ( .A(n308), .B(n526), .Y(n882) );
  INVX2 U895 ( .A(o_m1[0]), .Y(n856) );
  OAI22X1 U896 ( .A(n308), .B(n523), .C(n882), .D(n856), .Y(n623) );
  INVX2 U897 ( .A(n858), .Y(n884) );
  INVX2 U898 ( .A(n859), .Y(n885) );
  INVX2 U899 ( .A(n860), .Y(n886) );
  INVX2 U900 ( .A(n861), .Y(n887) );
  INVX2 U901 ( .A(n862), .Y(n888) );
  INVX2 U902 ( .A(n863), .Y(n889) );
  INVX2 U903 ( .A(n864), .Y(n890) );
  INVX2 U904 ( .A(n865), .Y(n891) );
  INVX2 U905 ( .A(n866), .Y(n892) );
  INVX2 U906 ( .A(n867), .Y(n893) );
  INVX2 U907 ( .A(n868), .Y(n894) );
  INVX2 U908 ( .A(n869), .Y(n895) );
  INVX2 U909 ( .A(n870), .Y(n896) );
  INVX2 U910 ( .A(n871), .Y(n897) );
  INVX2 U911 ( .A(n872), .Y(n898) );
  INVX2 U912 ( .A(n873), .Y(n899) );
  INVX2 U913 ( .A(n874), .Y(n900) );
  INVX2 U914 ( .A(n875), .Y(n901) );
  INVX2 U915 ( .A(n876), .Y(n902) );
  INVX2 U916 ( .A(n877), .Y(n903) );
  INVX2 U917 ( .A(n878), .Y(n904) );
  INVX2 U918 ( .A(n879), .Y(n905) );
  INVX2 U919 ( .A(n880), .Y(n906) );
  INVX2 U920 ( .A(n881), .Y(n907) );
  INVX2 U921 ( .A(n882), .Y(n883) );
  INVX2 U922 ( .A(n243), .Y(n910) );
  INVX2 U923 ( .A(n332), .Y(n911) );
  INVX2 U924 ( .A(n265), .Y(n912) );
  INVX2 U925 ( .A(n281), .Y(n913) );
  INVX2 U926 ( .A(n389), .Y(n914) );
  INVX2 U927 ( .A(n247), .Y(n917) );
  INVX2 U928 ( .A(n280), .Y(n918) );
  INVX2 U929 ( .A(n276), .Y(n919) );
  INVX2 U930 ( .A(curr[0]), .Y(n920) );
  INVX2 U931 ( .A(n261), .Y(n922) );
  INVX2 U932 ( .A(n248), .Y(n923) );
  INVX2 U933 ( .A(n289), .Y(n924) );
  INVX2 U934 ( .A(n318), .Y(n925) );
  INVX2 U935 ( .A(n324), .Y(n926) );
  INVX2 U936 ( .A(curr[1]), .Y(n927) );
  INVX2 U937 ( .A(curr[3]), .Y(n928) );
  INVX2 U938 ( .A(curr[5]), .Y(n929) );
endmodule


module edge_detection_8_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n48, n49, n51, n54, n56, n58, n60, n102,
         n103, n104, n105, n107, n108, n109, n110, n111;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  XNOR2X1 U4 ( .A(n17), .B(n2), .Y(SUM[9]) );
  AOI21X1 U5 ( .A(n105), .B(n17), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n105), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n108), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n109), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n104), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n104), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n28), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n103), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n103), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n36), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n41), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n102), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n102), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n44), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n110), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n110), .Y(n10) );
  NAND2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  OR2X2 U77 ( .A(B[3]), .B(A[3]), .Y(n102) );
  OR2X2 U78 ( .A(B[5]), .B(A[5]), .Y(n103) );
  OR2X2 U79 ( .A(B[7]), .B(A[7]), .Y(n104) );
  OR2X2 U80 ( .A(B[9]), .B(A[9]), .Y(n105) );
  AND2X2 U81 ( .A(n51), .B(n111), .Y(SUM[0]) );
  INVX1 U82 ( .A(n20), .Y(n107) );
  INVX2 U83 ( .A(n107), .Y(n108) );
  OAI21X1 U84 ( .A(n28), .B(n26), .C(n27), .Y(n109) );
  OR2X2 U85 ( .A(B[1]), .B(A[1]), .Y(n110) );
  OR2X2 U86 ( .A(B[0]), .B(A[0]), .Y(n111) );
  XNOR2X1 U87 ( .A(n12), .B(n1), .Y(SUM[10]) );
  INVX2 U88 ( .A(n42), .Y(n60) );
  INVX2 U89 ( .A(n34), .Y(n58) );
  INVX2 U90 ( .A(n26), .Y(n56) );
  INVX2 U91 ( .A(n18), .Y(n54) );
  INVX2 U92 ( .A(n51), .Y(n49) );
  INVX2 U93 ( .A(n48), .Y(n46) );
  INVX2 U94 ( .A(n40), .Y(n38) );
  INVX2 U95 ( .A(n32), .Y(n30) );
  INVX2 U96 ( .A(n24), .Y(n22) );
  INVX2 U97 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_8_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_8_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_8_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_8_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_8_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n74), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  XOR2X1 U40 ( .A(A[6]), .B(n24), .Y(n65) );
  XOR2X1 U41 ( .A(n65), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U42 ( .A(A[6]), .B(n24), .Y(n66) );
  NAND2X1 U43 ( .A(A[6]), .B(n6), .Y(n67) );
  NAND2X1 U44 ( .A(n24), .B(n6), .Y(n68) );
  NAND3X1 U45 ( .A(n66), .B(n67), .C(n68), .Y(n5) );
  XOR2X1 U46 ( .A(A[7]), .B(n23), .Y(n69) );
  XOR2X1 U47 ( .A(n69), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U48 ( .A(A[7]), .B(n23), .Y(n70) );
  NAND2X1 U49 ( .A(n5), .B(A[7]), .Y(n71) );
  NAND2X1 U50 ( .A(n23), .B(n5), .Y(n72) );
  NAND3X1 U51 ( .A(n70), .B(n71), .C(n72), .Y(n4) );
  INVX1 U52 ( .A(n16), .Y(n73) );
  INVX2 U53 ( .A(n73), .Y(n74) );
  INVX2 U54 ( .A(B[0]), .Y(n30) );
  INVX2 U55 ( .A(B[1]), .Y(n29) );
  INVX2 U56 ( .A(B[2]), .Y(n28) );
  INVX2 U57 ( .A(B[3]), .Y(n27) );
  INVX2 U58 ( .A(B[4]), .Y(n26) );
  INVX2 U59 ( .A(B[5]), .Y(n25) );
  INVX2 U60 ( .A(B[6]), .Y(n24) );
  INVX2 U61 ( .A(B[7]), .Y(n23) );
  INVX2 U62 ( .A(n17), .Y(n22) );
  INVX2 U63 ( .A(n9), .Y(n20) );
  INVX2 U64 ( .A(n15), .Y(n13) );
  INVX2 U65 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_8_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  INVX1 U39 ( .A(B[2]), .Y(n28) );
  INVX1 U40 ( .A(B[4]), .Y(n26) );
  OR2X2 U41 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U42 ( .A(B[0]), .Y(n30) );
  INVX2 U43 ( .A(B[1]), .Y(n29) );
  INVX2 U44 ( .A(B[3]), .Y(n27) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_8_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n66), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n68), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  INVX1 U39 ( .A(B[1]), .Y(n29) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX1 U41 ( .A(B[0]), .Y(n30) );
  INVX1 U42 ( .A(n11), .Y(n65) );
  INVX2 U43 ( .A(n65), .Y(n66) );
  INVX1 U44 ( .A(n16), .Y(n67) );
  INVX2 U45 ( .A(n67), .Y(n68) );
  INVX2 U46 ( .A(B[2]), .Y(n28) );
  INVX2 U47 ( .A(B[3]), .Y(n27) );
  INVX2 U48 ( .A(B[4]), .Y(n26) );
  INVX2 U49 ( .A(B[5]), .Y(n25) );
  INVX2 U50 ( .A(B[6]), .Y(n24) );
  INVX2 U51 ( .A(B[7]), .Y(n23) );
  INVX2 U52 ( .A(n17), .Y(n22) );
  INVX2 U53 ( .A(n9), .Y(n20) );
  INVX2 U54 ( .A(n15), .Y(n13) );
  INVX2 U55 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_8_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n65), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  BUFX2 U40 ( .A(n19), .Y(n65) );
  INVX1 U41 ( .A(B[0]), .Y(n30) );
  INVX2 U42 ( .A(B[1]), .Y(n29) );
  INVX2 U43 ( .A(B[2]), .Y(n28) );
  INVX2 U44 ( .A(B[3]), .Y(n27) );
  INVX2 U45 ( .A(B[4]), .Y(n26) );
  INVX2 U46 ( .A(B[5]), .Y(n25) );
  INVX2 U47 ( .A(B[6]), .Y(n24) );
  INVX2 U48 ( .A(B[7]), .Y(n23) );
  INVX2 U49 ( .A(n17), .Y(n22) );
  INVX2 U50 ( .A(n9), .Y(n20) );
  INVX2 U51 ( .A(n15), .Y(n13) );
  INVX2 U52 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_8_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_8_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72;

  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  XOR2X1 U40 ( .A(n24), .B(A[6]), .Y(n65) );
  XOR2X1 U41 ( .A(n65), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U42 ( .A(n24), .B(A[6]), .Y(n66) );
  NAND2X1 U43 ( .A(n24), .B(n6), .Y(n67) );
  NAND2X1 U44 ( .A(A[6]), .B(n6), .Y(n68) );
  NAND3X1 U45 ( .A(n66), .B(n67), .C(n68), .Y(n5) );
  XOR2X1 U46 ( .A(n23), .B(A[7]), .Y(n69) );
  XOR2X1 U47 ( .A(n69), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U48 ( .A(n23), .B(A[7]), .Y(n70) );
  NAND2X1 U49 ( .A(n23), .B(n5), .Y(n71) );
  NAND2X1 U50 ( .A(A[7]), .B(n5), .Y(n72) );
  NAND3X1 U51 ( .A(n70), .B(n71), .C(n72), .Y(n4) );
  INVX2 U52 ( .A(B[0]), .Y(n30) );
  INVX2 U53 ( .A(B[1]), .Y(n29) );
  INVX2 U54 ( .A(B[2]), .Y(n28) );
  INVX2 U55 ( .A(B[3]), .Y(n27) );
  INVX2 U56 ( .A(B[4]), .Y(n26) );
  INVX2 U57 ( .A(B[5]), .Y(n25) );
  INVX2 U58 ( .A(B[6]), .Y(n24) );
  INVX2 U59 ( .A(B[7]), .Y(n23) );
  INVX2 U60 ( .A(n17), .Y(n22) );
  INVX2 U61 ( .A(n9), .Y(n20) );
  INVX2 U62 ( .A(n15), .Y(n13) );
  INVX2 U63 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_8 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n303, n315, n341, n364, n386,
         n442, n445, n446, n447, n448, n449, n450, n453, n454, n455, n456,
         n457, n458, n459, n460, n462, n463, n464, n465, n467, n468, n470,
         n471, n472, n473, n474, n475, n476, n481, n484, n485, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n519, n521, n522, n1, n2, n8, n9, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65,
         n141, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n443, n444, n451, n452, n461,
         n466, n469, n477, n478, n479, n480, n482, n483, n486, n487, n488,
         n517, n518, n520, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n522), .CLK(clk), .R(n187), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n521), .CLK(clk), .R(n187), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n187), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n519), .CLK(clk), .R(n187), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n530), .CLK(clk), .R(n187), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n506), .CLK(clk), .R(n186), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n186), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n186), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n422), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n421), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n420), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n419), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n418), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n417), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n416), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n415), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n414), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n440), .CLK(clk), .R(n185), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n439), .CLK(clk), .R(n185), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n438), .CLK(clk), .R(n185), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n437), .CLK(clk), .R(n185), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n436), .CLK(clk), .R(n185), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n435), .CLK(clk), .R(n185), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n434), .CLK(clk), .R(n185), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n433), .CLK(clk), .R(n185), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n432), .CLK(clk), .R(n185), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n538), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n537), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n536), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n535), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n534), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n533), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n532), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n531), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n517), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n488), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n487), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n486), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n483), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n482), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n480), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n479), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n478), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n557), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n556), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n555), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n554), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n553), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n552), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n551), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n550), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n549), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n548), .CLK(clk), .R(n182), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n431), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n430), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n429), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n428), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n427), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n426), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n425), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n424), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n423), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n477), .CLK(clk), .R(n182), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n469), .CLK(clk), .R(n182), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n466), .CLK(clk), .R(n181), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n461), .CLK(clk), .R(n181), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n452), .CLK(clk), .R(n181), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n451), .CLK(clk), .R(n181), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n444), .CLK(clk), .R(n181), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n443), .CLK(clk), .R(n181), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n441), .CLK(clk), .R(n181), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n529), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n528), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n527), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n526), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n525), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n524), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n523), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n520), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n518), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n567), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n566), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n565), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n564), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n563), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n562), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n561), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n560), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n559), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n558), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n569), .CLK(clk), .R(n179), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n516), .CLK(clk), .R(n179), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n515), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n514), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n513), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n512), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n511), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n510), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n509), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n508), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n507), .CLK(clk), .R(n178), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n547), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n546), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n545), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n544), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n543), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n542), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n541), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n540), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n539), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n497), .CLK(clk), .R(n178), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n498), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n499), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n500), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n501), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n502), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n503), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n504), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n505), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n496), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n495), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n494), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n493), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n492), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n491), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n490), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n489), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n364), .B(n449), .Y(n460) );
  AND2X2 U160 ( .A(n303), .B(n315), .Y(n481) );
  OR2X1 U458 ( .A(n447), .B(n448), .Y(n446) );
  NAND3X1 U459 ( .A(n449), .B(n450), .C(n412), .Y(n445) );
  OR2X1 U462 ( .A(n455), .B(n456), .Y(n454) );
  NAND3X1 U464 ( .A(n459), .B(n450), .C(n460), .Y(n453) );
  OAI21X1 U465 ( .A(n450), .B(n413), .C(n462), .Y(n519) );
  NAND2X1 U467 ( .A(n568), .B(n457), .Y(n464) );
  NAND3X1 U469 ( .A(n442), .B(n315), .C(n386), .Y(n463) );
  OR2X1 U472 ( .A(n455), .B(n447), .Y(n468) );
  NAND3X1 U475 ( .A(n386), .B(n450), .C(n471), .Y(n467) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n570), .Y(n471) );
  NAND2X1 U477 ( .A(n473), .B(n474), .Y(n450) );
  NOR2X1 U478 ( .A(n475), .B(n476), .Y(n474) );
  NAND3X1 U479 ( .A(n364), .B(n386), .C(n465), .Y(n476) );
  NAND3X1 U482 ( .A(n341), .B(n442), .C(n481), .Y(n475) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n303) );
  NOR2X1 U487 ( .A(n484), .B(n485), .Y(n473) );
  NAND3X1 U488 ( .A(n472), .B(n458), .C(n412), .Y(n485) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n472) );
  NAND3X1 U491 ( .A(n457), .B(n470), .C(n449), .Y(n484) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n449) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n470) );
  edge_detection_8_DW01_add_7 add_231 ( .A({Gx[10:2], n30, n28}), .B({Gy[10:2], 
        n27, n26}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_8_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_8_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_8_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_8_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_8_DW01_sub_8 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_8_DW01_sub_9 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_8_DW01_sub_10 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_8_DW01_sub_11 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_8_DW01_sub_12 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_8_DW01_sub_13 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n413), .B(n188), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n189), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n245), .Y(n9) );
  AND2X2 U52 ( .A(n245), .B(n189), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n188), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n467), .B(n468), .Y(n19) );
  OR2X2 U158 ( .A(n453), .B(n454), .Y(n20) );
  OR2X2 U159 ( .A(n445), .B(n446), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n413), .Y(n22) );
  INVX1 U162 ( .A(n227), .Y(n479) );
  NOR2X1 U163 ( .A(n384), .B(Gy[8]), .Y(n23) );
  INVX1 U164 ( .A(n23), .Y(n389) );
  INVX4 U165 ( .A(n65), .Y(n406) );
  OR2X1 U166 ( .A(n28), .B(n30), .Y(n254) );
  OR2X1 U167 ( .A(n254), .B(Gx[2]), .Y(n258) );
  OR2X2 U168 ( .A(n262), .B(Gx[4]), .Y(n266) );
  OR2X2 U169 ( .A(n270), .B(Gx[6]), .Y(n274) );
  OR2X2 U170 ( .A(n278), .B(Gx[8]), .Y(n282) );
  BUFX2 U171 ( .A(n333), .Y(n174) );
  BUFX2 U172 ( .A(n333), .Y(n173) );
  BUFX2 U173 ( .A(n333), .Y(n171) );
  BUFX2 U174 ( .A(n333), .Y(n172) );
  INVX2 U175 ( .A(n364), .Y(n170) );
  INVX2 U176 ( .A(n1), .Y(n392) );
  INVX2 U177 ( .A(n386), .Y(n169) );
  BUFX2 U178 ( .A(n333), .Y(n175) );
  INVX2 U179 ( .A(n341), .Y(n408) );
  AND2X2 U180 ( .A(n341), .B(n1), .Y(n24) );
  INVX2 U181 ( .A(n459), .Y(n393) );
  INVX2 U182 ( .A(N288), .Y(n141) );
  BUFX2 U183 ( .A(n_rst), .Y(n176) );
  BUFX2 U184 ( .A(n_rst), .Y(n177) );
  BUFX2 U185 ( .A(n_rst), .Y(n179) );
  BUFX2 U186 ( .A(n_rst), .Y(n180) );
  BUFX2 U187 ( .A(n_rst), .Y(n181) );
  BUFX2 U188 ( .A(n_rst), .Y(n182) );
  BUFX2 U189 ( .A(n_rst), .Y(n183) );
  BUFX2 U190 ( .A(n_rst), .Y(n184) );
  BUFX2 U191 ( .A(n_rst), .Y(n186) );
  BUFX2 U192 ( .A(n_rst), .Y(n178) );
  BUFX2 U193 ( .A(n_rst), .Y(n185) );
  BUFX2 U194 ( .A(n_rst), .Y(n187) );
  OR2X1 U195 ( .A(n274), .B(Gx[7]), .Y(n278) );
  BUFX2 U196 ( .A(Gy[1]), .Y(n27) );
  INVX2 U197 ( .A(n25), .Y(n26) );
  OR2X1 U198 ( .A(n258), .B(Gx[3]), .Y(n262) );
  OR2X1 U199 ( .A(n266), .B(Gx[5]), .Y(n270) );
  INVX2 U202 ( .A(N269), .Y(n25) );
  BUFX4 U203 ( .A(N258), .Y(n28) );
  INVX2 U204 ( .A(Gx[1]), .Y(n29) );
  INVX4 U205 ( .A(n29), .Y(n30) );
  AOI21X1 U206 ( .A(n141), .B(n168), .C(n315), .Y(n65) );
  NOR2X1 U207 ( .A(N289), .B(N290), .Y(n168) );
  INVX2 U208 ( .A(n315), .Y(n404) );
  INVX2 U209 ( .A(state[1]), .Y(n413) );
  INVX2 U210 ( .A(state[0]), .Y(n188) );
  NAND3X1 U211 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n315) );
  INVX2 U212 ( .A(state[2]), .Y(n189) );
  NAND2X1 U213 ( .A(n17), .B(n8), .Y(n341) );
  INVX2 U214 ( .A(state[3]), .Y(n245) );
  NAND2X1 U215 ( .A(n16), .B(n22), .Y(n442) );
  INVX2 U216 ( .A(n442), .Y(n333) );
  MUX2X1 U217 ( .B(N205), .A(N168), .S(n171), .Y(n190) );
  INVX2 U218 ( .A(n190), .Y(n432) );
  NAND2X1 U219 ( .A(n16), .B(n17), .Y(n386) );
  INVX2 U220 ( .A(C1[9]), .Y(n192) );
  INVX2 U221 ( .A(N205), .Y(n191) );
  MUX2X1 U222 ( .B(n192), .A(n191), .S(n169), .Y(n530) );
  MUX2X1 U223 ( .B(N204), .A(N167), .S(n171), .Y(n193) );
  INVX2 U224 ( .A(n193), .Y(n433) );
  INVX2 U225 ( .A(C1[8]), .Y(n195) );
  INVX2 U226 ( .A(N204), .Y(n194) );
  MUX2X1 U227 ( .B(n195), .A(n194), .S(n169), .Y(n531) );
  MUX2X1 U228 ( .B(N203), .A(N166), .S(n171), .Y(n196) );
  INVX2 U229 ( .A(n196), .Y(n434) );
  INVX2 U230 ( .A(C1[7]), .Y(n198) );
  INVX2 U231 ( .A(N203), .Y(n197) );
  MUX2X1 U232 ( .B(n198), .A(n197), .S(n169), .Y(n532) );
  MUX2X1 U233 ( .B(N202), .A(N165), .S(n171), .Y(n199) );
  INVX2 U234 ( .A(n199), .Y(n435) );
  INVX2 U235 ( .A(C1[6]), .Y(n201) );
  INVX2 U236 ( .A(N202), .Y(n200) );
  MUX2X1 U237 ( .B(n201), .A(n200), .S(n169), .Y(n533) );
  MUX2X1 U238 ( .B(N201), .A(N164), .S(n171), .Y(n202) );
  INVX2 U239 ( .A(n202), .Y(n436) );
  INVX2 U240 ( .A(C1[5]), .Y(n204) );
  INVX2 U241 ( .A(N201), .Y(n203) );
  MUX2X1 U242 ( .B(n204), .A(n203), .S(n169), .Y(n534) );
  MUX2X1 U243 ( .B(N200), .A(N163), .S(n171), .Y(n205) );
  INVX2 U244 ( .A(n205), .Y(n437) );
  INVX2 U245 ( .A(C1[4]), .Y(n207) );
  INVX2 U246 ( .A(N200), .Y(n206) );
  MUX2X1 U247 ( .B(n207), .A(n206), .S(n169), .Y(n535) );
  MUX2X1 U248 ( .B(N199), .A(N162), .S(n171), .Y(n208) );
  INVX2 U249 ( .A(n208), .Y(n438) );
  INVX2 U250 ( .A(C1[3]), .Y(n210) );
  INVX2 U251 ( .A(N199), .Y(n209) );
  MUX2X1 U252 ( .B(n210), .A(n209), .S(n169), .Y(n536) );
  MUX2X1 U253 ( .B(N198), .A(N161), .S(n171), .Y(n211) );
  INVX2 U254 ( .A(n211), .Y(n439) );
  INVX2 U255 ( .A(C1[2]), .Y(n213) );
  INVX2 U256 ( .A(N198), .Y(n212) );
  MUX2X1 U257 ( .B(n213), .A(n212), .S(n169), .Y(n537) );
  MUX2X1 U258 ( .B(N197), .A(N160), .S(n171), .Y(n214) );
  INVX2 U259 ( .A(n214), .Y(n440) );
  INVX2 U260 ( .A(C1[1]), .Y(n216) );
  INVX2 U261 ( .A(N197), .Y(n215) );
  MUX2X1 U262 ( .B(n216), .A(n215), .S(n169), .Y(n538) );
  MUX2X1 U263 ( .B(A1[8]), .A(N150), .S(n171), .Y(n217) );
  INVX2 U264 ( .A(n217), .Y(n414) );
  MUX2X1 U265 ( .B(A1[7]), .A(N149), .S(n171), .Y(n218) );
  INVX2 U266 ( .A(n218), .Y(n415) );
  MUX2X1 U267 ( .B(A1[6]), .A(N148), .S(n171), .Y(n219) );
  INVX2 U268 ( .A(n219), .Y(n416) );
  MUX2X1 U269 ( .B(A1[5]), .A(N147), .S(n171), .Y(n220) );
  INVX2 U270 ( .A(n220), .Y(n417) );
  MUX2X1 U271 ( .B(A1[4]), .A(N146), .S(n172), .Y(n221) );
  INVX2 U272 ( .A(n221), .Y(n418) );
  MUX2X1 U273 ( .B(A1[3]), .A(N145), .S(n172), .Y(n222) );
  INVX2 U274 ( .A(n222), .Y(n419) );
  MUX2X1 U275 ( .B(A1[2]), .A(N144), .S(n172), .Y(n223) );
  INVX2 U276 ( .A(n223), .Y(n420) );
  MUX2X1 U277 ( .B(A1[1]), .A(N143), .S(n172), .Y(n224) );
  INVX2 U278 ( .A(n224), .Y(n421) );
  MUX2X1 U279 ( .B(A1[0]), .A(N142), .S(n172), .Y(n225) );
  INVX2 U280 ( .A(n225), .Y(n422) );
  MUX2X1 U281 ( .B(D1[8]), .A(N186), .S(n172), .Y(n226) );
  INVX2 U282 ( .A(n226), .Y(n478) );
  MUX2X1 U283 ( .B(D1[7]), .A(N185), .S(n172), .Y(n227) );
  MUX2X1 U284 ( .B(D1[6]), .A(N184), .S(n172), .Y(n228) );
  INVX2 U285 ( .A(n228), .Y(n480) );
  MUX2X1 U286 ( .B(D1[5]), .A(N183), .S(n172), .Y(n229) );
  INVX2 U287 ( .A(n229), .Y(n482) );
  MUX2X1 U288 ( .B(D1[4]), .A(N182), .S(n172), .Y(n230) );
  INVX2 U289 ( .A(n230), .Y(n483) );
  MUX2X1 U290 ( .B(D1[3]), .A(N181), .S(n172), .Y(n231) );
  INVX2 U291 ( .A(n231), .Y(n486) );
  MUX2X1 U292 ( .B(D1[2]), .A(N180), .S(n172), .Y(n232) );
  INVX2 U293 ( .A(n232), .Y(n487) );
  MUX2X1 U294 ( .B(D1[1]), .A(N179), .S(n172), .Y(n233) );
  INVX2 U295 ( .A(n233), .Y(n488) );
  MUX2X1 U296 ( .B(D1[0]), .A(N178), .S(n173), .Y(n234) );
  INVX2 U297 ( .A(n234), .Y(n517) );
  NAND2X1 U298 ( .A(n16), .B(n18), .Y(n364) );
  MUX2X1 U299 ( .B(E1[9]), .A(N225), .S(n170), .Y(n235) );
  INVX2 U300 ( .A(n235), .Y(n548) );
  MUX2X1 U301 ( .B(E1[8]), .A(N224), .S(n170), .Y(n236) );
  INVX2 U302 ( .A(n236), .Y(n549) );
  MUX2X1 U303 ( .B(E1[7]), .A(N223), .S(n170), .Y(n237) );
  INVX2 U304 ( .A(n237), .Y(n550) );
  MUX2X1 U305 ( .B(E1[6]), .A(N222), .S(n170), .Y(n238) );
  INVX2 U306 ( .A(n238), .Y(n551) );
  MUX2X1 U307 ( .B(E1[5]), .A(N221), .S(n170), .Y(n239) );
  INVX2 U308 ( .A(n239), .Y(n552) );
  MUX2X1 U309 ( .B(E1[4]), .A(N220), .S(n170), .Y(n240) );
  INVX2 U310 ( .A(n240), .Y(n553) );
  MUX2X1 U311 ( .B(E1[3]), .A(N219), .S(n170), .Y(n241) );
  INVX2 U312 ( .A(n241), .Y(n554) );
  MUX2X1 U313 ( .B(E1[2]), .A(N218), .S(n170), .Y(n242) );
  INVX2 U314 ( .A(n242), .Y(n555) );
  MUX2X1 U315 ( .B(E1[1]), .A(N217), .S(n170), .Y(n243) );
  INVX2 U316 ( .A(n243), .Y(n556) );
  MUX2X1 U317 ( .B(E1[0]), .A(N216), .S(n170), .Y(n244) );
  INVX2 U318 ( .A(n244), .Y(n557) );
  INVX2 U319 ( .A(N236), .Y(n247) );
  OAI21X1 U320 ( .A(n408), .B(n24), .C(n28), .Y(n246) );
  OAI21X1 U321 ( .A(n1), .B(n247), .C(n246), .Y(n516) );
  INVX2 U322 ( .A(N237), .Y(n250) );
  XOR2X1 U323 ( .A(n30), .B(n28), .Y(n248) );
  AOI22X1 U324 ( .A(n248), .B(n408), .C(n30), .D(n24), .Y(n249) );
  OAI21X1 U325 ( .A(n1), .B(n250), .C(n249), .Y(n515) );
  INVX2 U326 ( .A(N238), .Y(n253) );
  XOR2X1 U327 ( .A(n254), .B(Gx[2]), .Y(n251) );
  AOI22X1 U328 ( .A(n251), .B(n408), .C(Gx[2]), .D(n24), .Y(n252) );
  OAI21X1 U329 ( .A(n1), .B(n253), .C(n252), .Y(n514) );
  INVX2 U330 ( .A(N239), .Y(n257) );
  XOR2X1 U331 ( .A(n258), .B(Gx[3]), .Y(n255) );
  AOI22X1 U332 ( .A(n255), .B(n408), .C(Gx[3]), .D(n24), .Y(n256) );
  OAI21X1 U333 ( .A(n1), .B(n257), .C(n256), .Y(n513) );
  INVX2 U334 ( .A(N240), .Y(n261) );
  XOR2X1 U335 ( .A(n262), .B(Gx[4]), .Y(n259) );
  AOI22X1 U336 ( .A(n259), .B(n408), .C(Gx[4]), .D(n24), .Y(n260) );
  OAI21X1 U337 ( .A(n1), .B(n261), .C(n260), .Y(n512) );
  INVX2 U338 ( .A(N241), .Y(n265) );
  XOR2X1 U339 ( .A(n266), .B(Gx[5]), .Y(n263) );
  AOI22X1 U340 ( .A(n263), .B(n408), .C(Gx[5]), .D(n24), .Y(n264) );
  OAI21X1 U341 ( .A(n1), .B(n265), .C(n264), .Y(n511) );
  INVX2 U342 ( .A(N242), .Y(n269) );
  XOR2X1 U343 ( .A(n270), .B(Gx[6]), .Y(n267) );
  AOI22X1 U344 ( .A(n267), .B(n408), .C(Gx[6]), .D(n24), .Y(n268) );
  OAI21X1 U345 ( .A(n1), .B(n269), .C(n268), .Y(n510) );
  INVX2 U346 ( .A(N243), .Y(n273) );
  XOR2X1 U347 ( .A(n274), .B(Gx[7]), .Y(n271) );
  AOI22X1 U348 ( .A(n271), .B(n408), .C(Gx[7]), .D(n24), .Y(n272) );
  OAI21X1 U349 ( .A(n1), .B(n273), .C(n272), .Y(n509) );
  INVX2 U350 ( .A(N244), .Y(n277) );
  XOR2X1 U351 ( .A(n278), .B(Gx[8]), .Y(n275) );
  AOI22X1 U352 ( .A(n275), .B(n408), .C(Gx[8]), .D(n24), .Y(n276) );
  OAI21X1 U353 ( .A(n1), .B(n277), .C(n276), .Y(n508) );
  INVX2 U354 ( .A(N245), .Y(n281) );
  XOR2X1 U355 ( .A(n282), .B(Gx[9]), .Y(n279) );
  AOI22X1 U356 ( .A(n279), .B(n408), .C(Gx[9]), .D(n24), .Y(n280) );
  OAI21X1 U357 ( .A(n1), .B(n281), .C(n280), .Y(n507) );
  NOR2X1 U358 ( .A(Gx[9]), .B(n282), .Y(n283) );
  XNOR2X1 U359 ( .A(n283), .B(Gx[10]), .Y(n284) );
  AOI22X1 U360 ( .A(n24), .B(Gx[10]), .C(n284), .D(n408), .Y(n286) );
  NAND2X1 U361 ( .A(N246), .B(n392), .Y(n285) );
  NAND2X1 U362 ( .A(n286), .B(n285), .Y(n506) );
  NAND2X1 U363 ( .A(n8), .B(n18), .Y(n459) );
  MUX2X1 U364 ( .B(N215), .A(N177), .S(n173), .Y(n287) );
  INVX2 U365 ( .A(n287), .Y(n441) );
  INVX2 U366 ( .A(C2[9]), .Y(n289) );
  INVX2 U367 ( .A(N215), .Y(n288) );
  MUX2X1 U368 ( .B(n289), .A(n288), .S(n169), .Y(n539) );
  MUX2X1 U369 ( .B(N214), .A(N176), .S(n173), .Y(n290) );
  INVX2 U370 ( .A(n290), .Y(n443) );
  INVX2 U371 ( .A(C2[8]), .Y(n292) );
  INVX2 U372 ( .A(N214), .Y(n291) );
  MUX2X1 U373 ( .B(n292), .A(n291), .S(n169), .Y(n540) );
  MUX2X1 U374 ( .B(N213), .A(N175), .S(n173), .Y(n293) );
  INVX2 U375 ( .A(n293), .Y(n444) );
  INVX2 U376 ( .A(C2[7]), .Y(n295) );
  INVX2 U377 ( .A(N213), .Y(n294) );
  MUX2X1 U378 ( .B(n295), .A(n294), .S(n169), .Y(n541) );
  MUX2X1 U379 ( .B(N212), .A(N174), .S(n173), .Y(n296) );
  INVX2 U380 ( .A(n296), .Y(n451) );
  INVX2 U381 ( .A(C2[6]), .Y(n298) );
  INVX2 U382 ( .A(N212), .Y(n297) );
  MUX2X1 U383 ( .B(n298), .A(n297), .S(n169), .Y(n542) );
  MUX2X1 U384 ( .B(N211), .A(N173), .S(n173), .Y(n299) );
  INVX2 U385 ( .A(n299), .Y(n452) );
  INVX2 U386 ( .A(C2[5]), .Y(n301) );
  INVX2 U387 ( .A(N211), .Y(n300) );
  MUX2X1 U388 ( .B(n301), .A(n300), .S(n169), .Y(n543) );
  MUX2X1 U389 ( .B(N210), .A(N172), .S(n173), .Y(n302) );
  INVX2 U390 ( .A(n302), .Y(n461) );
  INVX2 U391 ( .A(C2[4]), .Y(n305) );
  INVX2 U392 ( .A(N210), .Y(n304) );
  MUX2X1 U393 ( .B(n305), .A(n304), .S(n169), .Y(n544) );
  MUX2X1 U394 ( .B(N209), .A(N171), .S(n173), .Y(n306) );
  INVX2 U395 ( .A(n306), .Y(n466) );
  INVX2 U396 ( .A(C2[3]), .Y(n308) );
  INVX2 U397 ( .A(N209), .Y(n307) );
  MUX2X1 U398 ( .B(n308), .A(n307), .S(n169), .Y(n545) );
  MUX2X1 U399 ( .B(N208), .A(N170), .S(n173), .Y(n309) );
  INVX2 U400 ( .A(n309), .Y(n469) );
  INVX2 U401 ( .A(C2[2]), .Y(n311) );
  INVX2 U402 ( .A(N208), .Y(n310) );
  MUX2X1 U403 ( .B(n311), .A(n310), .S(n169), .Y(n546) );
  MUX2X1 U404 ( .B(N207), .A(N169), .S(n173), .Y(n312) );
  INVX2 U405 ( .A(n312), .Y(n477) );
  INVX2 U406 ( .A(C2[1]), .Y(n314) );
  INVX2 U407 ( .A(N207), .Y(n313) );
  MUX2X1 U408 ( .B(n314), .A(n313), .S(n169), .Y(n547) );
  MUX2X1 U409 ( .B(A2[8]), .A(N159), .S(n173), .Y(n316) );
  INVX2 U410 ( .A(n316), .Y(n423) );
  MUX2X1 U411 ( .B(A2[7]), .A(N158), .S(n173), .Y(n317) );
  INVX2 U412 ( .A(n317), .Y(n424) );
  MUX2X1 U413 ( .B(A2[6]), .A(N157), .S(n173), .Y(n318) );
  INVX2 U414 ( .A(n318), .Y(n425) );
  MUX2X1 U415 ( .B(A2[5]), .A(N156), .S(n174), .Y(n319) );
  INVX2 U416 ( .A(n319), .Y(n426) );
  MUX2X1 U417 ( .B(A2[4]), .A(N155), .S(n174), .Y(n320) );
  INVX2 U418 ( .A(n320), .Y(n427) );
  MUX2X1 U419 ( .B(A2[3]), .A(N154), .S(n174), .Y(n321) );
  INVX2 U420 ( .A(n321), .Y(n428) );
  MUX2X1 U421 ( .B(A2[2]), .A(N153), .S(n174), .Y(n322) );
  INVX2 U422 ( .A(n322), .Y(n429) );
  MUX2X1 U423 ( .B(A2[1]), .A(N152), .S(n174), .Y(n323) );
  INVX2 U424 ( .A(n323), .Y(n430) );
  MUX2X1 U425 ( .B(A2[0]), .A(N151), .S(n174), .Y(n324) );
  INVX2 U426 ( .A(n324), .Y(n431) );
  MUX2X1 U427 ( .B(D2[8]), .A(N195), .S(n174), .Y(n325) );
  INVX2 U428 ( .A(n325), .Y(n518) );
  MUX2X1 U429 ( .B(D2[7]), .A(N194), .S(n174), .Y(n326) );
  INVX2 U430 ( .A(n326), .Y(n520) );
  MUX2X1 U431 ( .B(D2[6]), .A(N193), .S(n174), .Y(n327) );
  INVX2 U432 ( .A(n327), .Y(n523) );
  MUX2X1 U433 ( .B(D2[5]), .A(N192), .S(n174), .Y(n328) );
  INVX2 U434 ( .A(n328), .Y(n524) );
  MUX2X1 U435 ( .B(D2[4]), .A(N191), .S(n174), .Y(n329) );
  INVX2 U436 ( .A(n329), .Y(n525) );
  MUX2X1 U437 ( .B(D2[3]), .A(N190), .S(n174), .Y(n330) );
  INVX2 U438 ( .A(n330), .Y(n526) );
  MUX2X1 U439 ( .B(D2[2]), .A(N189), .S(n174), .Y(n331) );
  INVX2 U440 ( .A(n331), .Y(n527) );
  MUX2X1 U441 ( .B(D2[1]), .A(N188), .S(n175), .Y(n332) );
  INVX2 U442 ( .A(n332), .Y(n528) );
  MUX2X1 U443 ( .B(D2[0]), .A(N187), .S(n175), .Y(n334) );
  INVX2 U444 ( .A(n334), .Y(n529) );
  MUX2X1 U445 ( .B(E2[9]), .A(N235), .S(n170), .Y(n335) );
  INVX2 U446 ( .A(n335), .Y(n558) );
  MUX2X1 U447 ( .B(E2[8]), .A(N234), .S(n170), .Y(n336) );
  INVX2 U448 ( .A(n336), .Y(n559) );
  MUX2X1 U449 ( .B(E2[7]), .A(N233), .S(n170), .Y(n337) );
  INVX2 U450 ( .A(n337), .Y(n560) );
  MUX2X1 U451 ( .B(E2[6]), .A(N232), .S(n170), .Y(n338) );
  INVX2 U452 ( .A(n338), .Y(n561) );
  MUX2X1 U453 ( .B(E2[5]), .A(N231), .S(n170), .Y(n339) );
  INVX2 U454 ( .A(n339), .Y(n562) );
  MUX2X1 U455 ( .B(E2[4]), .A(N230), .S(n170), .Y(n340) );
  INVX2 U456 ( .A(n340), .Y(n563) );
  MUX2X1 U457 ( .B(E2[3]), .A(N229), .S(n170), .Y(n342) );
  INVX2 U460 ( .A(n342), .Y(n564) );
  MUX2X1 U461 ( .B(E2[2]), .A(N228), .S(n170), .Y(n343) );
  INVX2 U463 ( .A(n343), .Y(n565) );
  MUX2X1 U466 ( .B(E2[1]), .A(N227), .S(n170), .Y(n344) );
  INVX2 U468 ( .A(n344), .Y(n566) );
  MUX2X1 U470 ( .B(E2[0]), .A(N226), .S(n170), .Y(n345) );
  INVX2 U471 ( .A(n345), .Y(n567) );
  INVX2 U473 ( .A(N247), .Y(n347) );
  NAND2X1 U474 ( .A(n1), .B(n459), .Y(n396) );
  INVX2 U480 ( .A(n396), .Y(n412) );
  OAI21X1 U481 ( .A(n393), .B(n412), .C(n26), .Y(n346) );
  OAI21X1 U483 ( .A(n1), .B(n347), .C(n346), .Y(n522) );
  INVX2 U485 ( .A(n27), .Y(n350) );
  XOR2X1 U486 ( .A(n27), .B(n26), .Y(n348) );
  AOI22X1 U489 ( .A(n348), .B(n393), .C(N248), .D(n392), .Y(n349) );
  OAI21X1 U494 ( .A(n396), .B(n350), .C(n349), .Y(n497) );
  INVX2 U495 ( .A(Gy[2]), .Y(n354) );
  NAND2X1 U496 ( .A(n25), .B(n350), .Y(n353) );
  XOR2X1 U497 ( .A(n353), .B(Gy[2]), .Y(n351) );
  AOI22X1 U498 ( .A(n351), .B(n393), .C(N249), .D(n392), .Y(n352) );
  OAI21X1 U499 ( .A(n396), .B(n354), .C(n352), .Y(n498) );
  INVX2 U500 ( .A(Gy[3]), .Y(n359) );
  INVX2 U501 ( .A(n353), .Y(n355) );
  NAND2X1 U502 ( .A(n355), .B(n354), .Y(n358) );
  XOR2X1 U503 ( .A(n358), .B(Gy[3]), .Y(n356) );
  AOI22X1 U504 ( .A(n356), .B(n393), .C(N250), .D(n392), .Y(n357) );
  OAI21X1 U505 ( .A(n396), .B(n359), .C(n357), .Y(n499) );
  INVX2 U506 ( .A(Gy[4]), .Y(n365) );
  INVX2 U507 ( .A(n358), .Y(n360) );
  NAND2X1 U508 ( .A(n360), .B(n359), .Y(n363) );
  XOR2X1 U509 ( .A(n363), .B(Gy[4]), .Y(n361) );
  AOI22X1 U510 ( .A(n361), .B(n393), .C(N251), .D(n392), .Y(n362) );
  OAI21X1 U511 ( .A(n396), .B(n365), .C(n362), .Y(n500) );
  INVX2 U512 ( .A(Gy[5]), .Y(n370) );
  INVX2 U513 ( .A(n363), .Y(n366) );
  NAND2X1 U514 ( .A(n366), .B(n365), .Y(n369) );
  XOR2X1 U515 ( .A(n369), .B(Gy[5]), .Y(n367) );
  AOI22X1 U516 ( .A(n367), .B(n393), .C(N252), .D(n392), .Y(n368) );
  OAI21X1 U517 ( .A(n396), .B(n370), .C(n368), .Y(n501) );
  INVX2 U518 ( .A(Gy[6]), .Y(n375) );
  INVX2 U519 ( .A(n369), .Y(n371) );
  NAND2X1 U520 ( .A(n371), .B(n370), .Y(n374) );
  XOR2X1 U521 ( .A(n374), .B(Gy[6]), .Y(n372) );
  AOI22X1 U522 ( .A(n372), .B(n393), .C(N253), .D(n392), .Y(n373) );
  OAI21X1 U523 ( .A(n396), .B(n375), .C(n373), .Y(n502) );
  INVX2 U524 ( .A(Gy[7]), .Y(n380) );
  INVX2 U525 ( .A(n374), .Y(n376) );
  NAND2X1 U526 ( .A(n376), .B(n375), .Y(n379) );
  XOR2X1 U527 ( .A(n379), .B(Gy[7]), .Y(n377) );
  AOI22X1 U528 ( .A(n377), .B(n393), .C(N254), .D(n392), .Y(n378) );
  OAI21X1 U529 ( .A(n396), .B(n380), .C(n378), .Y(n503) );
  INVX2 U530 ( .A(Gy[8]), .Y(n385) );
  INVX2 U531 ( .A(n379), .Y(n381) );
  NAND2X1 U532 ( .A(n381), .B(n380), .Y(n384) );
  XOR2X1 U533 ( .A(n384), .B(Gy[8]), .Y(n382) );
  AOI22X1 U534 ( .A(n382), .B(n393), .C(N255), .D(n392), .Y(n383) );
  OAI21X1 U535 ( .A(n396), .B(n385), .C(n383), .Y(n504) );
  INVX2 U536 ( .A(Gy[9]), .Y(n390) );
  XOR2X1 U537 ( .A(n389), .B(Gy[9]), .Y(n387) );
  AOI22X1 U538 ( .A(n387), .B(n393), .C(N256), .D(n392), .Y(n388) );
  OAI21X1 U539 ( .A(n396), .B(n390), .C(n388), .Y(n505) );
  INVX2 U540 ( .A(Gy[10]), .Y(n410) );
  NAND2X1 U541 ( .A(n23), .B(n390), .Y(n391) );
  XOR2X1 U542 ( .A(n391), .B(Gy[10]), .Y(n394) );
  AOI22X1 U543 ( .A(n394), .B(n393), .C(N257), .D(n392), .Y(n395) );
  OAI21X1 U544 ( .A(n410), .B(n396), .C(n395), .Y(n521) );
  MUX2X1 U545 ( .B(temp_sum[0]), .A(N280), .S(n404), .Y(n397) );
  NAND2X1 U546 ( .A(n406), .B(n397), .Y(n496) );
  MUX2X1 U547 ( .B(temp_sum[1]), .A(N281), .S(n404), .Y(n398) );
  NAND2X1 U548 ( .A(n406), .B(n398), .Y(n495) );
  MUX2X1 U549 ( .B(temp_sum[2]), .A(N282), .S(n404), .Y(n399) );
  NAND2X1 U550 ( .A(n406), .B(n399), .Y(n494) );
  MUX2X1 U551 ( .B(temp_sum[3]), .A(N283), .S(n404), .Y(n400) );
  NAND2X1 U552 ( .A(n406), .B(n400), .Y(n493) );
  MUX2X1 U553 ( .B(temp_sum[4]), .A(N284), .S(n404), .Y(n401) );
  NAND2X1 U554 ( .A(n406), .B(n401), .Y(n492) );
  MUX2X1 U555 ( .B(temp_sum[5]), .A(N285), .S(n404), .Y(n402) );
  NAND2X1 U556 ( .A(n406), .B(n402), .Y(n491) );
  MUX2X1 U557 ( .B(temp_sum[6]), .A(N286), .S(n404), .Y(n403) );
  NAND2X1 U558 ( .A(n406), .B(n403), .Y(n490) );
  MUX2X1 U559 ( .B(temp_sum[7]), .A(N287), .S(n404), .Y(n405) );
  NAND2X1 U560 ( .A(n406), .B(n405), .Y(n489) );
  NAND2X1 U561 ( .A(n22), .B(n8), .Y(n457) );
  NAND2X1 U562 ( .A(n9), .B(n18), .Y(n458) );
  NAND2X1 U563 ( .A(n2), .B(n8), .Y(n465) );
  OAI21X1 U564 ( .A(Gx[10]), .B(n465), .C(n315), .Y(n455) );
  INVX2 U565 ( .A(n470), .Y(n407) );
  NOR2X1 U566 ( .A(n408), .B(n407), .Y(n409) );
  OAI21X1 U567 ( .A(n457), .B(n410), .C(n409), .Y(n447) );
  INVX2 U568 ( .A(Gx[10]), .Y(n411) );
  OAI21X1 U569 ( .A(n465), .B(n411), .C(n458), .Y(n448) );
  INVX2 U570 ( .A(n448), .Y(n568) );
  OAI21X1 U571 ( .A(Gy[10]), .B(n457), .C(n458), .Y(n456) );
  INVX2 U572 ( .A(n303), .Y(n569) );
  INVX2 U573 ( .A(n472), .Y(n570) );
  NOR2X1 U574 ( .A(n463), .B(n464), .Y(n462) );
endmodule


module edge_detection_7_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n48, n49, n51, n54, n56, n58, n60, n102,
         n103, n104, n105, n107, n108, n109, n110, n111;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  XNOR2X1 U4 ( .A(n17), .B(n2), .Y(SUM[9]) );
  AOI21X1 U5 ( .A(n105), .B(n17), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n105), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n108), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n109), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n104), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n104), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n28), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n103), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n103), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n36), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n41), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n102), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n102), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n44), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n110), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n110), .Y(n10) );
  NAND2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  OR2X2 U77 ( .A(B[3]), .B(A[3]), .Y(n102) );
  OR2X2 U78 ( .A(B[5]), .B(A[5]), .Y(n103) );
  OR2X2 U79 ( .A(B[7]), .B(A[7]), .Y(n104) );
  OR2X2 U80 ( .A(B[9]), .B(A[9]), .Y(n105) );
  AND2X2 U81 ( .A(n51), .B(n111), .Y(SUM[0]) );
  INVX1 U82 ( .A(n20), .Y(n107) );
  INVX2 U83 ( .A(n107), .Y(n108) );
  OAI21X1 U84 ( .A(n28), .B(n26), .C(n27), .Y(n109) );
  OR2X2 U85 ( .A(B[1]), .B(A[1]), .Y(n110) );
  OR2X2 U86 ( .A(B[0]), .B(A[0]), .Y(n111) );
  XNOR2X1 U87 ( .A(n12), .B(n1), .Y(SUM[10]) );
  INVX2 U88 ( .A(n42), .Y(n60) );
  INVX2 U89 ( .A(n34), .Y(n58) );
  INVX2 U90 ( .A(n26), .Y(n56) );
  INVX2 U91 ( .A(n18), .Y(n54) );
  INVX2 U92 ( .A(n51), .Y(n49) );
  INVX2 U93 ( .A(n48), .Y(n46) );
  INVX2 U94 ( .A(n40), .Y(n38) );
  INVX2 U95 ( .A(n32), .Y(n30) );
  INVX2 U96 ( .A(n24), .Y(n22) );
  INVX2 U97 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_7_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_7_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_7_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_7_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_7_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n16, n17, n18, n19,
         n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66, n67,
         n68;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n67), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n68), .B(n16), .C(n64), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n68), .Y(n2) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U39 ( .A(A[0]), .Y(n65) );
  AND2X2 U40 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U41 ( .A(n64), .Y(n15) );
  AND2X2 U42 ( .A(n65), .B(B[0]), .Y(n19) );
  INVX1 U43 ( .A(B[0]), .Y(n30) );
  INVX1 U44 ( .A(n16), .Y(n66) );
  INVX2 U45 ( .A(n66), .Y(n67) );
  OR2X2 U46 ( .A(A[2]), .B(n28), .Y(n68) );
  INVX2 U47 ( .A(B[1]), .Y(n29) );
  INVX2 U48 ( .A(B[2]), .Y(n28) );
  INVX2 U49 ( .A(B[3]), .Y(n27) );
  INVX2 U50 ( .A(B[4]), .Y(n26) );
  INVX2 U51 ( .A(B[5]), .Y(n25) );
  INVX2 U52 ( .A(B[6]), .Y(n24) );
  INVX2 U53 ( .A(B[7]), .Y(n23) );
  INVX2 U54 ( .A(n17), .Y(n22) );
  INVX2 U55 ( .A(n9), .Y(n20) );
  INVX2 U56 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_7_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n73), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U40 ( .A(B[7]), .Y(n23) );
  INVX1 U41 ( .A(B[6]), .Y(n24) );
  INVX1 U42 ( .A(B[5]), .Y(n25) );
  INVX1 U43 ( .A(B[2]), .Y(n28) );
  INVX1 U44 ( .A(B[1]), .Y(n29) );
  XOR2X1 U45 ( .A(A[6]), .B(n24), .Y(n65) );
  XOR2X1 U46 ( .A(n65), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U47 ( .A(A[6]), .B(n24), .Y(n66) );
  NAND2X1 U48 ( .A(A[6]), .B(n6), .Y(n67) );
  NAND2X1 U49 ( .A(n24), .B(n6), .Y(n68) );
  NAND3X1 U50 ( .A(n66), .B(n67), .C(n68), .Y(n5) );
  XOR2X1 U51 ( .A(A[7]), .B(n23), .Y(n69) );
  XOR2X1 U52 ( .A(n69), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U53 ( .A(A[7]), .B(n23), .Y(n70) );
  NAND2X1 U54 ( .A(A[7]), .B(n5), .Y(n71) );
  NAND2X1 U55 ( .A(n23), .B(n5), .Y(n72) );
  NAND3X1 U56 ( .A(n70), .B(n71), .C(n72), .Y(n4) );
  BUFX2 U57 ( .A(n16), .Y(n73) );
  INVX2 U58 ( .A(B[0]), .Y(n30) );
  INVX2 U59 ( .A(B[3]), .Y(n27) );
  INVX2 U60 ( .A(B[4]), .Y(n26) );
  INVX2 U61 ( .A(n17), .Y(n22) );
  INVX2 U62 ( .A(n9), .Y(n20) );
  INVX2 U63 ( .A(n15), .Y(n13) );
  INVX2 U64 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_7_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  INVX1 U39 ( .A(B[2]), .Y(n28) );
  OR2X2 U40 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U41 ( .A(n4), .Y(DIFF[8]) );
  INVX2 U42 ( .A(B[0]), .Y(n30) );
  INVX2 U43 ( .A(B[1]), .Y(n29) );
  INVX2 U44 ( .A(B[3]), .Y(n27) );
  INVX2 U45 ( .A(B[4]), .Y(n26) );
  INVX2 U46 ( .A(B[5]), .Y(n25) );
  INVX2 U47 ( .A(B[6]), .Y(n24) );
  INVX2 U48 ( .A(B[7]), .Y(n23) );
  INVX2 U49 ( .A(n17), .Y(n22) );
  INVX2 U50 ( .A(n9), .Y(n20) );
  INVX2 U51 ( .A(n15), .Y(n13) );
endmodule


module edge_detection_7_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n72), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n72), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  XOR2X1 U39 ( .A(A[6]), .B(n24), .Y(n64) );
  XOR2X1 U40 ( .A(n64), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U41 ( .A(A[6]), .B(n24), .Y(n65) );
  NAND2X1 U42 ( .A(A[6]), .B(n6), .Y(n66) );
  NAND2X1 U43 ( .A(n24), .B(n6), .Y(n67) );
  NAND3X1 U44 ( .A(n65), .B(n66), .C(n67), .Y(n5) );
  XOR2X1 U45 ( .A(A[7]), .B(n23), .Y(n68) );
  XOR2X1 U46 ( .A(n68), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U47 ( .A(A[7]), .B(n23), .Y(n69) );
  NAND2X1 U48 ( .A(A[7]), .B(n5), .Y(n70) );
  NAND2X1 U49 ( .A(n23), .B(n5), .Y(n71) );
  NAND3X1 U50 ( .A(n69), .B(n70), .C(n71), .Y(n4) );
  INVX1 U51 ( .A(B[2]), .Y(n28) );
  OR2X2 U52 ( .A(A[2]), .B(n28), .Y(n72) );
  INVX2 U53 ( .A(B[0]), .Y(n30) );
  INVX2 U54 ( .A(B[1]), .Y(n29) );
  INVX2 U55 ( .A(B[3]), .Y(n27) );
  INVX2 U56 ( .A(B[4]), .Y(n26) );
  INVX2 U57 ( .A(B[5]), .Y(n25) );
  INVX2 U58 ( .A(B[6]), .Y(n24) );
  INVX2 U59 ( .A(B[7]), .Y(n23) );
  INVX2 U60 ( .A(n17), .Y(n22) );
  INVX2 U61 ( .A(n9), .Y(n20) );
  INVX2 U62 ( .A(n15), .Y(n13) );
  INVX2 U63 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_7_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n66), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X1 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U40 ( .A(n16), .Y(n65) );
  INVX2 U41 ( .A(n65), .Y(n66) );
  INVX2 U42 ( .A(B[0]), .Y(n30) );
  INVX2 U43 ( .A(B[1]), .Y(n29) );
  INVX2 U44 ( .A(B[2]), .Y(n28) );
  INVX2 U45 ( .A(B[3]), .Y(n27) );
  INVX2 U46 ( .A(B[4]), .Y(n26) );
  INVX2 U47 ( .A(B[5]), .Y(n25) );
  INVX2 U48 ( .A(B[6]), .Y(n24) );
  INVX2 U49 ( .A(B[7]), .Y(n23) );
  INVX2 U50 ( .A(n17), .Y(n22) );
  INVX2 U51 ( .A(n9), .Y(n20) );
  INVX2 U52 ( .A(n15), .Y(n13) );
  INVX2 U53 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_7_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_7 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n571), .CLK(clk), .R(n187), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n572), .CLK(clk), .R(n187), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n187), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n573), .CLK(clk), .R(n187), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n530), .CLK(clk), .R(n187), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n584), .CLK(clk), .R(n186), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n186), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n186), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n422), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n421), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n420), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n419), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n418), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n417), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n416), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n415), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n414), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n440), .CLK(clk), .R(n185), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n439), .CLK(clk), .R(n185), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n438), .CLK(clk), .R(n185), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n437), .CLK(clk), .R(n185), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n436), .CLK(clk), .R(n185), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n435), .CLK(clk), .R(n185), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n434), .CLK(clk), .R(n185), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n433), .CLK(clk), .R(n185), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n432), .CLK(clk), .R(n185), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n538), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n537), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n536), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n535), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n534), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n533), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n532), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n531), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n517), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n488), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n487), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n486), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n483), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n482), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n480), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n479), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n478), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n557), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n556), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n555), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n554), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n553), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n552), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n551), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n550), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n549), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n548), .CLK(clk), .R(n182), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n431), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n430), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n429), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n428), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n427), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n426), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n425), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n424), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n423), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n477), .CLK(clk), .R(n182), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n469), .CLK(clk), .R(n182), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n466), .CLK(clk), .R(n181), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n461), .CLK(clk), .R(n181), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n452), .CLK(clk), .R(n181), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n451), .CLK(clk), .R(n181), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n444), .CLK(clk), .R(n181), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n443), .CLK(clk), .R(n181), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n441), .CLK(clk), .R(n181), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n529), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n528), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n527), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n526), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n525), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n524), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n523), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n520), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n518), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n567), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n566), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n565), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n564), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n563), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n562), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n561), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n560), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n559), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n558), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n569), .CLK(clk), .R(n179), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n574), .CLK(clk), .R(n179), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n575), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n576), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n577), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n578), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n579), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n580), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n581), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n582), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n583), .CLK(clk), .R(n178), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n547), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n546), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n545), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n544), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n543), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n542), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n541), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n540), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n539), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n593), .CLK(clk), .R(n178), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n592), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n591), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n590), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n589), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n588), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n587), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n586), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n585), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n594), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n595), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n596), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n597), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n598), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n599), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n600), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n601), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n634), .B(n627), .Y(n618) );
  AND2X2 U160 ( .A(n637), .B(n636), .Y(n604) );
  OR2X1 U458 ( .A(n629), .B(n628), .Y(n630) );
  NAND3X1 U459 ( .A(n627), .B(n626), .C(n412), .Y(n631) );
  OR2X1 U462 ( .A(n623), .B(n622), .Y(n624) );
  NAND3X1 U464 ( .A(n619), .B(n626), .C(n618), .Y(n625) );
  OAI21X1 U465 ( .A(n626), .B(n413), .C(n617), .Y(n573) );
  NAND2X1 U467 ( .A(n568), .B(n621), .Y(n615) );
  NAND3X1 U469 ( .A(n632), .B(n636), .C(n633), .Y(n616) );
  OR2X1 U472 ( .A(n623), .B(n629), .Y(n612) );
  NAND3X1 U475 ( .A(n633), .B(n626), .C(n610), .Y(n613) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n570), .Y(n610) );
  NAND2X1 U477 ( .A(n608), .B(n607), .Y(n626) );
  NOR2X1 U478 ( .A(n606), .B(n605), .Y(n607) );
  NAND3X1 U479 ( .A(n634), .B(n633), .C(n614), .Y(n605) );
  NAND3X1 U482 ( .A(n635), .B(n632), .C(n604), .Y(n606) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n637) );
  NOR2X1 U487 ( .A(n603), .B(n602), .Y(n608) );
  NAND3X1 U488 ( .A(n609), .B(n620), .C(n412), .Y(n602) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n609) );
  NAND3X1 U491 ( .A(n621), .B(n611), .C(n627), .Y(n603) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n627) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n611) );
  edge_detection_7_DW01_add_7 add_231 ( .A({Gx[10:2], n30, n28}), .B({Gy[10:2], 
        n27, n26}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_7_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_7_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_7_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_7_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_7_DW01_sub_8 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_7_DW01_sub_9 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_7_DW01_sub_10 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_7_DW01_sub_11 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_7_DW01_sub_12 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_7_DW01_sub_13 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n413), .B(n188), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n189), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n245), .Y(n9) );
  AND2X2 U52 ( .A(n245), .B(n189), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n188), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n613), .B(n612), .Y(n19) );
  OR2X2 U158 ( .A(n625), .B(n624), .Y(n20) );
  OR2X2 U159 ( .A(n631), .B(n630), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n413), .Y(n22) );
  NOR2X1 U162 ( .A(n379), .B(Gy[7]), .Y(n23) );
  INVX1 U163 ( .A(n23), .Y(n383) );
  INVX4 U164 ( .A(n65), .Y(n406) );
  OR2X1 U165 ( .A(n28), .B(n30), .Y(n254) );
  OR2X1 U166 ( .A(n254), .B(Gx[2]), .Y(n258) );
  OR2X2 U167 ( .A(n262), .B(Gx[4]), .Y(n266) );
  OR2X2 U168 ( .A(n270), .B(Gx[6]), .Y(n274) );
  OR2X2 U169 ( .A(n278), .B(Gx[8]), .Y(n282) );
  BUFX2 U170 ( .A(n333), .Y(n174) );
  BUFX2 U171 ( .A(n333), .Y(n173) );
  BUFX2 U172 ( .A(n333), .Y(n171) );
  BUFX2 U173 ( .A(n333), .Y(n172) );
  INVX2 U174 ( .A(n634), .Y(n170) );
  INVX2 U175 ( .A(n1), .Y(n392) );
  INVX2 U176 ( .A(n633), .Y(n169) );
  BUFX2 U177 ( .A(n333), .Y(n175) );
  INVX2 U178 ( .A(n635), .Y(n408) );
  AND2X2 U179 ( .A(n635), .B(n1), .Y(n24) );
  INVX2 U180 ( .A(n619), .Y(n393) );
  INVX2 U181 ( .A(N288), .Y(n141) );
  BUFX2 U182 ( .A(n_rst), .Y(n176) );
  BUFX2 U183 ( .A(n_rst), .Y(n177) );
  BUFX2 U184 ( .A(n_rst), .Y(n179) );
  BUFX2 U185 ( .A(n_rst), .Y(n180) );
  BUFX2 U186 ( .A(n_rst), .Y(n181) );
  BUFX2 U187 ( .A(n_rst), .Y(n182) );
  BUFX2 U188 ( .A(n_rst), .Y(n183) );
  BUFX2 U189 ( .A(n_rst), .Y(n184) );
  BUFX2 U190 ( .A(n_rst), .Y(n186) );
  BUFX2 U191 ( .A(n_rst), .Y(n178) );
  BUFX2 U192 ( .A(n_rst), .Y(n185) );
  BUFX2 U193 ( .A(n_rst), .Y(n187) );
  OR2X1 U194 ( .A(n274), .B(Gx[7]), .Y(n278) );
  BUFX2 U195 ( .A(Gy[1]), .Y(n27) );
  INVX2 U196 ( .A(n25), .Y(n26) );
  OR2X1 U197 ( .A(n258), .B(Gx[3]), .Y(n262) );
  OR2X1 U198 ( .A(n266), .B(Gx[5]), .Y(n270) );
  INVX2 U201 ( .A(N269), .Y(n25) );
  BUFX4 U202 ( .A(N258), .Y(n28) );
  INVX2 U203 ( .A(Gx[1]), .Y(n29) );
  INVX4 U204 ( .A(n29), .Y(n30) );
  AOI21X1 U205 ( .A(n141), .B(n168), .C(n636), .Y(n65) );
  NOR2X1 U206 ( .A(N289), .B(N290), .Y(n168) );
  INVX2 U207 ( .A(n636), .Y(n404) );
  INVX1 U208 ( .A(n227), .Y(n479) );
  INVX2 U209 ( .A(state[1]), .Y(n413) );
  INVX2 U210 ( .A(state[0]), .Y(n188) );
  NAND3X1 U211 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n636) );
  INVX2 U212 ( .A(state[2]), .Y(n189) );
  NAND2X1 U213 ( .A(n17), .B(n8), .Y(n635) );
  INVX2 U214 ( .A(state[3]), .Y(n245) );
  NAND2X1 U215 ( .A(n16), .B(n22), .Y(n632) );
  INVX2 U216 ( .A(n632), .Y(n333) );
  MUX2X1 U217 ( .B(N205), .A(N168), .S(n171), .Y(n190) );
  INVX2 U218 ( .A(n190), .Y(n432) );
  NAND2X1 U219 ( .A(n16), .B(n17), .Y(n633) );
  INVX2 U220 ( .A(C1[9]), .Y(n192) );
  INVX2 U221 ( .A(N205), .Y(n191) );
  MUX2X1 U222 ( .B(n192), .A(n191), .S(n169), .Y(n530) );
  MUX2X1 U223 ( .B(N204), .A(N167), .S(n171), .Y(n193) );
  INVX2 U224 ( .A(n193), .Y(n433) );
  INVX2 U225 ( .A(C1[8]), .Y(n195) );
  INVX2 U226 ( .A(N204), .Y(n194) );
  MUX2X1 U227 ( .B(n195), .A(n194), .S(n169), .Y(n531) );
  MUX2X1 U228 ( .B(N203), .A(N166), .S(n171), .Y(n196) );
  INVX2 U229 ( .A(n196), .Y(n434) );
  INVX2 U230 ( .A(C1[7]), .Y(n198) );
  INVX2 U231 ( .A(N203), .Y(n197) );
  MUX2X1 U232 ( .B(n198), .A(n197), .S(n169), .Y(n532) );
  MUX2X1 U233 ( .B(N202), .A(N165), .S(n171), .Y(n199) );
  INVX2 U234 ( .A(n199), .Y(n435) );
  INVX2 U235 ( .A(C1[6]), .Y(n201) );
  INVX2 U236 ( .A(N202), .Y(n200) );
  MUX2X1 U237 ( .B(n201), .A(n200), .S(n169), .Y(n533) );
  MUX2X1 U238 ( .B(N201), .A(N164), .S(n171), .Y(n202) );
  INVX2 U239 ( .A(n202), .Y(n436) );
  INVX2 U240 ( .A(C1[5]), .Y(n204) );
  INVX2 U241 ( .A(N201), .Y(n203) );
  MUX2X1 U242 ( .B(n204), .A(n203), .S(n169), .Y(n534) );
  MUX2X1 U243 ( .B(N200), .A(N163), .S(n171), .Y(n205) );
  INVX2 U244 ( .A(n205), .Y(n437) );
  INVX2 U245 ( .A(C1[4]), .Y(n207) );
  INVX2 U246 ( .A(N200), .Y(n206) );
  MUX2X1 U247 ( .B(n207), .A(n206), .S(n169), .Y(n535) );
  MUX2X1 U248 ( .B(N199), .A(N162), .S(n171), .Y(n208) );
  INVX2 U249 ( .A(n208), .Y(n438) );
  INVX2 U250 ( .A(C1[3]), .Y(n210) );
  INVX2 U251 ( .A(N199), .Y(n209) );
  MUX2X1 U252 ( .B(n210), .A(n209), .S(n169), .Y(n536) );
  MUX2X1 U253 ( .B(N198), .A(N161), .S(n171), .Y(n211) );
  INVX2 U254 ( .A(n211), .Y(n439) );
  INVX2 U255 ( .A(C1[2]), .Y(n213) );
  INVX2 U256 ( .A(N198), .Y(n212) );
  MUX2X1 U257 ( .B(n213), .A(n212), .S(n169), .Y(n537) );
  MUX2X1 U258 ( .B(N197), .A(N160), .S(n171), .Y(n214) );
  INVX2 U259 ( .A(n214), .Y(n440) );
  INVX2 U260 ( .A(C1[1]), .Y(n216) );
  INVX2 U261 ( .A(N197), .Y(n215) );
  MUX2X1 U262 ( .B(n216), .A(n215), .S(n169), .Y(n538) );
  MUX2X1 U263 ( .B(A1[8]), .A(N150), .S(n171), .Y(n217) );
  INVX2 U264 ( .A(n217), .Y(n414) );
  MUX2X1 U265 ( .B(A1[7]), .A(N149), .S(n171), .Y(n218) );
  INVX2 U266 ( .A(n218), .Y(n415) );
  MUX2X1 U267 ( .B(A1[6]), .A(N148), .S(n171), .Y(n219) );
  INVX2 U268 ( .A(n219), .Y(n416) );
  MUX2X1 U269 ( .B(A1[5]), .A(N147), .S(n171), .Y(n220) );
  INVX2 U270 ( .A(n220), .Y(n417) );
  MUX2X1 U271 ( .B(A1[4]), .A(N146), .S(n172), .Y(n221) );
  INVX2 U272 ( .A(n221), .Y(n418) );
  MUX2X1 U273 ( .B(A1[3]), .A(N145), .S(n172), .Y(n222) );
  INVX2 U274 ( .A(n222), .Y(n419) );
  MUX2X1 U275 ( .B(A1[2]), .A(N144), .S(n172), .Y(n223) );
  INVX2 U276 ( .A(n223), .Y(n420) );
  MUX2X1 U277 ( .B(A1[1]), .A(N143), .S(n172), .Y(n224) );
  INVX2 U278 ( .A(n224), .Y(n421) );
  MUX2X1 U279 ( .B(A1[0]), .A(N142), .S(n172), .Y(n225) );
  INVX2 U280 ( .A(n225), .Y(n422) );
  MUX2X1 U281 ( .B(D1[8]), .A(N186), .S(n172), .Y(n226) );
  INVX2 U282 ( .A(n226), .Y(n478) );
  MUX2X1 U283 ( .B(D1[7]), .A(N185), .S(n172), .Y(n227) );
  MUX2X1 U284 ( .B(D1[6]), .A(N184), .S(n172), .Y(n228) );
  INVX2 U285 ( .A(n228), .Y(n480) );
  MUX2X1 U286 ( .B(D1[5]), .A(N183), .S(n172), .Y(n229) );
  INVX2 U287 ( .A(n229), .Y(n482) );
  MUX2X1 U288 ( .B(D1[4]), .A(N182), .S(n172), .Y(n230) );
  INVX2 U289 ( .A(n230), .Y(n483) );
  MUX2X1 U290 ( .B(D1[3]), .A(N181), .S(n172), .Y(n231) );
  INVX2 U291 ( .A(n231), .Y(n486) );
  MUX2X1 U292 ( .B(D1[2]), .A(N180), .S(n172), .Y(n232) );
  INVX2 U293 ( .A(n232), .Y(n487) );
  MUX2X1 U294 ( .B(D1[1]), .A(N179), .S(n172), .Y(n233) );
  INVX2 U295 ( .A(n233), .Y(n488) );
  MUX2X1 U296 ( .B(D1[0]), .A(N178), .S(n173), .Y(n234) );
  INVX2 U297 ( .A(n234), .Y(n517) );
  NAND2X1 U298 ( .A(n16), .B(n18), .Y(n634) );
  MUX2X1 U299 ( .B(E1[9]), .A(N225), .S(n170), .Y(n235) );
  INVX2 U300 ( .A(n235), .Y(n548) );
  MUX2X1 U301 ( .B(E1[8]), .A(N224), .S(n170), .Y(n236) );
  INVX2 U302 ( .A(n236), .Y(n549) );
  MUX2X1 U303 ( .B(E1[7]), .A(N223), .S(n170), .Y(n237) );
  INVX2 U304 ( .A(n237), .Y(n550) );
  MUX2X1 U305 ( .B(E1[6]), .A(N222), .S(n170), .Y(n238) );
  INVX2 U306 ( .A(n238), .Y(n551) );
  MUX2X1 U307 ( .B(E1[5]), .A(N221), .S(n170), .Y(n239) );
  INVX2 U308 ( .A(n239), .Y(n552) );
  MUX2X1 U309 ( .B(E1[4]), .A(N220), .S(n170), .Y(n240) );
  INVX2 U310 ( .A(n240), .Y(n553) );
  MUX2X1 U311 ( .B(E1[3]), .A(N219), .S(n170), .Y(n241) );
  INVX2 U312 ( .A(n241), .Y(n554) );
  MUX2X1 U313 ( .B(E1[2]), .A(N218), .S(n170), .Y(n242) );
  INVX2 U314 ( .A(n242), .Y(n555) );
  MUX2X1 U315 ( .B(E1[1]), .A(N217), .S(n170), .Y(n243) );
  INVX2 U316 ( .A(n243), .Y(n556) );
  MUX2X1 U317 ( .B(E1[0]), .A(N216), .S(n170), .Y(n244) );
  INVX2 U318 ( .A(n244), .Y(n557) );
  INVX2 U319 ( .A(N236), .Y(n247) );
  OAI21X1 U320 ( .A(n408), .B(n24), .C(n28), .Y(n246) );
  OAI21X1 U321 ( .A(n1), .B(n247), .C(n246), .Y(n574) );
  INVX2 U322 ( .A(N237), .Y(n250) );
  XOR2X1 U323 ( .A(n30), .B(n28), .Y(n248) );
  AOI22X1 U324 ( .A(n248), .B(n408), .C(n30), .D(n24), .Y(n249) );
  OAI21X1 U325 ( .A(n1), .B(n250), .C(n249), .Y(n575) );
  INVX2 U326 ( .A(N238), .Y(n253) );
  XOR2X1 U327 ( .A(n254), .B(Gx[2]), .Y(n251) );
  AOI22X1 U328 ( .A(n251), .B(n408), .C(Gx[2]), .D(n24), .Y(n252) );
  OAI21X1 U329 ( .A(n1), .B(n253), .C(n252), .Y(n576) );
  INVX2 U330 ( .A(N239), .Y(n257) );
  XOR2X1 U331 ( .A(n258), .B(Gx[3]), .Y(n255) );
  AOI22X1 U332 ( .A(n255), .B(n408), .C(Gx[3]), .D(n24), .Y(n256) );
  OAI21X1 U333 ( .A(n1), .B(n257), .C(n256), .Y(n577) );
  INVX2 U334 ( .A(N240), .Y(n261) );
  XOR2X1 U335 ( .A(n262), .B(Gx[4]), .Y(n259) );
  AOI22X1 U336 ( .A(n259), .B(n408), .C(Gx[4]), .D(n24), .Y(n260) );
  OAI21X1 U337 ( .A(n1), .B(n261), .C(n260), .Y(n578) );
  INVX2 U338 ( .A(N241), .Y(n265) );
  XOR2X1 U339 ( .A(n266), .B(Gx[5]), .Y(n263) );
  AOI22X1 U340 ( .A(n263), .B(n408), .C(Gx[5]), .D(n24), .Y(n264) );
  OAI21X1 U341 ( .A(n1), .B(n265), .C(n264), .Y(n579) );
  INVX2 U342 ( .A(N242), .Y(n269) );
  XOR2X1 U343 ( .A(n270), .B(Gx[6]), .Y(n267) );
  AOI22X1 U344 ( .A(n267), .B(n408), .C(Gx[6]), .D(n24), .Y(n268) );
  OAI21X1 U345 ( .A(n1), .B(n269), .C(n268), .Y(n580) );
  INVX2 U346 ( .A(N243), .Y(n273) );
  XOR2X1 U347 ( .A(n274), .B(Gx[7]), .Y(n271) );
  AOI22X1 U348 ( .A(n271), .B(n408), .C(Gx[7]), .D(n24), .Y(n272) );
  OAI21X1 U349 ( .A(n1), .B(n273), .C(n272), .Y(n581) );
  INVX2 U350 ( .A(N244), .Y(n277) );
  XOR2X1 U351 ( .A(n278), .B(Gx[8]), .Y(n275) );
  AOI22X1 U352 ( .A(n275), .B(n408), .C(Gx[8]), .D(n24), .Y(n276) );
  OAI21X1 U353 ( .A(n1), .B(n277), .C(n276), .Y(n582) );
  INVX2 U354 ( .A(N245), .Y(n281) );
  XOR2X1 U355 ( .A(n282), .B(Gx[9]), .Y(n279) );
  AOI22X1 U356 ( .A(n279), .B(n408), .C(Gx[9]), .D(n24), .Y(n280) );
  OAI21X1 U357 ( .A(n1), .B(n281), .C(n280), .Y(n583) );
  NOR2X1 U358 ( .A(Gx[9]), .B(n282), .Y(n283) );
  XNOR2X1 U359 ( .A(n283), .B(Gx[10]), .Y(n284) );
  AOI22X1 U360 ( .A(n24), .B(Gx[10]), .C(n284), .D(n408), .Y(n286) );
  NAND2X1 U361 ( .A(N246), .B(n392), .Y(n285) );
  NAND2X1 U362 ( .A(n286), .B(n285), .Y(n584) );
  NAND2X1 U363 ( .A(n8), .B(n18), .Y(n619) );
  MUX2X1 U364 ( .B(N215), .A(N177), .S(n173), .Y(n287) );
  INVX2 U365 ( .A(n287), .Y(n441) );
  INVX2 U366 ( .A(C2[9]), .Y(n289) );
  INVX2 U367 ( .A(N215), .Y(n288) );
  MUX2X1 U368 ( .B(n289), .A(n288), .S(n169), .Y(n539) );
  MUX2X1 U369 ( .B(N214), .A(N176), .S(n173), .Y(n290) );
  INVX2 U370 ( .A(n290), .Y(n443) );
  INVX2 U371 ( .A(C2[8]), .Y(n292) );
  INVX2 U372 ( .A(N214), .Y(n291) );
  MUX2X1 U373 ( .B(n292), .A(n291), .S(n169), .Y(n540) );
  MUX2X1 U374 ( .B(N213), .A(N175), .S(n173), .Y(n293) );
  INVX2 U375 ( .A(n293), .Y(n444) );
  INVX2 U376 ( .A(C2[7]), .Y(n295) );
  INVX2 U377 ( .A(N213), .Y(n294) );
  MUX2X1 U378 ( .B(n295), .A(n294), .S(n169), .Y(n541) );
  MUX2X1 U379 ( .B(N212), .A(N174), .S(n173), .Y(n296) );
  INVX2 U380 ( .A(n296), .Y(n451) );
  INVX2 U381 ( .A(C2[6]), .Y(n298) );
  INVX2 U382 ( .A(N212), .Y(n297) );
  MUX2X1 U383 ( .B(n298), .A(n297), .S(n169), .Y(n542) );
  MUX2X1 U384 ( .B(N211), .A(N173), .S(n173), .Y(n299) );
  INVX2 U385 ( .A(n299), .Y(n452) );
  INVX2 U386 ( .A(C2[5]), .Y(n301) );
  INVX2 U387 ( .A(N211), .Y(n300) );
  MUX2X1 U388 ( .B(n301), .A(n300), .S(n169), .Y(n543) );
  MUX2X1 U389 ( .B(N210), .A(N172), .S(n173), .Y(n302) );
  INVX2 U390 ( .A(n302), .Y(n461) );
  INVX2 U391 ( .A(C2[4]), .Y(n305) );
  INVX2 U392 ( .A(N210), .Y(n304) );
  MUX2X1 U393 ( .B(n305), .A(n304), .S(n169), .Y(n544) );
  MUX2X1 U394 ( .B(N209), .A(N171), .S(n173), .Y(n306) );
  INVX2 U395 ( .A(n306), .Y(n466) );
  INVX2 U396 ( .A(C2[3]), .Y(n308) );
  INVX2 U397 ( .A(N209), .Y(n307) );
  MUX2X1 U398 ( .B(n308), .A(n307), .S(n169), .Y(n545) );
  MUX2X1 U399 ( .B(N208), .A(N170), .S(n173), .Y(n309) );
  INVX2 U400 ( .A(n309), .Y(n469) );
  INVX2 U401 ( .A(C2[2]), .Y(n311) );
  INVX2 U402 ( .A(N208), .Y(n310) );
  MUX2X1 U403 ( .B(n311), .A(n310), .S(n169), .Y(n546) );
  MUX2X1 U404 ( .B(N207), .A(N169), .S(n173), .Y(n312) );
  INVX2 U405 ( .A(n312), .Y(n477) );
  INVX2 U406 ( .A(C2[1]), .Y(n314) );
  INVX2 U407 ( .A(N207), .Y(n313) );
  MUX2X1 U408 ( .B(n314), .A(n313), .S(n169), .Y(n547) );
  MUX2X1 U409 ( .B(A2[8]), .A(N159), .S(n173), .Y(n316) );
  INVX2 U410 ( .A(n316), .Y(n423) );
  MUX2X1 U411 ( .B(A2[7]), .A(N158), .S(n173), .Y(n317) );
  INVX2 U412 ( .A(n317), .Y(n424) );
  MUX2X1 U413 ( .B(A2[6]), .A(N157), .S(n173), .Y(n318) );
  INVX2 U414 ( .A(n318), .Y(n425) );
  MUX2X1 U415 ( .B(A2[5]), .A(N156), .S(n174), .Y(n319) );
  INVX2 U416 ( .A(n319), .Y(n426) );
  MUX2X1 U417 ( .B(A2[4]), .A(N155), .S(n174), .Y(n320) );
  INVX2 U418 ( .A(n320), .Y(n427) );
  MUX2X1 U419 ( .B(A2[3]), .A(N154), .S(n174), .Y(n321) );
  INVX2 U420 ( .A(n321), .Y(n428) );
  MUX2X1 U421 ( .B(A2[2]), .A(N153), .S(n174), .Y(n322) );
  INVX2 U422 ( .A(n322), .Y(n429) );
  MUX2X1 U423 ( .B(A2[1]), .A(N152), .S(n174), .Y(n323) );
  INVX2 U424 ( .A(n323), .Y(n430) );
  MUX2X1 U425 ( .B(A2[0]), .A(N151), .S(n174), .Y(n324) );
  INVX2 U426 ( .A(n324), .Y(n431) );
  MUX2X1 U427 ( .B(D2[8]), .A(N195), .S(n174), .Y(n325) );
  INVX2 U428 ( .A(n325), .Y(n518) );
  MUX2X1 U429 ( .B(D2[7]), .A(N194), .S(n174), .Y(n326) );
  INVX2 U430 ( .A(n326), .Y(n520) );
  MUX2X1 U431 ( .B(D2[6]), .A(N193), .S(n174), .Y(n327) );
  INVX2 U432 ( .A(n327), .Y(n523) );
  MUX2X1 U433 ( .B(D2[5]), .A(N192), .S(n174), .Y(n328) );
  INVX2 U434 ( .A(n328), .Y(n524) );
  MUX2X1 U435 ( .B(D2[4]), .A(N191), .S(n174), .Y(n329) );
  INVX2 U436 ( .A(n329), .Y(n525) );
  MUX2X1 U437 ( .B(D2[3]), .A(N190), .S(n174), .Y(n330) );
  INVX2 U438 ( .A(n330), .Y(n526) );
  MUX2X1 U439 ( .B(D2[2]), .A(N189), .S(n174), .Y(n331) );
  INVX2 U440 ( .A(n331), .Y(n527) );
  MUX2X1 U441 ( .B(D2[1]), .A(N188), .S(n175), .Y(n332) );
  INVX2 U442 ( .A(n332), .Y(n528) );
  MUX2X1 U443 ( .B(D2[0]), .A(N187), .S(n175), .Y(n334) );
  INVX2 U444 ( .A(n334), .Y(n529) );
  MUX2X1 U445 ( .B(E2[9]), .A(N235), .S(n170), .Y(n335) );
  INVX2 U446 ( .A(n335), .Y(n558) );
  MUX2X1 U447 ( .B(E2[8]), .A(N234), .S(n170), .Y(n336) );
  INVX2 U448 ( .A(n336), .Y(n559) );
  MUX2X1 U449 ( .B(E2[7]), .A(N233), .S(n170), .Y(n337) );
  INVX2 U450 ( .A(n337), .Y(n560) );
  MUX2X1 U451 ( .B(E2[6]), .A(N232), .S(n170), .Y(n338) );
  INVX2 U452 ( .A(n338), .Y(n561) );
  MUX2X1 U453 ( .B(E2[5]), .A(N231), .S(n170), .Y(n339) );
  INVX2 U454 ( .A(n339), .Y(n562) );
  MUX2X1 U455 ( .B(E2[4]), .A(N230), .S(n170), .Y(n340) );
  INVX2 U456 ( .A(n340), .Y(n563) );
  MUX2X1 U457 ( .B(E2[3]), .A(N229), .S(n170), .Y(n342) );
  INVX2 U460 ( .A(n342), .Y(n564) );
  MUX2X1 U461 ( .B(E2[2]), .A(N228), .S(n170), .Y(n343) );
  INVX2 U463 ( .A(n343), .Y(n565) );
  MUX2X1 U466 ( .B(E2[1]), .A(N227), .S(n170), .Y(n344) );
  INVX2 U468 ( .A(n344), .Y(n566) );
  MUX2X1 U470 ( .B(E2[0]), .A(N226), .S(n170), .Y(n345) );
  INVX2 U471 ( .A(n345), .Y(n567) );
  INVX2 U473 ( .A(N247), .Y(n347) );
  NAND2X1 U474 ( .A(n1), .B(n619), .Y(n396) );
  INVX2 U480 ( .A(n396), .Y(n412) );
  OAI21X1 U481 ( .A(n393), .B(n412), .C(n26), .Y(n346) );
  OAI21X1 U483 ( .A(n1), .B(n347), .C(n346), .Y(n571) );
  INVX2 U485 ( .A(n27), .Y(n350) );
  XOR2X1 U486 ( .A(n27), .B(n26), .Y(n348) );
  AOI22X1 U489 ( .A(n348), .B(n393), .C(N248), .D(n392), .Y(n349) );
  OAI21X1 U494 ( .A(n396), .B(n350), .C(n349), .Y(n593) );
  INVX2 U495 ( .A(Gy[2]), .Y(n354) );
  NAND2X1 U496 ( .A(n25), .B(n350), .Y(n353) );
  XOR2X1 U497 ( .A(n353), .B(Gy[2]), .Y(n351) );
  AOI22X1 U498 ( .A(n351), .B(n393), .C(N249), .D(n392), .Y(n352) );
  OAI21X1 U499 ( .A(n396), .B(n354), .C(n352), .Y(n592) );
  INVX2 U500 ( .A(Gy[3]), .Y(n359) );
  INVX2 U501 ( .A(n353), .Y(n355) );
  NAND2X1 U502 ( .A(n355), .B(n354), .Y(n358) );
  XOR2X1 U503 ( .A(n358), .B(Gy[3]), .Y(n356) );
  AOI22X1 U504 ( .A(n356), .B(n393), .C(N250), .D(n392), .Y(n357) );
  OAI21X1 U505 ( .A(n396), .B(n359), .C(n357), .Y(n591) );
  INVX2 U506 ( .A(Gy[4]), .Y(n365) );
  INVX2 U507 ( .A(n358), .Y(n360) );
  NAND2X1 U508 ( .A(n360), .B(n359), .Y(n363) );
  XOR2X1 U509 ( .A(n363), .B(Gy[4]), .Y(n361) );
  AOI22X1 U510 ( .A(n361), .B(n393), .C(N251), .D(n392), .Y(n362) );
  OAI21X1 U511 ( .A(n396), .B(n365), .C(n362), .Y(n590) );
  INVX2 U512 ( .A(Gy[5]), .Y(n370) );
  INVX2 U513 ( .A(n363), .Y(n366) );
  NAND2X1 U514 ( .A(n366), .B(n365), .Y(n369) );
  XOR2X1 U515 ( .A(n369), .B(Gy[5]), .Y(n367) );
  AOI22X1 U516 ( .A(n367), .B(n393), .C(N252), .D(n392), .Y(n368) );
  OAI21X1 U517 ( .A(n396), .B(n370), .C(n368), .Y(n589) );
  INVX2 U518 ( .A(Gy[6]), .Y(n375) );
  INVX2 U519 ( .A(n369), .Y(n371) );
  NAND2X1 U520 ( .A(n371), .B(n370), .Y(n374) );
  XOR2X1 U521 ( .A(n374), .B(Gy[6]), .Y(n372) );
  AOI22X1 U522 ( .A(n372), .B(n393), .C(N253), .D(n392), .Y(n373) );
  OAI21X1 U523 ( .A(n396), .B(n375), .C(n373), .Y(n588) );
  INVX2 U524 ( .A(Gy[7]), .Y(n380) );
  INVX2 U525 ( .A(n374), .Y(n376) );
  NAND2X1 U526 ( .A(n376), .B(n375), .Y(n379) );
  XOR2X1 U527 ( .A(n379), .B(Gy[7]), .Y(n377) );
  AOI22X1 U528 ( .A(n377), .B(n393), .C(N254), .D(n392), .Y(n378) );
  OAI21X1 U529 ( .A(n396), .B(n380), .C(n378), .Y(n587) );
  INVX2 U530 ( .A(Gy[8]), .Y(n384) );
  XOR2X1 U531 ( .A(n383), .B(Gy[8]), .Y(n381) );
  AOI22X1 U532 ( .A(n381), .B(n393), .C(N255), .D(n392), .Y(n382) );
  OAI21X1 U533 ( .A(n396), .B(n384), .C(n382), .Y(n586) );
  INVX2 U534 ( .A(Gy[9]), .Y(n389) );
  NAND2X1 U535 ( .A(n23), .B(n384), .Y(n388) );
  XOR2X1 U536 ( .A(n388), .B(Gy[9]), .Y(n385) );
  AOI22X1 U537 ( .A(n385), .B(n393), .C(N256), .D(n392), .Y(n387) );
  OAI21X1 U538 ( .A(n396), .B(n389), .C(n387), .Y(n585) );
  INVX2 U539 ( .A(Gy[10]), .Y(n410) );
  INVX2 U540 ( .A(n388), .Y(n390) );
  NAND2X1 U541 ( .A(n390), .B(n389), .Y(n391) );
  XOR2X1 U542 ( .A(n391), .B(Gy[10]), .Y(n394) );
  AOI22X1 U543 ( .A(n394), .B(n393), .C(N257), .D(n392), .Y(n395) );
  OAI21X1 U544 ( .A(n410), .B(n396), .C(n395), .Y(n572) );
  MUX2X1 U545 ( .B(temp_sum[0]), .A(N280), .S(n404), .Y(n397) );
  NAND2X1 U546 ( .A(n406), .B(n397), .Y(n594) );
  MUX2X1 U547 ( .B(temp_sum[1]), .A(N281), .S(n404), .Y(n398) );
  NAND2X1 U548 ( .A(n406), .B(n398), .Y(n595) );
  MUX2X1 U549 ( .B(temp_sum[2]), .A(N282), .S(n404), .Y(n399) );
  NAND2X1 U550 ( .A(n406), .B(n399), .Y(n596) );
  MUX2X1 U551 ( .B(temp_sum[3]), .A(N283), .S(n404), .Y(n400) );
  NAND2X1 U552 ( .A(n406), .B(n400), .Y(n597) );
  MUX2X1 U553 ( .B(temp_sum[4]), .A(N284), .S(n404), .Y(n401) );
  NAND2X1 U554 ( .A(n406), .B(n401), .Y(n598) );
  MUX2X1 U555 ( .B(temp_sum[5]), .A(N285), .S(n404), .Y(n402) );
  NAND2X1 U556 ( .A(n406), .B(n402), .Y(n599) );
  MUX2X1 U557 ( .B(temp_sum[6]), .A(N286), .S(n404), .Y(n403) );
  NAND2X1 U558 ( .A(n406), .B(n403), .Y(n600) );
  MUX2X1 U559 ( .B(temp_sum[7]), .A(N287), .S(n404), .Y(n405) );
  NAND2X1 U560 ( .A(n406), .B(n405), .Y(n601) );
  NAND2X1 U561 ( .A(n22), .B(n8), .Y(n621) );
  NAND2X1 U562 ( .A(n9), .B(n18), .Y(n620) );
  NAND2X1 U563 ( .A(n2), .B(n8), .Y(n614) );
  OAI21X1 U564 ( .A(Gx[10]), .B(n614), .C(n636), .Y(n623) );
  INVX2 U565 ( .A(n611), .Y(n407) );
  NOR2X1 U566 ( .A(n408), .B(n407), .Y(n409) );
  OAI21X1 U567 ( .A(n621), .B(n410), .C(n409), .Y(n629) );
  INVX2 U568 ( .A(Gx[10]), .Y(n411) );
  OAI21X1 U569 ( .A(n614), .B(n411), .C(n620), .Y(n628) );
  INVX2 U570 ( .A(n628), .Y(n568) );
  OAI21X1 U571 ( .A(Gy[10]), .B(n621), .C(n620), .Y(n622) );
  INVX2 U572 ( .A(n637), .Y(n569) );
  INVX2 U573 ( .A(n609), .Y(n570) );
  NOR2X1 U574 ( .A(n616), .B(n615), .Y(n617) );
endmodule


module edge_detection_6_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n48, n49, n51, n54, n56, n58, n60, n102,
         n103, n104, n105, n107, n108, n109, n110, n111, n112;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  XNOR2X1 U4 ( .A(n109), .B(n2), .Y(SUM[9]) );
  AOI21X1 U5 ( .A(n105), .B(n17), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n105), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n20), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n108), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n104), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n104), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n28), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n103), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n103), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n36), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n110), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n102), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n102), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n44), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n111), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n111), .Y(n10) );
  NAND2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  OR2X2 U77 ( .A(B[3]), .B(A[3]), .Y(n102) );
  OR2X2 U78 ( .A(B[5]), .B(A[5]), .Y(n103) );
  OR2X2 U79 ( .A(B[7]), .B(A[7]), .Y(n104) );
  OR2X2 U80 ( .A(B[9]), .B(A[9]), .Y(n105) );
  AND2X2 U81 ( .A(n51), .B(n112), .Y(SUM[0]) );
  INVX1 U82 ( .A(n25), .Y(n107) );
  INVX2 U83 ( .A(n107), .Y(n108) );
  OAI21X1 U84 ( .A(n20), .B(n18), .C(n19), .Y(n109) );
  BUFX2 U85 ( .A(n41), .Y(n110) );
  OR2X2 U86 ( .A(B[1]), .B(A[1]), .Y(n111) );
  OR2X2 U87 ( .A(B[0]), .B(A[0]), .Y(n112) );
  XNOR2X1 U88 ( .A(n12), .B(n1), .Y(SUM[10]) );
  INVX2 U89 ( .A(n42), .Y(n60) );
  INVX2 U90 ( .A(n34), .Y(n58) );
  INVX2 U91 ( .A(n26), .Y(n56) );
  INVX2 U92 ( .A(n18), .Y(n54) );
  INVX2 U93 ( .A(n51), .Y(n49) );
  INVX2 U94 ( .A(n48), .Y(n46) );
  INVX2 U95 ( .A(n40), .Y(n38) );
  INVX2 U96 ( .A(n32), .Y(n30) );
  INVX2 U97 ( .A(n24), .Y(n22) );
  INVX2 U98 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_6_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_6_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_6_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_6_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_6_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n76), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n77), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n77), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n66), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n66), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OAI21X1 U39 ( .A(n11), .B(n9), .C(n10), .Y(n64) );
  INVX4 U40 ( .A(B[0]), .Y(n30) );
  BUFX4 U41 ( .A(n19), .Y(n66) );
  BUFX2 U42 ( .A(n7), .Y(n65) );
  XOR2X1 U43 ( .A(n26), .B(A[4]), .Y(n67) );
  XOR2X1 U44 ( .A(n64), .B(n67), .Y(DIFF[4]) );
  NAND2X1 U45 ( .A(n8), .B(n26), .Y(n68) );
  NAND2X1 U46 ( .A(n8), .B(A[4]), .Y(n69) );
  NAND2X1 U47 ( .A(n26), .B(A[4]), .Y(n70) );
  NAND3X1 U48 ( .A(n69), .B(n68), .C(n70), .Y(n7) );
  XOR2X1 U49 ( .A(n25), .B(A[5]), .Y(n71) );
  XOR2X1 U50 ( .A(n65), .B(n71), .Y(DIFF[5]) );
  NAND2X1 U51 ( .A(n7), .B(n25), .Y(n72) );
  NAND2X1 U52 ( .A(n7), .B(A[5]), .Y(n73) );
  NAND2X1 U53 ( .A(n25), .B(A[5]), .Y(n74) );
  NAND3X1 U54 ( .A(n73), .B(n72), .C(n74), .Y(n6) );
  INVX1 U55 ( .A(n16), .Y(n75) );
  INVX2 U56 ( .A(n75), .Y(n76) );
  OR2X2 U57 ( .A(A[2]), .B(n28), .Y(n77) );
  INVX2 U58 ( .A(B[1]), .Y(n29) );
  INVX2 U59 ( .A(B[2]), .Y(n28) );
  INVX2 U60 ( .A(B[3]), .Y(n27) );
  INVX2 U61 ( .A(B[4]), .Y(n26) );
  INVX2 U62 ( .A(B[5]), .Y(n25) );
  INVX2 U63 ( .A(B[6]), .Y(n24) );
  INVX2 U64 ( .A(B[7]), .Y(n23) );
  INVX2 U65 ( .A(n17), .Y(n22) );
  INVX2 U66 ( .A(n9), .Y(n20) );
  INVX2 U67 ( .A(n15), .Y(n13) );
  INVX2 U68 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_6_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n74), .B(n65), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n74), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n75), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n75), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  OR2X2 U39 ( .A(A[0]), .B(n30), .Y(n64) );
  OAI21X1 U40 ( .A(n17), .B(n75), .C(n18), .Y(n65) );
  INVX4 U41 ( .A(n64), .Y(n75) );
  XOR2X1 U42 ( .A(A[6]), .B(n24), .Y(n66) );
  XOR2X1 U43 ( .A(n66), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U44 ( .A(A[6]), .B(n24), .Y(n67) );
  NAND2X1 U45 ( .A(A[6]), .B(n6), .Y(n68) );
  NAND2X1 U46 ( .A(n24), .B(n6), .Y(n69) );
  NAND3X1 U47 ( .A(n67), .B(n68), .C(n69), .Y(n5) );
  XOR2X1 U48 ( .A(A[7]), .B(n23), .Y(n70) );
  XOR2X1 U49 ( .A(n70), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U50 ( .A(A[7]), .B(n23), .Y(n71) );
  NAND2X1 U51 ( .A(n5), .B(A[7]), .Y(n72) );
  NAND2X1 U52 ( .A(n23), .B(n5), .Y(n73) );
  NAND3X1 U53 ( .A(n71), .B(n72), .C(n73), .Y(n4) );
  OR2X2 U54 ( .A(A[2]), .B(n28), .Y(n74) );
  INVX2 U55 ( .A(B[0]), .Y(n30) );
  INVX2 U56 ( .A(B[1]), .Y(n29) );
  INVX2 U57 ( .A(B[2]), .Y(n28) );
  INVX2 U58 ( .A(B[3]), .Y(n27) );
  INVX2 U59 ( .A(B[4]), .Y(n26) );
  INVX2 U60 ( .A(B[5]), .Y(n25) );
  INVX2 U61 ( .A(B[6]), .Y(n24) );
  INVX2 U62 ( .A(B[7]), .Y(n23) );
  INVX2 U63 ( .A(n17), .Y(n22) );
  INVX2 U64 ( .A(n9), .Y(n20) );
  INVX2 U65 ( .A(n15), .Y(n13) );
  INVX2 U66 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_6_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n75), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n72), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n72), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XOR2X1 U39 ( .A(A[6]), .B(n24), .Y(n64) );
  XOR2X1 U40 ( .A(n64), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U41 ( .A(A[6]), .B(n24), .Y(n65) );
  NAND2X1 U42 ( .A(A[6]), .B(n6), .Y(n66) );
  NAND2X1 U43 ( .A(n24), .B(n6), .Y(n67) );
  NAND3X1 U44 ( .A(n65), .B(n66), .C(n67), .Y(n5) );
  XOR2X1 U45 ( .A(A[7]), .B(n23), .Y(n68) );
  XOR2X1 U46 ( .A(n68), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U47 ( .A(A[7]), .B(n23), .Y(n69) );
  NAND2X1 U48 ( .A(A[7]), .B(n5), .Y(n70) );
  NAND2X1 U49 ( .A(n23), .B(n5), .Y(n71) );
  NAND3X1 U50 ( .A(n69), .B(n70), .C(n71), .Y(n4) );
  INVX1 U51 ( .A(B[7]), .Y(n23) );
  INVX1 U52 ( .A(B[6]), .Y(n24) );
  INVX1 U53 ( .A(B[5]), .Y(n25) );
  OR2X1 U54 ( .A(A[2]), .B(n28), .Y(n72) );
  XOR2X1 U55 ( .A(B[0]), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U56 ( .A(B[2]), .Y(n28) );
  INVX1 U57 ( .A(B[1]), .Y(n29) );
  INVX1 U58 ( .A(A[0]), .Y(n73) );
  AND2X2 U59 ( .A(n73), .B(B[0]), .Y(n19) );
  INVX1 U60 ( .A(n16), .Y(n74) );
  INVX2 U61 ( .A(n74), .Y(n75) );
  INVX2 U62 ( .A(B[3]), .Y(n27) );
  INVX2 U63 ( .A(B[4]), .Y(n26) );
  INVX2 U64 ( .A(n17), .Y(n22) );
  INVX2 U65 ( .A(n9), .Y(n20) );
  INVX2 U66 ( .A(n15), .Y(n13) );
  INVX2 U67 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_6_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n72), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n72), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  INVX2 U39 ( .A(B[0]), .Y(n30) );
  XOR2X1 U40 ( .A(A[6]), .B(n24), .Y(n64) );
  XOR2X1 U41 ( .A(n64), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U42 ( .A(A[6]), .B(n24), .Y(n65) );
  NAND2X1 U43 ( .A(A[6]), .B(n6), .Y(n66) );
  NAND2X1 U44 ( .A(n24), .B(n6), .Y(n67) );
  NAND3X1 U45 ( .A(n65), .B(n66), .C(n67), .Y(n5) );
  XOR2X1 U46 ( .A(A[7]), .B(n23), .Y(n68) );
  XOR2X1 U47 ( .A(n5), .B(n68), .Y(DIFF[7]) );
  NAND2X1 U48 ( .A(A[7]), .B(n23), .Y(n69) );
  NAND2X1 U49 ( .A(n5), .B(A[7]), .Y(n70) );
  NAND2X1 U50 ( .A(n23), .B(n5), .Y(n71) );
  NAND3X1 U51 ( .A(n69), .B(n70), .C(n71), .Y(n4) );
  INVX1 U52 ( .A(B[7]), .Y(n23) );
  INVX1 U53 ( .A(B[6]), .Y(n24) );
  INVX1 U54 ( .A(B[5]), .Y(n25) );
  OR2X1 U55 ( .A(A[2]), .B(n28), .Y(n72) );
  INVX1 U56 ( .A(B[2]), .Y(n28) );
  INVX1 U57 ( .A(B[1]), .Y(n29) );
  INVX2 U58 ( .A(B[3]), .Y(n27) );
  INVX2 U59 ( .A(B[4]), .Y(n26) );
  INVX2 U60 ( .A(n17), .Y(n22) );
  INVX2 U61 ( .A(n9), .Y(n20) );
  INVX2 U62 ( .A(n15), .Y(n13) );
  INVX2 U63 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_6_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n64, n65, n66, n67,
         n68, n69;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n67), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n69), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  NOR2X1 U27 ( .A(A[0]), .B(n65), .Y(n19) );
  INVX2 U39 ( .A(B[0]), .Y(n65) );
  INVX1 U40 ( .A(B[2]), .Y(n28) );
  INVX1 U41 ( .A(B[7]), .Y(n23) );
  INVX1 U42 ( .A(B[5]), .Y(n25) );
  INVX1 U43 ( .A(B[6]), .Y(n24) );
  INVX1 U44 ( .A(B[4]), .Y(n26) );
  XNOR2X1 U45 ( .A(n65), .B(A[0]), .Y(DIFF[0]) );
  OR2X1 U46 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U47 ( .A(n11), .Y(n66) );
  INVX2 U48 ( .A(n66), .Y(n67) );
  INVX1 U49 ( .A(n16), .Y(n68) );
  INVX2 U50 ( .A(n68), .Y(n69) );
  INVX2 U51 ( .A(B[1]), .Y(n29) );
  INVX2 U52 ( .A(B[3]), .Y(n27) );
  INVX2 U53 ( .A(n17), .Y(n22) );
  INVX2 U54 ( .A(n9), .Y(n20) );
  INVX2 U55 ( .A(n15), .Y(n13) );
  INVX2 U56 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_6_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n64, n65, n66, n67,
         n68, n69;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n67), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n69), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  INVX1 U39 ( .A(B[5]), .Y(n25) );
  INVX1 U40 ( .A(B[4]), .Y(n26) );
  INVX1 U41 ( .A(B[6]), .Y(n24) );
  INVX1 U42 ( .A(B[7]), .Y(n23) );
  OR2X1 U43 ( .A(A[2]), .B(n28), .Y(n64) );
  XOR2X1 U44 ( .A(B[0]), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U45 ( .A(A[0]), .Y(n65) );
  AND2X2 U46 ( .A(n65), .B(B[0]), .Y(n19) );
  INVX1 U47 ( .A(n11), .Y(n66) );
  INVX2 U48 ( .A(n66), .Y(n67) );
  INVX1 U49 ( .A(n16), .Y(n68) );
  INVX2 U50 ( .A(n68), .Y(n69) );
  INVX2 U51 ( .A(B[1]), .Y(n29) );
  INVX2 U52 ( .A(B[2]), .Y(n28) );
  INVX2 U53 ( .A(B[3]), .Y(n27) );
  INVX2 U54 ( .A(n17), .Y(n22) );
  INVX2 U55 ( .A(n9), .Y(n20) );
  INVX2 U56 ( .A(n15), .Y(n13) );
  INVX2 U57 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_6 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n571), .CLK(clk), .R(n187), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n572), .CLK(clk), .R(n187), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n187), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n573), .CLK(clk), .R(n187), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n530), .CLK(clk), .R(n187), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n584), .CLK(clk), .R(n186), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n186), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n186), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n422), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n421), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n420), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n419), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n418), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n417), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n416), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n415), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n414), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n440), .CLK(clk), .R(n185), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n439), .CLK(clk), .R(n185), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n438), .CLK(clk), .R(n185), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n437), .CLK(clk), .R(n185), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n436), .CLK(clk), .R(n185), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n435), .CLK(clk), .R(n185), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n434), .CLK(clk), .R(n185), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n433), .CLK(clk), .R(n185), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n432), .CLK(clk), .R(n185), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n538), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n537), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n536), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n535), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n534), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n533), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n532), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n531), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n517), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n488), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n487), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n486), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n483), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n482), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n480), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n479), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n478), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n557), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n556), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n555), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n554), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n553), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n552), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n551), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n550), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n549), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n548), .CLK(clk), .R(n182), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n431), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n430), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n429), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n428), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n427), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n426), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n425), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n424), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n423), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n477), .CLK(clk), .R(n182), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n469), .CLK(clk), .R(n182), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n466), .CLK(clk), .R(n181), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n461), .CLK(clk), .R(n181), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n452), .CLK(clk), .R(n181), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n451), .CLK(clk), .R(n181), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n444), .CLK(clk), .R(n181), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n443), .CLK(clk), .R(n181), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n441), .CLK(clk), .R(n181), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n529), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n528), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n527), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n526), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n525), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n524), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n523), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n520), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n518), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n567), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n566), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n565), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n564), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n563), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n562), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n561), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n560), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n559), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n558), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n569), .CLK(clk), .R(n179), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n574), .CLK(clk), .R(n179), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n575), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n576), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n577), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n578), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n579), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n580), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n581), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n582), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n583), .CLK(clk), .R(n178), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n547), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n546), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n545), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n544), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n543), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n542), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n541), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n540), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n539), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n593), .CLK(clk), .R(n178), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n592), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n591), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n590), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n589), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n588), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n587), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n586), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n585), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n594), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n595), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n596), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n597), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n598), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n599), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n600), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n601), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n634), .B(n627), .Y(n618) );
  AND2X2 U160 ( .A(n637), .B(n636), .Y(n604) );
  OR2X1 U458 ( .A(n629), .B(n628), .Y(n630) );
  NAND3X1 U459 ( .A(n627), .B(n626), .C(n412), .Y(n631) );
  OR2X1 U462 ( .A(n623), .B(n622), .Y(n624) );
  NAND3X1 U464 ( .A(n619), .B(n626), .C(n618), .Y(n625) );
  OAI21X1 U465 ( .A(n626), .B(n413), .C(n617), .Y(n573) );
  NAND2X1 U467 ( .A(n568), .B(n621), .Y(n615) );
  NAND3X1 U469 ( .A(n632), .B(n636), .C(n633), .Y(n616) );
  OR2X1 U472 ( .A(n623), .B(n629), .Y(n612) );
  NAND3X1 U475 ( .A(n633), .B(n626), .C(n610), .Y(n613) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n570), .Y(n610) );
  NAND2X1 U477 ( .A(n608), .B(n607), .Y(n626) );
  NOR2X1 U478 ( .A(n606), .B(n605), .Y(n607) );
  NAND3X1 U479 ( .A(n634), .B(n633), .C(n614), .Y(n605) );
  NAND3X1 U482 ( .A(n635), .B(n632), .C(n604), .Y(n606) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n637) );
  NOR2X1 U487 ( .A(n603), .B(n602), .Y(n608) );
  NAND3X1 U488 ( .A(n609), .B(n620), .C(n412), .Y(n602) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n609) );
  NAND3X1 U491 ( .A(n621), .B(n611), .C(n627), .Y(n603) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n627) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n611) );
  edge_detection_6_DW01_add_7 add_231 ( .A({Gx[10:2], n30, n28}), .B({Gy[10:2], 
        n27, n26}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_6_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_6_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_6_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_6_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_6_DW01_sub_8 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_6_DW01_sub_9 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_6_DW01_sub_10 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_6_DW01_sub_11 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_6_DW01_sub_12 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_6_DW01_sub_13 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  INVX4 U5 ( .A(n65), .Y(n406) );
  INVX2 U6 ( .A(n29), .Y(n30) );
  BUFX2 U12 ( .A(N258), .Y(n28) );
  NAND2X1 U13 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U52 ( .A(n413), .B(n188), .Y(n2) );
  AND2X2 U128 ( .A(state[3]), .B(n189), .Y(n8) );
  AND2X2 U155 ( .A(state[2]), .B(n245), .Y(n9) );
  AND2X2 U156 ( .A(n245), .B(n189), .Y(n16) );
  AND2X2 U158 ( .A(state[1]), .B(n188), .Y(n17) );
  AND2X2 U159 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U161 ( .A(n613), .B(n612), .Y(n19) );
  OR2X2 U162 ( .A(n625), .B(n624), .Y(n20) );
  OR2X2 U163 ( .A(n631), .B(n630), .Y(n21) );
  AND2X2 U164 ( .A(state[0]), .B(n413), .Y(n22) );
  INVX1 U165 ( .A(n227), .Y(n479) );
  NOR2X1 U166 ( .A(n358), .B(Gy[3]), .Y(n23) );
  INVX1 U167 ( .A(n23), .Y(n362) );
  OR2X1 U168 ( .A(n28), .B(n30), .Y(n254) );
  OR2X1 U169 ( .A(n254), .B(Gx[2]), .Y(n258) );
  OR2X2 U170 ( .A(n262), .B(Gx[4]), .Y(n266) );
  OR2X2 U171 ( .A(n270), .B(Gx[6]), .Y(n274) );
  OR2X2 U172 ( .A(n278), .B(Gx[8]), .Y(n282) );
  BUFX2 U173 ( .A(n333), .Y(n174) );
  BUFX2 U174 ( .A(n333), .Y(n173) );
  BUFX2 U175 ( .A(n333), .Y(n171) );
  BUFX2 U176 ( .A(n333), .Y(n172) );
  INVX2 U177 ( .A(n634), .Y(n170) );
  INVX2 U178 ( .A(n1), .Y(n392) );
  INVX2 U179 ( .A(n633), .Y(n169) );
  BUFX2 U180 ( .A(n333), .Y(n175) );
  INVX2 U181 ( .A(n635), .Y(n408) );
  AND2X2 U182 ( .A(n635), .B(n1), .Y(n24) );
  INVX2 U183 ( .A(n619), .Y(n393) );
  INVX2 U184 ( .A(N288), .Y(n141) );
  BUFX2 U185 ( .A(n_rst), .Y(n176) );
  BUFX2 U186 ( .A(n_rst), .Y(n177) );
  BUFX2 U187 ( .A(n_rst), .Y(n179) );
  BUFX2 U188 ( .A(n_rst), .Y(n180) );
  BUFX2 U189 ( .A(n_rst), .Y(n181) );
  BUFX2 U190 ( .A(n_rst), .Y(n182) );
  BUFX2 U191 ( .A(n_rst), .Y(n183) );
  BUFX2 U192 ( .A(n_rst), .Y(n184) );
  BUFX2 U193 ( .A(n_rst), .Y(n186) );
  BUFX2 U194 ( .A(n_rst), .Y(n178) );
  BUFX2 U195 ( .A(n_rst), .Y(n185) );
  BUFX2 U196 ( .A(n_rst), .Y(n187) );
  OR2X1 U197 ( .A(n274), .B(Gx[7]), .Y(n278) );
  BUFX2 U198 ( .A(Gy[1]), .Y(n27) );
  INVX2 U199 ( .A(n25), .Y(n26) );
  OR2X1 U200 ( .A(n258), .B(Gx[3]), .Y(n262) );
  OR2X1 U201 ( .A(n266), .B(Gx[5]), .Y(n270) );
  INVX2 U204 ( .A(N269), .Y(n25) );
  INVX2 U205 ( .A(Gx[1]), .Y(n29) );
  AOI21X1 U206 ( .A(n141), .B(n168), .C(n636), .Y(n65) );
  NOR2X1 U207 ( .A(N289), .B(N290), .Y(n168) );
  INVX2 U208 ( .A(n636), .Y(n404) );
  INVX2 U209 ( .A(state[1]), .Y(n413) );
  INVX2 U210 ( .A(state[0]), .Y(n188) );
  NAND3X1 U211 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n636) );
  INVX2 U212 ( .A(state[2]), .Y(n189) );
  NAND2X1 U213 ( .A(n17), .B(n8), .Y(n635) );
  INVX2 U214 ( .A(state[3]), .Y(n245) );
  NAND2X1 U215 ( .A(n16), .B(n22), .Y(n632) );
  INVX2 U216 ( .A(n632), .Y(n333) );
  MUX2X1 U217 ( .B(N205), .A(N168), .S(n171), .Y(n190) );
  INVX2 U218 ( .A(n190), .Y(n432) );
  NAND2X1 U219 ( .A(n16), .B(n17), .Y(n633) );
  INVX2 U220 ( .A(C1[9]), .Y(n192) );
  INVX2 U221 ( .A(N205), .Y(n191) );
  MUX2X1 U222 ( .B(n192), .A(n191), .S(n169), .Y(n530) );
  MUX2X1 U223 ( .B(N204), .A(N167), .S(n171), .Y(n193) );
  INVX2 U224 ( .A(n193), .Y(n433) );
  INVX2 U225 ( .A(C1[8]), .Y(n195) );
  INVX2 U226 ( .A(N204), .Y(n194) );
  MUX2X1 U227 ( .B(n195), .A(n194), .S(n169), .Y(n531) );
  MUX2X1 U228 ( .B(N203), .A(N166), .S(n171), .Y(n196) );
  INVX2 U229 ( .A(n196), .Y(n434) );
  INVX2 U230 ( .A(C1[7]), .Y(n198) );
  INVX2 U231 ( .A(N203), .Y(n197) );
  MUX2X1 U232 ( .B(n198), .A(n197), .S(n169), .Y(n532) );
  MUX2X1 U233 ( .B(N202), .A(N165), .S(n171), .Y(n199) );
  INVX2 U234 ( .A(n199), .Y(n435) );
  INVX2 U235 ( .A(C1[6]), .Y(n201) );
  INVX2 U236 ( .A(N202), .Y(n200) );
  MUX2X1 U237 ( .B(n201), .A(n200), .S(n169), .Y(n533) );
  MUX2X1 U238 ( .B(N201), .A(N164), .S(n171), .Y(n202) );
  INVX2 U239 ( .A(n202), .Y(n436) );
  INVX2 U240 ( .A(C1[5]), .Y(n204) );
  INVX2 U241 ( .A(N201), .Y(n203) );
  MUX2X1 U242 ( .B(n204), .A(n203), .S(n169), .Y(n534) );
  MUX2X1 U243 ( .B(N200), .A(N163), .S(n171), .Y(n205) );
  INVX2 U244 ( .A(n205), .Y(n437) );
  INVX2 U245 ( .A(C1[4]), .Y(n207) );
  INVX2 U246 ( .A(N200), .Y(n206) );
  MUX2X1 U247 ( .B(n207), .A(n206), .S(n169), .Y(n535) );
  MUX2X1 U248 ( .B(N199), .A(N162), .S(n171), .Y(n208) );
  INVX2 U249 ( .A(n208), .Y(n438) );
  INVX2 U250 ( .A(C1[3]), .Y(n210) );
  INVX2 U251 ( .A(N199), .Y(n209) );
  MUX2X1 U252 ( .B(n210), .A(n209), .S(n169), .Y(n536) );
  MUX2X1 U253 ( .B(N198), .A(N161), .S(n171), .Y(n211) );
  INVX2 U254 ( .A(n211), .Y(n439) );
  INVX2 U255 ( .A(C1[2]), .Y(n213) );
  INVX2 U256 ( .A(N198), .Y(n212) );
  MUX2X1 U257 ( .B(n213), .A(n212), .S(n169), .Y(n537) );
  MUX2X1 U258 ( .B(N197), .A(N160), .S(n171), .Y(n214) );
  INVX2 U259 ( .A(n214), .Y(n440) );
  INVX2 U260 ( .A(C1[1]), .Y(n216) );
  INVX2 U261 ( .A(N197), .Y(n215) );
  MUX2X1 U262 ( .B(n216), .A(n215), .S(n169), .Y(n538) );
  MUX2X1 U263 ( .B(A1[8]), .A(N150), .S(n171), .Y(n217) );
  INVX2 U264 ( .A(n217), .Y(n414) );
  MUX2X1 U265 ( .B(A1[7]), .A(N149), .S(n171), .Y(n218) );
  INVX2 U266 ( .A(n218), .Y(n415) );
  MUX2X1 U267 ( .B(A1[6]), .A(N148), .S(n171), .Y(n219) );
  INVX2 U268 ( .A(n219), .Y(n416) );
  MUX2X1 U269 ( .B(A1[5]), .A(N147), .S(n171), .Y(n220) );
  INVX2 U270 ( .A(n220), .Y(n417) );
  MUX2X1 U271 ( .B(A1[4]), .A(N146), .S(n172), .Y(n221) );
  INVX2 U272 ( .A(n221), .Y(n418) );
  MUX2X1 U273 ( .B(A1[3]), .A(N145), .S(n172), .Y(n222) );
  INVX2 U274 ( .A(n222), .Y(n419) );
  MUX2X1 U275 ( .B(A1[2]), .A(N144), .S(n172), .Y(n223) );
  INVX2 U276 ( .A(n223), .Y(n420) );
  MUX2X1 U277 ( .B(A1[1]), .A(N143), .S(n172), .Y(n224) );
  INVX2 U278 ( .A(n224), .Y(n421) );
  MUX2X1 U279 ( .B(A1[0]), .A(N142), .S(n172), .Y(n225) );
  INVX2 U280 ( .A(n225), .Y(n422) );
  MUX2X1 U281 ( .B(D1[8]), .A(N186), .S(n172), .Y(n226) );
  INVX2 U282 ( .A(n226), .Y(n478) );
  MUX2X1 U283 ( .B(D1[7]), .A(N185), .S(n172), .Y(n227) );
  MUX2X1 U284 ( .B(D1[6]), .A(N184), .S(n172), .Y(n228) );
  INVX2 U285 ( .A(n228), .Y(n480) );
  MUX2X1 U286 ( .B(D1[5]), .A(N183), .S(n172), .Y(n229) );
  INVX2 U287 ( .A(n229), .Y(n482) );
  MUX2X1 U288 ( .B(D1[4]), .A(N182), .S(n172), .Y(n230) );
  INVX2 U289 ( .A(n230), .Y(n483) );
  MUX2X1 U290 ( .B(D1[3]), .A(N181), .S(n172), .Y(n231) );
  INVX2 U291 ( .A(n231), .Y(n486) );
  MUX2X1 U292 ( .B(D1[2]), .A(N180), .S(n172), .Y(n232) );
  INVX2 U293 ( .A(n232), .Y(n487) );
  MUX2X1 U294 ( .B(D1[1]), .A(N179), .S(n172), .Y(n233) );
  INVX2 U295 ( .A(n233), .Y(n488) );
  MUX2X1 U296 ( .B(D1[0]), .A(N178), .S(n173), .Y(n234) );
  INVX2 U297 ( .A(n234), .Y(n517) );
  NAND2X1 U298 ( .A(n16), .B(n18), .Y(n634) );
  MUX2X1 U299 ( .B(E1[9]), .A(N225), .S(n170), .Y(n235) );
  INVX2 U300 ( .A(n235), .Y(n548) );
  MUX2X1 U301 ( .B(E1[8]), .A(N224), .S(n170), .Y(n236) );
  INVX2 U302 ( .A(n236), .Y(n549) );
  MUX2X1 U303 ( .B(E1[7]), .A(N223), .S(n170), .Y(n237) );
  INVX2 U304 ( .A(n237), .Y(n550) );
  MUX2X1 U305 ( .B(E1[6]), .A(N222), .S(n170), .Y(n238) );
  INVX2 U306 ( .A(n238), .Y(n551) );
  MUX2X1 U307 ( .B(E1[5]), .A(N221), .S(n170), .Y(n239) );
  INVX2 U308 ( .A(n239), .Y(n552) );
  MUX2X1 U309 ( .B(E1[4]), .A(N220), .S(n170), .Y(n240) );
  INVX2 U310 ( .A(n240), .Y(n553) );
  MUX2X1 U311 ( .B(E1[3]), .A(N219), .S(n170), .Y(n241) );
  INVX2 U312 ( .A(n241), .Y(n554) );
  MUX2X1 U313 ( .B(E1[2]), .A(N218), .S(n170), .Y(n242) );
  INVX2 U314 ( .A(n242), .Y(n555) );
  MUX2X1 U315 ( .B(E1[1]), .A(N217), .S(n170), .Y(n243) );
  INVX2 U316 ( .A(n243), .Y(n556) );
  MUX2X1 U317 ( .B(E1[0]), .A(N216), .S(n170), .Y(n244) );
  INVX2 U318 ( .A(n244), .Y(n557) );
  INVX2 U319 ( .A(N236), .Y(n247) );
  OAI21X1 U320 ( .A(n408), .B(n24), .C(n28), .Y(n246) );
  OAI21X1 U321 ( .A(n1), .B(n247), .C(n246), .Y(n574) );
  INVX2 U322 ( .A(N237), .Y(n250) );
  XOR2X1 U323 ( .A(n30), .B(n28), .Y(n248) );
  AOI22X1 U324 ( .A(n248), .B(n408), .C(n30), .D(n24), .Y(n249) );
  OAI21X1 U325 ( .A(n1), .B(n250), .C(n249), .Y(n575) );
  INVX2 U326 ( .A(N238), .Y(n253) );
  XOR2X1 U327 ( .A(n254), .B(Gx[2]), .Y(n251) );
  AOI22X1 U328 ( .A(n251), .B(n408), .C(Gx[2]), .D(n24), .Y(n252) );
  OAI21X1 U329 ( .A(n1), .B(n253), .C(n252), .Y(n576) );
  INVX2 U330 ( .A(N239), .Y(n257) );
  XOR2X1 U331 ( .A(n258), .B(Gx[3]), .Y(n255) );
  AOI22X1 U332 ( .A(n255), .B(n408), .C(Gx[3]), .D(n24), .Y(n256) );
  OAI21X1 U333 ( .A(n1), .B(n257), .C(n256), .Y(n577) );
  INVX2 U334 ( .A(N240), .Y(n261) );
  XOR2X1 U335 ( .A(n262), .B(Gx[4]), .Y(n259) );
  AOI22X1 U336 ( .A(n259), .B(n408), .C(Gx[4]), .D(n24), .Y(n260) );
  OAI21X1 U337 ( .A(n1), .B(n261), .C(n260), .Y(n578) );
  INVX2 U338 ( .A(N241), .Y(n265) );
  XOR2X1 U339 ( .A(n266), .B(Gx[5]), .Y(n263) );
  AOI22X1 U340 ( .A(n263), .B(n408), .C(Gx[5]), .D(n24), .Y(n264) );
  OAI21X1 U341 ( .A(n1), .B(n265), .C(n264), .Y(n579) );
  INVX2 U342 ( .A(N242), .Y(n269) );
  XOR2X1 U343 ( .A(n270), .B(Gx[6]), .Y(n267) );
  AOI22X1 U344 ( .A(n267), .B(n408), .C(Gx[6]), .D(n24), .Y(n268) );
  OAI21X1 U345 ( .A(n1), .B(n269), .C(n268), .Y(n580) );
  INVX2 U346 ( .A(N243), .Y(n273) );
  XOR2X1 U347 ( .A(n274), .B(Gx[7]), .Y(n271) );
  AOI22X1 U348 ( .A(n271), .B(n408), .C(Gx[7]), .D(n24), .Y(n272) );
  OAI21X1 U349 ( .A(n1), .B(n273), .C(n272), .Y(n581) );
  INVX2 U350 ( .A(N244), .Y(n277) );
  XOR2X1 U351 ( .A(n278), .B(Gx[8]), .Y(n275) );
  AOI22X1 U352 ( .A(n275), .B(n408), .C(Gx[8]), .D(n24), .Y(n276) );
  OAI21X1 U353 ( .A(n1), .B(n277), .C(n276), .Y(n582) );
  INVX2 U354 ( .A(N245), .Y(n281) );
  XOR2X1 U355 ( .A(n282), .B(Gx[9]), .Y(n279) );
  AOI22X1 U356 ( .A(n279), .B(n408), .C(Gx[9]), .D(n24), .Y(n280) );
  OAI21X1 U357 ( .A(n1), .B(n281), .C(n280), .Y(n583) );
  NOR2X1 U358 ( .A(Gx[9]), .B(n282), .Y(n283) );
  XNOR2X1 U359 ( .A(n283), .B(Gx[10]), .Y(n284) );
  AOI22X1 U360 ( .A(n24), .B(Gx[10]), .C(n284), .D(n408), .Y(n286) );
  NAND2X1 U361 ( .A(N246), .B(n392), .Y(n285) );
  NAND2X1 U362 ( .A(n286), .B(n285), .Y(n584) );
  NAND2X1 U363 ( .A(n8), .B(n18), .Y(n619) );
  MUX2X1 U364 ( .B(N215), .A(N177), .S(n173), .Y(n287) );
  INVX2 U365 ( .A(n287), .Y(n441) );
  INVX2 U366 ( .A(C2[9]), .Y(n289) );
  INVX2 U367 ( .A(N215), .Y(n288) );
  MUX2X1 U368 ( .B(n289), .A(n288), .S(n169), .Y(n539) );
  MUX2X1 U369 ( .B(N214), .A(N176), .S(n173), .Y(n290) );
  INVX2 U370 ( .A(n290), .Y(n443) );
  INVX2 U371 ( .A(C2[8]), .Y(n292) );
  INVX2 U372 ( .A(N214), .Y(n291) );
  MUX2X1 U373 ( .B(n292), .A(n291), .S(n169), .Y(n540) );
  MUX2X1 U374 ( .B(N213), .A(N175), .S(n173), .Y(n293) );
  INVX2 U375 ( .A(n293), .Y(n444) );
  INVX2 U376 ( .A(C2[7]), .Y(n295) );
  INVX2 U377 ( .A(N213), .Y(n294) );
  MUX2X1 U378 ( .B(n295), .A(n294), .S(n169), .Y(n541) );
  MUX2X1 U379 ( .B(N212), .A(N174), .S(n173), .Y(n296) );
  INVX2 U380 ( .A(n296), .Y(n451) );
  INVX2 U381 ( .A(C2[6]), .Y(n298) );
  INVX2 U382 ( .A(N212), .Y(n297) );
  MUX2X1 U383 ( .B(n298), .A(n297), .S(n169), .Y(n542) );
  MUX2X1 U384 ( .B(N211), .A(N173), .S(n173), .Y(n299) );
  INVX2 U385 ( .A(n299), .Y(n452) );
  INVX2 U386 ( .A(C2[5]), .Y(n301) );
  INVX2 U387 ( .A(N211), .Y(n300) );
  MUX2X1 U388 ( .B(n301), .A(n300), .S(n169), .Y(n543) );
  MUX2X1 U389 ( .B(N210), .A(N172), .S(n173), .Y(n302) );
  INVX2 U390 ( .A(n302), .Y(n461) );
  INVX2 U391 ( .A(C2[4]), .Y(n305) );
  INVX2 U392 ( .A(N210), .Y(n304) );
  MUX2X1 U393 ( .B(n305), .A(n304), .S(n169), .Y(n544) );
  MUX2X1 U394 ( .B(N209), .A(N171), .S(n173), .Y(n306) );
  INVX2 U395 ( .A(n306), .Y(n466) );
  INVX2 U396 ( .A(C2[3]), .Y(n308) );
  INVX2 U397 ( .A(N209), .Y(n307) );
  MUX2X1 U398 ( .B(n308), .A(n307), .S(n169), .Y(n545) );
  MUX2X1 U399 ( .B(N208), .A(N170), .S(n173), .Y(n309) );
  INVX2 U400 ( .A(n309), .Y(n469) );
  INVX2 U401 ( .A(C2[2]), .Y(n311) );
  INVX2 U402 ( .A(N208), .Y(n310) );
  MUX2X1 U403 ( .B(n311), .A(n310), .S(n169), .Y(n546) );
  MUX2X1 U404 ( .B(N207), .A(N169), .S(n173), .Y(n312) );
  INVX2 U405 ( .A(n312), .Y(n477) );
  INVX2 U406 ( .A(C2[1]), .Y(n314) );
  INVX2 U407 ( .A(N207), .Y(n313) );
  MUX2X1 U408 ( .B(n314), .A(n313), .S(n169), .Y(n547) );
  MUX2X1 U409 ( .B(A2[8]), .A(N159), .S(n173), .Y(n316) );
  INVX2 U410 ( .A(n316), .Y(n423) );
  MUX2X1 U411 ( .B(A2[7]), .A(N158), .S(n173), .Y(n317) );
  INVX2 U412 ( .A(n317), .Y(n424) );
  MUX2X1 U413 ( .B(A2[6]), .A(N157), .S(n173), .Y(n318) );
  INVX2 U414 ( .A(n318), .Y(n425) );
  MUX2X1 U415 ( .B(A2[5]), .A(N156), .S(n174), .Y(n319) );
  INVX2 U416 ( .A(n319), .Y(n426) );
  MUX2X1 U417 ( .B(A2[4]), .A(N155), .S(n174), .Y(n320) );
  INVX2 U418 ( .A(n320), .Y(n427) );
  MUX2X1 U419 ( .B(A2[3]), .A(N154), .S(n174), .Y(n321) );
  INVX2 U420 ( .A(n321), .Y(n428) );
  MUX2X1 U421 ( .B(A2[2]), .A(N153), .S(n174), .Y(n322) );
  INVX2 U422 ( .A(n322), .Y(n429) );
  MUX2X1 U423 ( .B(A2[1]), .A(N152), .S(n174), .Y(n323) );
  INVX2 U424 ( .A(n323), .Y(n430) );
  MUX2X1 U425 ( .B(A2[0]), .A(N151), .S(n174), .Y(n324) );
  INVX2 U426 ( .A(n324), .Y(n431) );
  MUX2X1 U427 ( .B(D2[8]), .A(N195), .S(n174), .Y(n325) );
  INVX2 U428 ( .A(n325), .Y(n518) );
  MUX2X1 U429 ( .B(D2[7]), .A(N194), .S(n174), .Y(n326) );
  INVX2 U430 ( .A(n326), .Y(n520) );
  MUX2X1 U431 ( .B(D2[6]), .A(N193), .S(n174), .Y(n327) );
  INVX2 U432 ( .A(n327), .Y(n523) );
  MUX2X1 U433 ( .B(D2[5]), .A(N192), .S(n174), .Y(n328) );
  INVX2 U434 ( .A(n328), .Y(n524) );
  MUX2X1 U435 ( .B(D2[4]), .A(N191), .S(n174), .Y(n329) );
  INVX2 U436 ( .A(n329), .Y(n525) );
  MUX2X1 U437 ( .B(D2[3]), .A(N190), .S(n174), .Y(n330) );
  INVX2 U438 ( .A(n330), .Y(n526) );
  MUX2X1 U439 ( .B(D2[2]), .A(N189), .S(n174), .Y(n331) );
  INVX2 U440 ( .A(n331), .Y(n527) );
  MUX2X1 U441 ( .B(D2[1]), .A(N188), .S(n175), .Y(n332) );
  INVX2 U442 ( .A(n332), .Y(n528) );
  MUX2X1 U443 ( .B(D2[0]), .A(N187), .S(n175), .Y(n334) );
  INVX2 U444 ( .A(n334), .Y(n529) );
  MUX2X1 U445 ( .B(E2[9]), .A(N235), .S(n170), .Y(n335) );
  INVX2 U446 ( .A(n335), .Y(n558) );
  MUX2X1 U447 ( .B(E2[8]), .A(N234), .S(n170), .Y(n336) );
  INVX2 U448 ( .A(n336), .Y(n559) );
  MUX2X1 U449 ( .B(E2[7]), .A(N233), .S(n170), .Y(n337) );
  INVX2 U450 ( .A(n337), .Y(n560) );
  MUX2X1 U451 ( .B(E2[6]), .A(N232), .S(n170), .Y(n338) );
  INVX2 U452 ( .A(n338), .Y(n561) );
  MUX2X1 U453 ( .B(E2[5]), .A(N231), .S(n170), .Y(n339) );
  INVX2 U454 ( .A(n339), .Y(n562) );
  MUX2X1 U455 ( .B(E2[4]), .A(N230), .S(n170), .Y(n340) );
  INVX2 U456 ( .A(n340), .Y(n563) );
  MUX2X1 U457 ( .B(E2[3]), .A(N229), .S(n170), .Y(n342) );
  INVX2 U460 ( .A(n342), .Y(n564) );
  MUX2X1 U461 ( .B(E2[2]), .A(N228), .S(n170), .Y(n343) );
  INVX2 U463 ( .A(n343), .Y(n565) );
  MUX2X1 U466 ( .B(E2[1]), .A(N227), .S(n170), .Y(n344) );
  INVX2 U468 ( .A(n344), .Y(n566) );
  MUX2X1 U470 ( .B(E2[0]), .A(N226), .S(n170), .Y(n345) );
  INVX2 U471 ( .A(n345), .Y(n567) );
  INVX2 U473 ( .A(N247), .Y(n347) );
  NAND2X1 U474 ( .A(n1), .B(n619), .Y(n396) );
  INVX2 U480 ( .A(n396), .Y(n412) );
  OAI21X1 U481 ( .A(n393), .B(n412), .C(n26), .Y(n346) );
  OAI21X1 U483 ( .A(n1), .B(n347), .C(n346), .Y(n571) );
  INVX2 U485 ( .A(n27), .Y(n350) );
  XOR2X1 U486 ( .A(n27), .B(n26), .Y(n348) );
  AOI22X1 U489 ( .A(n348), .B(n393), .C(N248), .D(n392), .Y(n349) );
  OAI21X1 U494 ( .A(n396), .B(n350), .C(n349), .Y(n593) );
  INVX2 U495 ( .A(Gy[2]), .Y(n354) );
  NAND2X1 U496 ( .A(n25), .B(n350), .Y(n353) );
  XOR2X1 U497 ( .A(n353), .B(Gy[2]), .Y(n351) );
  AOI22X1 U498 ( .A(n351), .B(n393), .C(N249), .D(n392), .Y(n352) );
  OAI21X1 U499 ( .A(n396), .B(n354), .C(n352), .Y(n592) );
  INVX2 U500 ( .A(Gy[3]), .Y(n359) );
  INVX2 U501 ( .A(n353), .Y(n355) );
  NAND2X1 U502 ( .A(n355), .B(n354), .Y(n358) );
  XOR2X1 U503 ( .A(n358), .B(Gy[3]), .Y(n356) );
  AOI22X1 U504 ( .A(n356), .B(n393), .C(N250), .D(n392), .Y(n357) );
  OAI21X1 U505 ( .A(n396), .B(n359), .C(n357), .Y(n591) );
  INVX2 U506 ( .A(Gy[4]), .Y(n363) );
  XOR2X1 U507 ( .A(n362), .B(Gy[4]), .Y(n360) );
  AOI22X1 U508 ( .A(n360), .B(n393), .C(N251), .D(n392), .Y(n361) );
  OAI21X1 U509 ( .A(n396), .B(n363), .C(n361), .Y(n590) );
  INVX2 U510 ( .A(Gy[5]), .Y(n368) );
  NAND2X1 U511 ( .A(n23), .B(n363), .Y(n367) );
  XOR2X1 U512 ( .A(n367), .B(Gy[5]), .Y(n365) );
  AOI22X1 U513 ( .A(n365), .B(n393), .C(N252), .D(n392), .Y(n366) );
  OAI21X1 U514 ( .A(n396), .B(n368), .C(n366), .Y(n589) );
  INVX2 U515 ( .A(Gy[6]), .Y(n373) );
  INVX2 U516 ( .A(n367), .Y(n369) );
  NAND2X1 U517 ( .A(n369), .B(n368), .Y(n372) );
  XOR2X1 U518 ( .A(n372), .B(Gy[6]), .Y(n370) );
  AOI22X1 U519 ( .A(n370), .B(n393), .C(N253), .D(n392), .Y(n371) );
  OAI21X1 U520 ( .A(n396), .B(n373), .C(n371), .Y(n588) );
  INVX2 U521 ( .A(Gy[7]), .Y(n378) );
  INVX2 U522 ( .A(n372), .Y(n374) );
  NAND2X1 U523 ( .A(n374), .B(n373), .Y(n377) );
  XOR2X1 U524 ( .A(n377), .B(Gy[7]), .Y(n375) );
  AOI22X1 U525 ( .A(n375), .B(n393), .C(N254), .D(n392), .Y(n376) );
  OAI21X1 U526 ( .A(n396), .B(n378), .C(n376), .Y(n587) );
  INVX2 U527 ( .A(Gy[8]), .Y(n383) );
  INVX2 U528 ( .A(n377), .Y(n379) );
  NAND2X1 U529 ( .A(n379), .B(n378), .Y(n382) );
  XOR2X1 U530 ( .A(n382), .B(Gy[8]), .Y(n380) );
  AOI22X1 U531 ( .A(n380), .B(n393), .C(N255), .D(n392), .Y(n381) );
  OAI21X1 U532 ( .A(n396), .B(n383), .C(n381), .Y(n586) );
  INVX2 U533 ( .A(Gy[9]), .Y(n389) );
  INVX2 U534 ( .A(n382), .Y(n384) );
  NAND2X1 U535 ( .A(n384), .B(n383), .Y(n388) );
  XOR2X1 U536 ( .A(n388), .B(Gy[9]), .Y(n385) );
  AOI22X1 U537 ( .A(n385), .B(n393), .C(N256), .D(n392), .Y(n387) );
  OAI21X1 U538 ( .A(n396), .B(n389), .C(n387), .Y(n585) );
  INVX2 U539 ( .A(Gy[10]), .Y(n410) );
  INVX2 U540 ( .A(n388), .Y(n390) );
  NAND2X1 U541 ( .A(n390), .B(n389), .Y(n391) );
  XOR2X1 U542 ( .A(n391), .B(Gy[10]), .Y(n394) );
  AOI22X1 U543 ( .A(n394), .B(n393), .C(N257), .D(n392), .Y(n395) );
  OAI21X1 U544 ( .A(n410), .B(n396), .C(n395), .Y(n572) );
  MUX2X1 U545 ( .B(temp_sum[0]), .A(N280), .S(n404), .Y(n397) );
  NAND2X1 U546 ( .A(n406), .B(n397), .Y(n594) );
  MUX2X1 U547 ( .B(temp_sum[1]), .A(N281), .S(n404), .Y(n398) );
  NAND2X1 U548 ( .A(n406), .B(n398), .Y(n595) );
  MUX2X1 U549 ( .B(temp_sum[2]), .A(N282), .S(n404), .Y(n399) );
  NAND2X1 U550 ( .A(n406), .B(n399), .Y(n596) );
  MUX2X1 U551 ( .B(temp_sum[3]), .A(N283), .S(n404), .Y(n400) );
  NAND2X1 U552 ( .A(n406), .B(n400), .Y(n597) );
  MUX2X1 U553 ( .B(temp_sum[4]), .A(N284), .S(n404), .Y(n401) );
  NAND2X1 U554 ( .A(n406), .B(n401), .Y(n598) );
  MUX2X1 U555 ( .B(temp_sum[5]), .A(N285), .S(n404), .Y(n402) );
  NAND2X1 U556 ( .A(n406), .B(n402), .Y(n599) );
  MUX2X1 U557 ( .B(temp_sum[6]), .A(N286), .S(n404), .Y(n403) );
  NAND2X1 U558 ( .A(n406), .B(n403), .Y(n600) );
  MUX2X1 U559 ( .B(temp_sum[7]), .A(N287), .S(n404), .Y(n405) );
  NAND2X1 U560 ( .A(n406), .B(n405), .Y(n601) );
  NAND2X1 U561 ( .A(n22), .B(n8), .Y(n621) );
  NAND2X1 U562 ( .A(n9), .B(n18), .Y(n620) );
  NAND2X1 U563 ( .A(n2), .B(n8), .Y(n614) );
  OAI21X1 U564 ( .A(Gx[10]), .B(n614), .C(n636), .Y(n623) );
  INVX2 U565 ( .A(n611), .Y(n407) );
  NOR2X1 U566 ( .A(n408), .B(n407), .Y(n409) );
  OAI21X1 U567 ( .A(n621), .B(n410), .C(n409), .Y(n629) );
  INVX2 U568 ( .A(Gx[10]), .Y(n411) );
  OAI21X1 U569 ( .A(n614), .B(n411), .C(n620), .Y(n628) );
  INVX2 U570 ( .A(n628), .Y(n568) );
  OAI21X1 U571 ( .A(Gy[10]), .B(n621), .C(n620), .Y(n622) );
  INVX2 U572 ( .A(n637), .Y(n569) );
  INVX2 U573 ( .A(n609), .Y(n570) );
  NOR2X1 U574 ( .A(n616), .B(n615), .Y(n617) );
endmodule


module edge_detection_5_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n47, n48, n49, n51, n54, n56, n58, n60,
         n61, n102, n103, n104, n105, n106, n107, n109, n110, n111, n112, n113,
         n114;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  XNOR2X1 U4 ( .A(n17), .B(n2), .Y(SUM[9]) );
  AOI21X1 U5 ( .A(n107), .B(n113), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n107), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n103), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n25), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n106), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n106), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n28), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n105), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n105), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n110), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n112), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n104), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n104), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n44), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n61), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n61), .Y(n10) );
  NOR2X1 U66 ( .A(B[1]), .B(A[1]), .Y(n47) );
  NAND2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  BUFX2 U77 ( .A(A[0]), .Y(n102) );
  BUFX2 U78 ( .A(n20), .Y(n103) );
  OR2X2 U79 ( .A(B[3]), .B(A[3]), .Y(n104) );
  OR2X2 U80 ( .A(B[5]), .B(A[5]), .Y(n105) );
  OR2X2 U81 ( .A(B[7]), .B(A[7]), .Y(n106) );
  OR2X2 U82 ( .A(B[9]), .B(A[9]), .Y(n107) );
  AND2X2 U83 ( .A(n51), .B(n114), .Y(SUM[0]) );
  INVX1 U84 ( .A(n36), .Y(n109) );
  INVX2 U85 ( .A(n109), .Y(n110) );
  INVX1 U86 ( .A(n41), .Y(n111) );
  INVX2 U87 ( .A(n111), .Y(n112) );
  OAI21X1 U88 ( .A(n20), .B(n18), .C(n19), .Y(n113) );
  XNOR2X1 U89 ( .A(n12), .B(n1), .Y(SUM[10]) );
  OR2X1 U90 ( .A(B[0]), .B(n102), .Y(n114) );
  INVX2 U91 ( .A(n42), .Y(n60) );
  INVX2 U92 ( .A(n34), .Y(n58) );
  INVX2 U93 ( .A(n26), .Y(n56) );
  INVX2 U94 ( .A(n18), .Y(n54) );
  INVX2 U95 ( .A(n51), .Y(n49) );
  INVX2 U96 ( .A(n48), .Y(n46) );
  INVX2 U97 ( .A(n47), .Y(n61) );
  INVX2 U98 ( .A(n40), .Y(n38) );
  INVX2 U99 ( .A(n32), .Y(n30) );
  INVX2 U100 ( .A(n24), .Y(n22) );
  INVX2 U101 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_5_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_5_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_5_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_5_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_5_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n73), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n72), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n72), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  XOR2X1 U39 ( .A(A[6]), .B(n24), .Y(n64) );
  XOR2X1 U40 ( .A(n64), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U41 ( .A(A[6]), .B(n24), .Y(n65) );
  NAND2X1 U42 ( .A(A[6]), .B(n6), .Y(n66) );
  NAND2X1 U43 ( .A(n24), .B(n6), .Y(n67) );
  NAND3X1 U44 ( .A(n65), .B(n66), .C(n67), .Y(n5) );
  XOR2X1 U45 ( .A(A[7]), .B(n23), .Y(n68) );
  XOR2X1 U46 ( .A(n68), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U47 ( .A(A[7]), .B(n23), .Y(n69) );
  NAND2X1 U48 ( .A(A[7]), .B(n5), .Y(n70) );
  NAND2X1 U49 ( .A(n23), .B(n5), .Y(n71) );
  NAND3X1 U50 ( .A(n69), .B(n70), .C(n71), .Y(n4) );
  INVX1 U51 ( .A(B[2]), .Y(n28) );
  OR2X2 U52 ( .A(A[2]), .B(n28), .Y(n72) );
  INVX1 U53 ( .A(n17), .Y(n22) );
  OAI21X1 U54 ( .A(n17), .B(n19), .C(n18), .Y(n73) );
  INVX1 U55 ( .A(n4), .Y(DIFF[8]) );
  INVX2 U56 ( .A(B[0]), .Y(n30) );
  INVX2 U57 ( .A(B[1]), .Y(n29) );
  INVX2 U58 ( .A(B[3]), .Y(n27) );
  INVX2 U59 ( .A(B[4]), .Y(n26) );
  INVX2 U60 ( .A(B[5]), .Y(n25) );
  INVX2 U61 ( .A(B[6]), .Y(n24) );
  INVX2 U62 ( .A(B[7]), .Y(n23) );
  INVX2 U63 ( .A(n9), .Y(n20) );
  INVX2 U64 ( .A(n15), .Y(n13) );
endmodule


module edge_detection_5_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n66), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n68), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX1 U40 ( .A(B[0]), .Y(n30) );
  INVX1 U41 ( .A(n11), .Y(n65) );
  INVX2 U42 ( .A(n65), .Y(n66) );
  INVX1 U43 ( .A(n16), .Y(n67) );
  INVX2 U44 ( .A(n67), .Y(n68) );
  INVX2 U45 ( .A(B[1]), .Y(n29) );
  INVX2 U46 ( .A(B[2]), .Y(n28) );
  INVX2 U47 ( .A(B[3]), .Y(n27) );
  INVX2 U48 ( .A(B[4]), .Y(n26) );
  INVX2 U49 ( .A(B[5]), .Y(n25) );
  INVX2 U50 ( .A(B[6]), .Y(n24) );
  INVX2 U51 ( .A(B[7]), .Y(n23) );
  INVX2 U52 ( .A(n17), .Y(n22) );
  INVX2 U53 ( .A(n9), .Y(n20) );
  INVX2 U54 ( .A(n15), .Y(n13) );
  INVX2 U55 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_5_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X1 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_5_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_5_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_5_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  INVX4 U39 ( .A(B[0]), .Y(n30) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n64) );
  XNOR2X1 U41 ( .A(A[4]), .B(n65), .Y(DIFF[4]) );
  XNOR2X1 U42 ( .A(n8), .B(n26), .Y(n65) );
  NAND2X1 U43 ( .A(A[4]), .B(n8), .Y(n66) );
  NAND2X1 U44 ( .A(A[4]), .B(n26), .Y(n67) );
  NAND2X1 U45 ( .A(n8), .B(n26), .Y(n68) );
  NAND3X1 U46 ( .A(n67), .B(n66), .C(n68), .Y(n7) );
  INVX2 U47 ( .A(B[1]), .Y(n29) );
  INVX2 U48 ( .A(B[2]), .Y(n28) );
  INVX2 U49 ( .A(B[3]), .Y(n27) );
  INVX2 U50 ( .A(B[4]), .Y(n26) );
  INVX2 U51 ( .A(B[5]), .Y(n25) );
  INVX2 U52 ( .A(B[6]), .Y(n24) );
  INVX2 U53 ( .A(B[7]), .Y(n23) );
  INVX2 U54 ( .A(n17), .Y(n22) );
  INVX2 U55 ( .A(n9), .Y(n20) );
  INVX2 U56 ( .A(n15), .Y(n13) );
  INVX2 U57 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_5 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n183), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n183), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n183), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n183), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n183), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n182), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n182), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n182), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n182), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n181), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n181), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n181), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n181), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n181), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n181), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n181), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n181), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n181), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n181), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n181), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n180), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n180), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n180), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n180), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n180), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n180), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n179), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n179), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n179), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n178), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n178), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n178), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n178), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n177), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n177), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n177), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n177), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n177), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n177), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n177), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n176), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n176), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n176), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n176), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n175), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n175), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n175), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n175), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n174), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n174), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n173), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n173), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n173), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n173), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n173), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n173), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n173), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n173), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n173), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n173), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n173), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n173), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n172), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n172), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n172), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n172), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n172), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n172), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n172), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n172), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n172), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n172), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n172), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n172), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_5_DW01_add_7 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_5_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_5_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_5_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_5_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_5_DW01_sub_8 sub_204 ( .A({1'b0, P2[7:2], n26, P2[0]}), .B({
        1'b0, P8}), .CI(1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, 
        N188, N187}) );
  edge_detection_5_DW01_sub_9 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_5_DW01_sub_10 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_5_DW01_sub_11 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_5_DW01_sub_12 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_5_DW01_sub_13 sub_199 ( .A({1'b0, P2[7:2], n26, P2[0]}), .B({
        1'b0, P0}), .CI(1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, 
        N143, N142}) );
  INVX2 U5 ( .A(n27), .Y(n402) );
  NAND2X1 U6 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U12 ( .A(n409), .B(n184), .Y(n2) );
  AND2X2 U13 ( .A(state[3]), .B(n185), .Y(n8) );
  AND2X2 U52 ( .A(state[2]), .B(n241), .Y(n9) );
  AND2X2 U128 ( .A(n241), .B(n185), .Y(n16) );
  INVX1 U155 ( .A(N269), .Y(n25) );
  AND2X2 U156 ( .A(state[1]), .B(n184), .Y(n17) );
  AND2X2 U158 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U159 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U161 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U162 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U163 ( .A(state[0]), .B(n409), .Y(n22) );
  NOR2X1 U164 ( .A(n380), .B(Gy[8]), .Y(n23) );
  INVX1 U165 ( .A(n23), .Y(n384) );
  INVX2 U166 ( .A(Gy[1]), .Y(n346) );
  INVX1 U167 ( .A(n223), .Y(n466) );
  OR2X2 U168 ( .A(n258), .B(Gx[4]), .Y(n262) );
  OR2X2 U169 ( .A(n266), .B(Gx[6]), .Y(n270) );
  OR2X2 U170 ( .A(n274), .B(Gx[8]), .Y(n278) );
  OR2X2 U171 ( .A(N258), .B(Gx[1]), .Y(n250) );
  BUFX2 U172 ( .A(n329), .Y(n170) );
  BUFX2 U173 ( .A(n329), .Y(n169) );
  BUFX2 U174 ( .A(n329), .Y(n141) );
  BUFX2 U175 ( .A(n329), .Y(n168) );
  INVX2 U176 ( .A(n630), .Y(n65) );
  INVX2 U177 ( .A(n1), .Y(n388) );
  INVX2 U178 ( .A(n629), .Y(n30) );
  BUFX2 U179 ( .A(n329), .Y(n171) );
  INVX2 U180 ( .A(n631), .Y(n404) );
  AND2X2 U181 ( .A(n631), .B(n1), .Y(n24) );
  INVX2 U182 ( .A(n615), .Y(n389) );
  INVX2 U183 ( .A(N288), .Y(n28) );
  BUFX2 U184 ( .A(n_rst), .Y(n172) );
  BUFX2 U185 ( .A(n_rst), .Y(n173) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n176) );
  BUFX2 U188 ( .A(n_rst), .Y(n177) );
  BUFX2 U189 ( .A(n_rst), .Y(n178) );
  BUFX2 U190 ( .A(n_rst), .Y(n179) );
  BUFX2 U191 ( .A(n_rst), .Y(n180) );
  BUFX2 U192 ( .A(n_rst), .Y(n182) );
  BUFX2 U193 ( .A(n_rst), .Y(n174) );
  BUFX2 U194 ( .A(n_rst), .Y(n181) );
  BUFX2 U195 ( .A(n_rst), .Y(n183) );
  OR2X1 U196 ( .A(n250), .B(Gx[2]), .Y(n254) );
  OR2X1 U197 ( .A(n254), .B(Gx[3]), .Y(n258) );
  OR2X1 U198 ( .A(n270), .B(Gx[7]), .Y(n274) );
  OR2X1 U199 ( .A(n262), .B(Gx[5]), .Y(n266) );
  BUFX2 U202 ( .A(P2[1]), .Y(n26) );
  AOI21X1 U203 ( .A(n28), .B(n29), .C(n632), .Y(n27) );
  NOR2X1 U204 ( .A(N289), .B(N290), .Y(n29) );
  INVX2 U205 ( .A(n632), .Y(n400) );
  INVX1 U206 ( .A(n322), .Y(n487) );
  INVX2 U207 ( .A(state[1]), .Y(n409) );
  INVX2 U208 ( .A(state[0]), .Y(n184) );
  NAND3X1 U209 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U210 ( .A(state[2]), .Y(n185) );
  NAND2X1 U211 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U212 ( .A(state[3]), .Y(n241) );
  NAND2X1 U213 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U214 ( .A(n628), .Y(n329) );
  MUX2X1 U215 ( .B(N205), .A(N168), .S(n141), .Y(n186) );
  INVX2 U216 ( .A(n186), .Y(n428) );
  NAND2X1 U217 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U218 ( .A(C1[9]), .Y(n188) );
  INVX2 U219 ( .A(N205), .Y(n187) );
  MUX2X1 U220 ( .B(n188), .A(n187), .S(n30), .Y(n526) );
  MUX2X1 U221 ( .B(N204), .A(N167), .S(n141), .Y(n189) );
  INVX2 U222 ( .A(n189), .Y(n429) );
  INVX2 U223 ( .A(C1[8]), .Y(n191) );
  INVX2 U224 ( .A(N204), .Y(n190) );
  MUX2X1 U225 ( .B(n191), .A(n190), .S(n30), .Y(n527) );
  MUX2X1 U226 ( .B(N203), .A(N166), .S(n141), .Y(n192) );
  INVX2 U227 ( .A(n192), .Y(n430) );
  INVX2 U228 ( .A(C1[7]), .Y(n194) );
  INVX2 U229 ( .A(N203), .Y(n193) );
  MUX2X1 U230 ( .B(n194), .A(n193), .S(n30), .Y(n528) );
  MUX2X1 U231 ( .B(N202), .A(N165), .S(n141), .Y(n195) );
  INVX2 U232 ( .A(n195), .Y(n431) );
  INVX2 U233 ( .A(C1[6]), .Y(n197) );
  INVX2 U234 ( .A(N202), .Y(n196) );
  MUX2X1 U235 ( .B(n197), .A(n196), .S(n30), .Y(n529) );
  MUX2X1 U236 ( .B(N201), .A(N164), .S(n141), .Y(n198) );
  INVX2 U237 ( .A(n198), .Y(n432) );
  INVX2 U238 ( .A(C1[5]), .Y(n200) );
  INVX2 U239 ( .A(N201), .Y(n199) );
  MUX2X1 U240 ( .B(n200), .A(n199), .S(n30), .Y(n530) );
  MUX2X1 U241 ( .B(N200), .A(N163), .S(n141), .Y(n201) );
  INVX2 U242 ( .A(n201), .Y(n433) );
  INVX2 U243 ( .A(C1[4]), .Y(n203) );
  INVX2 U244 ( .A(N200), .Y(n202) );
  MUX2X1 U245 ( .B(n203), .A(n202), .S(n30), .Y(n531) );
  MUX2X1 U246 ( .B(N199), .A(N162), .S(n141), .Y(n204) );
  INVX2 U247 ( .A(n204), .Y(n434) );
  INVX2 U248 ( .A(C1[3]), .Y(n206) );
  INVX2 U249 ( .A(N199), .Y(n205) );
  MUX2X1 U250 ( .B(n206), .A(n205), .S(n30), .Y(n532) );
  MUX2X1 U251 ( .B(N198), .A(N161), .S(n141), .Y(n207) );
  INVX2 U252 ( .A(n207), .Y(n435) );
  INVX2 U253 ( .A(C1[2]), .Y(n209) );
  INVX2 U254 ( .A(N198), .Y(n208) );
  MUX2X1 U255 ( .B(n209), .A(n208), .S(n30), .Y(n533) );
  MUX2X1 U256 ( .B(N197), .A(N160), .S(n141), .Y(n210) );
  INVX2 U257 ( .A(n210), .Y(n436) );
  INVX2 U258 ( .A(C1[1]), .Y(n212) );
  INVX2 U259 ( .A(N197), .Y(n211) );
  MUX2X1 U260 ( .B(n212), .A(n211), .S(n30), .Y(n534) );
  MUX2X1 U261 ( .B(A1[8]), .A(N150), .S(n141), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n410) );
  MUX2X1 U263 ( .B(A1[7]), .A(N149), .S(n141), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n411) );
  MUX2X1 U265 ( .B(A1[6]), .A(N148), .S(n141), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n412) );
  MUX2X1 U267 ( .B(A1[5]), .A(N147), .S(n141), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n413) );
  MUX2X1 U269 ( .B(A1[4]), .A(N146), .S(n168), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n414) );
  MUX2X1 U271 ( .B(A1[3]), .A(N145), .S(n168), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n415) );
  MUX2X1 U273 ( .B(A1[2]), .A(N144), .S(n168), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n416) );
  MUX2X1 U275 ( .B(A1[1]), .A(N143), .S(n168), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n417) );
  MUX2X1 U277 ( .B(A1[0]), .A(N142), .S(n168), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n418) );
  MUX2X1 U279 ( .B(D1[8]), .A(N186), .S(n168), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n461) );
  MUX2X1 U281 ( .B(D1[7]), .A(N185), .S(n168), .Y(n223) );
  MUX2X1 U282 ( .B(D1[6]), .A(N184), .S(n168), .Y(n224) );
  INVX2 U283 ( .A(n224), .Y(n469) );
  MUX2X1 U284 ( .B(D1[5]), .A(N183), .S(n168), .Y(n225) );
  INVX2 U285 ( .A(n225), .Y(n477) );
  MUX2X1 U286 ( .B(D1[4]), .A(N182), .S(n168), .Y(n226) );
  INVX2 U287 ( .A(n226), .Y(n478) );
  MUX2X1 U288 ( .B(D1[3]), .A(N181), .S(n168), .Y(n227) );
  INVX2 U289 ( .A(n227), .Y(n479) );
  MUX2X1 U290 ( .B(D1[2]), .A(N180), .S(n168), .Y(n228) );
  INVX2 U291 ( .A(n228), .Y(n480) );
  MUX2X1 U292 ( .B(D1[1]), .A(N179), .S(n168), .Y(n229) );
  INVX2 U293 ( .A(n229), .Y(n482) );
  MUX2X1 U294 ( .B(D1[0]), .A(N178), .S(n169), .Y(n230) );
  INVX2 U295 ( .A(n230), .Y(n483) );
  NAND2X1 U296 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U297 ( .B(E1[9]), .A(N225), .S(n65), .Y(n231) );
  INVX2 U298 ( .A(n231), .Y(n544) );
  MUX2X1 U299 ( .B(E1[8]), .A(N224), .S(n65), .Y(n232) );
  INVX2 U300 ( .A(n232), .Y(n545) );
  MUX2X1 U301 ( .B(E1[7]), .A(N223), .S(n65), .Y(n233) );
  INVX2 U302 ( .A(n233), .Y(n546) );
  MUX2X1 U303 ( .B(E1[6]), .A(N222), .S(n65), .Y(n234) );
  INVX2 U304 ( .A(n234), .Y(n547) );
  MUX2X1 U305 ( .B(E1[5]), .A(N221), .S(n65), .Y(n235) );
  INVX2 U306 ( .A(n235), .Y(n548) );
  MUX2X1 U307 ( .B(E1[4]), .A(N220), .S(n65), .Y(n236) );
  INVX2 U308 ( .A(n236), .Y(n549) );
  MUX2X1 U309 ( .B(E1[3]), .A(N219), .S(n65), .Y(n237) );
  INVX2 U310 ( .A(n237), .Y(n550) );
  MUX2X1 U311 ( .B(E1[2]), .A(N218), .S(n65), .Y(n238) );
  INVX2 U312 ( .A(n238), .Y(n551) );
  MUX2X1 U313 ( .B(E1[1]), .A(N217), .S(n65), .Y(n239) );
  INVX2 U314 ( .A(n239), .Y(n552) );
  MUX2X1 U315 ( .B(E1[0]), .A(N216), .S(n65), .Y(n240) );
  INVX2 U316 ( .A(n240), .Y(n553) );
  INVX2 U317 ( .A(N236), .Y(n243) );
  OAI21X1 U318 ( .A(n404), .B(n24), .C(N258), .Y(n242) );
  OAI21X1 U319 ( .A(n1), .B(n243), .C(n242), .Y(n570) );
  INVX2 U320 ( .A(N237), .Y(n246) );
  XOR2X1 U321 ( .A(Gx[1]), .B(N258), .Y(n244) );
  AOI22X1 U322 ( .A(n244), .B(n404), .C(Gx[1]), .D(n24), .Y(n245) );
  OAI21X1 U323 ( .A(n1), .B(n246), .C(n245), .Y(n571) );
  INVX2 U324 ( .A(N238), .Y(n249) );
  XOR2X1 U325 ( .A(n250), .B(Gx[2]), .Y(n247) );
  AOI22X1 U326 ( .A(n247), .B(n404), .C(Gx[2]), .D(n24), .Y(n248) );
  OAI21X1 U327 ( .A(n1), .B(n249), .C(n248), .Y(n572) );
  INVX2 U328 ( .A(N239), .Y(n253) );
  XOR2X1 U329 ( .A(n254), .B(Gx[3]), .Y(n251) );
  AOI22X1 U330 ( .A(n251), .B(n404), .C(Gx[3]), .D(n24), .Y(n252) );
  OAI21X1 U331 ( .A(n1), .B(n253), .C(n252), .Y(n573) );
  INVX2 U332 ( .A(N240), .Y(n257) );
  XOR2X1 U333 ( .A(n258), .B(Gx[4]), .Y(n255) );
  AOI22X1 U334 ( .A(n255), .B(n404), .C(Gx[4]), .D(n24), .Y(n256) );
  OAI21X1 U335 ( .A(n1), .B(n257), .C(n256), .Y(n574) );
  INVX2 U336 ( .A(N241), .Y(n261) );
  XOR2X1 U337 ( .A(n262), .B(Gx[5]), .Y(n259) );
  AOI22X1 U338 ( .A(n259), .B(n404), .C(Gx[5]), .D(n24), .Y(n260) );
  OAI21X1 U339 ( .A(n1), .B(n261), .C(n260), .Y(n575) );
  INVX2 U340 ( .A(N242), .Y(n265) );
  XOR2X1 U341 ( .A(n266), .B(Gx[6]), .Y(n263) );
  AOI22X1 U342 ( .A(n263), .B(n404), .C(Gx[6]), .D(n24), .Y(n264) );
  OAI21X1 U343 ( .A(n1), .B(n265), .C(n264), .Y(n576) );
  INVX2 U344 ( .A(N243), .Y(n269) );
  XOR2X1 U345 ( .A(n270), .B(Gx[7]), .Y(n267) );
  AOI22X1 U346 ( .A(n267), .B(n404), .C(Gx[7]), .D(n24), .Y(n268) );
  OAI21X1 U347 ( .A(n1), .B(n269), .C(n268), .Y(n577) );
  INVX2 U348 ( .A(N244), .Y(n273) );
  XOR2X1 U349 ( .A(n274), .B(Gx[8]), .Y(n271) );
  AOI22X1 U350 ( .A(n271), .B(n404), .C(Gx[8]), .D(n24), .Y(n272) );
  OAI21X1 U351 ( .A(n1), .B(n273), .C(n272), .Y(n578) );
  INVX2 U352 ( .A(N245), .Y(n277) );
  XOR2X1 U353 ( .A(n278), .B(Gx[9]), .Y(n275) );
  AOI22X1 U354 ( .A(n275), .B(n404), .C(Gx[9]), .D(n24), .Y(n276) );
  OAI21X1 U355 ( .A(n1), .B(n277), .C(n276), .Y(n579) );
  NOR2X1 U356 ( .A(Gx[9]), .B(n278), .Y(n279) );
  XNOR2X1 U357 ( .A(n279), .B(Gx[10]), .Y(n280) );
  AOI22X1 U358 ( .A(n24), .B(Gx[10]), .C(n280), .D(n404), .Y(n282) );
  NAND2X1 U359 ( .A(N246), .B(n388), .Y(n281) );
  NAND2X1 U360 ( .A(n282), .B(n281), .Y(n580) );
  NAND2X1 U361 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U362 ( .B(N215), .A(N177), .S(n169), .Y(n283) );
  INVX2 U363 ( .A(n283), .Y(n437) );
  INVX2 U364 ( .A(C2[9]), .Y(n285) );
  INVX2 U365 ( .A(N215), .Y(n284) );
  MUX2X1 U366 ( .B(n285), .A(n284), .S(n30), .Y(n535) );
  MUX2X1 U367 ( .B(N214), .A(N176), .S(n169), .Y(n286) );
  INVX2 U368 ( .A(n286), .Y(n438) );
  INVX2 U369 ( .A(C2[8]), .Y(n288) );
  INVX2 U370 ( .A(N214), .Y(n287) );
  MUX2X1 U371 ( .B(n288), .A(n287), .S(n30), .Y(n536) );
  MUX2X1 U372 ( .B(N213), .A(N175), .S(n169), .Y(n289) );
  INVX2 U373 ( .A(n289), .Y(n439) );
  INVX2 U374 ( .A(C2[7]), .Y(n291) );
  INVX2 U375 ( .A(N213), .Y(n290) );
  MUX2X1 U376 ( .B(n291), .A(n290), .S(n30), .Y(n537) );
  MUX2X1 U377 ( .B(N212), .A(N174), .S(n169), .Y(n292) );
  INVX2 U378 ( .A(n292), .Y(n440) );
  INVX2 U379 ( .A(C2[6]), .Y(n294) );
  INVX2 U380 ( .A(N212), .Y(n293) );
  MUX2X1 U381 ( .B(n294), .A(n293), .S(n30), .Y(n538) );
  MUX2X1 U382 ( .B(N211), .A(N173), .S(n169), .Y(n295) );
  INVX2 U383 ( .A(n295), .Y(n441) );
  INVX2 U384 ( .A(C2[5]), .Y(n297) );
  INVX2 U385 ( .A(N211), .Y(n296) );
  MUX2X1 U386 ( .B(n297), .A(n296), .S(n30), .Y(n539) );
  MUX2X1 U387 ( .B(N210), .A(N172), .S(n169), .Y(n298) );
  INVX2 U388 ( .A(n298), .Y(n443) );
  INVX2 U389 ( .A(C2[4]), .Y(n300) );
  INVX2 U390 ( .A(N210), .Y(n299) );
  MUX2X1 U391 ( .B(n300), .A(n299), .S(n30), .Y(n540) );
  MUX2X1 U392 ( .B(N209), .A(N171), .S(n169), .Y(n301) );
  INVX2 U393 ( .A(n301), .Y(n444) );
  INVX2 U394 ( .A(C2[3]), .Y(n304) );
  INVX2 U395 ( .A(N209), .Y(n302) );
  MUX2X1 U396 ( .B(n304), .A(n302), .S(n30), .Y(n541) );
  MUX2X1 U397 ( .B(N208), .A(N170), .S(n169), .Y(n305) );
  INVX2 U398 ( .A(n305), .Y(n451) );
  INVX2 U399 ( .A(C2[2]), .Y(n307) );
  INVX2 U400 ( .A(N208), .Y(n306) );
  MUX2X1 U401 ( .B(n307), .A(n306), .S(n30), .Y(n542) );
  MUX2X1 U402 ( .B(N207), .A(N169), .S(n169), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n452) );
  INVX2 U404 ( .A(C2[1]), .Y(n310) );
  INVX2 U405 ( .A(N207), .Y(n309) );
  MUX2X1 U406 ( .B(n310), .A(n309), .S(n30), .Y(n543) );
  MUX2X1 U407 ( .B(A2[8]), .A(N159), .S(n169), .Y(n311) );
  INVX2 U408 ( .A(n311), .Y(n419) );
  MUX2X1 U409 ( .B(A2[7]), .A(N158), .S(n169), .Y(n312) );
  INVX2 U410 ( .A(n312), .Y(n420) );
  MUX2X1 U411 ( .B(A2[6]), .A(N157), .S(n169), .Y(n313) );
  INVX2 U412 ( .A(n313), .Y(n421) );
  MUX2X1 U413 ( .B(A2[5]), .A(N156), .S(n170), .Y(n314) );
  INVX2 U414 ( .A(n314), .Y(n422) );
  MUX2X1 U415 ( .B(A2[4]), .A(N155), .S(n170), .Y(n316) );
  INVX2 U416 ( .A(n316), .Y(n423) );
  MUX2X1 U417 ( .B(A2[3]), .A(N154), .S(n170), .Y(n317) );
  INVX2 U418 ( .A(n317), .Y(n424) );
  MUX2X1 U419 ( .B(A2[2]), .A(N153), .S(n170), .Y(n318) );
  INVX2 U420 ( .A(n318), .Y(n425) );
  MUX2X1 U421 ( .B(A2[1]), .A(N152), .S(n170), .Y(n319) );
  INVX2 U422 ( .A(n319), .Y(n426) );
  MUX2X1 U423 ( .B(A2[0]), .A(N151), .S(n170), .Y(n320) );
  INVX2 U424 ( .A(n320), .Y(n427) );
  MUX2X1 U425 ( .B(D2[8]), .A(N195), .S(n170), .Y(n321) );
  INVX2 U426 ( .A(n321), .Y(n486) );
  MUX2X1 U427 ( .B(D2[7]), .A(N194), .S(n170), .Y(n322) );
  MUX2X1 U428 ( .B(D2[6]), .A(N193), .S(n170), .Y(n323) );
  INVX2 U429 ( .A(n323), .Y(n488) );
  MUX2X1 U430 ( .B(D2[5]), .A(N192), .S(n170), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n517) );
  MUX2X1 U432 ( .B(D2[4]), .A(N191), .S(n170), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n518) );
  MUX2X1 U434 ( .B(D2[3]), .A(N190), .S(n170), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n520) );
  MUX2X1 U436 ( .B(D2[2]), .A(N189), .S(n170), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n523) );
  MUX2X1 U438 ( .B(D2[1]), .A(N188), .S(n171), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n524) );
  MUX2X1 U440 ( .B(D2[0]), .A(N187), .S(n171), .Y(n330) );
  INVX2 U441 ( .A(n330), .Y(n525) );
  MUX2X1 U442 ( .B(E2[9]), .A(N235), .S(n65), .Y(n331) );
  INVX2 U443 ( .A(n331), .Y(n554) );
  MUX2X1 U444 ( .B(E2[8]), .A(N234), .S(n65), .Y(n332) );
  INVX2 U445 ( .A(n332), .Y(n555) );
  MUX2X1 U446 ( .B(E2[7]), .A(N233), .S(n65), .Y(n333) );
  INVX2 U447 ( .A(n333), .Y(n556) );
  MUX2X1 U448 ( .B(E2[6]), .A(N232), .S(n65), .Y(n334) );
  INVX2 U449 ( .A(n334), .Y(n557) );
  MUX2X1 U450 ( .B(E2[5]), .A(N231), .S(n65), .Y(n335) );
  INVX2 U451 ( .A(n335), .Y(n558) );
  MUX2X1 U452 ( .B(E2[4]), .A(N230), .S(n65), .Y(n336) );
  INVX2 U453 ( .A(n336), .Y(n559) );
  MUX2X1 U454 ( .B(E2[3]), .A(N229), .S(n65), .Y(n337) );
  INVX2 U455 ( .A(n337), .Y(n560) );
  MUX2X1 U456 ( .B(E2[2]), .A(N228), .S(n65), .Y(n338) );
  INVX2 U457 ( .A(n338), .Y(n561) );
  MUX2X1 U460 ( .B(E2[1]), .A(N227), .S(n65), .Y(n339) );
  INVX2 U461 ( .A(n339), .Y(n562) );
  MUX2X1 U463 ( .B(E2[0]), .A(N226), .S(n65), .Y(n340) );
  INVX2 U466 ( .A(n340), .Y(n563) );
  INVX2 U468 ( .A(N247), .Y(n343) );
  NAND2X1 U470 ( .A(n1), .B(n615), .Y(n392) );
  INVX2 U471 ( .A(n392), .Y(n408) );
  OAI21X1 U473 ( .A(n389), .B(n408), .C(N269), .Y(n342) );
  OAI21X1 U474 ( .A(n1), .B(n343), .C(n342), .Y(n567) );
  XOR2X1 U480 ( .A(Gy[1]), .B(N269), .Y(n344) );
  AOI22X1 U481 ( .A(n344), .B(n389), .C(N248), .D(n388), .Y(n345) );
  OAI21X1 U483 ( .A(n392), .B(n346), .C(n345), .Y(n589) );
  INVX2 U485 ( .A(Gy[2]), .Y(n350) );
  NAND2X1 U486 ( .A(n25), .B(n346), .Y(n349) );
  XOR2X1 U489 ( .A(n349), .B(Gy[2]), .Y(n347) );
  AOI22X1 U494 ( .A(n347), .B(n389), .C(N249), .D(n388), .Y(n348) );
  OAI21X1 U495 ( .A(n392), .B(n350), .C(n348), .Y(n588) );
  INVX2 U496 ( .A(Gy[3]), .Y(n355) );
  INVX2 U497 ( .A(n349), .Y(n351) );
  NAND2X1 U498 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U499 ( .A(n354), .B(Gy[3]), .Y(n352) );
  AOI22X1 U500 ( .A(n352), .B(n389), .C(N250), .D(n388), .Y(n353) );
  OAI21X1 U501 ( .A(n392), .B(n355), .C(n353), .Y(n587) );
  INVX2 U502 ( .A(Gy[4]), .Y(n360) );
  INVX2 U503 ( .A(n354), .Y(n356) );
  NAND2X1 U504 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U505 ( .A(n359), .B(Gy[4]), .Y(n357) );
  AOI22X1 U506 ( .A(n357), .B(n389), .C(N251), .D(n388), .Y(n358) );
  OAI21X1 U507 ( .A(n392), .B(n360), .C(n358), .Y(n586) );
  INVX2 U508 ( .A(Gy[5]), .Y(n366) );
  INVX2 U509 ( .A(n359), .Y(n361) );
  NAND2X1 U510 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U511 ( .A(n365), .B(Gy[5]), .Y(n362) );
  AOI22X1 U512 ( .A(n362), .B(n389), .C(N252), .D(n388), .Y(n363) );
  OAI21X1 U513 ( .A(n392), .B(n366), .C(n363), .Y(n585) );
  INVX2 U514 ( .A(Gy[6]), .Y(n371) );
  INVX2 U515 ( .A(n365), .Y(n367) );
  NAND2X1 U516 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U517 ( .A(n370), .B(Gy[6]), .Y(n368) );
  AOI22X1 U518 ( .A(n368), .B(n389), .C(N253), .D(n388), .Y(n369) );
  OAI21X1 U519 ( .A(n392), .B(n371), .C(n369), .Y(n584) );
  INVX2 U520 ( .A(Gy[7]), .Y(n376) );
  INVX2 U521 ( .A(n370), .Y(n372) );
  NAND2X1 U522 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U523 ( .A(n375), .B(Gy[7]), .Y(n373) );
  AOI22X1 U524 ( .A(n373), .B(n389), .C(N254), .D(n388), .Y(n374) );
  OAI21X1 U525 ( .A(n392), .B(n376), .C(n374), .Y(n583) );
  INVX2 U526 ( .A(Gy[8]), .Y(n381) );
  INVX2 U527 ( .A(n375), .Y(n377) );
  NAND2X1 U528 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U529 ( .A(n380), .B(Gy[8]), .Y(n378) );
  AOI22X1 U530 ( .A(n378), .B(n389), .C(N255), .D(n388), .Y(n379) );
  OAI21X1 U531 ( .A(n392), .B(n381), .C(n379), .Y(n582) );
  INVX2 U532 ( .A(Gy[9]), .Y(n385) );
  XOR2X1 U533 ( .A(n384), .B(Gy[9]), .Y(n382) );
  AOI22X1 U534 ( .A(n382), .B(n389), .C(N256), .D(n388), .Y(n383) );
  OAI21X1 U535 ( .A(n392), .B(n385), .C(n383), .Y(n581) );
  INVX2 U536 ( .A(Gy[10]), .Y(n406) );
  NAND2X1 U537 ( .A(n23), .B(n385), .Y(n387) );
  XOR2X1 U538 ( .A(n387), .B(Gy[10]), .Y(n390) );
  AOI22X1 U539 ( .A(n390), .B(n389), .C(N257), .D(n388), .Y(n391) );
  OAI21X1 U540 ( .A(n406), .B(n392), .C(n391), .Y(n568) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_4_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n48, n49, n51, n54, n56, n58, n60, n102,
         n103, n104, n105, n107, n108, n109, n110, n111;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  XNOR2X1 U4 ( .A(n17), .B(n2), .Y(SUM[9]) );
  AOI21X1 U5 ( .A(n105), .B(n17), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n105), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n20), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n25), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n25), .B(n104), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n104), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n28), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n103), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n103), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n109), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n41), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n102), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n102), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n108), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n110), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n110), .Y(n10) );
  NAND2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  OR2X2 U77 ( .A(B[3]), .B(A[3]), .Y(n102) );
  OR2X2 U78 ( .A(B[5]), .B(A[5]), .Y(n103) );
  OR2X2 U79 ( .A(B[7]), .B(A[7]), .Y(n104) );
  OR2X2 U80 ( .A(B[9]), .B(A[9]), .Y(n105) );
  AND2X2 U81 ( .A(n51), .B(n111), .Y(SUM[0]) );
  INVX1 U82 ( .A(n44), .Y(n107) );
  INVX2 U83 ( .A(n107), .Y(n108) );
  BUFX2 U84 ( .A(n36), .Y(n109) );
  OR2X2 U85 ( .A(B[1]), .B(A[1]), .Y(n110) );
  OR2X2 U86 ( .A(B[0]), .B(A[0]), .Y(n111) );
  XNOR2X1 U87 ( .A(n12), .B(n1), .Y(SUM[10]) );
  INVX2 U88 ( .A(n42), .Y(n60) );
  INVX2 U89 ( .A(n34), .Y(n58) );
  INVX2 U90 ( .A(n26), .Y(n56) );
  INVX2 U91 ( .A(n18), .Y(n54) );
  INVX2 U92 ( .A(n51), .Y(n49) );
  INVX2 U93 ( .A(n48), .Y(n46) );
  INVX2 U94 ( .A(n40), .Y(n38) );
  INVX2 U95 ( .A(n32), .Y(n30) );
  INVX2 U96 ( .A(n24), .Y(n22) );
  INVX2 U97 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_4_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_4_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_4_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_4_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_4_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  INVX1 U39 ( .A(B[7]), .Y(n23) );
  INVX1 U40 ( .A(B[5]), .Y(n25) );
  INVX1 U41 ( .A(B[6]), .Y(n24) );
  OR2X2 U42 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U43 ( .A(n17), .Y(n22) );
  INVX1 U44 ( .A(n4), .Y(DIFF[8]) );
  INVX1 U45 ( .A(B[1]), .Y(n29) );
  INVX2 U46 ( .A(B[0]), .Y(n30) );
  INVX2 U47 ( .A(B[2]), .Y(n28) );
  INVX2 U48 ( .A(B[3]), .Y(n27) );
  INVX2 U49 ( .A(B[4]), .Y(n26) );
  INVX2 U50 ( .A(n9), .Y(n20) );
  INVX2 U51 ( .A(n15), .Y(n13) );
endmodule


module edge_detection_4_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  INVX1 U39 ( .A(B[7]), .Y(n23) );
  INVX1 U40 ( .A(B[6]), .Y(n24) );
  INVX1 U41 ( .A(B[5]), .Y(n25) );
  OR2X2 U42 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U43 ( .A(B[0]), .Y(n30) );
  INVX2 U44 ( .A(B[1]), .Y(n29) );
  INVX2 U45 ( .A(B[2]), .Y(n28) );
  INVX2 U46 ( .A(B[3]), .Y(n27) );
  INVX2 U47 ( .A(B[4]), .Y(n26) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_4_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X1 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U40 ( .A(B[0]), .Y(n30) );
  XOR2X1 U41 ( .A(A[6]), .B(n24), .Y(n65) );
  XOR2X1 U42 ( .A(n65), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U43 ( .A(A[6]), .B(n24), .Y(n66) );
  NAND2X1 U44 ( .A(A[6]), .B(n6), .Y(n67) );
  NAND2X1 U45 ( .A(n24), .B(n6), .Y(n68) );
  NAND3X1 U46 ( .A(n66), .B(n67), .C(n68), .Y(n5) );
  XOR2X1 U47 ( .A(A[7]), .B(n23), .Y(n69) );
  XOR2X1 U48 ( .A(n69), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U49 ( .A(A[7]), .B(n23), .Y(n70) );
  NAND2X1 U50 ( .A(n5), .B(A[7]), .Y(n71) );
  NAND2X1 U51 ( .A(n23), .B(n5), .Y(n72) );
  NAND3X1 U52 ( .A(n70), .B(n71), .C(n72), .Y(n4) );
  INVX2 U53 ( .A(B[1]), .Y(n29) );
  INVX2 U54 ( .A(B[2]), .Y(n28) );
  INVX2 U55 ( .A(B[3]), .Y(n27) );
  INVX2 U56 ( .A(B[4]), .Y(n26) );
  INVX2 U57 ( .A(B[5]), .Y(n25) );
  INVX2 U58 ( .A(B[6]), .Y(n24) );
  INVX2 U59 ( .A(B[7]), .Y(n23) );
  INVX2 U60 ( .A(n17), .Y(n22) );
  INVX2 U61 ( .A(n9), .Y(n20) );
  INVX2 U62 ( .A(n15), .Y(n13) );
  INVX2 U63 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_4_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n73), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n74), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n74), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  INVX1 U39 ( .A(B[0]), .Y(n30) );
  XOR2X1 U40 ( .A(A[6]), .B(n24), .Y(n64) );
  XOR2X1 U41 ( .A(n64), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U42 ( .A(A[6]), .B(n24), .Y(n65) );
  NAND2X1 U43 ( .A(A[6]), .B(n6), .Y(n66) );
  NAND2X1 U44 ( .A(n24), .B(n6), .Y(n67) );
  NAND3X1 U45 ( .A(n65), .B(n66), .C(n67), .Y(n5) );
  XOR2X1 U46 ( .A(A[7]), .B(n23), .Y(n68) );
  XOR2X1 U47 ( .A(n68), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U48 ( .A(A[7]), .B(n23), .Y(n69) );
  NAND2X1 U49 ( .A(A[7]), .B(n5), .Y(n70) );
  NAND2X1 U50 ( .A(n23), .B(n5), .Y(n71) );
  NAND3X1 U51 ( .A(n69), .B(n70), .C(n71), .Y(n4) );
  INVX1 U52 ( .A(n16), .Y(n72) );
  INVX2 U53 ( .A(n72), .Y(n73) );
  OR2X1 U54 ( .A(A[2]), .B(n28), .Y(n74) );
  INVX2 U55 ( .A(B[1]), .Y(n29) );
  INVX2 U56 ( .A(B[2]), .Y(n28) );
  INVX2 U57 ( .A(B[3]), .Y(n27) );
  INVX2 U58 ( .A(B[4]), .Y(n26) );
  INVX2 U59 ( .A(B[5]), .Y(n25) );
  INVX2 U60 ( .A(B[6]), .Y(n24) );
  INVX2 U61 ( .A(B[7]), .Y(n23) );
  INVX2 U62 ( .A(n17), .Y(n22) );
  INVX2 U63 ( .A(n9), .Y(n20) );
  INVX2 U64 ( .A(n15), .Y(n13) );
  INVX2 U65 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_4_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n72), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n73), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n73), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  XOR2X1 U39 ( .A(A[6]), .B(n24), .Y(n64) );
  XOR2X1 U40 ( .A(n64), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U41 ( .A(A[6]), .B(n24), .Y(n65) );
  NAND2X1 U42 ( .A(A[6]), .B(n6), .Y(n66) );
  NAND2X1 U43 ( .A(n24), .B(n6), .Y(n67) );
  NAND3X1 U44 ( .A(n65), .B(n66), .C(n67), .Y(n5) );
  XOR2X1 U45 ( .A(A[7]), .B(n23), .Y(n68) );
  XOR2X1 U46 ( .A(n68), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U47 ( .A(A[7]), .B(n23), .Y(n69) );
  NAND2X1 U48 ( .A(A[7]), .B(n5), .Y(n70) );
  NAND2X1 U49 ( .A(n23), .B(n5), .Y(n71) );
  NAND3X1 U50 ( .A(n69), .B(n70), .C(n71), .Y(n4) );
  OAI21X1 U51 ( .A(n17), .B(n19), .C(n18), .Y(n72) );
  OR2X1 U52 ( .A(A[2]), .B(n28), .Y(n73) );
  INVX2 U53 ( .A(B[0]), .Y(n30) );
  INVX2 U54 ( .A(B[1]), .Y(n29) );
  INVX2 U55 ( .A(B[2]), .Y(n28) );
  INVX2 U56 ( .A(B[3]), .Y(n27) );
  INVX2 U57 ( .A(B[4]), .Y(n26) );
  INVX2 U58 ( .A(B[5]), .Y(n25) );
  INVX2 U59 ( .A(B[6]), .Y(n24) );
  INVX2 U60 ( .A(B[7]), .Y(n23) );
  INVX2 U61 ( .A(n17), .Y(n22) );
  INVX2 U62 ( .A(n9), .Y(n20) );
  INVX2 U63 ( .A(n15), .Y(n13) );
  INVX2 U64 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_4_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n72), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n68), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n68), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  XOR2X1 U39 ( .A(n25), .B(A[5]), .Y(n64) );
  XOR2X1 U40 ( .A(n7), .B(n64), .Y(DIFF[5]) );
  NAND2X1 U41 ( .A(n7), .B(n25), .Y(n65) );
  NAND2X1 U42 ( .A(n7), .B(A[5]), .Y(n66) );
  NAND2X1 U43 ( .A(n25), .B(A[5]), .Y(n67) );
  NAND3X1 U44 ( .A(n66), .B(n65), .C(n67), .Y(n6) );
  INVX1 U45 ( .A(B[1]), .Y(n29) );
  OR2X1 U46 ( .A(A[2]), .B(n28), .Y(n68) );
  XNOR2X1 U47 ( .A(n3), .B(n69), .Y(DIFF[1]) );
  XOR2X1 U48 ( .A(n30), .B(n70), .Y(DIFF[0]) );
  INVX1 U49 ( .A(B[0]), .Y(n30) );
  INVX1 U50 ( .A(n19), .Y(n69) );
  INVX1 U51 ( .A(A[0]), .Y(n70) );
  INVX1 U52 ( .A(n16), .Y(n71) );
  INVX2 U53 ( .A(n71), .Y(n72) );
  INVX2 U54 ( .A(B[2]), .Y(n28) );
  INVX2 U55 ( .A(B[3]), .Y(n27) );
  INVX2 U56 ( .A(B[4]), .Y(n26) );
  INVX2 U57 ( .A(B[5]), .Y(n25) );
  INVX2 U58 ( .A(B[6]), .Y(n24) );
  INVX2 U59 ( .A(B[7]), .Y(n23) );
  INVX2 U60 ( .A(n17), .Y(n22) );
  INVX2 U61 ( .A(n9), .Y(n20) );
  INVX2 U62 ( .A(n15), .Y(n13) );
  INVX2 U63 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_4 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n571), .CLK(clk), .R(n187), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n572), .CLK(clk), .R(n187), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n187), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n573), .CLK(clk), .R(n187), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n530), .CLK(clk), .R(n187), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n584), .CLK(clk), .R(n186), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n186), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n186), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n422), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n421), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n420), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n419), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n418), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n417), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n416), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n415), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n414), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n440), .CLK(clk), .R(n185), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n439), .CLK(clk), .R(n185), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n438), .CLK(clk), .R(n185), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n437), .CLK(clk), .R(n185), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n436), .CLK(clk), .R(n185), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n435), .CLK(clk), .R(n185), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n434), .CLK(clk), .R(n185), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n433), .CLK(clk), .R(n185), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n432), .CLK(clk), .R(n185), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n538), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n537), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n536), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n535), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n534), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n533), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n532), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n531), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n517), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n488), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n487), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n486), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n483), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n482), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n480), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n479), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n478), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n557), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n556), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n555), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n554), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n553), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n552), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n551), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n550), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n549), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n548), .CLK(clk), .R(n182), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n431), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n430), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n429), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n428), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n427), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n426), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n425), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n424), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n423), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n477), .CLK(clk), .R(n182), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n469), .CLK(clk), .R(n182), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n466), .CLK(clk), .R(n181), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n461), .CLK(clk), .R(n181), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n452), .CLK(clk), .R(n181), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n451), .CLK(clk), .R(n181), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n444), .CLK(clk), .R(n181), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n443), .CLK(clk), .R(n181), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n441), .CLK(clk), .R(n181), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n529), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n528), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n527), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n526), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n525), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n524), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n523), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n520), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n518), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n567), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n566), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n565), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n564), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n563), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n562), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n561), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n560), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n559), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n558), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n569), .CLK(clk), .R(n179), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n574), .CLK(clk), .R(n179), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n575), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n576), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n577), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n578), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n579), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n580), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n581), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n582), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n583), .CLK(clk), .R(n178), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n547), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n546), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n545), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n544), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n543), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n542), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n541), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n540), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n539), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n593), .CLK(clk), .R(n178), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n592), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n591), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n590), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n589), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n588), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n587), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n586), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n585), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n594), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n595), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n596), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n597), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n598), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n599), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n600), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n601), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n634), .B(n627), .Y(n618) );
  AND2X2 U160 ( .A(n637), .B(n636), .Y(n604) );
  OR2X1 U458 ( .A(n629), .B(n628), .Y(n630) );
  NAND3X1 U459 ( .A(n627), .B(n626), .C(n412), .Y(n631) );
  OR2X1 U462 ( .A(n623), .B(n622), .Y(n624) );
  NAND3X1 U464 ( .A(n619), .B(n626), .C(n618), .Y(n625) );
  OAI21X1 U465 ( .A(n626), .B(n413), .C(n617), .Y(n573) );
  NAND2X1 U467 ( .A(n568), .B(n621), .Y(n615) );
  NAND3X1 U469 ( .A(n632), .B(n636), .C(n633), .Y(n616) );
  OR2X1 U472 ( .A(n623), .B(n629), .Y(n612) );
  NAND3X1 U475 ( .A(n633), .B(n626), .C(n610), .Y(n613) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n570), .Y(n610) );
  NAND2X1 U477 ( .A(n608), .B(n607), .Y(n626) );
  NOR2X1 U478 ( .A(n606), .B(n605), .Y(n607) );
  NAND3X1 U479 ( .A(n634), .B(n633), .C(n614), .Y(n605) );
  NAND3X1 U482 ( .A(n635), .B(n632), .C(n604), .Y(n606) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n637) );
  NOR2X1 U487 ( .A(n603), .B(n602), .Y(n608) );
  NAND3X1 U488 ( .A(n609), .B(n620), .C(n412), .Y(n602) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n609) );
  NAND3X1 U491 ( .A(n621), .B(n611), .C(n627), .Y(n603) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n627) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n611) );
  edge_detection_4_DW01_add_7 add_231 ( .A({Gx[10:2], n30, n28}), .B({Gy[10:2], 
        n27, n26}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_4_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_4_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_4_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_4_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_4_DW01_sub_8 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_4_DW01_sub_9 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_4_DW01_sub_10 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_4_DW01_sub_11 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_4_DW01_sub_12 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_4_DW01_sub_13 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  INVX4 U5 ( .A(n65), .Y(n406) );
  INVX2 U6 ( .A(n29), .Y(n30) );
  BUFX2 U12 ( .A(N258), .Y(n28) );
  NAND2X1 U13 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U52 ( .A(n413), .B(n188), .Y(n2) );
  AND2X2 U128 ( .A(state[3]), .B(n189), .Y(n8) );
  AND2X2 U155 ( .A(state[2]), .B(n245), .Y(n9) );
  AND2X2 U156 ( .A(n245), .B(n189), .Y(n16) );
  AND2X2 U158 ( .A(state[1]), .B(n188), .Y(n17) );
  AND2X2 U159 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U161 ( .A(n613), .B(n612), .Y(n19) );
  OR2X2 U162 ( .A(n625), .B(n624), .Y(n20) );
  OR2X2 U163 ( .A(n631), .B(n630), .Y(n21) );
  AND2X2 U164 ( .A(state[0]), .B(n413), .Y(n22) );
  NOR2X1 U165 ( .A(n379), .B(Gy[7]), .Y(n23) );
  INVX1 U166 ( .A(n23), .Y(n383) );
  OR2X1 U167 ( .A(n28), .B(n30), .Y(n254) );
  OR2X1 U168 ( .A(n254), .B(Gx[2]), .Y(n258) );
  OR2X2 U169 ( .A(n262), .B(Gx[4]), .Y(n266) );
  OR2X2 U170 ( .A(n270), .B(Gx[6]), .Y(n274) );
  OR2X2 U171 ( .A(n278), .B(Gx[8]), .Y(n282) );
  BUFX2 U172 ( .A(n333), .Y(n174) );
  BUFX2 U173 ( .A(n333), .Y(n173) );
  BUFX2 U174 ( .A(n333), .Y(n171) );
  BUFX2 U175 ( .A(n333), .Y(n172) );
  INVX2 U176 ( .A(n634), .Y(n170) );
  INVX2 U177 ( .A(n1), .Y(n392) );
  INVX2 U178 ( .A(n633), .Y(n169) );
  BUFX2 U179 ( .A(n333), .Y(n175) );
  INVX2 U180 ( .A(n635), .Y(n408) );
  AND2X2 U181 ( .A(n635), .B(n1), .Y(n24) );
  INVX2 U182 ( .A(n619), .Y(n393) );
  INVX2 U183 ( .A(N288), .Y(n141) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n177) );
  BUFX2 U186 ( .A(n_rst), .Y(n179) );
  BUFX2 U187 ( .A(n_rst), .Y(n180) );
  BUFX2 U188 ( .A(n_rst), .Y(n181) );
  BUFX2 U189 ( .A(n_rst), .Y(n182) );
  BUFX2 U190 ( .A(n_rst), .Y(n183) );
  BUFX2 U191 ( .A(n_rst), .Y(n184) );
  BUFX2 U192 ( .A(n_rst), .Y(n186) );
  BUFX2 U193 ( .A(n_rst), .Y(n178) );
  BUFX2 U194 ( .A(n_rst), .Y(n185) );
  BUFX2 U195 ( .A(n_rst), .Y(n187) );
  OR2X1 U196 ( .A(n274), .B(Gx[7]), .Y(n278) );
  BUFX2 U197 ( .A(Gy[1]), .Y(n27) );
  INVX2 U198 ( .A(n25), .Y(n26) );
  OR2X1 U199 ( .A(n258), .B(Gx[3]), .Y(n262) );
  OR2X1 U200 ( .A(n266), .B(Gx[5]), .Y(n270) );
  INVX2 U203 ( .A(N269), .Y(n25) );
  INVX2 U204 ( .A(Gx[1]), .Y(n29) );
  INVX1 U205 ( .A(n193), .Y(n433) );
  AOI21X1 U206 ( .A(n141), .B(n168), .C(n636), .Y(n65) );
  NOR2X1 U207 ( .A(N289), .B(N290), .Y(n168) );
  INVX2 U208 ( .A(n636), .Y(n404) );
  INVX1 U209 ( .A(n290), .Y(n443) );
  INVX2 U210 ( .A(state[1]), .Y(n413) );
  INVX2 U211 ( .A(state[0]), .Y(n188) );
  NAND3X1 U212 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n636) );
  INVX2 U213 ( .A(state[2]), .Y(n189) );
  NAND2X1 U214 ( .A(n17), .B(n8), .Y(n635) );
  INVX2 U215 ( .A(state[3]), .Y(n245) );
  NAND2X1 U216 ( .A(n16), .B(n22), .Y(n632) );
  INVX2 U217 ( .A(n632), .Y(n333) );
  MUX2X1 U218 ( .B(N205), .A(N168), .S(n171), .Y(n190) );
  INVX2 U219 ( .A(n190), .Y(n432) );
  NAND2X1 U220 ( .A(n16), .B(n17), .Y(n633) );
  INVX2 U221 ( .A(C1[9]), .Y(n192) );
  INVX2 U222 ( .A(N205), .Y(n191) );
  MUX2X1 U223 ( .B(n192), .A(n191), .S(n169), .Y(n530) );
  MUX2X1 U224 ( .B(N204), .A(N167), .S(n171), .Y(n193) );
  INVX2 U225 ( .A(C1[8]), .Y(n195) );
  INVX2 U226 ( .A(N204), .Y(n194) );
  MUX2X1 U227 ( .B(n195), .A(n194), .S(n169), .Y(n531) );
  MUX2X1 U228 ( .B(N203), .A(N166), .S(n171), .Y(n196) );
  INVX2 U229 ( .A(n196), .Y(n434) );
  INVX2 U230 ( .A(C1[7]), .Y(n198) );
  INVX2 U231 ( .A(N203), .Y(n197) );
  MUX2X1 U232 ( .B(n198), .A(n197), .S(n169), .Y(n532) );
  MUX2X1 U233 ( .B(N202), .A(N165), .S(n171), .Y(n199) );
  INVX2 U234 ( .A(n199), .Y(n435) );
  INVX2 U235 ( .A(C1[6]), .Y(n201) );
  INVX2 U236 ( .A(N202), .Y(n200) );
  MUX2X1 U237 ( .B(n201), .A(n200), .S(n169), .Y(n533) );
  MUX2X1 U238 ( .B(N201), .A(N164), .S(n171), .Y(n202) );
  INVX2 U239 ( .A(n202), .Y(n436) );
  INVX2 U240 ( .A(C1[5]), .Y(n204) );
  INVX2 U241 ( .A(N201), .Y(n203) );
  MUX2X1 U242 ( .B(n204), .A(n203), .S(n169), .Y(n534) );
  MUX2X1 U243 ( .B(N200), .A(N163), .S(n171), .Y(n205) );
  INVX2 U244 ( .A(n205), .Y(n437) );
  INVX2 U245 ( .A(C1[4]), .Y(n207) );
  INVX2 U246 ( .A(N200), .Y(n206) );
  MUX2X1 U247 ( .B(n207), .A(n206), .S(n169), .Y(n535) );
  MUX2X1 U248 ( .B(N199), .A(N162), .S(n171), .Y(n208) );
  INVX2 U249 ( .A(n208), .Y(n438) );
  INVX2 U250 ( .A(C1[3]), .Y(n210) );
  INVX2 U251 ( .A(N199), .Y(n209) );
  MUX2X1 U252 ( .B(n210), .A(n209), .S(n169), .Y(n536) );
  MUX2X1 U253 ( .B(N198), .A(N161), .S(n171), .Y(n211) );
  INVX2 U254 ( .A(n211), .Y(n439) );
  INVX2 U255 ( .A(C1[2]), .Y(n213) );
  INVX2 U256 ( .A(N198), .Y(n212) );
  MUX2X1 U257 ( .B(n213), .A(n212), .S(n169), .Y(n537) );
  MUX2X1 U258 ( .B(N197), .A(N160), .S(n171), .Y(n214) );
  INVX2 U259 ( .A(n214), .Y(n440) );
  INVX2 U260 ( .A(C1[1]), .Y(n216) );
  INVX2 U261 ( .A(N197), .Y(n215) );
  MUX2X1 U262 ( .B(n216), .A(n215), .S(n169), .Y(n538) );
  MUX2X1 U263 ( .B(A1[8]), .A(N150), .S(n171), .Y(n217) );
  INVX2 U264 ( .A(n217), .Y(n414) );
  MUX2X1 U265 ( .B(A1[7]), .A(N149), .S(n171), .Y(n218) );
  INVX2 U266 ( .A(n218), .Y(n415) );
  MUX2X1 U267 ( .B(A1[6]), .A(N148), .S(n171), .Y(n219) );
  INVX2 U268 ( .A(n219), .Y(n416) );
  MUX2X1 U269 ( .B(A1[5]), .A(N147), .S(n171), .Y(n220) );
  INVX2 U270 ( .A(n220), .Y(n417) );
  MUX2X1 U271 ( .B(A1[4]), .A(N146), .S(n172), .Y(n221) );
  INVX2 U272 ( .A(n221), .Y(n418) );
  MUX2X1 U273 ( .B(A1[3]), .A(N145), .S(n172), .Y(n222) );
  INVX2 U274 ( .A(n222), .Y(n419) );
  MUX2X1 U275 ( .B(A1[2]), .A(N144), .S(n172), .Y(n223) );
  INVX2 U276 ( .A(n223), .Y(n420) );
  MUX2X1 U277 ( .B(A1[1]), .A(N143), .S(n172), .Y(n224) );
  INVX2 U278 ( .A(n224), .Y(n421) );
  MUX2X1 U279 ( .B(A1[0]), .A(N142), .S(n172), .Y(n225) );
  INVX2 U280 ( .A(n225), .Y(n422) );
  MUX2X1 U281 ( .B(D1[8]), .A(N186), .S(n172), .Y(n226) );
  INVX2 U282 ( .A(n226), .Y(n478) );
  MUX2X1 U283 ( .B(D1[7]), .A(N185), .S(n172), .Y(n227) );
  INVX2 U284 ( .A(n227), .Y(n479) );
  MUX2X1 U285 ( .B(D1[6]), .A(N184), .S(n172), .Y(n228) );
  INVX2 U286 ( .A(n228), .Y(n480) );
  MUX2X1 U287 ( .B(D1[5]), .A(N183), .S(n172), .Y(n229) );
  INVX2 U288 ( .A(n229), .Y(n482) );
  MUX2X1 U289 ( .B(D1[4]), .A(N182), .S(n172), .Y(n230) );
  INVX2 U290 ( .A(n230), .Y(n483) );
  MUX2X1 U291 ( .B(D1[3]), .A(N181), .S(n172), .Y(n231) );
  INVX2 U292 ( .A(n231), .Y(n486) );
  MUX2X1 U293 ( .B(D1[2]), .A(N180), .S(n172), .Y(n232) );
  INVX2 U294 ( .A(n232), .Y(n487) );
  MUX2X1 U295 ( .B(D1[1]), .A(N179), .S(n172), .Y(n233) );
  INVX2 U296 ( .A(n233), .Y(n488) );
  MUX2X1 U297 ( .B(D1[0]), .A(N178), .S(n173), .Y(n234) );
  INVX2 U298 ( .A(n234), .Y(n517) );
  NAND2X1 U299 ( .A(n16), .B(n18), .Y(n634) );
  MUX2X1 U300 ( .B(E1[9]), .A(N225), .S(n170), .Y(n235) );
  INVX2 U301 ( .A(n235), .Y(n548) );
  MUX2X1 U302 ( .B(E1[8]), .A(N224), .S(n170), .Y(n236) );
  INVX2 U303 ( .A(n236), .Y(n549) );
  MUX2X1 U304 ( .B(E1[7]), .A(N223), .S(n170), .Y(n237) );
  INVX2 U305 ( .A(n237), .Y(n550) );
  MUX2X1 U306 ( .B(E1[6]), .A(N222), .S(n170), .Y(n238) );
  INVX2 U307 ( .A(n238), .Y(n551) );
  MUX2X1 U308 ( .B(E1[5]), .A(N221), .S(n170), .Y(n239) );
  INVX2 U309 ( .A(n239), .Y(n552) );
  MUX2X1 U310 ( .B(E1[4]), .A(N220), .S(n170), .Y(n240) );
  INVX2 U311 ( .A(n240), .Y(n553) );
  MUX2X1 U312 ( .B(E1[3]), .A(N219), .S(n170), .Y(n241) );
  INVX2 U313 ( .A(n241), .Y(n554) );
  MUX2X1 U314 ( .B(E1[2]), .A(N218), .S(n170), .Y(n242) );
  INVX2 U315 ( .A(n242), .Y(n555) );
  MUX2X1 U316 ( .B(E1[1]), .A(N217), .S(n170), .Y(n243) );
  INVX2 U317 ( .A(n243), .Y(n556) );
  MUX2X1 U318 ( .B(E1[0]), .A(N216), .S(n170), .Y(n244) );
  INVX2 U319 ( .A(n244), .Y(n557) );
  INVX2 U320 ( .A(N236), .Y(n247) );
  OAI21X1 U321 ( .A(n408), .B(n24), .C(n28), .Y(n246) );
  OAI21X1 U322 ( .A(n1), .B(n247), .C(n246), .Y(n574) );
  INVX2 U323 ( .A(N237), .Y(n250) );
  XOR2X1 U324 ( .A(n30), .B(n28), .Y(n248) );
  AOI22X1 U325 ( .A(n248), .B(n408), .C(n30), .D(n24), .Y(n249) );
  OAI21X1 U326 ( .A(n1), .B(n250), .C(n249), .Y(n575) );
  INVX2 U327 ( .A(N238), .Y(n253) );
  XOR2X1 U328 ( .A(n254), .B(Gx[2]), .Y(n251) );
  AOI22X1 U329 ( .A(n251), .B(n408), .C(Gx[2]), .D(n24), .Y(n252) );
  OAI21X1 U330 ( .A(n1), .B(n253), .C(n252), .Y(n576) );
  INVX2 U331 ( .A(N239), .Y(n257) );
  XOR2X1 U332 ( .A(n258), .B(Gx[3]), .Y(n255) );
  AOI22X1 U333 ( .A(n255), .B(n408), .C(Gx[3]), .D(n24), .Y(n256) );
  OAI21X1 U334 ( .A(n1), .B(n257), .C(n256), .Y(n577) );
  INVX2 U335 ( .A(N240), .Y(n261) );
  XOR2X1 U336 ( .A(n262), .B(Gx[4]), .Y(n259) );
  AOI22X1 U337 ( .A(n259), .B(n408), .C(Gx[4]), .D(n24), .Y(n260) );
  OAI21X1 U338 ( .A(n1), .B(n261), .C(n260), .Y(n578) );
  INVX2 U339 ( .A(N241), .Y(n265) );
  XOR2X1 U340 ( .A(n266), .B(Gx[5]), .Y(n263) );
  AOI22X1 U341 ( .A(n263), .B(n408), .C(Gx[5]), .D(n24), .Y(n264) );
  OAI21X1 U342 ( .A(n1), .B(n265), .C(n264), .Y(n579) );
  INVX2 U343 ( .A(N242), .Y(n269) );
  XOR2X1 U344 ( .A(n270), .B(Gx[6]), .Y(n267) );
  AOI22X1 U345 ( .A(n267), .B(n408), .C(Gx[6]), .D(n24), .Y(n268) );
  OAI21X1 U346 ( .A(n1), .B(n269), .C(n268), .Y(n580) );
  INVX2 U347 ( .A(N243), .Y(n273) );
  XOR2X1 U348 ( .A(n274), .B(Gx[7]), .Y(n271) );
  AOI22X1 U349 ( .A(n271), .B(n408), .C(Gx[7]), .D(n24), .Y(n272) );
  OAI21X1 U350 ( .A(n1), .B(n273), .C(n272), .Y(n581) );
  INVX2 U351 ( .A(N244), .Y(n277) );
  XOR2X1 U352 ( .A(n278), .B(Gx[8]), .Y(n275) );
  AOI22X1 U353 ( .A(n275), .B(n408), .C(Gx[8]), .D(n24), .Y(n276) );
  OAI21X1 U354 ( .A(n1), .B(n277), .C(n276), .Y(n582) );
  INVX2 U355 ( .A(N245), .Y(n281) );
  XOR2X1 U356 ( .A(n282), .B(Gx[9]), .Y(n279) );
  AOI22X1 U357 ( .A(n279), .B(n408), .C(Gx[9]), .D(n24), .Y(n280) );
  OAI21X1 U358 ( .A(n1), .B(n281), .C(n280), .Y(n583) );
  NOR2X1 U359 ( .A(Gx[9]), .B(n282), .Y(n283) );
  XNOR2X1 U360 ( .A(n283), .B(Gx[10]), .Y(n284) );
  AOI22X1 U361 ( .A(n24), .B(Gx[10]), .C(n284), .D(n408), .Y(n286) );
  NAND2X1 U362 ( .A(N246), .B(n392), .Y(n285) );
  NAND2X1 U363 ( .A(n286), .B(n285), .Y(n584) );
  NAND2X1 U364 ( .A(n8), .B(n18), .Y(n619) );
  MUX2X1 U365 ( .B(N215), .A(N177), .S(n173), .Y(n287) );
  INVX2 U366 ( .A(n287), .Y(n441) );
  INVX2 U367 ( .A(C2[9]), .Y(n289) );
  INVX2 U368 ( .A(N215), .Y(n288) );
  MUX2X1 U369 ( .B(n289), .A(n288), .S(n169), .Y(n539) );
  MUX2X1 U370 ( .B(N214), .A(N176), .S(n173), .Y(n290) );
  INVX2 U371 ( .A(C2[8]), .Y(n292) );
  INVX2 U372 ( .A(N214), .Y(n291) );
  MUX2X1 U373 ( .B(n292), .A(n291), .S(n169), .Y(n540) );
  MUX2X1 U374 ( .B(N213), .A(N175), .S(n173), .Y(n293) );
  INVX2 U375 ( .A(n293), .Y(n444) );
  INVX2 U376 ( .A(C2[7]), .Y(n295) );
  INVX2 U377 ( .A(N213), .Y(n294) );
  MUX2X1 U378 ( .B(n295), .A(n294), .S(n169), .Y(n541) );
  MUX2X1 U379 ( .B(N212), .A(N174), .S(n173), .Y(n296) );
  INVX2 U380 ( .A(n296), .Y(n451) );
  INVX2 U381 ( .A(C2[6]), .Y(n298) );
  INVX2 U382 ( .A(N212), .Y(n297) );
  MUX2X1 U383 ( .B(n298), .A(n297), .S(n169), .Y(n542) );
  MUX2X1 U384 ( .B(N211), .A(N173), .S(n173), .Y(n299) );
  INVX2 U385 ( .A(n299), .Y(n452) );
  INVX2 U386 ( .A(C2[5]), .Y(n301) );
  INVX2 U387 ( .A(N211), .Y(n300) );
  MUX2X1 U388 ( .B(n301), .A(n300), .S(n169), .Y(n543) );
  MUX2X1 U389 ( .B(N210), .A(N172), .S(n173), .Y(n302) );
  INVX2 U390 ( .A(n302), .Y(n461) );
  INVX2 U391 ( .A(C2[4]), .Y(n305) );
  INVX2 U392 ( .A(N210), .Y(n304) );
  MUX2X1 U393 ( .B(n305), .A(n304), .S(n169), .Y(n544) );
  MUX2X1 U394 ( .B(N209), .A(N171), .S(n173), .Y(n306) );
  INVX2 U395 ( .A(n306), .Y(n466) );
  INVX2 U396 ( .A(C2[3]), .Y(n308) );
  INVX2 U397 ( .A(N209), .Y(n307) );
  MUX2X1 U398 ( .B(n308), .A(n307), .S(n169), .Y(n545) );
  MUX2X1 U399 ( .B(N208), .A(N170), .S(n173), .Y(n309) );
  INVX2 U400 ( .A(n309), .Y(n469) );
  INVX2 U401 ( .A(C2[2]), .Y(n311) );
  INVX2 U402 ( .A(N208), .Y(n310) );
  MUX2X1 U403 ( .B(n311), .A(n310), .S(n169), .Y(n546) );
  MUX2X1 U404 ( .B(N207), .A(N169), .S(n173), .Y(n312) );
  INVX2 U405 ( .A(n312), .Y(n477) );
  INVX2 U406 ( .A(C2[1]), .Y(n314) );
  INVX2 U407 ( .A(N207), .Y(n313) );
  MUX2X1 U408 ( .B(n314), .A(n313), .S(n169), .Y(n547) );
  MUX2X1 U409 ( .B(A2[8]), .A(N159), .S(n173), .Y(n316) );
  INVX2 U410 ( .A(n316), .Y(n423) );
  MUX2X1 U411 ( .B(A2[7]), .A(N158), .S(n173), .Y(n317) );
  INVX2 U412 ( .A(n317), .Y(n424) );
  MUX2X1 U413 ( .B(A2[6]), .A(N157), .S(n173), .Y(n318) );
  INVX2 U414 ( .A(n318), .Y(n425) );
  MUX2X1 U415 ( .B(A2[5]), .A(N156), .S(n174), .Y(n319) );
  INVX2 U416 ( .A(n319), .Y(n426) );
  MUX2X1 U417 ( .B(A2[4]), .A(N155), .S(n174), .Y(n320) );
  INVX2 U418 ( .A(n320), .Y(n427) );
  MUX2X1 U419 ( .B(A2[3]), .A(N154), .S(n174), .Y(n321) );
  INVX2 U420 ( .A(n321), .Y(n428) );
  MUX2X1 U421 ( .B(A2[2]), .A(N153), .S(n174), .Y(n322) );
  INVX2 U422 ( .A(n322), .Y(n429) );
  MUX2X1 U423 ( .B(A2[1]), .A(N152), .S(n174), .Y(n323) );
  INVX2 U424 ( .A(n323), .Y(n430) );
  MUX2X1 U425 ( .B(A2[0]), .A(N151), .S(n174), .Y(n324) );
  INVX2 U426 ( .A(n324), .Y(n431) );
  MUX2X1 U427 ( .B(D2[8]), .A(N195), .S(n174), .Y(n325) );
  INVX2 U428 ( .A(n325), .Y(n518) );
  MUX2X1 U429 ( .B(D2[7]), .A(N194), .S(n174), .Y(n326) );
  INVX2 U430 ( .A(n326), .Y(n520) );
  MUX2X1 U431 ( .B(D2[6]), .A(N193), .S(n174), .Y(n327) );
  INVX2 U432 ( .A(n327), .Y(n523) );
  MUX2X1 U433 ( .B(D2[5]), .A(N192), .S(n174), .Y(n328) );
  INVX2 U434 ( .A(n328), .Y(n524) );
  MUX2X1 U435 ( .B(D2[4]), .A(N191), .S(n174), .Y(n329) );
  INVX2 U436 ( .A(n329), .Y(n525) );
  MUX2X1 U437 ( .B(D2[3]), .A(N190), .S(n174), .Y(n330) );
  INVX2 U438 ( .A(n330), .Y(n526) );
  MUX2X1 U439 ( .B(D2[2]), .A(N189), .S(n174), .Y(n331) );
  INVX2 U440 ( .A(n331), .Y(n527) );
  MUX2X1 U441 ( .B(D2[1]), .A(N188), .S(n175), .Y(n332) );
  INVX2 U442 ( .A(n332), .Y(n528) );
  MUX2X1 U443 ( .B(D2[0]), .A(N187), .S(n175), .Y(n334) );
  INVX2 U444 ( .A(n334), .Y(n529) );
  MUX2X1 U445 ( .B(E2[9]), .A(N235), .S(n170), .Y(n335) );
  INVX2 U446 ( .A(n335), .Y(n558) );
  MUX2X1 U447 ( .B(E2[8]), .A(N234), .S(n170), .Y(n336) );
  INVX2 U448 ( .A(n336), .Y(n559) );
  MUX2X1 U449 ( .B(E2[7]), .A(N233), .S(n170), .Y(n337) );
  INVX2 U450 ( .A(n337), .Y(n560) );
  MUX2X1 U451 ( .B(E2[6]), .A(N232), .S(n170), .Y(n338) );
  INVX2 U452 ( .A(n338), .Y(n561) );
  MUX2X1 U453 ( .B(E2[5]), .A(N231), .S(n170), .Y(n339) );
  INVX2 U454 ( .A(n339), .Y(n562) );
  MUX2X1 U455 ( .B(E2[4]), .A(N230), .S(n170), .Y(n340) );
  INVX2 U456 ( .A(n340), .Y(n563) );
  MUX2X1 U457 ( .B(E2[3]), .A(N229), .S(n170), .Y(n342) );
  INVX2 U460 ( .A(n342), .Y(n564) );
  MUX2X1 U461 ( .B(E2[2]), .A(N228), .S(n170), .Y(n343) );
  INVX2 U463 ( .A(n343), .Y(n565) );
  MUX2X1 U466 ( .B(E2[1]), .A(N227), .S(n170), .Y(n344) );
  INVX2 U468 ( .A(n344), .Y(n566) );
  MUX2X1 U470 ( .B(E2[0]), .A(N226), .S(n170), .Y(n345) );
  INVX2 U471 ( .A(n345), .Y(n567) );
  INVX2 U473 ( .A(N247), .Y(n347) );
  NAND2X1 U474 ( .A(n1), .B(n619), .Y(n396) );
  INVX2 U480 ( .A(n396), .Y(n412) );
  OAI21X1 U481 ( .A(n393), .B(n412), .C(n26), .Y(n346) );
  OAI21X1 U483 ( .A(n1), .B(n347), .C(n346), .Y(n571) );
  INVX2 U485 ( .A(n27), .Y(n350) );
  XOR2X1 U486 ( .A(n27), .B(n26), .Y(n348) );
  AOI22X1 U489 ( .A(n348), .B(n393), .C(N248), .D(n392), .Y(n349) );
  OAI21X1 U494 ( .A(n396), .B(n350), .C(n349), .Y(n593) );
  INVX2 U495 ( .A(Gy[2]), .Y(n354) );
  NAND2X1 U496 ( .A(n25), .B(n350), .Y(n353) );
  XOR2X1 U497 ( .A(n353), .B(Gy[2]), .Y(n351) );
  AOI22X1 U498 ( .A(n351), .B(n393), .C(N249), .D(n392), .Y(n352) );
  OAI21X1 U499 ( .A(n396), .B(n354), .C(n352), .Y(n592) );
  INVX2 U500 ( .A(Gy[3]), .Y(n359) );
  INVX2 U501 ( .A(n353), .Y(n355) );
  NAND2X1 U502 ( .A(n355), .B(n354), .Y(n358) );
  XOR2X1 U503 ( .A(n358), .B(Gy[3]), .Y(n356) );
  AOI22X1 U504 ( .A(n356), .B(n393), .C(N250), .D(n392), .Y(n357) );
  OAI21X1 U505 ( .A(n396), .B(n359), .C(n357), .Y(n591) );
  INVX2 U506 ( .A(Gy[4]), .Y(n365) );
  INVX2 U507 ( .A(n358), .Y(n360) );
  NAND2X1 U508 ( .A(n360), .B(n359), .Y(n363) );
  XOR2X1 U509 ( .A(n363), .B(Gy[4]), .Y(n361) );
  AOI22X1 U510 ( .A(n361), .B(n393), .C(N251), .D(n392), .Y(n362) );
  OAI21X1 U511 ( .A(n396), .B(n365), .C(n362), .Y(n590) );
  INVX2 U512 ( .A(Gy[5]), .Y(n370) );
  INVX2 U513 ( .A(n363), .Y(n366) );
  NAND2X1 U514 ( .A(n366), .B(n365), .Y(n369) );
  XOR2X1 U515 ( .A(n369), .B(Gy[5]), .Y(n367) );
  AOI22X1 U516 ( .A(n367), .B(n393), .C(N252), .D(n392), .Y(n368) );
  OAI21X1 U517 ( .A(n396), .B(n370), .C(n368), .Y(n589) );
  INVX2 U518 ( .A(Gy[6]), .Y(n375) );
  INVX2 U519 ( .A(n369), .Y(n371) );
  NAND2X1 U520 ( .A(n371), .B(n370), .Y(n374) );
  XOR2X1 U521 ( .A(n374), .B(Gy[6]), .Y(n372) );
  AOI22X1 U522 ( .A(n372), .B(n393), .C(N253), .D(n392), .Y(n373) );
  OAI21X1 U523 ( .A(n396), .B(n375), .C(n373), .Y(n588) );
  INVX2 U524 ( .A(Gy[7]), .Y(n380) );
  INVX2 U525 ( .A(n374), .Y(n376) );
  NAND2X1 U526 ( .A(n376), .B(n375), .Y(n379) );
  XOR2X1 U527 ( .A(n379), .B(Gy[7]), .Y(n377) );
  AOI22X1 U528 ( .A(n377), .B(n393), .C(N254), .D(n392), .Y(n378) );
  OAI21X1 U529 ( .A(n396), .B(n380), .C(n378), .Y(n587) );
  INVX2 U530 ( .A(Gy[8]), .Y(n384) );
  XOR2X1 U531 ( .A(n383), .B(Gy[8]), .Y(n381) );
  AOI22X1 U532 ( .A(n381), .B(n393), .C(N255), .D(n392), .Y(n382) );
  OAI21X1 U533 ( .A(n396), .B(n384), .C(n382), .Y(n586) );
  INVX2 U534 ( .A(Gy[9]), .Y(n389) );
  NAND2X1 U535 ( .A(n23), .B(n384), .Y(n388) );
  XOR2X1 U536 ( .A(n388), .B(Gy[9]), .Y(n385) );
  AOI22X1 U537 ( .A(n385), .B(n393), .C(N256), .D(n392), .Y(n387) );
  OAI21X1 U538 ( .A(n396), .B(n389), .C(n387), .Y(n585) );
  INVX2 U539 ( .A(Gy[10]), .Y(n410) );
  INVX2 U540 ( .A(n388), .Y(n390) );
  NAND2X1 U541 ( .A(n390), .B(n389), .Y(n391) );
  XOR2X1 U542 ( .A(n391), .B(Gy[10]), .Y(n394) );
  AOI22X1 U543 ( .A(n394), .B(n393), .C(N257), .D(n392), .Y(n395) );
  OAI21X1 U544 ( .A(n410), .B(n396), .C(n395), .Y(n572) );
  MUX2X1 U545 ( .B(temp_sum[0]), .A(N280), .S(n404), .Y(n397) );
  NAND2X1 U546 ( .A(n406), .B(n397), .Y(n594) );
  MUX2X1 U547 ( .B(temp_sum[1]), .A(N281), .S(n404), .Y(n398) );
  NAND2X1 U548 ( .A(n406), .B(n398), .Y(n595) );
  MUX2X1 U549 ( .B(temp_sum[2]), .A(N282), .S(n404), .Y(n399) );
  NAND2X1 U550 ( .A(n406), .B(n399), .Y(n596) );
  MUX2X1 U551 ( .B(temp_sum[3]), .A(N283), .S(n404), .Y(n400) );
  NAND2X1 U552 ( .A(n406), .B(n400), .Y(n597) );
  MUX2X1 U553 ( .B(temp_sum[4]), .A(N284), .S(n404), .Y(n401) );
  NAND2X1 U554 ( .A(n406), .B(n401), .Y(n598) );
  MUX2X1 U555 ( .B(temp_sum[5]), .A(N285), .S(n404), .Y(n402) );
  NAND2X1 U556 ( .A(n406), .B(n402), .Y(n599) );
  MUX2X1 U557 ( .B(temp_sum[6]), .A(N286), .S(n404), .Y(n403) );
  NAND2X1 U558 ( .A(n406), .B(n403), .Y(n600) );
  MUX2X1 U559 ( .B(temp_sum[7]), .A(N287), .S(n404), .Y(n405) );
  NAND2X1 U560 ( .A(n406), .B(n405), .Y(n601) );
  NAND2X1 U561 ( .A(n22), .B(n8), .Y(n621) );
  NAND2X1 U562 ( .A(n9), .B(n18), .Y(n620) );
  NAND2X1 U563 ( .A(n2), .B(n8), .Y(n614) );
  OAI21X1 U564 ( .A(Gx[10]), .B(n614), .C(n636), .Y(n623) );
  INVX2 U565 ( .A(n611), .Y(n407) );
  NOR2X1 U566 ( .A(n408), .B(n407), .Y(n409) );
  OAI21X1 U567 ( .A(n621), .B(n410), .C(n409), .Y(n629) );
  INVX2 U568 ( .A(Gx[10]), .Y(n411) );
  OAI21X1 U569 ( .A(n614), .B(n411), .C(n620), .Y(n628) );
  INVX2 U570 ( .A(n628), .Y(n568) );
  OAI21X1 U571 ( .A(Gy[10]), .B(n621), .C(n620), .Y(n622) );
  INVX2 U572 ( .A(n637), .Y(n569) );
  INVX2 U573 ( .A(n609), .Y(n570) );
  NOR2X1 U574 ( .A(n616), .B(n615), .Y(n617) );
endmodule


module edge_detection_3_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n48, n49, n51, n54, n56, n58, n60, n102,
         n103, n104, n105, n106, n108, n109, n110, n111, n112;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  XNOR2X1 U4 ( .A(n17), .B(n2), .Y(SUM[9]) );
  AOI21X1 U5 ( .A(n106), .B(n110), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n106), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n102), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n25), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n105), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n105), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n28), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n104), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n104), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n36), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n109), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n103), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n103), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n44), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n112), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n112), .Y(n10) );
  NAND2X1 U67 ( .A(A[1]), .B(B[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  BUFX2 U77 ( .A(n20), .Y(n102) );
  OR2X2 U78 ( .A(B[3]), .B(A[3]), .Y(n103) );
  OR2X2 U79 ( .A(B[5]), .B(A[5]), .Y(n104) );
  OR2X2 U80 ( .A(B[7]), .B(A[7]), .Y(n105) );
  OR2X2 U81 ( .A(B[9]), .B(A[9]), .Y(n106) );
  AND2X2 U82 ( .A(n51), .B(n111), .Y(SUM[0]) );
  INVX1 U83 ( .A(n41), .Y(n108) );
  INVX2 U84 ( .A(n108), .Y(n109) );
  OAI21X1 U85 ( .A(n20), .B(n18), .C(n19), .Y(n110) );
  OR2X2 U86 ( .A(B[0]), .B(A[0]), .Y(n111) );
  OR2X2 U87 ( .A(A[1]), .B(B[1]), .Y(n112) );
  XNOR2X1 U88 ( .A(n12), .B(n1), .Y(SUM[10]) );
  INVX2 U89 ( .A(n42), .Y(n60) );
  INVX2 U90 ( .A(n34), .Y(n58) );
  INVX2 U91 ( .A(n26), .Y(n56) );
  INVX2 U92 ( .A(n18), .Y(n54) );
  INVX2 U93 ( .A(n51), .Y(n49) );
  INVX2 U94 ( .A(n48), .Y(n46) );
  INVX2 U95 ( .A(n40), .Y(n38) );
  INVX2 U96 ( .A(n32), .Y(n30) );
  INVX2 U97 ( .A(n24), .Y(n22) );
  INVX2 U98 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_3_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_3_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_3_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_3_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_3_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n64), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n66), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n66), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U39 ( .A(A[0]), .Y(n65) );
  BUFX2 U40 ( .A(n16), .Y(n64) );
  AND2X2 U41 ( .A(n65), .B(B[0]), .Y(n19) );
  INVX1 U42 ( .A(B[0]), .Y(n30) );
  OR2X2 U43 ( .A(A[2]), .B(n28), .Y(n66) );
  INVX2 U44 ( .A(B[1]), .Y(n29) );
  INVX2 U45 ( .A(B[2]), .Y(n28) );
  INVX2 U46 ( .A(B[3]), .Y(n27) );
  INVX2 U47 ( .A(B[4]), .Y(n26) );
  INVX2 U48 ( .A(B[5]), .Y(n25) );
  INVX2 U49 ( .A(B[6]), .Y(n24) );
  INVX2 U50 ( .A(B[7]), .Y(n23) );
  INVX2 U51 ( .A(n17), .Y(n22) );
  INVX2 U52 ( .A(n9), .Y(n20) );
  INVX2 U53 ( .A(n15), .Y(n13) );
  INVX2 U54 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_3_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n74), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X1 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U40 ( .A(B[0]), .Y(n30) );
  XOR2X1 U41 ( .A(A[6]), .B(n24), .Y(n65) );
  XOR2X1 U42 ( .A(n65), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U43 ( .A(A[6]), .B(n24), .Y(n66) );
  NAND2X1 U44 ( .A(A[6]), .B(n6), .Y(n67) );
  NAND2X1 U45 ( .A(n24), .B(n6), .Y(n68) );
  NAND3X1 U46 ( .A(n66), .B(n67), .C(n68), .Y(n5) );
  XOR2X1 U47 ( .A(A[7]), .B(n23), .Y(n69) );
  XOR2X1 U48 ( .A(n69), .B(n5), .Y(DIFF[7]) );
  NAND2X1 U49 ( .A(A[7]), .B(n23), .Y(n70) );
  NAND2X1 U50 ( .A(A[7]), .B(n5), .Y(n71) );
  NAND2X1 U51 ( .A(n23), .B(n5), .Y(n72) );
  NAND3X1 U52 ( .A(n70), .B(n71), .C(n72), .Y(n4) );
  INVX1 U53 ( .A(n16), .Y(n73) );
  INVX2 U54 ( .A(n73), .Y(n74) );
  INVX2 U55 ( .A(B[1]), .Y(n29) );
  INVX2 U56 ( .A(B[2]), .Y(n28) );
  INVX2 U57 ( .A(B[3]), .Y(n27) );
  INVX2 U58 ( .A(B[4]), .Y(n26) );
  INVX2 U59 ( .A(B[5]), .Y(n25) );
  INVX2 U60 ( .A(B[6]), .Y(n24) );
  INVX2 U61 ( .A(B[7]), .Y(n23) );
  INVX2 U62 ( .A(n17), .Y(n22) );
  INVX2 U63 ( .A(n9), .Y(n20) );
  INVX2 U64 ( .A(n15), .Y(n13) );
  INVX2 U65 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_3_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n16), .B(n64), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  INVX1 U39 ( .A(B[2]), .Y(n28) );
  OR2X2 U40 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U41 ( .A(n17), .Y(n22) );
  INVX1 U42 ( .A(n4), .Y(DIFF[8]) );
  INVX1 U43 ( .A(B[1]), .Y(n29) );
  INVX2 U44 ( .A(B[0]), .Y(n30) );
  INVX2 U45 ( .A(B[3]), .Y(n27) );
  INVX2 U46 ( .A(B[4]), .Y(n26) );
  INVX2 U47 ( .A(B[5]), .Y(n25) );
  INVX2 U48 ( .A(B[6]), .Y(n24) );
  INVX2 U49 ( .A(B[7]), .Y(n23) );
  INVX2 U50 ( .A(n9), .Y(n20) );
  INVX2 U51 ( .A(n15), .Y(n13) );
endmodule


module edge_detection_3_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n74), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U40 ( .A(B[7]), .Y(n23) );
  INVX1 U41 ( .A(B[6]), .Y(n24) );
  INVX1 U42 ( .A(B[5]), .Y(n25) );
  INVX1 U43 ( .A(B[2]), .Y(n28) );
  INVX1 U44 ( .A(B[1]), .Y(n29) );
  NAND3X1 U45 ( .A(n67), .B(n68), .C(n69), .Y(n65) );
  INVX1 U46 ( .A(B[0]), .Y(n30) );
  XOR2X1 U47 ( .A(A[6]), .B(n24), .Y(n66) );
  XOR2X1 U48 ( .A(n6), .B(n66), .Y(DIFF[6]) );
  NAND2X1 U49 ( .A(A[6]), .B(n24), .Y(n67) );
  NAND2X1 U50 ( .A(A[6]), .B(n6), .Y(n68) );
  NAND2X1 U51 ( .A(n24), .B(n6), .Y(n69) );
  NAND3X1 U52 ( .A(n67), .B(n68), .C(n69), .Y(n5) );
  XOR2X1 U53 ( .A(A[7]), .B(n23), .Y(n70) );
  XOR2X1 U54 ( .A(n70), .B(n65), .Y(DIFF[7]) );
  NAND2X1 U55 ( .A(A[7]), .B(n23), .Y(n71) );
  NAND2X1 U56 ( .A(A[7]), .B(n5), .Y(n72) );
  NAND2X1 U57 ( .A(n23), .B(n5), .Y(n73) );
  NAND3X1 U58 ( .A(n71), .B(n73), .C(n72), .Y(n4) );
  BUFX2 U59 ( .A(n16), .Y(n74) );
  INVX2 U60 ( .A(B[3]), .Y(n27) );
  INVX2 U61 ( .A(B[4]), .Y(n26) );
  INVX2 U62 ( .A(n17), .Y(n22) );
  INVX2 U63 ( .A(n9), .Y(n20) );
  INVX2 U64 ( .A(n15), .Y(n13) );
  INVX2 U65 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_3_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n66), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X1 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U40 ( .A(n16), .Y(n65) );
  INVX2 U41 ( .A(n65), .Y(n66) );
  INVX2 U42 ( .A(B[0]), .Y(n30) );
  INVX2 U43 ( .A(B[1]), .Y(n29) );
  INVX2 U44 ( .A(B[2]), .Y(n28) );
  INVX2 U45 ( .A(B[3]), .Y(n27) );
  INVX2 U46 ( .A(B[4]), .Y(n26) );
  INVX2 U47 ( .A(B[5]), .Y(n25) );
  INVX2 U48 ( .A(B[6]), .Y(n24) );
  INVX2 U49 ( .A(B[7]), .Y(n23) );
  INVX2 U50 ( .A(n17), .Y(n22) );
  INVX2 U51 ( .A(n9), .Y(n20) );
  INVX2 U52 ( .A(n15), .Y(n13) );
  INVX2 U53 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_3_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n66), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n68), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX1 U40 ( .A(n11), .Y(n65) );
  INVX2 U41 ( .A(n65), .Y(n66) );
  INVX1 U42 ( .A(n16), .Y(n67) );
  INVX2 U43 ( .A(n67), .Y(n68) );
  INVX2 U44 ( .A(B[0]), .Y(n30) );
  INVX2 U45 ( .A(B[1]), .Y(n29) );
  INVX2 U46 ( .A(B[2]), .Y(n28) );
  INVX2 U47 ( .A(B[3]), .Y(n27) );
  INVX2 U48 ( .A(B[4]), .Y(n26) );
  INVX2 U49 ( .A(B[5]), .Y(n25) );
  INVX2 U50 ( .A(B[6]), .Y(n24) );
  INVX2 U51 ( .A(B[7]), .Y(n23) );
  INVX2 U52 ( .A(n17), .Y(n22) );
  INVX2 U53 ( .A(n9), .Y(n20) );
  INVX2 U54 ( .A(n15), .Y(n13) );
  INVX2 U55 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_3 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n571), .CLK(clk), .R(n187), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n572), .CLK(clk), .R(n187), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n187), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n573), .CLK(clk), .R(n187), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n530), .CLK(clk), .R(n187), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n584), .CLK(clk), .R(n186), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n186), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n186), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n422), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n421), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n420), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n419), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n418), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n417), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n416), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n415), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n414), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n440), .CLK(clk), .R(n185), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n439), .CLK(clk), .R(n185), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n438), .CLK(clk), .R(n185), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n437), .CLK(clk), .R(n185), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n436), .CLK(clk), .R(n185), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n435), .CLK(clk), .R(n185), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n434), .CLK(clk), .R(n185), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n433), .CLK(clk), .R(n185), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n432), .CLK(clk), .R(n185), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n538), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n537), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n536), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n535), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n534), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n533), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n532), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n531), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n517), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n488), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n487), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n486), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n483), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n482), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n480), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n479), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n478), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n557), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n556), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n555), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n554), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n553), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n552), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n551), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n550), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n549), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n548), .CLK(clk), .R(n182), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n431), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n430), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n429), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n428), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n427), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n426), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n425), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n424), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n423), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n477), .CLK(clk), .R(n182), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n469), .CLK(clk), .R(n182), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n466), .CLK(clk), .R(n181), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n461), .CLK(clk), .R(n181), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n452), .CLK(clk), .R(n181), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n451), .CLK(clk), .R(n181), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n444), .CLK(clk), .R(n181), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n443), .CLK(clk), .R(n181), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n441), .CLK(clk), .R(n181), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n529), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n528), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n527), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n526), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n525), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n524), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n523), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n520), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n518), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n567), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n566), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n565), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n564), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n563), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n562), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n561), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n560), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n559), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n558), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n569), .CLK(clk), .R(n179), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n574), .CLK(clk), .R(n179), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n575), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n576), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n577), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n578), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n579), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n580), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n581), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n582), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n583), .CLK(clk), .R(n178), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n547), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n546), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n545), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n544), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n543), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n542), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n541), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n540), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n539), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n593), .CLK(clk), .R(n178), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n592), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n591), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n590), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n589), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n588), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n587), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n586), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n585), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n594), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n595), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n596), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n597), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n598), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n599), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n600), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n601), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n634), .B(n627), .Y(n618) );
  AND2X2 U160 ( .A(n637), .B(n636), .Y(n604) );
  OR2X1 U458 ( .A(n629), .B(n628), .Y(n630) );
  NAND3X1 U459 ( .A(n627), .B(n626), .C(n412), .Y(n631) );
  OR2X1 U462 ( .A(n623), .B(n622), .Y(n624) );
  NAND3X1 U464 ( .A(n619), .B(n626), .C(n618), .Y(n625) );
  OAI21X1 U465 ( .A(n626), .B(n413), .C(n617), .Y(n573) );
  NAND2X1 U467 ( .A(n568), .B(n621), .Y(n615) );
  NAND3X1 U469 ( .A(n632), .B(n636), .C(n633), .Y(n616) );
  OR2X1 U472 ( .A(n623), .B(n629), .Y(n612) );
  NAND3X1 U475 ( .A(n633), .B(n626), .C(n610), .Y(n613) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n570), .Y(n610) );
  NAND2X1 U477 ( .A(n608), .B(n607), .Y(n626) );
  NOR2X1 U478 ( .A(n606), .B(n605), .Y(n607) );
  NAND3X1 U479 ( .A(n634), .B(n633), .C(n614), .Y(n605) );
  NAND3X1 U482 ( .A(n635), .B(n632), .C(n604), .Y(n606) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n637) );
  NOR2X1 U487 ( .A(n603), .B(n602), .Y(n608) );
  NAND3X1 U488 ( .A(n609), .B(n620), .C(n412), .Y(n602) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n609) );
  NAND3X1 U491 ( .A(n621), .B(n611), .C(n627), .Y(n603) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n627) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n611) );
  edge_detection_3_DW01_add_7 add_231 ( .A({Gx[10:1], n28}), .B({Gy[10:2], n27, 
        n26}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, N283, 
        N282, N281, N280}) );
  edge_detection_3_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_3_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_3_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_3_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_3_DW01_sub_8 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_3_DW01_sub_9 sub_203 ( .A({1'b0, P8[7:1], n30}), .B({1'b0, P6}), .CI(1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178}) );
  edge_detection_3_DW01_sub_10 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_3_DW01_sub_11 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  edge_detection_3_DW01_sub_12 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_3_DW01_sub_13 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  INVX2 U5 ( .A(n65), .Y(n406) );
  BUFX2 U6 ( .A(N258), .Y(n28) );
  NAND2X1 U12 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U13 ( .A(n413), .B(n188), .Y(n2) );
  AND2X2 U52 ( .A(state[3]), .B(n189), .Y(n8) );
  AND2X2 U128 ( .A(state[2]), .B(n245), .Y(n9) );
  AND2X2 U155 ( .A(n245), .B(n189), .Y(n16) );
  AND2X2 U156 ( .A(state[1]), .B(n188), .Y(n17) );
  AND2X2 U158 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U159 ( .A(n613), .B(n612), .Y(n19) );
  OR2X2 U161 ( .A(n625), .B(n624), .Y(n20) );
  OR2X2 U162 ( .A(n631), .B(n630), .Y(n21) );
  AND2X2 U163 ( .A(state[0]), .B(n413), .Y(n22) );
  NOR2X1 U164 ( .A(n358), .B(Gy[3]), .Y(n23) );
  INVX1 U165 ( .A(n23), .Y(n362) );
  OR2X2 U166 ( .A(n28), .B(Gx[1]), .Y(n254) );
  OR2X2 U167 ( .A(n262), .B(Gx[4]), .Y(n266) );
  OR2X2 U168 ( .A(n270), .B(Gx[6]), .Y(n274) );
  OR2X2 U169 ( .A(n278), .B(Gx[8]), .Y(n282) );
  BUFX2 U170 ( .A(n333), .Y(n174) );
  BUFX2 U171 ( .A(n333), .Y(n173) );
  BUFX2 U172 ( .A(n333), .Y(n171) );
  BUFX2 U173 ( .A(n333), .Y(n172) );
  INVX2 U174 ( .A(n634), .Y(n170) );
  INVX2 U175 ( .A(n1), .Y(n392) );
  INVX2 U176 ( .A(n633), .Y(n169) );
  BUFX2 U177 ( .A(n333), .Y(n175) );
  INVX2 U178 ( .A(n635), .Y(n408) );
  AND2X2 U179 ( .A(n635), .B(n1), .Y(n24) );
  INVX2 U180 ( .A(n619), .Y(n393) );
  INVX2 U181 ( .A(N288), .Y(n141) );
  BUFX2 U182 ( .A(n_rst), .Y(n176) );
  BUFX2 U183 ( .A(n_rst), .Y(n177) );
  BUFX2 U184 ( .A(n_rst), .Y(n179) );
  BUFX2 U185 ( .A(n_rst), .Y(n180) );
  BUFX2 U186 ( .A(n_rst), .Y(n181) );
  BUFX2 U187 ( .A(n_rst), .Y(n182) );
  BUFX2 U188 ( .A(n_rst), .Y(n183) );
  BUFX2 U189 ( .A(n_rst), .Y(n184) );
  BUFX2 U190 ( .A(n_rst), .Y(n186) );
  BUFX2 U191 ( .A(n_rst), .Y(n178) );
  BUFX2 U192 ( .A(n_rst), .Y(n185) );
  BUFX2 U193 ( .A(n_rst), .Y(n187) );
  OR2X1 U194 ( .A(n254), .B(Gx[2]), .Y(n258) );
  OR2X1 U195 ( .A(n274), .B(Gx[7]), .Y(n278) );
  BUFX2 U196 ( .A(Gy[1]), .Y(n27) );
  INVX2 U197 ( .A(n25), .Y(n26) );
  OR2X1 U198 ( .A(n258), .B(Gx[3]), .Y(n262) );
  OR2X1 U199 ( .A(n266), .B(Gx[5]), .Y(n270) );
  INVX2 U202 ( .A(N269), .Y(n25) );
  INVX1 U203 ( .A(P8[0]), .Y(n29) );
  INVX2 U204 ( .A(n29), .Y(n30) );
  INVX1 U205 ( .A(n326), .Y(n520) );
  AOI21X1 U206 ( .A(n141), .B(n168), .C(n636), .Y(n65) );
  NOR2X1 U207 ( .A(N289), .B(N290), .Y(n168) );
  INVX2 U208 ( .A(n636), .Y(n404) );
  INVX1 U209 ( .A(n317), .Y(n424) );
  INVX2 U210 ( .A(state[1]), .Y(n413) );
  INVX2 U211 ( .A(state[0]), .Y(n188) );
  NAND3X1 U212 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n636) );
  INVX2 U213 ( .A(state[2]), .Y(n189) );
  NAND2X1 U214 ( .A(n17), .B(n8), .Y(n635) );
  INVX2 U215 ( .A(state[3]), .Y(n245) );
  NAND2X1 U216 ( .A(n16), .B(n22), .Y(n632) );
  INVX2 U217 ( .A(n632), .Y(n333) );
  MUX2X1 U218 ( .B(N205), .A(N168), .S(n171), .Y(n190) );
  INVX2 U219 ( .A(n190), .Y(n432) );
  NAND2X1 U220 ( .A(n16), .B(n17), .Y(n633) );
  INVX2 U221 ( .A(C1[9]), .Y(n192) );
  INVX2 U222 ( .A(N205), .Y(n191) );
  MUX2X1 U223 ( .B(n192), .A(n191), .S(n169), .Y(n530) );
  MUX2X1 U224 ( .B(N204), .A(N167), .S(n171), .Y(n193) );
  INVX2 U225 ( .A(n193), .Y(n433) );
  INVX2 U226 ( .A(C1[8]), .Y(n195) );
  INVX2 U227 ( .A(N204), .Y(n194) );
  MUX2X1 U228 ( .B(n195), .A(n194), .S(n169), .Y(n531) );
  MUX2X1 U229 ( .B(N203), .A(N166), .S(n171), .Y(n196) );
  INVX2 U230 ( .A(n196), .Y(n434) );
  INVX2 U231 ( .A(C1[7]), .Y(n198) );
  INVX2 U232 ( .A(N203), .Y(n197) );
  MUX2X1 U233 ( .B(n198), .A(n197), .S(n169), .Y(n532) );
  MUX2X1 U234 ( .B(N202), .A(N165), .S(n171), .Y(n199) );
  INVX2 U235 ( .A(n199), .Y(n435) );
  INVX2 U236 ( .A(C1[6]), .Y(n201) );
  INVX2 U237 ( .A(N202), .Y(n200) );
  MUX2X1 U238 ( .B(n201), .A(n200), .S(n169), .Y(n533) );
  MUX2X1 U239 ( .B(N201), .A(N164), .S(n171), .Y(n202) );
  INVX2 U240 ( .A(n202), .Y(n436) );
  INVX2 U241 ( .A(C1[5]), .Y(n204) );
  INVX2 U242 ( .A(N201), .Y(n203) );
  MUX2X1 U243 ( .B(n204), .A(n203), .S(n169), .Y(n534) );
  MUX2X1 U244 ( .B(N200), .A(N163), .S(n171), .Y(n205) );
  INVX2 U245 ( .A(n205), .Y(n437) );
  INVX2 U246 ( .A(C1[4]), .Y(n207) );
  INVX2 U247 ( .A(N200), .Y(n206) );
  MUX2X1 U248 ( .B(n207), .A(n206), .S(n169), .Y(n535) );
  MUX2X1 U249 ( .B(N199), .A(N162), .S(n171), .Y(n208) );
  INVX2 U250 ( .A(n208), .Y(n438) );
  INVX2 U251 ( .A(C1[3]), .Y(n210) );
  INVX2 U252 ( .A(N199), .Y(n209) );
  MUX2X1 U253 ( .B(n210), .A(n209), .S(n169), .Y(n536) );
  MUX2X1 U254 ( .B(N198), .A(N161), .S(n171), .Y(n211) );
  INVX2 U255 ( .A(n211), .Y(n439) );
  INVX2 U256 ( .A(C1[2]), .Y(n213) );
  INVX2 U257 ( .A(N198), .Y(n212) );
  MUX2X1 U258 ( .B(n213), .A(n212), .S(n169), .Y(n537) );
  MUX2X1 U259 ( .B(N197), .A(N160), .S(n171), .Y(n214) );
  INVX2 U260 ( .A(n214), .Y(n440) );
  INVX2 U261 ( .A(C1[1]), .Y(n216) );
  INVX2 U262 ( .A(N197), .Y(n215) );
  MUX2X1 U263 ( .B(n216), .A(n215), .S(n169), .Y(n538) );
  MUX2X1 U264 ( .B(A1[8]), .A(N150), .S(n171), .Y(n217) );
  INVX2 U265 ( .A(n217), .Y(n414) );
  MUX2X1 U266 ( .B(A1[7]), .A(N149), .S(n171), .Y(n218) );
  INVX2 U267 ( .A(n218), .Y(n415) );
  MUX2X1 U268 ( .B(A1[6]), .A(N148), .S(n171), .Y(n219) );
  INVX2 U269 ( .A(n219), .Y(n416) );
  MUX2X1 U270 ( .B(A1[5]), .A(N147), .S(n171), .Y(n220) );
  INVX2 U271 ( .A(n220), .Y(n417) );
  MUX2X1 U272 ( .B(A1[4]), .A(N146), .S(n172), .Y(n221) );
  INVX2 U273 ( .A(n221), .Y(n418) );
  MUX2X1 U274 ( .B(A1[3]), .A(N145), .S(n172), .Y(n222) );
  INVX2 U275 ( .A(n222), .Y(n419) );
  MUX2X1 U276 ( .B(A1[2]), .A(N144), .S(n172), .Y(n223) );
  INVX2 U277 ( .A(n223), .Y(n420) );
  MUX2X1 U278 ( .B(A1[1]), .A(N143), .S(n172), .Y(n224) );
  INVX2 U279 ( .A(n224), .Y(n421) );
  MUX2X1 U280 ( .B(A1[0]), .A(N142), .S(n172), .Y(n225) );
  INVX2 U281 ( .A(n225), .Y(n422) );
  MUX2X1 U282 ( .B(D1[8]), .A(N186), .S(n172), .Y(n226) );
  INVX2 U283 ( .A(n226), .Y(n478) );
  MUX2X1 U284 ( .B(D1[7]), .A(N185), .S(n172), .Y(n227) );
  INVX2 U285 ( .A(n227), .Y(n479) );
  MUX2X1 U286 ( .B(D1[6]), .A(N184), .S(n172), .Y(n228) );
  INVX2 U287 ( .A(n228), .Y(n480) );
  MUX2X1 U288 ( .B(D1[5]), .A(N183), .S(n172), .Y(n229) );
  INVX2 U289 ( .A(n229), .Y(n482) );
  MUX2X1 U290 ( .B(D1[4]), .A(N182), .S(n172), .Y(n230) );
  INVX2 U291 ( .A(n230), .Y(n483) );
  MUX2X1 U292 ( .B(D1[3]), .A(N181), .S(n172), .Y(n231) );
  INVX2 U293 ( .A(n231), .Y(n486) );
  MUX2X1 U294 ( .B(D1[2]), .A(N180), .S(n172), .Y(n232) );
  INVX2 U295 ( .A(n232), .Y(n487) );
  MUX2X1 U296 ( .B(D1[1]), .A(N179), .S(n172), .Y(n233) );
  INVX2 U297 ( .A(n233), .Y(n488) );
  MUX2X1 U298 ( .B(D1[0]), .A(N178), .S(n173), .Y(n234) );
  INVX2 U299 ( .A(n234), .Y(n517) );
  NAND2X1 U300 ( .A(n16), .B(n18), .Y(n634) );
  MUX2X1 U301 ( .B(E1[9]), .A(N225), .S(n170), .Y(n235) );
  INVX2 U302 ( .A(n235), .Y(n548) );
  MUX2X1 U303 ( .B(E1[8]), .A(N224), .S(n170), .Y(n236) );
  INVX2 U304 ( .A(n236), .Y(n549) );
  MUX2X1 U305 ( .B(E1[7]), .A(N223), .S(n170), .Y(n237) );
  INVX2 U306 ( .A(n237), .Y(n550) );
  MUX2X1 U307 ( .B(E1[6]), .A(N222), .S(n170), .Y(n238) );
  INVX2 U308 ( .A(n238), .Y(n551) );
  MUX2X1 U309 ( .B(E1[5]), .A(N221), .S(n170), .Y(n239) );
  INVX2 U310 ( .A(n239), .Y(n552) );
  MUX2X1 U311 ( .B(E1[4]), .A(N220), .S(n170), .Y(n240) );
  INVX2 U312 ( .A(n240), .Y(n553) );
  MUX2X1 U313 ( .B(E1[3]), .A(N219), .S(n170), .Y(n241) );
  INVX2 U314 ( .A(n241), .Y(n554) );
  MUX2X1 U315 ( .B(E1[2]), .A(N218), .S(n170), .Y(n242) );
  INVX2 U316 ( .A(n242), .Y(n555) );
  MUX2X1 U317 ( .B(E1[1]), .A(N217), .S(n170), .Y(n243) );
  INVX2 U318 ( .A(n243), .Y(n556) );
  MUX2X1 U319 ( .B(E1[0]), .A(N216), .S(n170), .Y(n244) );
  INVX2 U320 ( .A(n244), .Y(n557) );
  INVX2 U321 ( .A(N236), .Y(n247) );
  OAI21X1 U322 ( .A(n408), .B(n24), .C(n28), .Y(n246) );
  OAI21X1 U323 ( .A(n1), .B(n247), .C(n246), .Y(n574) );
  INVX2 U324 ( .A(N237), .Y(n250) );
  XOR2X1 U325 ( .A(Gx[1]), .B(n28), .Y(n248) );
  AOI22X1 U326 ( .A(n248), .B(n408), .C(Gx[1]), .D(n24), .Y(n249) );
  OAI21X1 U327 ( .A(n1), .B(n250), .C(n249), .Y(n575) );
  INVX2 U328 ( .A(N238), .Y(n253) );
  XOR2X1 U329 ( .A(n254), .B(Gx[2]), .Y(n251) );
  AOI22X1 U330 ( .A(n251), .B(n408), .C(Gx[2]), .D(n24), .Y(n252) );
  OAI21X1 U331 ( .A(n1), .B(n253), .C(n252), .Y(n576) );
  INVX2 U332 ( .A(N239), .Y(n257) );
  XOR2X1 U333 ( .A(n258), .B(Gx[3]), .Y(n255) );
  AOI22X1 U334 ( .A(n255), .B(n408), .C(Gx[3]), .D(n24), .Y(n256) );
  OAI21X1 U335 ( .A(n1), .B(n257), .C(n256), .Y(n577) );
  INVX2 U336 ( .A(N240), .Y(n261) );
  XOR2X1 U337 ( .A(n262), .B(Gx[4]), .Y(n259) );
  AOI22X1 U338 ( .A(n259), .B(n408), .C(Gx[4]), .D(n24), .Y(n260) );
  OAI21X1 U339 ( .A(n1), .B(n261), .C(n260), .Y(n578) );
  INVX2 U340 ( .A(N241), .Y(n265) );
  XOR2X1 U341 ( .A(n266), .B(Gx[5]), .Y(n263) );
  AOI22X1 U342 ( .A(n263), .B(n408), .C(Gx[5]), .D(n24), .Y(n264) );
  OAI21X1 U343 ( .A(n1), .B(n265), .C(n264), .Y(n579) );
  INVX2 U344 ( .A(N242), .Y(n269) );
  XOR2X1 U345 ( .A(n270), .B(Gx[6]), .Y(n267) );
  AOI22X1 U346 ( .A(n267), .B(n408), .C(Gx[6]), .D(n24), .Y(n268) );
  OAI21X1 U347 ( .A(n1), .B(n269), .C(n268), .Y(n580) );
  INVX2 U348 ( .A(N243), .Y(n273) );
  XOR2X1 U349 ( .A(n274), .B(Gx[7]), .Y(n271) );
  AOI22X1 U350 ( .A(n271), .B(n408), .C(Gx[7]), .D(n24), .Y(n272) );
  OAI21X1 U351 ( .A(n1), .B(n273), .C(n272), .Y(n581) );
  INVX2 U352 ( .A(N244), .Y(n277) );
  XOR2X1 U353 ( .A(n278), .B(Gx[8]), .Y(n275) );
  AOI22X1 U354 ( .A(n275), .B(n408), .C(Gx[8]), .D(n24), .Y(n276) );
  OAI21X1 U355 ( .A(n1), .B(n277), .C(n276), .Y(n582) );
  INVX2 U356 ( .A(N245), .Y(n281) );
  XOR2X1 U357 ( .A(n282), .B(Gx[9]), .Y(n279) );
  AOI22X1 U358 ( .A(n279), .B(n408), .C(Gx[9]), .D(n24), .Y(n280) );
  OAI21X1 U359 ( .A(n1), .B(n281), .C(n280), .Y(n583) );
  NOR2X1 U360 ( .A(Gx[9]), .B(n282), .Y(n283) );
  XNOR2X1 U361 ( .A(n283), .B(Gx[10]), .Y(n284) );
  AOI22X1 U362 ( .A(n24), .B(Gx[10]), .C(n284), .D(n408), .Y(n286) );
  NAND2X1 U363 ( .A(N246), .B(n392), .Y(n285) );
  NAND2X1 U364 ( .A(n286), .B(n285), .Y(n584) );
  NAND2X1 U365 ( .A(n8), .B(n18), .Y(n619) );
  MUX2X1 U366 ( .B(N215), .A(N177), .S(n173), .Y(n287) );
  INVX2 U367 ( .A(n287), .Y(n441) );
  INVX2 U368 ( .A(C2[9]), .Y(n289) );
  INVX2 U369 ( .A(N215), .Y(n288) );
  MUX2X1 U370 ( .B(n289), .A(n288), .S(n169), .Y(n539) );
  MUX2X1 U371 ( .B(N214), .A(N176), .S(n173), .Y(n290) );
  INVX2 U372 ( .A(n290), .Y(n443) );
  INVX2 U373 ( .A(C2[8]), .Y(n292) );
  INVX2 U374 ( .A(N214), .Y(n291) );
  MUX2X1 U375 ( .B(n292), .A(n291), .S(n169), .Y(n540) );
  MUX2X1 U376 ( .B(N213), .A(N175), .S(n173), .Y(n293) );
  INVX2 U377 ( .A(n293), .Y(n444) );
  INVX2 U378 ( .A(C2[7]), .Y(n295) );
  INVX2 U379 ( .A(N213), .Y(n294) );
  MUX2X1 U380 ( .B(n295), .A(n294), .S(n169), .Y(n541) );
  MUX2X1 U381 ( .B(N212), .A(N174), .S(n173), .Y(n296) );
  INVX2 U382 ( .A(n296), .Y(n451) );
  INVX2 U383 ( .A(C2[6]), .Y(n298) );
  INVX2 U384 ( .A(N212), .Y(n297) );
  MUX2X1 U385 ( .B(n298), .A(n297), .S(n169), .Y(n542) );
  MUX2X1 U386 ( .B(N211), .A(N173), .S(n173), .Y(n299) );
  INVX2 U387 ( .A(n299), .Y(n452) );
  INVX2 U388 ( .A(C2[5]), .Y(n301) );
  INVX2 U389 ( .A(N211), .Y(n300) );
  MUX2X1 U390 ( .B(n301), .A(n300), .S(n169), .Y(n543) );
  MUX2X1 U391 ( .B(N210), .A(N172), .S(n173), .Y(n302) );
  INVX2 U392 ( .A(n302), .Y(n461) );
  INVX2 U393 ( .A(C2[4]), .Y(n305) );
  INVX2 U394 ( .A(N210), .Y(n304) );
  MUX2X1 U395 ( .B(n305), .A(n304), .S(n169), .Y(n544) );
  MUX2X1 U396 ( .B(N209), .A(N171), .S(n173), .Y(n306) );
  INVX2 U397 ( .A(n306), .Y(n466) );
  INVX2 U398 ( .A(C2[3]), .Y(n308) );
  INVX2 U399 ( .A(N209), .Y(n307) );
  MUX2X1 U400 ( .B(n308), .A(n307), .S(n169), .Y(n545) );
  MUX2X1 U401 ( .B(N208), .A(N170), .S(n173), .Y(n309) );
  INVX2 U402 ( .A(n309), .Y(n469) );
  INVX2 U403 ( .A(C2[2]), .Y(n311) );
  INVX2 U404 ( .A(N208), .Y(n310) );
  MUX2X1 U405 ( .B(n311), .A(n310), .S(n169), .Y(n546) );
  MUX2X1 U406 ( .B(N207), .A(N169), .S(n173), .Y(n312) );
  INVX2 U407 ( .A(n312), .Y(n477) );
  INVX2 U408 ( .A(C2[1]), .Y(n314) );
  INVX2 U409 ( .A(N207), .Y(n313) );
  MUX2X1 U410 ( .B(n314), .A(n313), .S(n169), .Y(n547) );
  MUX2X1 U411 ( .B(A2[8]), .A(N159), .S(n173), .Y(n316) );
  INVX2 U412 ( .A(n316), .Y(n423) );
  MUX2X1 U413 ( .B(A2[7]), .A(N158), .S(n173), .Y(n317) );
  MUX2X1 U414 ( .B(A2[6]), .A(N157), .S(n173), .Y(n318) );
  INVX2 U415 ( .A(n318), .Y(n425) );
  MUX2X1 U416 ( .B(A2[5]), .A(N156), .S(n174), .Y(n319) );
  INVX2 U417 ( .A(n319), .Y(n426) );
  MUX2X1 U418 ( .B(A2[4]), .A(N155), .S(n174), .Y(n320) );
  INVX2 U419 ( .A(n320), .Y(n427) );
  MUX2X1 U420 ( .B(A2[3]), .A(N154), .S(n174), .Y(n321) );
  INVX2 U421 ( .A(n321), .Y(n428) );
  MUX2X1 U422 ( .B(A2[2]), .A(N153), .S(n174), .Y(n322) );
  INVX2 U423 ( .A(n322), .Y(n429) );
  MUX2X1 U424 ( .B(A2[1]), .A(N152), .S(n174), .Y(n323) );
  INVX2 U425 ( .A(n323), .Y(n430) );
  MUX2X1 U426 ( .B(A2[0]), .A(N151), .S(n174), .Y(n324) );
  INVX2 U427 ( .A(n324), .Y(n431) );
  MUX2X1 U428 ( .B(D2[8]), .A(N195), .S(n174), .Y(n325) );
  INVX2 U429 ( .A(n325), .Y(n518) );
  MUX2X1 U430 ( .B(D2[7]), .A(N194), .S(n174), .Y(n326) );
  MUX2X1 U431 ( .B(D2[6]), .A(N193), .S(n174), .Y(n327) );
  INVX2 U432 ( .A(n327), .Y(n523) );
  MUX2X1 U433 ( .B(D2[5]), .A(N192), .S(n174), .Y(n328) );
  INVX2 U434 ( .A(n328), .Y(n524) );
  MUX2X1 U435 ( .B(D2[4]), .A(N191), .S(n174), .Y(n329) );
  INVX2 U436 ( .A(n329), .Y(n525) );
  MUX2X1 U437 ( .B(D2[3]), .A(N190), .S(n174), .Y(n330) );
  INVX2 U438 ( .A(n330), .Y(n526) );
  MUX2X1 U439 ( .B(D2[2]), .A(N189), .S(n174), .Y(n331) );
  INVX2 U440 ( .A(n331), .Y(n527) );
  MUX2X1 U441 ( .B(D2[1]), .A(N188), .S(n175), .Y(n332) );
  INVX2 U442 ( .A(n332), .Y(n528) );
  MUX2X1 U443 ( .B(D2[0]), .A(N187), .S(n175), .Y(n334) );
  INVX2 U444 ( .A(n334), .Y(n529) );
  MUX2X1 U445 ( .B(E2[9]), .A(N235), .S(n170), .Y(n335) );
  INVX2 U446 ( .A(n335), .Y(n558) );
  MUX2X1 U447 ( .B(E2[8]), .A(N234), .S(n170), .Y(n336) );
  INVX2 U448 ( .A(n336), .Y(n559) );
  MUX2X1 U449 ( .B(E2[7]), .A(N233), .S(n170), .Y(n337) );
  INVX2 U450 ( .A(n337), .Y(n560) );
  MUX2X1 U451 ( .B(E2[6]), .A(N232), .S(n170), .Y(n338) );
  INVX2 U452 ( .A(n338), .Y(n561) );
  MUX2X1 U453 ( .B(E2[5]), .A(N231), .S(n170), .Y(n339) );
  INVX2 U454 ( .A(n339), .Y(n562) );
  MUX2X1 U455 ( .B(E2[4]), .A(N230), .S(n170), .Y(n340) );
  INVX2 U456 ( .A(n340), .Y(n563) );
  MUX2X1 U457 ( .B(E2[3]), .A(N229), .S(n170), .Y(n342) );
  INVX2 U460 ( .A(n342), .Y(n564) );
  MUX2X1 U461 ( .B(E2[2]), .A(N228), .S(n170), .Y(n343) );
  INVX2 U463 ( .A(n343), .Y(n565) );
  MUX2X1 U466 ( .B(E2[1]), .A(N227), .S(n170), .Y(n344) );
  INVX2 U468 ( .A(n344), .Y(n566) );
  MUX2X1 U470 ( .B(E2[0]), .A(N226), .S(n170), .Y(n345) );
  INVX2 U471 ( .A(n345), .Y(n567) );
  INVX2 U473 ( .A(N247), .Y(n347) );
  NAND2X1 U474 ( .A(n1), .B(n619), .Y(n396) );
  INVX2 U480 ( .A(n396), .Y(n412) );
  OAI21X1 U481 ( .A(n393), .B(n412), .C(n26), .Y(n346) );
  OAI21X1 U483 ( .A(n1), .B(n347), .C(n346), .Y(n571) );
  INVX2 U485 ( .A(n27), .Y(n350) );
  XOR2X1 U486 ( .A(n27), .B(n26), .Y(n348) );
  AOI22X1 U489 ( .A(n348), .B(n393), .C(N248), .D(n392), .Y(n349) );
  OAI21X1 U494 ( .A(n396), .B(n350), .C(n349), .Y(n593) );
  INVX2 U495 ( .A(Gy[2]), .Y(n354) );
  NAND2X1 U496 ( .A(n25), .B(n350), .Y(n353) );
  XOR2X1 U497 ( .A(n353), .B(Gy[2]), .Y(n351) );
  AOI22X1 U498 ( .A(n351), .B(n393), .C(N249), .D(n392), .Y(n352) );
  OAI21X1 U499 ( .A(n396), .B(n354), .C(n352), .Y(n592) );
  INVX2 U500 ( .A(Gy[3]), .Y(n359) );
  INVX2 U501 ( .A(n353), .Y(n355) );
  NAND2X1 U502 ( .A(n355), .B(n354), .Y(n358) );
  XOR2X1 U503 ( .A(n358), .B(Gy[3]), .Y(n356) );
  AOI22X1 U504 ( .A(n356), .B(n393), .C(N250), .D(n392), .Y(n357) );
  OAI21X1 U505 ( .A(n396), .B(n359), .C(n357), .Y(n591) );
  INVX2 U506 ( .A(Gy[4]), .Y(n363) );
  XOR2X1 U507 ( .A(n362), .B(Gy[4]), .Y(n360) );
  AOI22X1 U508 ( .A(n360), .B(n393), .C(N251), .D(n392), .Y(n361) );
  OAI21X1 U509 ( .A(n396), .B(n363), .C(n361), .Y(n590) );
  INVX2 U510 ( .A(Gy[5]), .Y(n368) );
  NAND2X1 U511 ( .A(n23), .B(n363), .Y(n367) );
  XOR2X1 U512 ( .A(n367), .B(Gy[5]), .Y(n365) );
  AOI22X1 U513 ( .A(n365), .B(n393), .C(N252), .D(n392), .Y(n366) );
  OAI21X1 U514 ( .A(n396), .B(n368), .C(n366), .Y(n589) );
  INVX2 U515 ( .A(Gy[6]), .Y(n373) );
  INVX2 U516 ( .A(n367), .Y(n369) );
  NAND2X1 U517 ( .A(n369), .B(n368), .Y(n372) );
  XOR2X1 U518 ( .A(n372), .B(Gy[6]), .Y(n370) );
  AOI22X1 U519 ( .A(n370), .B(n393), .C(N253), .D(n392), .Y(n371) );
  OAI21X1 U520 ( .A(n396), .B(n373), .C(n371), .Y(n588) );
  INVX2 U521 ( .A(Gy[7]), .Y(n378) );
  INVX2 U522 ( .A(n372), .Y(n374) );
  NAND2X1 U523 ( .A(n374), .B(n373), .Y(n377) );
  XOR2X1 U524 ( .A(n377), .B(Gy[7]), .Y(n375) );
  AOI22X1 U525 ( .A(n375), .B(n393), .C(N254), .D(n392), .Y(n376) );
  OAI21X1 U526 ( .A(n396), .B(n378), .C(n376), .Y(n587) );
  INVX2 U527 ( .A(Gy[8]), .Y(n383) );
  INVX2 U528 ( .A(n377), .Y(n379) );
  NAND2X1 U529 ( .A(n379), .B(n378), .Y(n382) );
  XOR2X1 U530 ( .A(n382), .B(Gy[8]), .Y(n380) );
  AOI22X1 U531 ( .A(n380), .B(n393), .C(N255), .D(n392), .Y(n381) );
  OAI21X1 U532 ( .A(n396), .B(n383), .C(n381), .Y(n586) );
  INVX2 U533 ( .A(Gy[9]), .Y(n389) );
  INVX2 U534 ( .A(n382), .Y(n384) );
  NAND2X1 U535 ( .A(n384), .B(n383), .Y(n388) );
  XOR2X1 U536 ( .A(n388), .B(Gy[9]), .Y(n385) );
  AOI22X1 U537 ( .A(n385), .B(n393), .C(N256), .D(n392), .Y(n387) );
  OAI21X1 U538 ( .A(n396), .B(n389), .C(n387), .Y(n585) );
  INVX2 U539 ( .A(Gy[10]), .Y(n410) );
  INVX2 U540 ( .A(n388), .Y(n390) );
  NAND2X1 U541 ( .A(n390), .B(n389), .Y(n391) );
  XOR2X1 U542 ( .A(n391), .B(Gy[10]), .Y(n394) );
  AOI22X1 U543 ( .A(n394), .B(n393), .C(N257), .D(n392), .Y(n395) );
  OAI21X1 U544 ( .A(n410), .B(n396), .C(n395), .Y(n572) );
  MUX2X1 U545 ( .B(temp_sum[0]), .A(N280), .S(n404), .Y(n397) );
  NAND2X1 U546 ( .A(n406), .B(n397), .Y(n594) );
  MUX2X1 U547 ( .B(temp_sum[1]), .A(N281), .S(n404), .Y(n398) );
  NAND2X1 U548 ( .A(n406), .B(n398), .Y(n595) );
  MUX2X1 U549 ( .B(temp_sum[2]), .A(N282), .S(n404), .Y(n399) );
  NAND2X1 U550 ( .A(n406), .B(n399), .Y(n596) );
  MUX2X1 U551 ( .B(temp_sum[3]), .A(N283), .S(n404), .Y(n400) );
  NAND2X1 U552 ( .A(n406), .B(n400), .Y(n597) );
  MUX2X1 U553 ( .B(temp_sum[4]), .A(N284), .S(n404), .Y(n401) );
  NAND2X1 U554 ( .A(n406), .B(n401), .Y(n598) );
  MUX2X1 U555 ( .B(temp_sum[5]), .A(N285), .S(n404), .Y(n402) );
  NAND2X1 U556 ( .A(n406), .B(n402), .Y(n599) );
  MUX2X1 U557 ( .B(temp_sum[6]), .A(N286), .S(n404), .Y(n403) );
  NAND2X1 U558 ( .A(n406), .B(n403), .Y(n600) );
  MUX2X1 U559 ( .B(temp_sum[7]), .A(N287), .S(n404), .Y(n405) );
  NAND2X1 U560 ( .A(n406), .B(n405), .Y(n601) );
  NAND2X1 U561 ( .A(n22), .B(n8), .Y(n621) );
  NAND2X1 U562 ( .A(n9), .B(n18), .Y(n620) );
  NAND2X1 U563 ( .A(n2), .B(n8), .Y(n614) );
  OAI21X1 U564 ( .A(Gx[10]), .B(n614), .C(n636), .Y(n623) );
  INVX2 U565 ( .A(n611), .Y(n407) );
  NOR2X1 U566 ( .A(n408), .B(n407), .Y(n409) );
  OAI21X1 U567 ( .A(n621), .B(n410), .C(n409), .Y(n629) );
  INVX2 U568 ( .A(Gx[10]), .Y(n411) );
  OAI21X1 U569 ( .A(n614), .B(n411), .C(n620), .Y(n628) );
  INVX2 U570 ( .A(n628), .Y(n568) );
  OAI21X1 U571 ( .A(Gy[10]), .B(n621), .C(n620), .Y(n622) );
  INVX2 U572 ( .A(n637), .Y(n569) );
  INVX2 U573 ( .A(n609), .Y(n570) );
  NOR2X1 U574 ( .A(n616), .B(n615), .Y(n617) );
endmodule


module edge_detection_2_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n48, n49, n51, n54, n56, n58, n60, n102,
         n103, n104, n105, n106, n108, n109, n110, n111;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  AOI21X1 U5 ( .A(n106), .B(n109), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n106), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n102), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n25), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n105), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n105), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n108), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n104), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n104), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n36), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n41), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n103), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n103), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n44), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n110), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n110), .Y(n10) );
  NAND2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  BUFX2 U77 ( .A(n20), .Y(n102) );
  OR2X2 U78 ( .A(B[3]), .B(A[3]), .Y(n103) );
  OR2X2 U79 ( .A(B[5]), .B(A[5]), .Y(n104) );
  OR2X2 U80 ( .A(B[7]), .B(A[7]), .Y(n105) );
  OR2X2 U81 ( .A(B[9]), .B(A[9]), .Y(n106) );
  AND2X2 U82 ( .A(n51), .B(n111), .Y(SUM[0]) );
  BUFX2 U83 ( .A(n28), .Y(n108) );
  OAI21X1 U84 ( .A(n20), .B(n18), .C(n19), .Y(n109) );
  XNOR2X1 U85 ( .A(n17), .B(n2), .Y(SUM[9]) );
  OR2X2 U86 ( .A(B[1]), .B(A[1]), .Y(n110) );
  XNOR2X1 U87 ( .A(n12), .B(n1), .Y(SUM[10]) );
  OR2X1 U88 ( .A(B[0]), .B(A[0]), .Y(n111) );
  INVX2 U89 ( .A(n42), .Y(n60) );
  INVX2 U90 ( .A(n34), .Y(n58) );
  INVX2 U91 ( .A(n26), .Y(n56) );
  INVX2 U92 ( .A(n18), .Y(n54) );
  INVX2 U93 ( .A(n51), .Y(n49) );
  INVX2 U94 ( .A(n48), .Y(n46) );
  INVX2 U95 ( .A(n40), .Y(n38) );
  INVX2 U96 ( .A(n32), .Y(n30) );
  INVX2 U97 ( .A(n24), .Y(n22) );
  INVX2 U98 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_2_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_2_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_2_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_2_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_2_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n66), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n68), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  INVX1 U39 ( .A(B[1]), .Y(n29) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX1 U41 ( .A(B[0]), .Y(n30) );
  INVX1 U42 ( .A(n11), .Y(n65) );
  INVX2 U43 ( .A(n65), .Y(n66) );
  INVX1 U44 ( .A(n16), .Y(n67) );
  INVX2 U45 ( .A(n67), .Y(n68) );
  INVX2 U46 ( .A(B[2]), .Y(n28) );
  INVX2 U47 ( .A(B[3]), .Y(n27) );
  INVX2 U48 ( .A(B[4]), .Y(n26) );
  INVX2 U49 ( .A(B[5]), .Y(n25) );
  INVX2 U50 ( .A(B[6]), .Y(n24) );
  INVX2 U51 ( .A(B[7]), .Y(n23) );
  INVX2 U52 ( .A(n17), .Y(n22) );
  INVX2 U53 ( .A(n9), .Y(n20) );
  INVX2 U54 ( .A(n15), .Y(n13) );
  INVX2 U55 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_2_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n66), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n68), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n19), .B(n3), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  INVX1 U39 ( .A(B[1]), .Y(n29) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX1 U41 ( .A(B[0]), .Y(n30) );
  INVX1 U42 ( .A(n11), .Y(n65) );
  INVX2 U43 ( .A(n65), .Y(n66) );
  INVX1 U44 ( .A(n16), .Y(n67) );
  INVX2 U45 ( .A(n67), .Y(n68) );
  INVX2 U46 ( .A(B[2]), .Y(n28) );
  INVX2 U47 ( .A(B[3]), .Y(n27) );
  INVX2 U48 ( .A(B[4]), .Y(n26) );
  INVX2 U49 ( .A(B[5]), .Y(n25) );
  INVX2 U50 ( .A(B[6]), .Y(n24) );
  INVX2 U51 ( .A(B[7]), .Y(n23) );
  INVX2 U52 ( .A(n17), .Y(n22) );
  INVX2 U53 ( .A(n9), .Y(n20) );
  INVX2 U54 ( .A(n15), .Y(n13) );
  INVX2 U55 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_2_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_2_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_2_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_2_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_2 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n569), .CLK(clk), .R(n184), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n570), .CLK(clk), .R(n184), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n21), .CLK(clk), .R(n184), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n571), .CLK(clk), .R(n184), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n528), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n582), .CLK(clk), .R(n183), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n23), .CLK(clk), .R(n183), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n22), .CLK(clk), .R(n183), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n420), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n419), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n418), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n417), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n416), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n415), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n414), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n413), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n412), .CLK(clk), .R(n183), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n438), .CLK(clk), .R(n182), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n437), .CLK(clk), .R(n182), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n436), .CLK(clk), .R(n182), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n435), .CLK(clk), .R(n182), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n434), .CLK(clk), .R(n182), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n433), .CLK(clk), .R(n182), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n432), .CLK(clk), .R(n182), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n431), .CLK(clk), .R(n182), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n430), .CLK(clk), .R(n182), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n536), .CLK(clk), .R(n182), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n535), .CLK(clk), .R(n182), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n534), .CLK(clk), .R(n181), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n533), .CLK(clk), .R(n181), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n532), .CLK(clk), .R(n181), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n531), .CLK(clk), .R(n181), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n530), .CLK(clk), .R(n181), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n529), .CLK(clk), .R(n181), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n487), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n486), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n483), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n482), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n480), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n479), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n478), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n477), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n469), .CLK(clk), .R(n180), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n555), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n554), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n553), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n552), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n551), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n550), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n549), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n548), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n547), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n546), .CLK(clk), .R(n179), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n429), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n428), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n427), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n426), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n425), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n424), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n423), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n422), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n421), .CLK(clk), .R(n179), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n466), .CLK(clk), .R(n179), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n461), .CLK(clk), .R(n179), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n452), .CLK(clk), .R(n178), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n451), .CLK(clk), .R(n178), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n444), .CLK(clk), .R(n178), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n443), .CLK(clk), .R(n178), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n441), .CLK(clk), .R(n178), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n440), .CLK(clk), .R(n178), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n439), .CLK(clk), .R(n178), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n527), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n526), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n525), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n524), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n523), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n520), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n518), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n517), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n488), .CLK(clk), .R(n177), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n565), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n564), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n563), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n562), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n561), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n560), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n559), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n558), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n557), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n556), .CLK(clk), .R(n176), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n567), .CLK(clk), .R(n176), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n572), .CLK(clk), .R(n176), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n573), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n574), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n575), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n576), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n577), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n578), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n579), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n581), .CLK(clk), .R(n175), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n545), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n544), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n543), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n542), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n541), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n540), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n539), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n538), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n537), .CLK(clk), .R(n175), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n591), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n590), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n589), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n588), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n587), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n586), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n585), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n584), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n583), .CLK(clk), .R(n174), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n592), .CLK(clk), .R(n174), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n174), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n593), .CLK(clk), .R(n174), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n174), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n594), .CLK(clk), .R(n173), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n173), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n595), .CLK(clk), .R(n173), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n173), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n596), .CLK(clk), .R(n173), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n173), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n597), .CLK(clk), .R(n173), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n173), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n598), .CLK(clk), .R(n173), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n173), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n599), .CLK(clk), .R(n173), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n173), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n632), .B(n625), .Y(n616) );
  AND2X2 U160 ( .A(n635), .B(n634), .Y(n602) );
  OR2X1 U458 ( .A(n627), .B(n626), .Y(n628) );
  NAND3X1 U459 ( .A(n625), .B(n624), .C(n410), .Y(n629) );
  OR2X1 U462 ( .A(n621), .B(n620), .Y(n622) );
  NAND3X1 U464 ( .A(n617), .B(n624), .C(n616), .Y(n623) );
  OAI21X1 U465 ( .A(n624), .B(n411), .C(n615), .Y(n571) );
  NAND2X1 U467 ( .A(n566), .B(n619), .Y(n613) );
  NAND3X1 U469 ( .A(n630), .B(n634), .C(n631), .Y(n614) );
  OR2X1 U472 ( .A(n621), .B(n627), .Y(n610) );
  NAND3X1 U475 ( .A(n631), .B(n624), .C(n608), .Y(n611) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n568), .Y(n608) );
  NAND2X1 U477 ( .A(n606), .B(n605), .Y(n624) );
  NOR2X1 U478 ( .A(n604), .B(n603), .Y(n605) );
  NAND3X1 U479 ( .A(n632), .B(n631), .C(n612), .Y(n603) );
  NAND3X1 U482 ( .A(n633), .B(n630), .C(n602), .Y(n604) );
  NAND3X1 U484 ( .A(state[2]), .B(n19), .C(state[3]), .Y(n635) );
  NOR2X1 U487 ( .A(n601), .B(n600), .Y(n606) );
  NAND3X1 U488 ( .A(n607), .B(n618), .C(n410), .Y(n600) );
  NAND2X1 U490 ( .A(n18), .B(n9), .Y(n607) );
  NAND3X1 U491 ( .A(n619), .B(n609), .C(n625), .Y(n601) );
  NAND2X1 U492 ( .A(n17), .B(n19), .Y(n625) );
  NAND2X1 U493 ( .A(n24), .B(n17), .Y(n609) );
  edge_detection_2_DW01_add_7 add_231 ( .A({Gx[10:2], n2, n1}), .B({Gy[10:1], 
        n27}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, N283, 
        N282, N281, N280}) );
  edge_detection_2_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_2_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_2_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_2_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_2_DW01_sub_8 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_2_DW01_sub_9 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  edge_detection_2_DW01_sub_10 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_2_DW01_sub_11 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_2_DW01_sub_12 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_2_DW01_sub_13 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  INVX4 U5 ( .A(n28), .Y(n404) );
  BUFX2 U6 ( .A(Gx[1]), .Y(n2) );
  BUFX2 U12 ( .A(N258), .Y(n1) );
  NAND2X1 U13 ( .A(n9), .B(n17), .Y(n8) );
  AND2X2 U52 ( .A(n411), .B(n185), .Y(n9) );
  AND2X2 U128 ( .A(state[3]), .B(n186), .Y(n16) );
  AND2X2 U155 ( .A(state[2]), .B(n242), .Y(n17) );
  AND2X2 U156 ( .A(n242), .B(n186), .Y(n18) );
  AND2X2 U158 ( .A(state[1]), .B(n185), .Y(n19) );
  AND2X2 U159 ( .A(state[0]), .B(state[1]), .Y(n20) );
  OR2X2 U161 ( .A(n611), .B(n610), .Y(n21) );
  OR2X2 U162 ( .A(n623), .B(n622), .Y(n22) );
  OR2X2 U163 ( .A(n629), .B(n628), .Y(n23) );
  AND2X2 U164 ( .A(state[0]), .B(n411), .Y(n24) );
  NOR2X1 U165 ( .A(n382), .B(Gy[8]), .Y(n25) );
  INVX1 U166 ( .A(n25), .Y(n387) );
  OR2X1 U167 ( .A(n1), .B(n2), .Y(n251) );
  OR2X2 U168 ( .A(n259), .B(Gx[4]), .Y(n263) );
  OR2X2 U169 ( .A(n267), .B(Gx[6]), .Y(n271) );
  OR2X2 U170 ( .A(n275), .B(Gx[8]), .Y(n279) );
  BUFX2 U171 ( .A(n330), .Y(n171) );
  BUFX2 U172 ( .A(n330), .Y(n170) );
  BUFX2 U173 ( .A(n330), .Y(n168) );
  BUFX2 U174 ( .A(n330), .Y(n169) );
  INVX2 U175 ( .A(n632), .Y(n141) );
  INVX2 U176 ( .A(n8), .Y(n390) );
  INVX2 U177 ( .A(n631), .Y(n65) );
  BUFX2 U178 ( .A(n330), .Y(n172) );
  INVX2 U179 ( .A(n633), .Y(n406) );
  AND2X2 U180 ( .A(n633), .B(n8), .Y(n26) );
  INVX2 U181 ( .A(n617), .Y(n391) );
  INVX2 U182 ( .A(N288), .Y(n29) );
  BUFX2 U183 ( .A(n_rst), .Y(n173) );
  BUFX2 U184 ( .A(n_rst), .Y(n174) );
  BUFX2 U185 ( .A(n_rst), .Y(n176) );
  BUFX2 U186 ( .A(n_rst), .Y(n177) );
  BUFX2 U187 ( .A(n_rst), .Y(n178) );
  BUFX2 U188 ( .A(n_rst), .Y(n179) );
  BUFX2 U189 ( .A(n_rst), .Y(n180) );
  BUFX2 U190 ( .A(n_rst), .Y(n181) );
  BUFX2 U191 ( .A(n_rst), .Y(n183) );
  BUFX2 U192 ( .A(n_rst), .Y(n175) );
  BUFX2 U193 ( .A(n_rst), .Y(n182) );
  BUFX2 U194 ( .A(n_rst), .Y(n184) );
  OR2X1 U195 ( .A(n251), .B(Gx[2]), .Y(n255) );
  OR2X1 U196 ( .A(n271), .B(Gx[7]), .Y(n275) );
  BUFX2 U197 ( .A(N269), .Y(n27) );
  OR2X1 U198 ( .A(n255), .B(Gx[3]), .Y(n259) );
  OR2X1 U199 ( .A(n263), .B(Gx[5]), .Y(n267) );
  AOI21X1 U202 ( .A(n29), .B(n30), .C(n634), .Y(n28) );
  NOR2X1 U203 ( .A(N289), .B(N290), .Y(n30) );
  INVX2 U204 ( .A(n634), .Y(n402) );
  INVX2 U205 ( .A(state[1]), .Y(n411) );
  INVX2 U206 ( .A(state[0]), .Y(n185) );
  NAND3X1 U207 ( .A(state[2]), .B(state[3]), .C(n9), .Y(n634) );
  INVX2 U208 ( .A(state[2]), .Y(n186) );
  NAND2X1 U209 ( .A(n19), .B(n16), .Y(n633) );
  INVX2 U210 ( .A(state[3]), .Y(n242) );
  NAND2X1 U211 ( .A(n18), .B(n24), .Y(n630) );
  INVX2 U212 ( .A(n630), .Y(n330) );
  MUX2X1 U213 ( .B(N205), .A(N168), .S(n168), .Y(n187) );
  INVX2 U214 ( .A(n187), .Y(n430) );
  NAND2X1 U215 ( .A(n18), .B(n19), .Y(n631) );
  INVX2 U216 ( .A(C1[9]), .Y(n189) );
  INVX2 U217 ( .A(N205), .Y(n188) );
  MUX2X1 U218 ( .B(n189), .A(n188), .S(n65), .Y(n528) );
  MUX2X1 U219 ( .B(N204), .A(N167), .S(n168), .Y(n190) );
  INVX2 U220 ( .A(n190), .Y(n431) );
  INVX2 U221 ( .A(C1[8]), .Y(n192) );
  INVX2 U222 ( .A(N204), .Y(n191) );
  MUX2X1 U223 ( .B(n192), .A(n191), .S(n65), .Y(n529) );
  MUX2X1 U224 ( .B(N203), .A(N166), .S(n168), .Y(n193) );
  INVX2 U225 ( .A(n193), .Y(n432) );
  INVX2 U226 ( .A(C1[7]), .Y(n195) );
  INVX2 U227 ( .A(N203), .Y(n194) );
  MUX2X1 U228 ( .B(n195), .A(n194), .S(n65), .Y(n530) );
  MUX2X1 U229 ( .B(N202), .A(N165), .S(n168), .Y(n196) );
  INVX2 U230 ( .A(n196), .Y(n433) );
  INVX2 U231 ( .A(C1[6]), .Y(n198) );
  INVX2 U232 ( .A(N202), .Y(n197) );
  MUX2X1 U233 ( .B(n198), .A(n197), .S(n65), .Y(n531) );
  MUX2X1 U234 ( .B(N201), .A(N164), .S(n168), .Y(n199) );
  INVX2 U235 ( .A(n199), .Y(n434) );
  INVX2 U236 ( .A(C1[5]), .Y(n201) );
  INVX2 U237 ( .A(N201), .Y(n200) );
  MUX2X1 U238 ( .B(n201), .A(n200), .S(n65), .Y(n532) );
  MUX2X1 U239 ( .B(N200), .A(N163), .S(n168), .Y(n202) );
  INVX2 U240 ( .A(n202), .Y(n435) );
  INVX2 U241 ( .A(C1[4]), .Y(n204) );
  INVX2 U242 ( .A(N200), .Y(n203) );
  MUX2X1 U243 ( .B(n204), .A(n203), .S(n65), .Y(n533) );
  MUX2X1 U244 ( .B(N199), .A(N162), .S(n168), .Y(n205) );
  INVX2 U245 ( .A(n205), .Y(n436) );
  INVX2 U246 ( .A(C1[3]), .Y(n207) );
  INVX2 U247 ( .A(N199), .Y(n206) );
  MUX2X1 U248 ( .B(n207), .A(n206), .S(n65), .Y(n534) );
  MUX2X1 U249 ( .B(N198), .A(N161), .S(n168), .Y(n208) );
  INVX2 U250 ( .A(n208), .Y(n437) );
  INVX2 U251 ( .A(C1[2]), .Y(n210) );
  INVX2 U252 ( .A(N198), .Y(n209) );
  MUX2X1 U253 ( .B(n210), .A(n209), .S(n65), .Y(n535) );
  MUX2X1 U254 ( .B(N197), .A(N160), .S(n168), .Y(n211) );
  INVX2 U255 ( .A(n211), .Y(n438) );
  INVX2 U256 ( .A(C1[1]), .Y(n213) );
  INVX2 U257 ( .A(N197), .Y(n212) );
  MUX2X1 U258 ( .B(n213), .A(n212), .S(n65), .Y(n536) );
  MUX2X1 U259 ( .B(A1[8]), .A(N150), .S(n168), .Y(n214) );
  INVX2 U260 ( .A(n214), .Y(n412) );
  MUX2X1 U261 ( .B(A1[7]), .A(N149), .S(n168), .Y(n215) );
  INVX2 U262 ( .A(n215), .Y(n413) );
  MUX2X1 U263 ( .B(A1[6]), .A(N148), .S(n168), .Y(n216) );
  INVX2 U264 ( .A(n216), .Y(n414) );
  MUX2X1 U265 ( .B(A1[5]), .A(N147), .S(n168), .Y(n217) );
  INVX2 U266 ( .A(n217), .Y(n415) );
  MUX2X1 U267 ( .B(A1[4]), .A(N146), .S(n169), .Y(n218) );
  INVX2 U268 ( .A(n218), .Y(n416) );
  MUX2X1 U269 ( .B(A1[3]), .A(N145), .S(n169), .Y(n219) );
  INVX2 U270 ( .A(n219), .Y(n417) );
  MUX2X1 U271 ( .B(A1[2]), .A(N144), .S(n169), .Y(n220) );
  INVX2 U272 ( .A(n220), .Y(n418) );
  MUX2X1 U273 ( .B(A1[1]), .A(N143), .S(n169), .Y(n221) );
  INVX2 U274 ( .A(n221), .Y(n419) );
  MUX2X1 U275 ( .B(A1[0]), .A(N142), .S(n169), .Y(n222) );
  INVX2 U276 ( .A(n222), .Y(n420) );
  MUX2X1 U277 ( .B(D1[8]), .A(N186), .S(n169), .Y(n223) );
  INVX2 U278 ( .A(n223), .Y(n469) );
  MUX2X1 U279 ( .B(D1[7]), .A(N185), .S(n169), .Y(n224) );
  INVX2 U280 ( .A(n224), .Y(n477) );
  MUX2X1 U281 ( .B(D1[6]), .A(N184), .S(n169), .Y(n225) );
  INVX2 U282 ( .A(n225), .Y(n478) );
  MUX2X1 U283 ( .B(D1[5]), .A(N183), .S(n169), .Y(n226) );
  INVX2 U284 ( .A(n226), .Y(n479) );
  MUX2X1 U285 ( .B(D1[4]), .A(N182), .S(n169), .Y(n227) );
  INVX2 U286 ( .A(n227), .Y(n480) );
  MUX2X1 U287 ( .B(D1[3]), .A(N181), .S(n169), .Y(n228) );
  INVX2 U288 ( .A(n228), .Y(n482) );
  MUX2X1 U289 ( .B(D1[2]), .A(N180), .S(n169), .Y(n229) );
  INVX2 U290 ( .A(n229), .Y(n483) );
  MUX2X1 U291 ( .B(D1[1]), .A(N179), .S(n169), .Y(n230) );
  INVX2 U292 ( .A(n230), .Y(n486) );
  MUX2X1 U293 ( .B(D1[0]), .A(N178), .S(n170), .Y(n231) );
  INVX2 U294 ( .A(n231), .Y(n487) );
  NAND2X1 U295 ( .A(n18), .B(n20), .Y(n632) );
  MUX2X1 U296 ( .B(E1[9]), .A(N225), .S(n141), .Y(n232) );
  INVX2 U297 ( .A(n232), .Y(n546) );
  MUX2X1 U298 ( .B(E1[8]), .A(N224), .S(n141), .Y(n233) );
  INVX2 U299 ( .A(n233), .Y(n547) );
  MUX2X1 U300 ( .B(E1[7]), .A(N223), .S(n141), .Y(n234) );
  INVX2 U301 ( .A(n234), .Y(n548) );
  MUX2X1 U302 ( .B(E1[6]), .A(N222), .S(n141), .Y(n235) );
  INVX2 U303 ( .A(n235), .Y(n549) );
  MUX2X1 U304 ( .B(E1[5]), .A(N221), .S(n141), .Y(n236) );
  INVX2 U305 ( .A(n236), .Y(n550) );
  MUX2X1 U306 ( .B(E1[4]), .A(N220), .S(n141), .Y(n237) );
  INVX2 U307 ( .A(n237), .Y(n551) );
  MUX2X1 U308 ( .B(E1[3]), .A(N219), .S(n141), .Y(n238) );
  INVX2 U309 ( .A(n238), .Y(n552) );
  MUX2X1 U310 ( .B(E1[2]), .A(N218), .S(n141), .Y(n239) );
  INVX2 U311 ( .A(n239), .Y(n553) );
  MUX2X1 U312 ( .B(E1[1]), .A(N217), .S(n141), .Y(n240) );
  INVX2 U313 ( .A(n240), .Y(n554) );
  MUX2X1 U314 ( .B(E1[0]), .A(N216), .S(n141), .Y(n241) );
  INVX2 U315 ( .A(n241), .Y(n555) );
  INVX2 U316 ( .A(N236), .Y(n244) );
  OAI21X1 U317 ( .A(n406), .B(n26), .C(n1), .Y(n243) );
  OAI21X1 U318 ( .A(n8), .B(n244), .C(n243), .Y(n572) );
  INVX2 U319 ( .A(N237), .Y(n247) );
  XOR2X1 U320 ( .A(n2), .B(n1), .Y(n245) );
  AOI22X1 U321 ( .A(n245), .B(n406), .C(n2), .D(n26), .Y(n246) );
  OAI21X1 U322 ( .A(n8), .B(n247), .C(n246), .Y(n573) );
  INVX2 U323 ( .A(N238), .Y(n250) );
  XOR2X1 U324 ( .A(n251), .B(Gx[2]), .Y(n248) );
  AOI22X1 U325 ( .A(n248), .B(n406), .C(Gx[2]), .D(n26), .Y(n249) );
  OAI21X1 U326 ( .A(n8), .B(n250), .C(n249), .Y(n574) );
  INVX2 U327 ( .A(N239), .Y(n254) );
  XOR2X1 U328 ( .A(n255), .B(Gx[3]), .Y(n252) );
  AOI22X1 U329 ( .A(n252), .B(n406), .C(Gx[3]), .D(n26), .Y(n253) );
  OAI21X1 U330 ( .A(n8), .B(n254), .C(n253), .Y(n575) );
  INVX2 U331 ( .A(N240), .Y(n258) );
  XOR2X1 U332 ( .A(n259), .B(Gx[4]), .Y(n256) );
  AOI22X1 U333 ( .A(n256), .B(n406), .C(Gx[4]), .D(n26), .Y(n257) );
  OAI21X1 U334 ( .A(n8), .B(n258), .C(n257), .Y(n576) );
  INVX2 U335 ( .A(N241), .Y(n262) );
  XOR2X1 U336 ( .A(n263), .B(Gx[5]), .Y(n260) );
  AOI22X1 U337 ( .A(n260), .B(n406), .C(Gx[5]), .D(n26), .Y(n261) );
  OAI21X1 U338 ( .A(n8), .B(n262), .C(n261), .Y(n577) );
  INVX2 U339 ( .A(N242), .Y(n266) );
  XOR2X1 U340 ( .A(n267), .B(Gx[6]), .Y(n264) );
  AOI22X1 U341 ( .A(n264), .B(n406), .C(Gx[6]), .D(n26), .Y(n265) );
  OAI21X1 U342 ( .A(n8), .B(n266), .C(n265), .Y(n578) );
  INVX2 U343 ( .A(N243), .Y(n270) );
  XOR2X1 U344 ( .A(n271), .B(Gx[7]), .Y(n268) );
  AOI22X1 U345 ( .A(n268), .B(n406), .C(Gx[7]), .D(n26), .Y(n269) );
  OAI21X1 U346 ( .A(n8), .B(n270), .C(n269), .Y(n579) );
  INVX2 U347 ( .A(N244), .Y(n274) );
  XOR2X1 U348 ( .A(n275), .B(Gx[8]), .Y(n272) );
  AOI22X1 U349 ( .A(n272), .B(n406), .C(Gx[8]), .D(n26), .Y(n273) );
  OAI21X1 U350 ( .A(n8), .B(n274), .C(n273), .Y(n580) );
  INVX2 U351 ( .A(N245), .Y(n278) );
  XOR2X1 U352 ( .A(n279), .B(Gx[9]), .Y(n276) );
  AOI22X1 U353 ( .A(n276), .B(n406), .C(Gx[9]), .D(n26), .Y(n277) );
  OAI21X1 U354 ( .A(n8), .B(n278), .C(n277), .Y(n581) );
  NOR2X1 U355 ( .A(Gx[9]), .B(n279), .Y(n280) );
  XNOR2X1 U356 ( .A(n280), .B(Gx[10]), .Y(n281) );
  AOI22X1 U357 ( .A(n26), .B(Gx[10]), .C(n281), .D(n406), .Y(n283) );
  NAND2X1 U358 ( .A(N246), .B(n390), .Y(n282) );
  NAND2X1 U359 ( .A(n282), .B(n283), .Y(n582) );
  NAND2X1 U360 ( .A(n16), .B(n20), .Y(n617) );
  MUX2X1 U361 ( .B(N215), .A(N177), .S(n170), .Y(n284) );
  INVX2 U362 ( .A(n284), .Y(n439) );
  INVX2 U363 ( .A(C2[9]), .Y(n286) );
  INVX2 U364 ( .A(N215), .Y(n285) );
  MUX2X1 U365 ( .B(n286), .A(n285), .S(n65), .Y(n537) );
  MUX2X1 U366 ( .B(N214), .A(N176), .S(n170), .Y(n287) );
  INVX2 U367 ( .A(n287), .Y(n440) );
  INVX2 U368 ( .A(C2[8]), .Y(n289) );
  INVX2 U369 ( .A(N214), .Y(n288) );
  MUX2X1 U370 ( .B(n289), .A(n288), .S(n65), .Y(n538) );
  MUX2X1 U371 ( .B(N213), .A(N175), .S(n170), .Y(n290) );
  INVX2 U372 ( .A(n290), .Y(n441) );
  INVX2 U373 ( .A(C2[7]), .Y(n292) );
  INVX2 U374 ( .A(N213), .Y(n291) );
  MUX2X1 U375 ( .B(n292), .A(n291), .S(n65), .Y(n539) );
  MUX2X1 U376 ( .B(N212), .A(N174), .S(n170), .Y(n293) );
  INVX2 U377 ( .A(n293), .Y(n443) );
  INVX2 U378 ( .A(C2[6]), .Y(n295) );
  INVX2 U379 ( .A(N212), .Y(n294) );
  MUX2X1 U380 ( .B(n295), .A(n294), .S(n65), .Y(n540) );
  MUX2X1 U381 ( .B(N211), .A(N173), .S(n170), .Y(n296) );
  INVX2 U382 ( .A(n296), .Y(n444) );
  INVX2 U383 ( .A(C2[5]), .Y(n298) );
  INVX2 U384 ( .A(N211), .Y(n297) );
  MUX2X1 U385 ( .B(n298), .A(n297), .S(n65), .Y(n541) );
  MUX2X1 U386 ( .B(N210), .A(N172), .S(n170), .Y(n299) );
  INVX2 U387 ( .A(n299), .Y(n451) );
  INVX2 U388 ( .A(C2[4]), .Y(n301) );
  INVX2 U389 ( .A(N210), .Y(n300) );
  MUX2X1 U390 ( .B(n301), .A(n300), .S(n65), .Y(n542) );
  MUX2X1 U391 ( .B(N209), .A(N171), .S(n170), .Y(n302) );
  INVX2 U392 ( .A(n302), .Y(n452) );
  INVX2 U393 ( .A(C2[3]), .Y(n305) );
  INVX2 U394 ( .A(N209), .Y(n304) );
  MUX2X1 U395 ( .B(n305), .A(n304), .S(n65), .Y(n543) );
  MUX2X1 U396 ( .B(N208), .A(N170), .S(n170), .Y(n306) );
  INVX2 U397 ( .A(n306), .Y(n461) );
  INVX2 U398 ( .A(C2[2]), .Y(n308) );
  INVX2 U399 ( .A(N208), .Y(n307) );
  MUX2X1 U400 ( .B(n308), .A(n307), .S(n65), .Y(n544) );
  MUX2X1 U401 ( .B(N207), .A(N169), .S(n170), .Y(n309) );
  INVX2 U402 ( .A(n309), .Y(n466) );
  INVX2 U403 ( .A(C2[1]), .Y(n311) );
  INVX2 U404 ( .A(N207), .Y(n310) );
  MUX2X1 U405 ( .B(n311), .A(n310), .S(n65), .Y(n545) );
  MUX2X1 U406 ( .B(A2[8]), .A(N159), .S(n170), .Y(n312) );
  INVX2 U407 ( .A(n312), .Y(n421) );
  MUX2X1 U408 ( .B(A2[7]), .A(N158), .S(n170), .Y(n313) );
  INVX2 U409 ( .A(n313), .Y(n422) );
  MUX2X1 U410 ( .B(A2[6]), .A(N157), .S(n170), .Y(n314) );
  INVX2 U411 ( .A(n314), .Y(n423) );
  MUX2X1 U412 ( .B(A2[5]), .A(N156), .S(n171), .Y(n316) );
  INVX2 U413 ( .A(n316), .Y(n424) );
  MUX2X1 U414 ( .B(A2[4]), .A(N155), .S(n171), .Y(n317) );
  INVX2 U415 ( .A(n317), .Y(n425) );
  MUX2X1 U416 ( .B(A2[3]), .A(N154), .S(n171), .Y(n318) );
  INVX2 U417 ( .A(n318), .Y(n426) );
  MUX2X1 U418 ( .B(A2[2]), .A(N153), .S(n171), .Y(n319) );
  INVX2 U419 ( .A(n319), .Y(n427) );
  MUX2X1 U420 ( .B(A2[1]), .A(N152), .S(n171), .Y(n320) );
  INVX2 U421 ( .A(n320), .Y(n428) );
  MUX2X1 U422 ( .B(A2[0]), .A(N151), .S(n171), .Y(n321) );
  INVX2 U423 ( .A(n321), .Y(n429) );
  MUX2X1 U424 ( .B(D2[8]), .A(N195), .S(n171), .Y(n322) );
  INVX2 U425 ( .A(n322), .Y(n488) );
  MUX2X1 U426 ( .B(D2[7]), .A(N194), .S(n171), .Y(n323) );
  INVX2 U427 ( .A(n323), .Y(n517) );
  MUX2X1 U428 ( .B(D2[6]), .A(N193), .S(n171), .Y(n324) );
  INVX2 U429 ( .A(n324), .Y(n518) );
  MUX2X1 U430 ( .B(D2[5]), .A(N192), .S(n171), .Y(n325) );
  INVX2 U431 ( .A(n325), .Y(n520) );
  MUX2X1 U432 ( .B(D2[4]), .A(N191), .S(n171), .Y(n326) );
  INVX2 U433 ( .A(n326), .Y(n523) );
  MUX2X1 U434 ( .B(D2[3]), .A(N190), .S(n171), .Y(n327) );
  INVX2 U435 ( .A(n327), .Y(n524) );
  MUX2X1 U436 ( .B(D2[2]), .A(N189), .S(n171), .Y(n328) );
  INVX2 U437 ( .A(n328), .Y(n525) );
  MUX2X1 U438 ( .B(D2[1]), .A(N188), .S(n172), .Y(n329) );
  INVX2 U439 ( .A(n329), .Y(n526) );
  MUX2X1 U440 ( .B(D2[0]), .A(N187), .S(n172), .Y(n331) );
  INVX2 U441 ( .A(n331), .Y(n527) );
  MUX2X1 U442 ( .B(E2[9]), .A(N235), .S(n141), .Y(n332) );
  INVX2 U443 ( .A(n332), .Y(n556) );
  MUX2X1 U444 ( .B(E2[8]), .A(N234), .S(n141), .Y(n333) );
  INVX2 U445 ( .A(n333), .Y(n557) );
  MUX2X1 U446 ( .B(E2[7]), .A(N233), .S(n141), .Y(n334) );
  INVX2 U447 ( .A(n334), .Y(n558) );
  MUX2X1 U448 ( .B(E2[6]), .A(N232), .S(n141), .Y(n335) );
  INVX2 U449 ( .A(n335), .Y(n559) );
  MUX2X1 U450 ( .B(E2[5]), .A(N231), .S(n141), .Y(n336) );
  INVX2 U451 ( .A(n336), .Y(n560) );
  MUX2X1 U452 ( .B(E2[4]), .A(N230), .S(n141), .Y(n337) );
  INVX2 U453 ( .A(n337), .Y(n561) );
  MUX2X1 U454 ( .B(E2[3]), .A(N229), .S(n141), .Y(n338) );
  INVX2 U455 ( .A(n338), .Y(n562) );
  MUX2X1 U456 ( .B(E2[2]), .A(N228), .S(n141), .Y(n339) );
  INVX2 U457 ( .A(n339), .Y(n563) );
  MUX2X1 U460 ( .B(E2[1]), .A(N227), .S(n141), .Y(n340) );
  INVX2 U461 ( .A(n340), .Y(n564) );
  MUX2X1 U463 ( .B(E2[0]), .A(N226), .S(n141), .Y(n342) );
  INVX2 U466 ( .A(n342), .Y(n565) );
  INVX2 U468 ( .A(N247), .Y(n344) );
  NAND2X1 U470 ( .A(n8), .B(n617), .Y(n394) );
  INVX2 U471 ( .A(n394), .Y(n410) );
  OAI21X1 U473 ( .A(n391), .B(n410), .C(n27), .Y(n343) );
  OAI21X1 U474 ( .A(n8), .B(n344), .C(n343), .Y(n569) );
  INVX2 U480 ( .A(Gy[1]), .Y(n347) );
  XOR2X1 U481 ( .A(Gy[1]), .B(n27), .Y(n345) );
  AOI22X1 U483 ( .A(n345), .B(n391), .C(N248), .D(n390), .Y(n346) );
  OAI21X1 U485 ( .A(n394), .B(n347), .C(n346), .Y(n591) );
  INVX2 U486 ( .A(Gy[2]), .Y(n352) );
  INVX2 U489 ( .A(n27), .Y(n348) );
  NAND2X1 U494 ( .A(n348), .B(n347), .Y(n351) );
  XOR2X1 U495 ( .A(n351), .B(Gy[2]), .Y(n349) );
  AOI22X1 U496 ( .A(n349), .B(n391), .C(N249), .D(n390), .Y(n350) );
  OAI21X1 U497 ( .A(n394), .B(n352), .C(n350), .Y(n590) );
  INVX2 U498 ( .A(Gy[3]), .Y(n357) );
  INVX2 U499 ( .A(n351), .Y(n353) );
  NAND2X1 U500 ( .A(n353), .B(n352), .Y(n356) );
  XOR2X1 U501 ( .A(n356), .B(Gy[3]), .Y(n354) );
  AOI22X1 U502 ( .A(n354), .B(n391), .C(N250), .D(n390), .Y(n355) );
  OAI21X1 U503 ( .A(n394), .B(n357), .C(n355), .Y(n589) );
  INVX2 U504 ( .A(Gy[4]), .Y(n362) );
  INVX2 U505 ( .A(n356), .Y(n358) );
  NAND2X1 U506 ( .A(n358), .B(n357), .Y(n361) );
  XOR2X1 U507 ( .A(n361), .B(Gy[4]), .Y(n359) );
  AOI22X1 U508 ( .A(n359), .B(n391), .C(N251), .D(n390), .Y(n360) );
  OAI21X1 U509 ( .A(n394), .B(n362), .C(n360), .Y(n588) );
  INVX2 U510 ( .A(Gy[5]), .Y(n368) );
  INVX2 U511 ( .A(n361), .Y(n363) );
  NAND2X1 U512 ( .A(n363), .B(n362), .Y(n367) );
  XOR2X1 U513 ( .A(n367), .B(Gy[5]), .Y(n365) );
  AOI22X1 U514 ( .A(n365), .B(n391), .C(N252), .D(n390), .Y(n366) );
  OAI21X1 U515 ( .A(n394), .B(n368), .C(n366), .Y(n587) );
  INVX2 U516 ( .A(Gy[6]), .Y(n373) );
  INVX2 U517 ( .A(n367), .Y(n369) );
  NAND2X1 U518 ( .A(n369), .B(n368), .Y(n372) );
  XOR2X1 U519 ( .A(n372), .B(Gy[6]), .Y(n370) );
  AOI22X1 U520 ( .A(n370), .B(n391), .C(N253), .D(n390), .Y(n371) );
  OAI21X1 U521 ( .A(n394), .B(n373), .C(n371), .Y(n586) );
  INVX2 U522 ( .A(Gy[7]), .Y(n378) );
  INVX2 U523 ( .A(n372), .Y(n374) );
  NAND2X1 U524 ( .A(n374), .B(n373), .Y(n377) );
  XOR2X1 U525 ( .A(n377), .B(Gy[7]), .Y(n375) );
  AOI22X1 U526 ( .A(n375), .B(n391), .C(N254), .D(n390), .Y(n376) );
  OAI21X1 U527 ( .A(n394), .B(n378), .C(n376), .Y(n585) );
  INVX2 U528 ( .A(Gy[8]), .Y(n383) );
  INVX2 U529 ( .A(n377), .Y(n379) );
  NAND2X1 U530 ( .A(n379), .B(n378), .Y(n382) );
  XOR2X1 U531 ( .A(n382), .B(Gy[8]), .Y(n380) );
  AOI22X1 U532 ( .A(n380), .B(n391), .C(N255), .D(n390), .Y(n381) );
  OAI21X1 U533 ( .A(n394), .B(n383), .C(n381), .Y(n584) );
  INVX2 U534 ( .A(Gy[9]), .Y(n388) );
  XOR2X1 U535 ( .A(n387), .B(Gy[9]), .Y(n384) );
  AOI22X1 U536 ( .A(n384), .B(n391), .C(N256), .D(n390), .Y(n385) );
  OAI21X1 U537 ( .A(n394), .B(n388), .C(n385), .Y(n583) );
  INVX2 U538 ( .A(Gy[10]), .Y(n408) );
  NAND2X1 U539 ( .A(n25), .B(n388), .Y(n389) );
  XOR2X1 U540 ( .A(n389), .B(Gy[10]), .Y(n392) );
  AOI22X1 U541 ( .A(n392), .B(n391), .C(N257), .D(n390), .Y(n393) );
  OAI21X1 U542 ( .A(n408), .B(n394), .C(n393), .Y(n570) );
  MUX2X1 U543 ( .B(temp_sum[0]), .A(N280), .S(n402), .Y(n395) );
  NAND2X1 U544 ( .A(n404), .B(n395), .Y(n592) );
  MUX2X1 U545 ( .B(temp_sum[1]), .A(N281), .S(n402), .Y(n396) );
  NAND2X1 U546 ( .A(n404), .B(n396), .Y(n593) );
  MUX2X1 U547 ( .B(temp_sum[2]), .A(N282), .S(n402), .Y(n397) );
  NAND2X1 U548 ( .A(n404), .B(n397), .Y(n594) );
  MUX2X1 U549 ( .B(temp_sum[3]), .A(N283), .S(n402), .Y(n398) );
  NAND2X1 U550 ( .A(n404), .B(n398), .Y(n595) );
  MUX2X1 U551 ( .B(temp_sum[4]), .A(N284), .S(n402), .Y(n399) );
  NAND2X1 U552 ( .A(n404), .B(n399), .Y(n596) );
  MUX2X1 U553 ( .B(temp_sum[5]), .A(N285), .S(n402), .Y(n400) );
  NAND2X1 U554 ( .A(n404), .B(n400), .Y(n597) );
  MUX2X1 U555 ( .B(temp_sum[6]), .A(N286), .S(n402), .Y(n401) );
  NAND2X1 U556 ( .A(n404), .B(n401), .Y(n598) );
  MUX2X1 U557 ( .B(temp_sum[7]), .A(N287), .S(n402), .Y(n403) );
  NAND2X1 U558 ( .A(n404), .B(n403), .Y(n599) );
  NAND2X1 U559 ( .A(n24), .B(n16), .Y(n619) );
  NAND2X1 U560 ( .A(n17), .B(n20), .Y(n618) );
  NAND2X1 U561 ( .A(n9), .B(n16), .Y(n612) );
  OAI21X1 U562 ( .A(Gx[10]), .B(n612), .C(n634), .Y(n621) );
  INVX2 U563 ( .A(n609), .Y(n405) );
  NOR2X1 U564 ( .A(n406), .B(n405), .Y(n407) );
  OAI21X1 U565 ( .A(n619), .B(n408), .C(n407), .Y(n627) );
  INVX2 U566 ( .A(Gx[10]), .Y(n409) );
  OAI21X1 U567 ( .A(n612), .B(n409), .C(n618), .Y(n626) );
  INVX2 U568 ( .A(n626), .Y(n566) );
  OAI21X1 U569 ( .A(Gy[10]), .B(n619), .C(n618), .Y(n620) );
  INVX2 U570 ( .A(n635), .Y(n567) );
  INVX2 U571 ( .A(n607), .Y(n568) );
  NOR2X1 U572 ( .A(n614), .B(n613), .Y(n615) );
endmodule


module edge_detection_1_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n48, n49, n51, n54, n56, n58, n60, n102,
         n103, n104, n105, n107, n108, n109, n110, n111, n112, n113;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  XNOR2X1 U4 ( .A(n17), .B(n2), .Y(SUM[9]) );
  AOI21X1 U5 ( .A(n105), .B(n111), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n105), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n20), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n25), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n104), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n104), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n28), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n103), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n103), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n36), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n34), .B(n36), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n110), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n102), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n102), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n108), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n112), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n112), .Y(n10) );
  NAND2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  OR2X2 U77 ( .A(B[3]), .B(A[3]), .Y(n102) );
  OR2X2 U78 ( .A(B[5]), .B(A[5]), .Y(n103) );
  OR2X2 U79 ( .A(B[7]), .B(A[7]), .Y(n104) );
  OR2X2 U80 ( .A(B[9]), .B(A[9]), .Y(n105) );
  AND2X2 U81 ( .A(n51), .B(n113), .Y(SUM[0]) );
  INVX1 U82 ( .A(n44), .Y(n107) );
  INVX2 U83 ( .A(n107), .Y(n108) );
  INVX1 U84 ( .A(n41), .Y(n109) );
  INVX2 U85 ( .A(n109), .Y(n110) );
  OAI21X1 U86 ( .A(n20), .B(n18), .C(n19), .Y(n111) );
  OR2X2 U87 ( .A(B[1]), .B(A[1]), .Y(n112) );
  XNOR2X1 U88 ( .A(n12), .B(n1), .Y(SUM[10]) );
  OR2X1 U89 ( .A(B[0]), .B(A[0]), .Y(n113) );
  INVX2 U90 ( .A(n42), .Y(n60) );
  INVX2 U91 ( .A(n34), .Y(n58) );
  INVX2 U92 ( .A(n26), .Y(n56) );
  INVX2 U93 ( .A(n18), .Y(n54) );
  INVX2 U94 ( .A(n51), .Y(n49) );
  INVX2 U95 ( .A(n48), .Y(n46) );
  INVX2 U96 ( .A(n40), .Y(n38) );
  INVX2 U97 ( .A(n32), .Y(n30) );
  INVX2 U98 ( .A(n24), .Y(n22) );
  INVX2 U99 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_1_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_1_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_1_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_1_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_1_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_1_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n64), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n65), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n65), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  BUFX2 U39 ( .A(n11), .Y(n64) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n65) );
  INVX1 U41 ( .A(B[0]), .Y(n30) );
  INVX2 U42 ( .A(B[1]), .Y(n29) );
  INVX2 U43 ( .A(B[2]), .Y(n28) );
  INVX2 U44 ( .A(B[3]), .Y(n27) );
  INVX2 U45 ( .A(B[4]), .Y(n26) );
  INVX2 U46 ( .A(B[5]), .Y(n25) );
  INVX2 U47 ( .A(B[6]), .Y(n24) );
  INVX2 U48 ( .A(B[7]), .Y(n23) );
  INVX2 U49 ( .A(n17), .Y(n22) );
  INVX2 U50 ( .A(n9), .Y(n20) );
  INVX2 U51 ( .A(n15), .Y(n13) );
  INVX2 U52 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_1_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n68), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n68), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  XOR2X1 U39 ( .A(A[5]), .B(n25), .Y(n64) );
  XOR2X1 U40 ( .A(n7), .B(n64), .Y(DIFF[5]) );
  NAND2X1 U41 ( .A(n7), .B(A[5]), .Y(n65) );
  NAND2X1 U42 ( .A(n7), .B(n25), .Y(n66) );
  NAND2X1 U43 ( .A(A[5]), .B(n25), .Y(n67) );
  NAND3X1 U44 ( .A(n66), .B(n65), .C(n67), .Y(n6) );
  OR2X1 U45 ( .A(A[2]), .B(n28), .Y(n68) );
  INVX2 U46 ( .A(B[0]), .Y(n30) );
  INVX2 U47 ( .A(B[1]), .Y(n29) );
  INVX2 U48 ( .A(B[2]), .Y(n28) );
  INVX2 U49 ( .A(B[3]), .Y(n27) );
  INVX2 U50 ( .A(B[4]), .Y(n26) );
  INVX2 U51 ( .A(B[5]), .Y(n25) );
  INVX2 U52 ( .A(B[6]), .Y(n24) );
  INVX2 U53 ( .A(B[7]), .Y(n23) );
  INVX2 U54 ( .A(n17), .Y(n22) );
  INVX2 U55 ( .A(n9), .Y(n20) );
  INVX2 U56 ( .A(n15), .Y(n13) );
  INVX2 U57 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_1_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n64), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n65), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n65), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  BUFX2 U39 ( .A(n16), .Y(n64) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n65) );
  INVX2 U41 ( .A(B[0]), .Y(n30) );
  INVX2 U42 ( .A(B[1]), .Y(n29) );
  INVX2 U43 ( .A(B[2]), .Y(n28) );
  INVX2 U44 ( .A(B[3]), .Y(n27) );
  INVX2 U45 ( .A(B[4]), .Y(n26) );
  INVX2 U46 ( .A(B[5]), .Y(n25) );
  INVX2 U47 ( .A(B[6]), .Y(n24) );
  INVX2 U48 ( .A(B[7]), .Y(n23) );
  INVX2 U49 ( .A(n17), .Y(n22) );
  INVX2 U50 ( .A(n9), .Y(n20) );
  INVX2 U51 ( .A(n15), .Y(n13) );
  INVX2 U52 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_1_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_1_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  OR2X1 U39 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX2 U40 ( .A(B[0]), .Y(n30) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_1 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n569), .CLK(clk), .R(n185), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n570), .CLK(clk), .R(n185), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n185), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n571), .CLK(clk), .R(n185), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n528), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n582), .CLK(clk), .R(n184), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n184), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n184), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n420), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n419), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n418), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n417), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n416), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n415), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n414), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n413), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n412), .CLK(clk), .R(n184), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n438), .CLK(clk), .R(n183), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n437), .CLK(clk), .R(n183), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n436), .CLK(clk), .R(n183), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n435), .CLK(clk), .R(n183), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n434), .CLK(clk), .R(n183), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n433), .CLK(clk), .R(n183), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n432), .CLK(clk), .R(n183), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n431), .CLK(clk), .R(n183), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n430), .CLK(clk), .R(n183), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n536), .CLK(clk), .R(n183), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n535), .CLK(clk), .R(n183), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n534), .CLK(clk), .R(n182), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n533), .CLK(clk), .R(n182), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n532), .CLK(clk), .R(n182), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n531), .CLK(clk), .R(n182), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n530), .CLK(clk), .R(n182), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n529), .CLK(clk), .R(n182), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n487), .CLK(clk), .R(n182), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n486), .CLK(clk), .R(n182), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n483), .CLK(clk), .R(n182), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n482), .CLK(clk), .R(n182), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n480), .CLK(clk), .R(n182), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n479), .CLK(clk), .R(n182), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n478), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n477), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n469), .CLK(clk), .R(n181), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n555), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n554), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n553), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n552), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n551), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n550), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n549), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n548), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n547), .CLK(clk), .R(n181), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n546), .CLK(clk), .R(n180), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n429), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n428), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n427), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n426), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n425), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n424), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n423), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n422), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n421), .CLK(clk), .R(n180), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n466), .CLK(clk), .R(n180), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n461), .CLK(clk), .R(n180), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n452), .CLK(clk), .R(n179), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n451), .CLK(clk), .R(n179), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n444), .CLK(clk), .R(n179), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n443), .CLK(clk), .R(n179), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n441), .CLK(clk), .R(n179), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n440), .CLK(clk), .R(n179), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n439), .CLK(clk), .R(n179), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n527), .CLK(clk), .R(n179), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n526), .CLK(clk), .R(n179), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n525), .CLK(clk), .R(n179), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n524), .CLK(clk), .R(n179), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n523), .CLK(clk), .R(n179), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n520), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n518), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n517), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n488), .CLK(clk), .R(n178), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n565), .CLK(clk), .R(n178), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n564), .CLK(clk), .R(n178), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n563), .CLK(clk), .R(n178), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n562), .CLK(clk), .R(n178), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n561), .CLK(clk), .R(n178), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n560), .CLK(clk), .R(n178), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n559), .CLK(clk), .R(n178), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n558), .CLK(clk), .R(n178), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n557), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n556), .CLK(clk), .R(n177), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n572), .CLK(clk), .R(n177), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n573), .CLK(clk), .R(n177), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n574), .CLK(clk), .R(n177), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n575), .CLK(clk), .R(n177), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n576), .CLK(clk), .R(n177), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n577), .CLK(clk), .R(n177), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n578), .CLK(clk), .R(n177), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n579), .CLK(clk), .R(n177), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n580), .CLK(clk), .R(n177), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n581), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n545), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n544), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n543), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n542), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n541), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n540), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n539), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n538), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n537), .CLK(clk), .R(n176), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n591), .CLK(clk), .R(n176), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n590), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n589), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n588), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n587), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n586), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n585), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n584), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n583), .CLK(clk), .R(n175), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n592), .CLK(clk), .R(n175), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n175), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n593), .CLK(clk), .R(n175), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n175), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n594), .CLK(clk), .R(n174), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n174), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n595), .CLK(clk), .R(n174), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n174), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n596), .CLK(clk), .R(n174), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n174), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n597), .CLK(clk), .R(n174), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n174), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n598), .CLK(clk), .R(n174), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n174), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n599), .CLK(clk), .R(n174), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n174), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n632), .B(n625), .Y(n616) );
  AND2X2 U160 ( .A(n635), .B(n634), .Y(n602) );
  OR2X1 U458 ( .A(n627), .B(n626), .Y(n628) );
  NAND3X1 U459 ( .A(n625), .B(n624), .C(n410), .Y(n629) );
  OR2X1 U462 ( .A(n621), .B(n620), .Y(n622) );
  NAND3X1 U464 ( .A(n617), .B(n624), .C(n616), .Y(n623) );
  OAI21X1 U465 ( .A(n624), .B(n411), .C(n615), .Y(n571) );
  NAND2X1 U467 ( .A(n566), .B(n619), .Y(n613) );
  NAND3X1 U469 ( .A(n630), .B(n634), .C(n631), .Y(n614) );
  OR2X1 U472 ( .A(n621), .B(n627), .Y(n610) );
  NAND3X1 U475 ( .A(n631), .B(n624), .C(n608), .Y(n611) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n568), .Y(n608) );
  NAND2X1 U477 ( .A(n606), .B(n605), .Y(n624) );
  NOR2X1 U478 ( .A(n604), .B(n603), .Y(n605) );
  NAND3X1 U479 ( .A(n632), .B(n631), .C(n612), .Y(n603) );
  NAND3X1 U482 ( .A(n633), .B(n630), .C(n602), .Y(n604) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n635) );
  NOR2X1 U487 ( .A(n601), .B(n600), .Y(n606) );
  NAND3X1 U488 ( .A(n607), .B(n618), .C(n410), .Y(n600) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n607) );
  NAND3X1 U491 ( .A(n619), .B(n609), .C(n625), .Y(n601) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n625) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n609) );
  edge_detection_1_DW01_add_7 add_231 ( .A({Gx[10:2], n25, N258}), .B({
        Gy[10:2], n28, N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, 
        N285, N284, N283, N282, N281, N280}) );
  edge_detection_1_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_1_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_1_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_1_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_1_DW01_sub_8 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  edge_detection_1_DW01_sub_9 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_1_DW01_sub_10 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_1_DW01_sub_11 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_1_DW01_sub_12 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_1_DW01_sub_13 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  INVX2 U5 ( .A(n24), .Y(n25) );
  NAND2X1 U6 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U12 ( .A(n411), .B(n186), .Y(n2) );
  AND2X2 U13 ( .A(state[3]), .B(n187), .Y(n8) );
  AND2X2 U52 ( .A(state[2]), .B(n243), .Y(n9) );
  AND2X2 U128 ( .A(n243), .B(n187), .Y(n16) );
  INVX1 U155 ( .A(N269), .Y(n27) );
  AND2X2 U156 ( .A(state[1]), .B(n186), .Y(n17) );
  AND2X2 U158 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U159 ( .A(n611), .B(n610), .Y(n19) );
  OR2X2 U161 ( .A(n623), .B(n622), .Y(n20) );
  OR2X2 U162 ( .A(n629), .B(n628), .Y(n21) );
  AND2X2 U163 ( .A(state[0]), .B(n411), .Y(n22) );
  NOR2X1 U164 ( .A(n382), .B(Gy[8]), .Y(n23) );
  INVX1 U165 ( .A(n23), .Y(n387) );
  INVX4 U166 ( .A(n29), .Y(n404) );
  INVX2 U167 ( .A(Gx[1]), .Y(n24) );
  OR2X2 U168 ( .A(N258), .B(n25), .Y(n252) );
  OR2X2 U169 ( .A(n260), .B(Gx[4]), .Y(n264) );
  OR2X2 U170 ( .A(n268), .B(Gx[6]), .Y(n272) );
  OR2X2 U171 ( .A(n276), .B(Gx[8]), .Y(n280) );
  BUFX2 U172 ( .A(n331), .Y(n172) );
  BUFX2 U173 ( .A(n331), .Y(n171) );
  BUFX2 U174 ( .A(n331), .Y(n169) );
  BUFX2 U175 ( .A(n331), .Y(n170) );
  INVX2 U176 ( .A(n632), .Y(n168) );
  INVX2 U177 ( .A(n1), .Y(n390) );
  INVX2 U178 ( .A(n631), .Y(n141) );
  BUFX2 U179 ( .A(n331), .Y(n173) );
  INVX2 U180 ( .A(n633), .Y(n406) );
  AND2X2 U181 ( .A(n633), .B(n1), .Y(n26) );
  INVX2 U182 ( .A(n617), .Y(n391) );
  INVX2 U183 ( .A(N288), .Y(n30) );
  BUFX2 U184 ( .A(n_rst), .Y(n174) );
  BUFX2 U185 ( .A(n_rst), .Y(n175) );
  BUFX2 U186 ( .A(n_rst), .Y(n177) );
  BUFX2 U187 ( .A(n_rst), .Y(n178) );
  BUFX2 U188 ( .A(n_rst), .Y(n179) );
  BUFX2 U189 ( .A(n_rst), .Y(n180) );
  BUFX2 U190 ( .A(n_rst), .Y(n181) );
  BUFX2 U191 ( .A(n_rst), .Y(n182) );
  BUFX2 U192 ( .A(n_rst), .Y(n184) );
  BUFX2 U193 ( .A(n_rst), .Y(n176) );
  BUFX2 U194 ( .A(n_rst), .Y(n183) );
  BUFX2 U195 ( .A(n_rst), .Y(n185) );
  OR2X1 U196 ( .A(n252), .B(Gx[2]), .Y(n256) );
  OR2X1 U197 ( .A(n256), .B(Gx[3]), .Y(n260) );
  OR2X1 U198 ( .A(n272), .B(Gx[7]), .Y(n276) );
  BUFX2 U199 ( .A(Gy[1]), .Y(n28) );
  OR2X1 U200 ( .A(n264), .B(Gx[5]), .Y(n268) );
  INVX1 U203 ( .A(n216), .Y(n413) );
  AOI21X1 U204 ( .A(n30), .B(n65), .C(n634), .Y(n29) );
  NOR2X1 U205 ( .A(N289), .B(N290), .Y(n65) );
  INVX2 U206 ( .A(n634), .Y(n402) );
  INVX2 U207 ( .A(state[1]), .Y(n411) );
  INVX2 U208 ( .A(state[0]), .Y(n186) );
  NAND3X1 U209 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n634) );
  INVX2 U210 ( .A(state[2]), .Y(n187) );
  NAND2X1 U211 ( .A(n17), .B(n8), .Y(n633) );
  INVX2 U212 ( .A(state[3]), .Y(n243) );
  NAND2X1 U213 ( .A(n16), .B(n22), .Y(n630) );
  INVX2 U214 ( .A(n630), .Y(n331) );
  MUX2X1 U215 ( .B(N205), .A(N168), .S(n169), .Y(n188) );
  INVX2 U216 ( .A(n188), .Y(n430) );
  NAND2X1 U217 ( .A(n16), .B(n17), .Y(n631) );
  INVX2 U218 ( .A(C1[9]), .Y(n190) );
  INVX2 U219 ( .A(N205), .Y(n189) );
  MUX2X1 U220 ( .B(n190), .A(n189), .S(n141), .Y(n528) );
  MUX2X1 U221 ( .B(N204), .A(N167), .S(n169), .Y(n191) );
  INVX2 U222 ( .A(n191), .Y(n431) );
  INVX2 U223 ( .A(C1[8]), .Y(n193) );
  INVX2 U224 ( .A(N204), .Y(n192) );
  MUX2X1 U225 ( .B(n193), .A(n192), .S(n141), .Y(n529) );
  MUX2X1 U226 ( .B(N203), .A(N166), .S(n169), .Y(n194) );
  INVX2 U227 ( .A(n194), .Y(n432) );
  INVX2 U228 ( .A(C1[7]), .Y(n196) );
  INVX2 U229 ( .A(N203), .Y(n195) );
  MUX2X1 U230 ( .B(n196), .A(n195), .S(n141), .Y(n530) );
  MUX2X1 U231 ( .B(N202), .A(N165), .S(n169), .Y(n197) );
  INVX2 U232 ( .A(n197), .Y(n433) );
  INVX2 U233 ( .A(C1[6]), .Y(n199) );
  INVX2 U234 ( .A(N202), .Y(n198) );
  MUX2X1 U235 ( .B(n199), .A(n198), .S(n141), .Y(n531) );
  MUX2X1 U236 ( .B(N201), .A(N164), .S(n169), .Y(n200) );
  INVX2 U237 ( .A(n200), .Y(n434) );
  INVX2 U238 ( .A(C1[5]), .Y(n202) );
  INVX2 U239 ( .A(N201), .Y(n201) );
  MUX2X1 U240 ( .B(n202), .A(n201), .S(n141), .Y(n532) );
  MUX2X1 U241 ( .B(N200), .A(N163), .S(n169), .Y(n203) );
  INVX2 U242 ( .A(n203), .Y(n435) );
  INVX2 U243 ( .A(C1[4]), .Y(n205) );
  INVX2 U244 ( .A(N200), .Y(n204) );
  MUX2X1 U245 ( .B(n205), .A(n204), .S(n141), .Y(n533) );
  MUX2X1 U246 ( .B(N199), .A(N162), .S(n169), .Y(n206) );
  INVX2 U247 ( .A(n206), .Y(n436) );
  INVX2 U248 ( .A(C1[3]), .Y(n208) );
  INVX2 U249 ( .A(N199), .Y(n207) );
  MUX2X1 U250 ( .B(n208), .A(n207), .S(n141), .Y(n534) );
  MUX2X1 U251 ( .B(N198), .A(N161), .S(n169), .Y(n209) );
  INVX2 U252 ( .A(n209), .Y(n437) );
  INVX2 U253 ( .A(C1[2]), .Y(n211) );
  INVX2 U254 ( .A(N198), .Y(n210) );
  MUX2X1 U255 ( .B(n211), .A(n210), .S(n141), .Y(n535) );
  MUX2X1 U256 ( .B(N197), .A(N160), .S(n169), .Y(n212) );
  INVX2 U257 ( .A(n212), .Y(n438) );
  INVX2 U258 ( .A(C1[1]), .Y(n214) );
  INVX2 U259 ( .A(N197), .Y(n213) );
  MUX2X1 U260 ( .B(n214), .A(n213), .S(n141), .Y(n536) );
  MUX2X1 U261 ( .B(A1[8]), .A(N150), .S(n169), .Y(n215) );
  INVX2 U262 ( .A(n215), .Y(n412) );
  MUX2X1 U263 ( .B(A1[7]), .A(N149), .S(n169), .Y(n216) );
  MUX2X1 U264 ( .B(A1[6]), .A(N148), .S(n169), .Y(n217) );
  INVX2 U265 ( .A(n217), .Y(n414) );
  MUX2X1 U266 ( .B(A1[5]), .A(N147), .S(n169), .Y(n218) );
  INVX2 U267 ( .A(n218), .Y(n415) );
  MUX2X1 U268 ( .B(A1[4]), .A(N146), .S(n170), .Y(n219) );
  INVX2 U269 ( .A(n219), .Y(n416) );
  MUX2X1 U270 ( .B(A1[3]), .A(N145), .S(n170), .Y(n220) );
  INVX2 U271 ( .A(n220), .Y(n417) );
  MUX2X1 U272 ( .B(A1[2]), .A(N144), .S(n170), .Y(n221) );
  INVX2 U273 ( .A(n221), .Y(n418) );
  MUX2X1 U274 ( .B(A1[1]), .A(N143), .S(n170), .Y(n222) );
  INVX2 U275 ( .A(n222), .Y(n419) );
  MUX2X1 U276 ( .B(A1[0]), .A(N142), .S(n170), .Y(n223) );
  INVX2 U277 ( .A(n223), .Y(n420) );
  MUX2X1 U278 ( .B(D1[8]), .A(N186), .S(n170), .Y(n224) );
  INVX2 U279 ( .A(n224), .Y(n469) );
  MUX2X1 U280 ( .B(D1[7]), .A(N185), .S(n170), .Y(n225) );
  INVX2 U281 ( .A(n225), .Y(n477) );
  MUX2X1 U282 ( .B(D1[6]), .A(N184), .S(n170), .Y(n226) );
  INVX2 U283 ( .A(n226), .Y(n478) );
  MUX2X1 U284 ( .B(D1[5]), .A(N183), .S(n170), .Y(n227) );
  INVX2 U285 ( .A(n227), .Y(n479) );
  MUX2X1 U286 ( .B(D1[4]), .A(N182), .S(n170), .Y(n228) );
  INVX2 U287 ( .A(n228), .Y(n480) );
  MUX2X1 U288 ( .B(D1[3]), .A(N181), .S(n170), .Y(n229) );
  INVX2 U289 ( .A(n229), .Y(n482) );
  MUX2X1 U290 ( .B(D1[2]), .A(N180), .S(n170), .Y(n230) );
  INVX2 U291 ( .A(n230), .Y(n483) );
  MUX2X1 U292 ( .B(D1[1]), .A(N179), .S(n170), .Y(n231) );
  INVX2 U293 ( .A(n231), .Y(n486) );
  MUX2X1 U294 ( .B(D1[0]), .A(N178), .S(n171), .Y(n232) );
  INVX2 U295 ( .A(n232), .Y(n487) );
  NAND2X1 U296 ( .A(n16), .B(n18), .Y(n632) );
  MUX2X1 U297 ( .B(E1[9]), .A(N225), .S(n168), .Y(n233) );
  INVX2 U298 ( .A(n233), .Y(n546) );
  MUX2X1 U299 ( .B(E1[8]), .A(N224), .S(n168), .Y(n234) );
  INVX2 U300 ( .A(n234), .Y(n547) );
  MUX2X1 U301 ( .B(E1[7]), .A(N223), .S(n168), .Y(n235) );
  INVX2 U302 ( .A(n235), .Y(n548) );
  MUX2X1 U303 ( .B(E1[6]), .A(N222), .S(n168), .Y(n236) );
  INVX2 U304 ( .A(n236), .Y(n549) );
  MUX2X1 U305 ( .B(E1[5]), .A(N221), .S(n168), .Y(n237) );
  INVX2 U306 ( .A(n237), .Y(n550) );
  MUX2X1 U307 ( .B(E1[4]), .A(N220), .S(n168), .Y(n238) );
  INVX2 U308 ( .A(n238), .Y(n551) );
  MUX2X1 U309 ( .B(E1[3]), .A(N219), .S(n168), .Y(n239) );
  INVX2 U310 ( .A(n239), .Y(n552) );
  MUX2X1 U311 ( .B(E1[2]), .A(N218), .S(n168), .Y(n240) );
  INVX2 U312 ( .A(n240), .Y(n553) );
  MUX2X1 U313 ( .B(E1[1]), .A(N217), .S(n168), .Y(n241) );
  INVX2 U314 ( .A(n241), .Y(n554) );
  MUX2X1 U315 ( .B(E1[0]), .A(N216), .S(n168), .Y(n242) );
  INVX2 U316 ( .A(n242), .Y(n555) );
  INVX2 U317 ( .A(N236), .Y(n245) );
  OAI21X1 U318 ( .A(n406), .B(n26), .C(N258), .Y(n244) );
  OAI21X1 U319 ( .A(n1), .B(n245), .C(n244), .Y(n572) );
  INVX2 U320 ( .A(N237), .Y(n248) );
  XOR2X1 U321 ( .A(n25), .B(N258), .Y(n246) );
  AOI22X1 U322 ( .A(n246), .B(n406), .C(n25), .D(n26), .Y(n247) );
  OAI21X1 U323 ( .A(n1), .B(n248), .C(n247), .Y(n573) );
  INVX2 U324 ( .A(N238), .Y(n251) );
  XOR2X1 U325 ( .A(n252), .B(Gx[2]), .Y(n249) );
  AOI22X1 U326 ( .A(n249), .B(n406), .C(Gx[2]), .D(n26), .Y(n250) );
  OAI21X1 U327 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U328 ( .A(N239), .Y(n255) );
  XOR2X1 U329 ( .A(n256), .B(Gx[3]), .Y(n253) );
  AOI22X1 U330 ( .A(n253), .B(n406), .C(Gx[3]), .D(n26), .Y(n254) );
  OAI21X1 U331 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U332 ( .A(N240), .Y(n259) );
  XOR2X1 U333 ( .A(n260), .B(Gx[4]), .Y(n257) );
  AOI22X1 U334 ( .A(n257), .B(n406), .C(Gx[4]), .D(n26), .Y(n258) );
  OAI21X1 U335 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U336 ( .A(N241), .Y(n263) );
  XOR2X1 U337 ( .A(n264), .B(Gx[5]), .Y(n261) );
  AOI22X1 U338 ( .A(n261), .B(n406), .C(Gx[5]), .D(n26), .Y(n262) );
  OAI21X1 U339 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U340 ( .A(N242), .Y(n267) );
  XOR2X1 U341 ( .A(n268), .B(Gx[6]), .Y(n265) );
  AOI22X1 U342 ( .A(n265), .B(n406), .C(Gx[6]), .D(n26), .Y(n266) );
  OAI21X1 U343 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U344 ( .A(N243), .Y(n271) );
  XOR2X1 U345 ( .A(n272), .B(Gx[7]), .Y(n269) );
  AOI22X1 U346 ( .A(n269), .B(n406), .C(Gx[7]), .D(n26), .Y(n270) );
  OAI21X1 U347 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  INVX2 U348 ( .A(N244), .Y(n275) );
  XOR2X1 U349 ( .A(n276), .B(Gx[8]), .Y(n273) );
  AOI22X1 U350 ( .A(n273), .B(n406), .C(Gx[8]), .D(n26), .Y(n274) );
  OAI21X1 U351 ( .A(n1), .B(n275), .C(n274), .Y(n580) );
  INVX2 U352 ( .A(N245), .Y(n279) );
  XOR2X1 U353 ( .A(n280), .B(Gx[9]), .Y(n277) );
  AOI22X1 U354 ( .A(n277), .B(n406), .C(Gx[9]), .D(n26), .Y(n278) );
  OAI21X1 U355 ( .A(n1), .B(n279), .C(n278), .Y(n581) );
  NOR2X1 U356 ( .A(Gx[9]), .B(n280), .Y(n281) );
  XNOR2X1 U357 ( .A(n281), .B(Gx[10]), .Y(n282) );
  AOI22X1 U358 ( .A(n26), .B(Gx[10]), .C(n282), .D(n406), .Y(n284) );
  NAND2X1 U359 ( .A(N246), .B(n390), .Y(n283) );
  NAND2X1 U360 ( .A(n284), .B(n283), .Y(n582) );
  NAND2X1 U361 ( .A(n8), .B(n18), .Y(n617) );
  MUX2X1 U362 ( .B(N215), .A(N177), .S(n171), .Y(n285) );
  INVX2 U363 ( .A(n285), .Y(n439) );
  INVX2 U364 ( .A(C2[9]), .Y(n287) );
  INVX2 U365 ( .A(N215), .Y(n286) );
  MUX2X1 U366 ( .B(n287), .A(n286), .S(n141), .Y(n537) );
  MUX2X1 U367 ( .B(N214), .A(N176), .S(n171), .Y(n288) );
  INVX2 U368 ( .A(n288), .Y(n440) );
  INVX2 U369 ( .A(C2[8]), .Y(n290) );
  INVX2 U370 ( .A(N214), .Y(n289) );
  MUX2X1 U371 ( .B(n290), .A(n289), .S(n141), .Y(n538) );
  MUX2X1 U372 ( .B(N213), .A(N175), .S(n171), .Y(n291) );
  INVX2 U373 ( .A(n291), .Y(n441) );
  INVX2 U374 ( .A(C2[7]), .Y(n293) );
  INVX2 U375 ( .A(N213), .Y(n292) );
  MUX2X1 U376 ( .B(n293), .A(n292), .S(n141), .Y(n539) );
  MUX2X1 U377 ( .B(N212), .A(N174), .S(n171), .Y(n294) );
  INVX2 U378 ( .A(n294), .Y(n443) );
  INVX2 U379 ( .A(C2[6]), .Y(n296) );
  INVX2 U380 ( .A(N212), .Y(n295) );
  MUX2X1 U381 ( .B(n296), .A(n295), .S(n141), .Y(n540) );
  MUX2X1 U382 ( .B(N211), .A(N173), .S(n171), .Y(n297) );
  INVX2 U383 ( .A(n297), .Y(n444) );
  INVX2 U384 ( .A(C2[5]), .Y(n299) );
  INVX2 U385 ( .A(N211), .Y(n298) );
  MUX2X1 U386 ( .B(n299), .A(n298), .S(n141), .Y(n541) );
  MUX2X1 U387 ( .B(N210), .A(N172), .S(n171), .Y(n300) );
  INVX2 U388 ( .A(n300), .Y(n451) );
  INVX2 U389 ( .A(C2[4]), .Y(n302) );
  INVX2 U390 ( .A(N210), .Y(n301) );
  MUX2X1 U391 ( .B(n302), .A(n301), .S(n141), .Y(n542) );
  MUX2X1 U392 ( .B(N209), .A(N171), .S(n171), .Y(n304) );
  INVX2 U393 ( .A(n304), .Y(n452) );
  INVX2 U394 ( .A(C2[3]), .Y(n306) );
  INVX2 U395 ( .A(N209), .Y(n305) );
  MUX2X1 U396 ( .B(n306), .A(n305), .S(n141), .Y(n543) );
  MUX2X1 U397 ( .B(N208), .A(N170), .S(n171), .Y(n307) );
  INVX2 U398 ( .A(n307), .Y(n461) );
  INVX2 U399 ( .A(C2[2]), .Y(n309) );
  INVX2 U400 ( .A(N208), .Y(n308) );
  MUX2X1 U401 ( .B(n309), .A(n308), .S(n141), .Y(n544) );
  MUX2X1 U402 ( .B(N207), .A(N169), .S(n171), .Y(n310) );
  INVX2 U403 ( .A(n310), .Y(n466) );
  INVX2 U404 ( .A(C2[1]), .Y(n312) );
  INVX2 U405 ( .A(N207), .Y(n311) );
  MUX2X1 U406 ( .B(n312), .A(n311), .S(n141), .Y(n545) );
  MUX2X1 U407 ( .B(A2[8]), .A(N159), .S(n171), .Y(n313) );
  INVX2 U408 ( .A(n313), .Y(n421) );
  MUX2X1 U409 ( .B(A2[7]), .A(N158), .S(n171), .Y(n314) );
  INVX2 U410 ( .A(n314), .Y(n422) );
  MUX2X1 U411 ( .B(A2[6]), .A(N157), .S(n171), .Y(n316) );
  INVX2 U412 ( .A(n316), .Y(n423) );
  MUX2X1 U413 ( .B(A2[5]), .A(N156), .S(n172), .Y(n317) );
  INVX2 U414 ( .A(n317), .Y(n424) );
  MUX2X1 U415 ( .B(A2[4]), .A(N155), .S(n172), .Y(n318) );
  INVX2 U416 ( .A(n318), .Y(n425) );
  MUX2X1 U417 ( .B(A2[3]), .A(N154), .S(n172), .Y(n319) );
  INVX2 U418 ( .A(n319), .Y(n426) );
  MUX2X1 U419 ( .B(A2[2]), .A(N153), .S(n172), .Y(n320) );
  INVX2 U420 ( .A(n320), .Y(n427) );
  MUX2X1 U421 ( .B(A2[1]), .A(N152), .S(n172), .Y(n321) );
  INVX2 U422 ( .A(n321), .Y(n428) );
  MUX2X1 U423 ( .B(A2[0]), .A(N151), .S(n172), .Y(n322) );
  INVX2 U424 ( .A(n322), .Y(n429) );
  MUX2X1 U425 ( .B(D2[8]), .A(N195), .S(n172), .Y(n323) );
  INVX2 U426 ( .A(n323), .Y(n488) );
  MUX2X1 U427 ( .B(D2[7]), .A(N194), .S(n172), .Y(n324) );
  INVX2 U428 ( .A(n324), .Y(n517) );
  MUX2X1 U429 ( .B(D2[6]), .A(N193), .S(n172), .Y(n325) );
  INVX2 U430 ( .A(n325), .Y(n518) );
  MUX2X1 U431 ( .B(D2[5]), .A(N192), .S(n172), .Y(n326) );
  INVX2 U432 ( .A(n326), .Y(n520) );
  MUX2X1 U433 ( .B(D2[4]), .A(N191), .S(n172), .Y(n327) );
  INVX2 U434 ( .A(n327), .Y(n523) );
  MUX2X1 U435 ( .B(D2[3]), .A(N190), .S(n172), .Y(n328) );
  INVX2 U436 ( .A(n328), .Y(n524) );
  MUX2X1 U437 ( .B(D2[2]), .A(N189), .S(n172), .Y(n329) );
  INVX2 U438 ( .A(n329), .Y(n525) );
  MUX2X1 U439 ( .B(D2[1]), .A(N188), .S(n173), .Y(n330) );
  INVX2 U440 ( .A(n330), .Y(n526) );
  MUX2X1 U441 ( .B(D2[0]), .A(N187), .S(n173), .Y(n332) );
  INVX2 U442 ( .A(n332), .Y(n527) );
  MUX2X1 U443 ( .B(E2[9]), .A(N235), .S(n168), .Y(n333) );
  INVX2 U444 ( .A(n333), .Y(n556) );
  MUX2X1 U445 ( .B(E2[8]), .A(N234), .S(n168), .Y(n334) );
  INVX2 U446 ( .A(n334), .Y(n557) );
  MUX2X1 U447 ( .B(E2[7]), .A(N233), .S(n168), .Y(n335) );
  INVX2 U448 ( .A(n335), .Y(n558) );
  MUX2X1 U449 ( .B(E2[6]), .A(N232), .S(n168), .Y(n336) );
  INVX2 U450 ( .A(n336), .Y(n559) );
  MUX2X1 U451 ( .B(E2[5]), .A(N231), .S(n168), .Y(n337) );
  INVX2 U452 ( .A(n337), .Y(n560) );
  MUX2X1 U453 ( .B(E2[4]), .A(N230), .S(n168), .Y(n338) );
  INVX2 U454 ( .A(n338), .Y(n561) );
  MUX2X1 U455 ( .B(E2[3]), .A(N229), .S(n168), .Y(n339) );
  INVX2 U456 ( .A(n339), .Y(n562) );
  MUX2X1 U457 ( .B(E2[2]), .A(N228), .S(n168), .Y(n340) );
  INVX2 U460 ( .A(n340), .Y(n563) );
  MUX2X1 U461 ( .B(E2[1]), .A(N227), .S(n168), .Y(n342) );
  INVX2 U463 ( .A(n342), .Y(n564) );
  MUX2X1 U466 ( .B(E2[0]), .A(N226), .S(n168), .Y(n343) );
  INVX2 U468 ( .A(n343), .Y(n565) );
  INVX2 U470 ( .A(N247), .Y(n345) );
  NAND2X1 U471 ( .A(n1), .B(n617), .Y(n394) );
  INVX2 U473 ( .A(n394), .Y(n410) );
  OAI21X1 U474 ( .A(n391), .B(n410), .C(N269), .Y(n344) );
  OAI21X1 U480 ( .A(n1), .B(n345), .C(n344), .Y(n569) );
  INVX2 U481 ( .A(n28), .Y(n348) );
  XOR2X1 U483 ( .A(n28), .B(N269), .Y(n346) );
  AOI22X1 U485 ( .A(n346), .B(n391), .C(N248), .D(n390), .Y(n347) );
  OAI21X1 U486 ( .A(n394), .B(n348), .C(n347), .Y(n591) );
  INVX2 U489 ( .A(Gy[2]), .Y(n352) );
  NAND2X1 U494 ( .A(n27), .B(n348), .Y(n351) );
  XOR2X1 U495 ( .A(n351), .B(Gy[2]), .Y(n349) );
  AOI22X1 U496 ( .A(n349), .B(n391), .C(N249), .D(n390), .Y(n350) );
  OAI21X1 U497 ( .A(n394), .B(n352), .C(n350), .Y(n590) );
  INVX2 U498 ( .A(Gy[3]), .Y(n357) );
  INVX2 U499 ( .A(n351), .Y(n353) );
  NAND2X1 U500 ( .A(n353), .B(n352), .Y(n356) );
  XOR2X1 U501 ( .A(n356), .B(Gy[3]), .Y(n354) );
  AOI22X1 U502 ( .A(n354), .B(n391), .C(N250), .D(n390), .Y(n355) );
  OAI21X1 U503 ( .A(n394), .B(n357), .C(n355), .Y(n589) );
  INVX2 U504 ( .A(Gy[4]), .Y(n362) );
  INVX2 U505 ( .A(n356), .Y(n358) );
  NAND2X1 U506 ( .A(n358), .B(n357), .Y(n361) );
  XOR2X1 U507 ( .A(n361), .B(Gy[4]), .Y(n359) );
  AOI22X1 U508 ( .A(n359), .B(n391), .C(N251), .D(n390), .Y(n360) );
  OAI21X1 U509 ( .A(n394), .B(n362), .C(n360), .Y(n588) );
  INVX2 U510 ( .A(Gy[5]), .Y(n368) );
  INVX2 U511 ( .A(n361), .Y(n363) );
  NAND2X1 U512 ( .A(n363), .B(n362), .Y(n367) );
  XOR2X1 U513 ( .A(n367), .B(Gy[5]), .Y(n365) );
  AOI22X1 U514 ( .A(n365), .B(n391), .C(N252), .D(n390), .Y(n366) );
  OAI21X1 U515 ( .A(n394), .B(n368), .C(n366), .Y(n587) );
  INVX2 U516 ( .A(Gy[6]), .Y(n373) );
  INVX2 U517 ( .A(n367), .Y(n369) );
  NAND2X1 U518 ( .A(n369), .B(n368), .Y(n372) );
  XOR2X1 U519 ( .A(n372), .B(Gy[6]), .Y(n370) );
  AOI22X1 U520 ( .A(n370), .B(n391), .C(N253), .D(n390), .Y(n371) );
  OAI21X1 U521 ( .A(n394), .B(n373), .C(n371), .Y(n586) );
  INVX2 U522 ( .A(Gy[7]), .Y(n378) );
  INVX2 U523 ( .A(n372), .Y(n374) );
  NAND2X1 U524 ( .A(n374), .B(n373), .Y(n377) );
  XOR2X1 U525 ( .A(n377), .B(Gy[7]), .Y(n375) );
  AOI22X1 U526 ( .A(n375), .B(n391), .C(N254), .D(n390), .Y(n376) );
  OAI21X1 U527 ( .A(n394), .B(n378), .C(n376), .Y(n585) );
  INVX2 U528 ( .A(Gy[8]), .Y(n383) );
  INVX2 U529 ( .A(n377), .Y(n379) );
  NAND2X1 U530 ( .A(n379), .B(n378), .Y(n382) );
  XOR2X1 U531 ( .A(n382), .B(Gy[8]), .Y(n380) );
  AOI22X1 U532 ( .A(n380), .B(n391), .C(N255), .D(n390), .Y(n381) );
  OAI21X1 U533 ( .A(n394), .B(n383), .C(n381), .Y(n584) );
  INVX2 U534 ( .A(Gy[9]), .Y(n388) );
  XOR2X1 U535 ( .A(n387), .B(Gy[9]), .Y(n384) );
  AOI22X1 U536 ( .A(n384), .B(n391), .C(N256), .D(n390), .Y(n385) );
  OAI21X1 U537 ( .A(n394), .B(n388), .C(n385), .Y(n583) );
  INVX2 U538 ( .A(Gy[10]), .Y(n408) );
  NAND2X1 U539 ( .A(n23), .B(n388), .Y(n389) );
  XOR2X1 U540 ( .A(n389), .B(Gy[10]), .Y(n392) );
  AOI22X1 U541 ( .A(n392), .B(n391), .C(N257), .D(n390), .Y(n393) );
  OAI21X1 U542 ( .A(n408), .B(n394), .C(n393), .Y(n570) );
  MUX2X1 U543 ( .B(temp_sum[0]), .A(N280), .S(n402), .Y(n395) );
  NAND2X1 U544 ( .A(n404), .B(n395), .Y(n592) );
  MUX2X1 U545 ( .B(temp_sum[1]), .A(N281), .S(n402), .Y(n396) );
  NAND2X1 U546 ( .A(n404), .B(n396), .Y(n593) );
  MUX2X1 U547 ( .B(temp_sum[2]), .A(N282), .S(n402), .Y(n397) );
  NAND2X1 U548 ( .A(n404), .B(n397), .Y(n594) );
  MUX2X1 U549 ( .B(temp_sum[3]), .A(N283), .S(n402), .Y(n398) );
  NAND2X1 U550 ( .A(n404), .B(n398), .Y(n595) );
  MUX2X1 U551 ( .B(temp_sum[4]), .A(N284), .S(n402), .Y(n399) );
  NAND2X1 U552 ( .A(n404), .B(n399), .Y(n596) );
  MUX2X1 U553 ( .B(temp_sum[5]), .A(N285), .S(n402), .Y(n400) );
  NAND2X1 U554 ( .A(n404), .B(n400), .Y(n597) );
  MUX2X1 U555 ( .B(temp_sum[6]), .A(N286), .S(n402), .Y(n401) );
  NAND2X1 U556 ( .A(n404), .B(n401), .Y(n598) );
  MUX2X1 U557 ( .B(temp_sum[7]), .A(N287), .S(n402), .Y(n403) );
  NAND2X1 U558 ( .A(n404), .B(n403), .Y(n599) );
  NAND2X1 U559 ( .A(n22), .B(n8), .Y(n619) );
  NAND2X1 U560 ( .A(n9), .B(n18), .Y(n618) );
  NAND2X1 U561 ( .A(n2), .B(n8), .Y(n612) );
  OAI21X1 U562 ( .A(Gx[10]), .B(n612), .C(n634), .Y(n621) );
  INVX2 U563 ( .A(n609), .Y(n405) );
  NOR2X1 U564 ( .A(n406), .B(n405), .Y(n407) );
  OAI21X1 U565 ( .A(n619), .B(n408), .C(n407), .Y(n627) );
  INVX2 U566 ( .A(Gx[10]), .Y(n409) );
  OAI21X1 U567 ( .A(n612), .B(n409), .C(n618), .Y(n626) );
  INVX2 U568 ( .A(n626), .Y(n566) );
  OAI21X1 U569 ( .A(Gy[10]), .B(n619), .C(n618), .Y(n620) );
  INVX2 U570 ( .A(n635), .Y(n567) );
  INVX2 U571 ( .A(n607), .Y(n568) );
  NOR2X1 U572 ( .A(n614), .B(n613), .Y(n615) );
endmodule


module edge_detection_0_DW01_add_7 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35, n36, n38,
         n40, n41, n42, n43, n44, n46, n48, n49, n51, n54, n56, n58, n60, n102,
         n103, n104, n105, n107, n108, n109, n110, n111, n112;

  XOR2X1 U2 ( .A(A[10]), .B(B[10]), .Y(n1) );
  XNOR2X1 U4 ( .A(n109), .B(n2), .Y(SUM[9]) );
  AOI21X1 U5 ( .A(n105), .B(n17), .C(n14), .Y(n12) );
  NAND2X1 U8 ( .A(n16), .B(n105), .Y(n2) );
  NAND2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n16) );
  XOR2X1 U12 ( .A(n20), .B(n3), .Y(SUM[8]) );
  OAI21X1 U13 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U14 ( .A(n19), .B(n54), .Y(n3) );
  NOR2X1 U16 ( .A(B[8]), .B(A[8]), .Y(n18) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n19) );
  XNOR2X1 U18 ( .A(n108), .B(n4), .Y(SUM[7]) );
  AOI21X1 U19 ( .A(n104), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U22 ( .A(n24), .B(n104), .Y(n4) );
  NAND2X1 U25 ( .A(B[7]), .B(A[7]), .Y(n24) );
  XOR2X1 U26 ( .A(n28), .B(n5), .Y(SUM[6]) );
  OAI21X1 U27 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U28 ( .A(n27), .B(n56), .Y(n5) );
  NOR2X1 U30 ( .A(B[6]), .B(A[6]), .Y(n26) );
  NAND2X1 U31 ( .A(B[6]), .B(A[6]), .Y(n27) );
  XNOR2X1 U32 ( .A(n33), .B(n6), .Y(SUM[5]) );
  AOI21X1 U33 ( .A(n103), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U36 ( .A(n32), .B(n103), .Y(n6) );
  NAND2X1 U39 ( .A(B[5]), .B(A[5]), .Y(n32) );
  XOR2X1 U40 ( .A(n36), .B(n7), .Y(SUM[4]) );
  OAI21X1 U41 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U42 ( .A(n35), .B(n58), .Y(n7) );
  NOR2X1 U44 ( .A(B[4]), .B(A[4]), .Y(n34) );
  NAND2X1 U45 ( .A(B[4]), .B(A[4]), .Y(n35) );
  XNOR2X1 U46 ( .A(n110), .B(n8), .Y(SUM[3]) );
  AOI21X1 U47 ( .A(n102), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U50 ( .A(n40), .B(n102), .Y(n8) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n40) );
  XOR2X1 U54 ( .A(n44), .B(n9), .Y(SUM[2]) );
  OAI21X1 U55 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U56 ( .A(n43), .B(n60), .Y(n9) );
  NOR2X1 U58 ( .A(B[2]), .B(A[2]), .Y(n42) );
  NAND2X1 U59 ( .A(B[2]), .B(A[2]), .Y(n43) );
  XNOR2X1 U60 ( .A(n10), .B(n49), .Y(SUM[1]) );
  AOI21X1 U61 ( .A(n49), .B(n111), .C(n46), .Y(n44) );
  NAND2X1 U64 ( .A(n48), .B(n111), .Y(n10) );
  NAND2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n48) );
  NAND2X1 U73 ( .A(B[0]), .B(A[0]), .Y(n51) );
  OR2X2 U77 ( .A(B[3]), .B(A[3]), .Y(n102) );
  OR2X2 U78 ( .A(B[5]), .B(A[5]), .Y(n103) );
  OR2X2 U79 ( .A(B[7]), .B(A[7]), .Y(n104) );
  OR2X2 U80 ( .A(B[9]), .B(A[9]), .Y(n105) );
  AND2X2 U81 ( .A(n51), .B(n112), .Y(SUM[0]) );
  INVX1 U82 ( .A(n25), .Y(n107) );
  INVX2 U83 ( .A(n107), .Y(n108) );
  OAI21X1 U84 ( .A(n20), .B(n18), .C(n19), .Y(n109) );
  BUFX2 U85 ( .A(n41), .Y(n110) );
  OR2X2 U86 ( .A(B[1]), .B(A[1]), .Y(n111) );
  OR2X2 U87 ( .A(B[0]), .B(A[0]), .Y(n112) );
  XNOR2X1 U88 ( .A(n12), .B(n1), .Y(SUM[10]) );
  INVX2 U89 ( .A(n42), .Y(n60) );
  INVX2 U90 ( .A(n34), .Y(n58) );
  INVX2 U91 ( .A(n26), .Y(n56) );
  INVX2 U92 ( .A(n18), .Y(n54) );
  INVX2 U93 ( .A(n51), .Y(n49) );
  INVX2 U94 ( .A(n48), .Y(n46) );
  INVX2 U95 ( .A(n40), .Y(n38) );
  INVX2 U96 ( .A(n32), .Y(n30) );
  INVX2 U97 ( .A(n24), .Y(n22) );
  INVX2 U98 ( .A(n16), .Y(n14) );
endmodule


module edge_detection_0_DW01_add_8 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_0_DW01_add_9 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n21, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n37, n39,
         n41, n43, n45, n46, \B[0] , n84, n85, n86;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U2 ( .A(n45), .B(n46), .C(n9), .YC(n8), .YS(SUM[9]) );
  FAX1 U3 ( .A(B[8]), .B(A[8]), .C(n10), .YC(n9), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[7]), .B(A[7]), .C(n37), .YC(n10), .YS(SUM[7]) );
  XNOR2X1 U6 ( .A(n16), .B(n1), .Y(SUM[6]) );
  AOI21X1 U7 ( .A(n86), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U10 ( .A(n15), .B(n86), .Y(n1) );
  NAND2X1 U13 ( .A(B[6]), .B(A[6]), .Y(n15) );
  XOR2X1 U14 ( .A(n19), .B(n2), .Y(SUM[5]) );
  OAI21X1 U15 ( .A(n19), .B(n17), .C(n18), .Y(n16) );
  NAND2X1 U16 ( .A(n18), .B(n39), .Y(n2) );
  NOR2X1 U18 ( .A(B[5]), .B(A[5]), .Y(n17) );
  NAND2X1 U19 ( .A(B[5]), .B(A[5]), .Y(n18) );
  XNOR2X1 U20 ( .A(n24), .B(n3), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n85), .B(n24), .C(n21), .Y(n19) );
  NAND2X1 U24 ( .A(n23), .B(n85), .Y(n3) );
  NAND2X1 U27 ( .A(B[4]), .B(A[4]), .Y(n23) );
  XOR2X1 U28 ( .A(n27), .B(n4), .Y(SUM[3]) );
  OAI21X1 U29 ( .A(n27), .B(n25), .C(n26), .Y(n24) );
  NAND2X1 U30 ( .A(n26), .B(n41), .Y(n4) );
  NOR2X1 U32 ( .A(B[3]), .B(A[3]), .Y(n25) );
  NAND2X1 U33 ( .A(B[3]), .B(A[3]), .Y(n26) );
  XNOR2X1 U34 ( .A(n32), .B(n5), .Y(SUM[2]) );
  AOI21X1 U35 ( .A(n84), .B(n32), .C(n29), .Y(n27) );
  NAND2X1 U38 ( .A(n31), .B(n84), .Y(n5) );
  NAND2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n31) );
  NAND2X1 U44 ( .A(n34), .B(n43), .Y(n6) );
  NOR2X1 U46 ( .A(B[1]), .B(A[1]), .Y(n33) );
  NAND2X1 U47 ( .A(B[1]), .B(A[1]), .Y(n34) );
  INVX2 U58 ( .A(n34), .Y(n32) );
  INVX2 U59 ( .A(n6), .Y(SUM[1]) );
  OR2X2 U60 ( .A(B[2]), .B(A[2]), .Y(n84) );
  OR2X2 U61 ( .A(B[4]), .B(A[4]), .Y(n85) );
  OR2X2 U62 ( .A(B[6]), .B(A[6]), .Y(n86) );
  INVX2 U63 ( .A(A[10]), .Y(n46) );
  INVX2 U64 ( .A(B[10]), .Y(n45) );
  INVX2 U65 ( .A(n33), .Y(n43) );
  INVX2 U66 ( .A(n25), .Y(n41) );
  INVX2 U67 ( .A(n17), .Y(n39) );
  INVX2 U68 ( .A(n11), .Y(n37) );
  INVX2 U69 ( .A(n31), .Y(n29) );
  INVX2 U70 ( .A(n23), .Y(n21) );
  INVX2 U71 ( .A(n15), .Y(n13) );
  INVX2 U72 ( .A(n8), .Y(SUM[10]) );
endmodule


module edge_detection_0_DW01_add_10 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77, n78;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  FAX1 U5 ( .A(B[5]), .B(A[5]), .C(n28), .YC(n9), .YS(SUM[5]) );
  XNOR2X1 U7 ( .A(n77), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n78), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[7]), .B(A[7]), .Y(n73) );
  XOR2X1 U49 ( .A(n8), .B(n73), .Y(SUM[7]) );
  NAND2X1 U50 ( .A(n8), .B(B[7]), .Y(n74) );
  NAND2X1 U51 ( .A(n8), .B(A[7]), .Y(n75) );
  NAND2X1 U52 ( .A(B[7]), .B(A[7]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n7) );
  OAI21X1 U54 ( .A(n18), .B(n16), .C(n17), .Y(n77) );
  OR2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n78) );
  INVX2 U56 ( .A(A[9]), .Y(n35) );
  INVX2 U57 ( .A(B[9]), .Y(n34) );
  INVX2 U58 ( .A(n24), .Y(n32) );
  INVX2 U59 ( .A(n16), .Y(n30) );
  INVX2 U60 ( .A(n10), .Y(n28) );
  INVX2 U61 ( .A(n22), .Y(n20) );
  INVX2 U62 ( .A(n14), .Y(n12) );
  INVX2 U63 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_0_DW01_add_11 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n12, n14, n15, n16, n17, n18,
         n20, n22, n23, n24, n25, n27, n28, n30, n32, n34, n35, n70, n71, n73,
         n74, n75, n76, n77;

  FAX1 U2 ( .A(n34), .B(n35), .C(n7), .YC(n6), .YS(SUM[8]) );
  FAX1 U3 ( .A(B[7]), .B(A[7]), .C(n8), .YC(n7), .YS(SUM[7]) );
  FAX1 U4 ( .A(B[6]), .B(A[6]), .C(n9), .YC(n8), .YS(SUM[6]) );
  XNOR2X1 U7 ( .A(n15), .B(n1), .Y(SUM[4]) );
  AOI21X1 U8 ( .A(n71), .B(n15), .C(n12), .Y(n10) );
  NAND2X1 U11 ( .A(n14), .B(n71), .Y(n1) );
  NAND2X1 U14 ( .A(B[4]), .B(A[4]), .Y(n14) );
  XOR2X1 U15 ( .A(n18), .B(n2), .Y(SUM[3]) );
  OAI21X1 U16 ( .A(n18), .B(n16), .C(n17), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n30), .Y(n2) );
  NOR2X1 U19 ( .A(B[3]), .B(A[3]), .Y(n16) );
  NAND2X1 U20 ( .A(B[3]), .B(A[3]), .Y(n17) );
  XNOR2X1 U21 ( .A(n23), .B(n3), .Y(SUM[2]) );
  AOI21X1 U22 ( .A(n70), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U25 ( .A(n22), .B(n70), .Y(n3) );
  NAND2X1 U28 ( .A(B[2]), .B(A[2]), .Y(n22) );
  XOR2X1 U29 ( .A(n4), .B(n27), .Y(SUM[1]) );
  OAI21X1 U30 ( .A(n24), .B(n27), .C(n25), .Y(n23) );
  NAND2X1 U31 ( .A(n25), .B(n32), .Y(n4) );
  NOR2X1 U33 ( .A(B[1]), .B(A[1]), .Y(n24) );
  NAND2X1 U34 ( .A(B[1]), .B(A[1]), .Y(n25) );
  NAND2X1 U39 ( .A(B[0]), .B(A[0]), .Y(n27) );
  OR2X2 U45 ( .A(B[2]), .B(A[2]), .Y(n70) );
  OR2X2 U46 ( .A(B[4]), .B(A[4]), .Y(n71) );
  AND2X2 U47 ( .A(n27), .B(n77), .Y(SUM[0]) );
  XOR2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n73) );
  XOR2X1 U49 ( .A(n28), .B(n73), .Y(SUM[5]) );
  NAND2X1 U50 ( .A(n28), .B(B[5]), .Y(n74) );
  NAND2X1 U51 ( .A(n28), .B(A[5]), .Y(n75) );
  NAND2X1 U52 ( .A(B[5]), .B(A[5]), .Y(n76) );
  NAND3X1 U53 ( .A(n75), .B(n74), .C(n76), .Y(n9) );
  OR2X2 U54 ( .A(B[0]), .B(A[0]), .Y(n77) );
  INVX2 U55 ( .A(A[9]), .Y(n35) );
  INVX2 U56 ( .A(B[9]), .Y(n34) );
  INVX2 U57 ( .A(n24), .Y(n32) );
  INVX2 U58 ( .A(n16), .Y(n30) );
  INVX2 U59 ( .A(n10), .Y(n28) );
  INVX2 U60 ( .A(n22), .Y(n20) );
  INVX2 U61 ( .A(n14), .Y(n12) );
  INVX2 U62 ( .A(n6), .Y(SUM[9]) );
endmodule


module edge_detection_0_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74;

  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n74), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n74), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n65), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n65), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  BUFX4 U39 ( .A(n19), .Y(n65) );
  NAND3X1 U40 ( .A(n67), .B(n68), .C(n69), .Y(n64) );
  INVX4 U41 ( .A(B[0]), .Y(n30) );
  XOR2X1 U42 ( .A(A[6]), .B(n24), .Y(n66) );
  XOR2X1 U43 ( .A(n66), .B(n6), .Y(DIFF[6]) );
  NAND2X1 U44 ( .A(A[6]), .B(n24), .Y(n67) );
  NAND2X1 U45 ( .A(A[6]), .B(n6), .Y(n68) );
  NAND2X1 U46 ( .A(n24), .B(n6), .Y(n69) );
  NAND3X1 U47 ( .A(n67), .B(n68), .C(n69), .Y(n5) );
  XOR2X1 U48 ( .A(A[7]), .B(n23), .Y(n70) );
  XOR2X1 U49 ( .A(n70), .B(n64), .Y(DIFF[7]) );
  NAND2X1 U50 ( .A(A[7]), .B(n23), .Y(n71) );
  NAND2X1 U51 ( .A(A[7]), .B(n5), .Y(n72) );
  NAND2X1 U52 ( .A(n23), .B(n5), .Y(n73) );
  NAND3X1 U53 ( .A(n71), .B(n72), .C(n73), .Y(n4) );
  OR2X2 U54 ( .A(A[2]), .B(n28), .Y(n74) );
  INVX2 U55 ( .A(B[1]), .Y(n29) );
  INVX2 U56 ( .A(B[2]), .Y(n28) );
  INVX2 U57 ( .A(B[3]), .Y(n27) );
  INVX2 U58 ( .A(B[4]), .Y(n26) );
  INVX2 U59 ( .A(B[5]), .Y(n25) );
  INVX2 U60 ( .A(B[6]), .Y(n24) );
  INVX2 U61 ( .A(B[7]), .Y(n23) );
  INVX2 U62 ( .A(n17), .Y(n22) );
  INVX2 U63 ( .A(n9), .Y(n20) );
  INVX2 U64 ( .A(n15), .Y(n13) );
  INVX2 U65 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_0_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n16), .B(n64), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  INVX1 U39 ( .A(B[2]), .Y(n28) );
  INVX1 U40 ( .A(B[4]), .Y(n26) );
  OR2X2 U41 ( .A(A[2]), .B(n28), .Y(n64) );
  INVX2 U42 ( .A(B[0]), .Y(n30) );
  INVX2 U43 ( .A(B[1]), .Y(n29) );
  INVX2 U44 ( .A(B[3]), .Y(n27) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_0_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65;

  FAX1 U2 ( .A(A[7]), .B(n23), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(A[6]), .B(n24), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(A[5]), .B(n25), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(A[4]), .B(n26), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n65), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(A[3]), .B(n27), .Y(n9) );
  NAND2X1 U11 ( .A(A[3]), .B(n27), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(A[2]), .B(n28), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(A[1]), .B(n29), .Y(n17) );
  NAND2X1 U25 ( .A(A[1]), .B(n29), .Y(n18) );
  XNOR2X1 U26 ( .A(n30), .B(A[0]), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(A[0]), .B(n30), .Y(n19) );
  OR2X2 U39 ( .A(A[2]), .B(n28), .Y(n64) );
  BUFX2 U40 ( .A(n11), .Y(n65) );
  INVX1 U41 ( .A(B[0]), .Y(n30) );
  INVX2 U42 ( .A(B[1]), .Y(n29) );
  INVX2 U43 ( .A(B[2]), .Y(n28) );
  INVX2 U44 ( .A(B[3]), .Y(n27) );
  INVX2 U45 ( .A(B[4]), .Y(n26) );
  INVX2 U46 ( .A(B[5]), .Y(n25) );
  INVX2 U47 ( .A(B[6]), .Y(n24) );
  INVX2 U48 ( .A(B[7]), .Y(n23) );
  INVX2 U49 ( .A(n17), .Y(n22) );
  INVX2 U50 ( .A(n9), .Y(n20) );
  INVX2 U51 ( .A(n15), .Y(n13) );
  INVX2 U52 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_0_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65, n66,
         n67, n68;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n66), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n68), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  INVX1 U39 ( .A(B[1]), .Y(n29) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX1 U41 ( .A(n11), .Y(n65) );
  INVX2 U42 ( .A(n65), .Y(n66) );
  INVX1 U43 ( .A(n16), .Y(n67) );
  INVX2 U44 ( .A(n67), .Y(n68) );
  INVX1 U45 ( .A(B[0]), .Y(n30) );
  INVX2 U46 ( .A(B[2]), .Y(n28) );
  INVX2 U47 ( .A(B[3]), .Y(n27) );
  INVX2 U48 ( .A(B[4]), .Y(n26) );
  INVX2 U49 ( .A(B[5]), .Y(n25) );
  INVX2 U50 ( .A(B[6]), .Y(n24) );
  INVX2 U51 ( .A(B[7]), .Y(n23) );
  INVX2 U52 ( .A(n17), .Y(n22) );
  INVX2 U53 ( .A(n9), .Y(n20) );
  INVX2 U54 ( .A(n15), .Y(n13) );
  INVX2 U55 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_0_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64, n65;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n64), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n65), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n65), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  BUFX2 U39 ( .A(n16), .Y(n64) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n65) );
  INVX2 U41 ( .A(B[0]), .Y(n30) );
  INVX2 U42 ( .A(B[1]), .Y(n29) );
  INVX2 U43 ( .A(B[2]), .Y(n28) );
  INVX2 U44 ( .A(B[3]), .Y(n27) );
  INVX2 U45 ( .A(B[4]), .Y(n26) );
  INVX2 U46 ( .A(B[5]), .Y(n25) );
  INVX2 U47 ( .A(B[6]), .Y(n24) );
  INVX2 U48 ( .A(B[7]), .Y(n23) );
  INVX2 U49 ( .A(n17), .Y(n22) );
  INVX2 U50 ( .A(n9), .Y(n20) );
  INVX2 U51 ( .A(n15), .Y(n13) );
  INVX2 U52 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_0_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n64;

  FAX1 U2 ( .A(n23), .B(A[7]), .C(n5), .YC(n4), .YS(DIFF[7]) );
  FAX1 U3 ( .A(n24), .B(A[6]), .C(n6), .YC(n5), .YS(DIFF[6]) );
  FAX1 U4 ( .A(n25), .B(A[5]), .C(n7), .YC(n6), .YS(DIFF[5]) );
  FAX1 U5 ( .A(n26), .B(A[4]), .C(n8), .YC(n7), .YS(DIFF[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(DIFF[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(n27), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(n27), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(DIFF[2]) );
  AOI21X1 U13 ( .A(n64), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n64), .Y(n2) );
  NAND2X1 U19 ( .A(n28), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n19), .B(n3), .Y(DIFF[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(n29), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(n29), .B(A[1]), .Y(n18) );
  XNOR2X1 U26 ( .A(A[0]), .B(n30), .Y(DIFF[0]) );
  NOR2X1 U27 ( .A(n30), .B(A[0]), .Y(n19) );
  INVX2 U39 ( .A(B[0]), .Y(n30) );
  OR2X1 U40 ( .A(n28), .B(A[2]), .Y(n64) );
  INVX2 U41 ( .A(B[1]), .Y(n29) );
  INVX2 U42 ( .A(B[2]), .Y(n28) );
  INVX2 U43 ( .A(B[3]), .Y(n27) );
  INVX2 U44 ( .A(B[4]), .Y(n26) );
  INVX2 U45 ( .A(B[5]), .Y(n25) );
  INVX2 U46 ( .A(B[6]), .Y(n24) );
  INVX2 U47 ( .A(B[7]), .Y(n23) );
  INVX2 U48 ( .A(n17), .Y(n22) );
  INVX2 U49 ( .A(n9), .Y(n20) );
  INVX2 U50 ( .A(n15), .Y(n13) );
  INVX2 U51 ( .A(n4), .Y(DIFF[8]) );
endmodule


module edge_detection_0 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n571), .CLK(clk), .R(n187), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n572), .CLK(clk), .R(n187), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n187), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n573), .CLK(clk), .R(n187), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n530), .CLK(clk), .R(n187), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n584), .CLK(clk), .R(n186), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n186), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n186), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n422), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n421), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n420), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n419), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n418), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n417), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n416), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n415), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n414), .CLK(clk), .R(n186), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n440), .CLK(clk), .R(n185), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n439), .CLK(clk), .R(n185), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n438), .CLK(clk), .R(n185), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n437), .CLK(clk), .R(n185), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n436), .CLK(clk), .R(n185), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n435), .CLK(clk), .R(n185), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n434), .CLK(clk), .R(n185), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n433), .CLK(clk), .R(n185), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n432), .CLK(clk), .R(n185), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n538), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n537), .CLK(clk), .R(n185), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n536), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n535), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n534), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n533), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n532), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n531), .CLK(clk), .R(n184), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n517), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n488), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n487), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n486), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n483), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n482), .CLK(clk), .R(n184), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n480), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n479), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n478), .CLK(clk), .R(n183), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n557), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n556), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n555), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n554), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n553), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n552), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n551), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n550), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n549), .CLK(clk), .R(n183), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n548), .CLK(clk), .R(n182), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n431), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n430), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n429), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n428), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n427), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n426), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n425), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n424), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n423), .CLK(clk), .R(n182), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n477), .CLK(clk), .R(n182), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n469), .CLK(clk), .R(n182), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n466), .CLK(clk), .R(n181), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n461), .CLK(clk), .R(n181), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n452), .CLK(clk), .R(n181), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n451), .CLK(clk), .R(n181), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n444), .CLK(clk), .R(n181), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n443), .CLK(clk), .R(n181), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n441), .CLK(clk), .R(n181), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n529), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n528), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n527), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n526), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n525), .CLK(clk), .R(n181), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n524), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n523), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n520), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n518), .CLK(clk), .R(n180), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n567), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n566), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n565), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n564), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n563), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n562), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n561), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n560), .CLK(clk), .R(n180), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n559), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n558), .CLK(clk), .R(n179), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n569), .CLK(clk), .R(n179), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n574), .CLK(clk), .R(n179), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n575), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n576), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n577), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n578), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n579), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n580), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n581), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n582), .CLK(clk), .R(n179), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n583), .CLK(clk), .R(n178), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n547), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n546), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n545), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n544), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n543), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n542), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n541), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n540), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n539), .CLK(clk), .R(n178), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n593), .CLK(clk), .R(n178), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n592), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n591), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n590), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n589), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n588), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n587), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n586), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n585), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n594), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n595), .CLK(clk), .R(n177), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n177), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n596), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n597), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n598), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n599), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n600), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n601), .CLK(clk), .R(n176), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n176), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n634), .B(n627), .Y(n618) );
  AND2X2 U160 ( .A(n637), .B(n636), .Y(n604) );
  OR2X1 U458 ( .A(n629), .B(n628), .Y(n630) );
  NAND3X1 U459 ( .A(n627), .B(n626), .C(n412), .Y(n631) );
  OR2X1 U462 ( .A(n623), .B(n622), .Y(n624) );
  NAND3X1 U464 ( .A(n619), .B(n626), .C(n618), .Y(n625) );
  OAI21X1 U465 ( .A(n626), .B(n413), .C(n617), .Y(n573) );
  NAND2X1 U467 ( .A(n568), .B(n621), .Y(n615) );
  NAND3X1 U469 ( .A(n632), .B(n636), .C(n633), .Y(n616) );
  OR2X1 U472 ( .A(n623), .B(n629), .Y(n612) );
  NAND3X1 U475 ( .A(n633), .B(n626), .C(n610), .Y(n613) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n570), .Y(n610) );
  NAND2X1 U477 ( .A(n608), .B(n607), .Y(n626) );
  NOR2X1 U478 ( .A(n606), .B(n605), .Y(n607) );
  NAND3X1 U479 ( .A(n634), .B(n633), .C(n614), .Y(n605) );
  NAND3X1 U482 ( .A(n635), .B(n632), .C(n604), .Y(n606) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n637) );
  NOR2X1 U487 ( .A(n603), .B(n602), .Y(n608) );
  NAND3X1 U488 ( .A(n609), .B(n620), .C(n412), .Y(n602) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n609) );
  NAND3X1 U491 ( .A(n621), .B(n611), .C(n627), .Y(n603) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n627) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n611) );
  edge_detection_0_DW01_add_7 add_231 ( .A({Gx[10:2], n30, n28}), .B({Gy[10:2], 
        n27, n26}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_0_DW01_add_8 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_0_DW01_add_9 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_0_DW01_add_10 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), 
        .CI(1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_0_DW01_add_11 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), 
        .CI(1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_0_DW01_sub_8 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  edge_detection_0_DW01_sub_9 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_0_DW01_sub_10 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_0_DW01_sub_11 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_0_DW01_sub_12 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_0_DW01_sub_13 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  INVX4 U5 ( .A(n65), .Y(n406) );
  INVX2 U6 ( .A(n29), .Y(n30) );
  BUFX2 U12 ( .A(N258), .Y(n28) );
  INVX1 U13 ( .A(n217), .Y(n414) );
  NAND2X1 U52 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U128 ( .A(n413), .B(n188), .Y(n2) );
  AND2X2 U155 ( .A(state[3]), .B(n189), .Y(n8) );
  AND2X2 U156 ( .A(state[2]), .B(n245), .Y(n9) );
  AND2X2 U158 ( .A(n245), .B(n189), .Y(n16) );
  AND2X2 U159 ( .A(state[1]), .B(n188), .Y(n17) );
  AND2X2 U161 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U162 ( .A(n613), .B(n612), .Y(n19) );
  OR2X2 U163 ( .A(n625), .B(n624), .Y(n20) );
  OR2X2 U164 ( .A(n631), .B(n630), .Y(n21) );
  AND2X2 U165 ( .A(state[0]), .B(n413), .Y(n22) );
  NOR2X1 U166 ( .A(n358), .B(Gy[3]), .Y(n23) );
  INVX1 U167 ( .A(n23), .Y(n362) );
  OR2X1 U168 ( .A(n28), .B(n30), .Y(n254) );
  OR2X1 U169 ( .A(n254), .B(Gx[2]), .Y(n258) );
  OR2X2 U170 ( .A(n262), .B(Gx[4]), .Y(n266) );
  OR2X2 U171 ( .A(n270), .B(Gx[6]), .Y(n274) );
  OR2X2 U172 ( .A(n278), .B(Gx[8]), .Y(n282) );
  BUFX2 U173 ( .A(n333), .Y(n174) );
  BUFX2 U174 ( .A(n333), .Y(n173) );
  BUFX2 U175 ( .A(n333), .Y(n171) );
  BUFX2 U176 ( .A(n333), .Y(n172) );
  INVX2 U177 ( .A(n634), .Y(n170) );
  INVX2 U178 ( .A(n1), .Y(n392) );
  INVX2 U179 ( .A(n633), .Y(n169) );
  BUFX2 U180 ( .A(n333), .Y(n175) );
  INVX2 U181 ( .A(n635), .Y(n408) );
  AND2X2 U182 ( .A(n635), .B(n1), .Y(n24) );
  INVX2 U183 ( .A(n619), .Y(n393) );
  INVX2 U184 ( .A(N288), .Y(n141) );
  BUFX2 U185 ( .A(n_rst), .Y(n176) );
  BUFX2 U186 ( .A(n_rst), .Y(n177) );
  BUFX2 U187 ( .A(n_rst), .Y(n179) );
  BUFX2 U188 ( .A(n_rst), .Y(n180) );
  BUFX2 U189 ( .A(n_rst), .Y(n181) );
  BUFX2 U190 ( .A(n_rst), .Y(n182) );
  BUFX2 U191 ( .A(n_rst), .Y(n183) );
  BUFX2 U192 ( .A(n_rst), .Y(n184) );
  BUFX2 U193 ( .A(n_rst), .Y(n186) );
  BUFX2 U194 ( .A(n_rst), .Y(n178) );
  BUFX2 U195 ( .A(n_rst), .Y(n185) );
  BUFX2 U196 ( .A(n_rst), .Y(n187) );
  OR2X1 U197 ( .A(n274), .B(Gx[7]), .Y(n278) );
  BUFX2 U198 ( .A(Gy[1]), .Y(n27) );
  INVX2 U199 ( .A(n25), .Y(n26) );
  OR2X1 U200 ( .A(n258), .B(Gx[3]), .Y(n262) );
  OR2X1 U201 ( .A(n266), .B(Gx[5]), .Y(n270) );
  INVX2 U204 ( .A(N269), .Y(n25) );
  INVX2 U205 ( .A(Gx[1]), .Y(n29) );
  INVX1 U206 ( .A(n218), .Y(n415) );
  AOI21X1 U207 ( .A(n141), .B(n168), .C(n636), .Y(n65) );
  NOR2X1 U208 ( .A(N289), .B(N290), .Y(n168) );
  INVX2 U209 ( .A(n636), .Y(n404) );
  INVX2 U210 ( .A(state[1]), .Y(n413) );
  INVX2 U211 ( .A(state[0]), .Y(n188) );
  NAND3X1 U212 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n636) );
  INVX2 U213 ( .A(state[2]), .Y(n189) );
  NAND2X1 U214 ( .A(n17), .B(n8), .Y(n635) );
  INVX2 U215 ( .A(state[3]), .Y(n245) );
  NAND2X1 U216 ( .A(n16), .B(n22), .Y(n632) );
  INVX2 U217 ( .A(n632), .Y(n333) );
  MUX2X1 U218 ( .B(N205), .A(N168), .S(n171), .Y(n190) );
  INVX2 U219 ( .A(n190), .Y(n432) );
  NAND2X1 U220 ( .A(n16), .B(n17), .Y(n633) );
  INVX2 U221 ( .A(C1[9]), .Y(n192) );
  INVX2 U222 ( .A(N205), .Y(n191) );
  MUX2X1 U223 ( .B(n192), .A(n191), .S(n169), .Y(n530) );
  MUX2X1 U224 ( .B(N204), .A(N167), .S(n171), .Y(n193) );
  INVX2 U225 ( .A(n193), .Y(n433) );
  INVX2 U226 ( .A(C1[8]), .Y(n195) );
  INVX2 U227 ( .A(N204), .Y(n194) );
  MUX2X1 U228 ( .B(n195), .A(n194), .S(n169), .Y(n531) );
  MUX2X1 U229 ( .B(N203), .A(N166), .S(n171), .Y(n196) );
  INVX2 U230 ( .A(n196), .Y(n434) );
  INVX2 U231 ( .A(C1[7]), .Y(n198) );
  INVX2 U232 ( .A(N203), .Y(n197) );
  MUX2X1 U233 ( .B(n198), .A(n197), .S(n169), .Y(n532) );
  MUX2X1 U234 ( .B(N202), .A(N165), .S(n171), .Y(n199) );
  INVX2 U235 ( .A(n199), .Y(n435) );
  INVX2 U236 ( .A(C1[6]), .Y(n201) );
  INVX2 U237 ( .A(N202), .Y(n200) );
  MUX2X1 U238 ( .B(n201), .A(n200), .S(n169), .Y(n533) );
  MUX2X1 U239 ( .B(N201), .A(N164), .S(n171), .Y(n202) );
  INVX2 U240 ( .A(n202), .Y(n436) );
  INVX2 U241 ( .A(C1[5]), .Y(n204) );
  INVX2 U242 ( .A(N201), .Y(n203) );
  MUX2X1 U243 ( .B(n204), .A(n203), .S(n169), .Y(n534) );
  MUX2X1 U244 ( .B(N200), .A(N163), .S(n171), .Y(n205) );
  INVX2 U245 ( .A(n205), .Y(n437) );
  INVX2 U246 ( .A(C1[4]), .Y(n207) );
  INVX2 U247 ( .A(N200), .Y(n206) );
  MUX2X1 U248 ( .B(n207), .A(n206), .S(n169), .Y(n535) );
  MUX2X1 U249 ( .B(N199), .A(N162), .S(n171), .Y(n208) );
  INVX2 U250 ( .A(n208), .Y(n438) );
  INVX2 U251 ( .A(C1[3]), .Y(n210) );
  INVX2 U252 ( .A(N199), .Y(n209) );
  MUX2X1 U253 ( .B(n210), .A(n209), .S(n169), .Y(n536) );
  MUX2X1 U254 ( .B(N198), .A(N161), .S(n171), .Y(n211) );
  INVX2 U255 ( .A(n211), .Y(n439) );
  INVX2 U256 ( .A(C1[2]), .Y(n213) );
  INVX2 U257 ( .A(N198), .Y(n212) );
  MUX2X1 U258 ( .B(n213), .A(n212), .S(n169), .Y(n537) );
  MUX2X1 U259 ( .B(N197), .A(N160), .S(n171), .Y(n214) );
  INVX2 U260 ( .A(n214), .Y(n440) );
  INVX2 U261 ( .A(C1[1]), .Y(n216) );
  INVX2 U262 ( .A(N197), .Y(n215) );
  MUX2X1 U263 ( .B(n216), .A(n215), .S(n169), .Y(n538) );
  MUX2X1 U264 ( .B(A1[8]), .A(N150), .S(n171), .Y(n217) );
  MUX2X1 U265 ( .B(A1[7]), .A(N149), .S(n171), .Y(n218) );
  MUX2X1 U266 ( .B(A1[6]), .A(N148), .S(n171), .Y(n219) );
  INVX2 U267 ( .A(n219), .Y(n416) );
  MUX2X1 U268 ( .B(A1[5]), .A(N147), .S(n171), .Y(n220) );
  INVX2 U269 ( .A(n220), .Y(n417) );
  MUX2X1 U270 ( .B(A1[4]), .A(N146), .S(n172), .Y(n221) );
  INVX2 U271 ( .A(n221), .Y(n418) );
  MUX2X1 U272 ( .B(A1[3]), .A(N145), .S(n172), .Y(n222) );
  INVX2 U273 ( .A(n222), .Y(n419) );
  MUX2X1 U274 ( .B(A1[2]), .A(N144), .S(n172), .Y(n223) );
  INVX2 U275 ( .A(n223), .Y(n420) );
  MUX2X1 U276 ( .B(A1[1]), .A(N143), .S(n172), .Y(n224) );
  INVX2 U277 ( .A(n224), .Y(n421) );
  MUX2X1 U278 ( .B(A1[0]), .A(N142), .S(n172), .Y(n225) );
  INVX2 U279 ( .A(n225), .Y(n422) );
  MUX2X1 U280 ( .B(D1[8]), .A(N186), .S(n172), .Y(n226) );
  INVX2 U281 ( .A(n226), .Y(n478) );
  MUX2X1 U282 ( .B(D1[7]), .A(N185), .S(n172), .Y(n227) );
  INVX2 U283 ( .A(n227), .Y(n479) );
  MUX2X1 U284 ( .B(D1[6]), .A(N184), .S(n172), .Y(n228) );
  INVX2 U285 ( .A(n228), .Y(n480) );
  MUX2X1 U286 ( .B(D1[5]), .A(N183), .S(n172), .Y(n229) );
  INVX2 U287 ( .A(n229), .Y(n482) );
  MUX2X1 U288 ( .B(D1[4]), .A(N182), .S(n172), .Y(n230) );
  INVX2 U289 ( .A(n230), .Y(n483) );
  MUX2X1 U290 ( .B(D1[3]), .A(N181), .S(n172), .Y(n231) );
  INVX2 U291 ( .A(n231), .Y(n486) );
  MUX2X1 U292 ( .B(D1[2]), .A(N180), .S(n172), .Y(n232) );
  INVX2 U293 ( .A(n232), .Y(n487) );
  MUX2X1 U294 ( .B(D1[1]), .A(N179), .S(n172), .Y(n233) );
  INVX2 U295 ( .A(n233), .Y(n488) );
  MUX2X1 U296 ( .B(D1[0]), .A(N178), .S(n173), .Y(n234) );
  INVX2 U297 ( .A(n234), .Y(n517) );
  NAND2X1 U298 ( .A(n16), .B(n18), .Y(n634) );
  MUX2X1 U299 ( .B(E1[9]), .A(N225), .S(n170), .Y(n235) );
  INVX2 U300 ( .A(n235), .Y(n548) );
  MUX2X1 U301 ( .B(E1[8]), .A(N224), .S(n170), .Y(n236) );
  INVX2 U302 ( .A(n236), .Y(n549) );
  MUX2X1 U303 ( .B(E1[7]), .A(N223), .S(n170), .Y(n237) );
  INVX2 U304 ( .A(n237), .Y(n550) );
  MUX2X1 U305 ( .B(E1[6]), .A(N222), .S(n170), .Y(n238) );
  INVX2 U306 ( .A(n238), .Y(n551) );
  MUX2X1 U307 ( .B(E1[5]), .A(N221), .S(n170), .Y(n239) );
  INVX2 U308 ( .A(n239), .Y(n552) );
  MUX2X1 U309 ( .B(E1[4]), .A(N220), .S(n170), .Y(n240) );
  INVX2 U310 ( .A(n240), .Y(n553) );
  MUX2X1 U311 ( .B(E1[3]), .A(N219), .S(n170), .Y(n241) );
  INVX2 U312 ( .A(n241), .Y(n554) );
  MUX2X1 U313 ( .B(E1[2]), .A(N218), .S(n170), .Y(n242) );
  INVX2 U314 ( .A(n242), .Y(n555) );
  MUX2X1 U315 ( .B(E1[1]), .A(N217), .S(n170), .Y(n243) );
  INVX2 U316 ( .A(n243), .Y(n556) );
  MUX2X1 U317 ( .B(E1[0]), .A(N216), .S(n170), .Y(n244) );
  INVX2 U318 ( .A(n244), .Y(n557) );
  INVX2 U319 ( .A(N236), .Y(n247) );
  OAI21X1 U320 ( .A(n408), .B(n24), .C(n28), .Y(n246) );
  OAI21X1 U321 ( .A(n1), .B(n247), .C(n246), .Y(n574) );
  INVX2 U322 ( .A(N237), .Y(n250) );
  XOR2X1 U323 ( .A(n30), .B(n28), .Y(n248) );
  AOI22X1 U324 ( .A(n248), .B(n408), .C(n30), .D(n24), .Y(n249) );
  OAI21X1 U325 ( .A(n1), .B(n250), .C(n249), .Y(n575) );
  INVX2 U326 ( .A(N238), .Y(n253) );
  XOR2X1 U327 ( .A(n254), .B(Gx[2]), .Y(n251) );
  AOI22X1 U328 ( .A(n251), .B(n408), .C(Gx[2]), .D(n24), .Y(n252) );
  OAI21X1 U329 ( .A(n1), .B(n253), .C(n252), .Y(n576) );
  INVX2 U330 ( .A(N239), .Y(n257) );
  XOR2X1 U331 ( .A(n258), .B(Gx[3]), .Y(n255) );
  AOI22X1 U332 ( .A(n255), .B(n408), .C(Gx[3]), .D(n24), .Y(n256) );
  OAI21X1 U333 ( .A(n1), .B(n257), .C(n256), .Y(n577) );
  INVX2 U334 ( .A(N240), .Y(n261) );
  XOR2X1 U335 ( .A(n262), .B(Gx[4]), .Y(n259) );
  AOI22X1 U336 ( .A(n259), .B(n408), .C(Gx[4]), .D(n24), .Y(n260) );
  OAI21X1 U337 ( .A(n1), .B(n261), .C(n260), .Y(n578) );
  INVX2 U338 ( .A(N241), .Y(n265) );
  XOR2X1 U339 ( .A(n266), .B(Gx[5]), .Y(n263) );
  AOI22X1 U340 ( .A(n263), .B(n408), .C(Gx[5]), .D(n24), .Y(n264) );
  OAI21X1 U341 ( .A(n1), .B(n265), .C(n264), .Y(n579) );
  INVX2 U342 ( .A(N242), .Y(n269) );
  XOR2X1 U343 ( .A(n270), .B(Gx[6]), .Y(n267) );
  AOI22X1 U344 ( .A(n267), .B(n408), .C(Gx[6]), .D(n24), .Y(n268) );
  OAI21X1 U345 ( .A(n1), .B(n269), .C(n268), .Y(n580) );
  INVX2 U346 ( .A(N243), .Y(n273) );
  XOR2X1 U347 ( .A(n274), .B(Gx[7]), .Y(n271) );
  AOI22X1 U348 ( .A(n271), .B(n408), .C(Gx[7]), .D(n24), .Y(n272) );
  OAI21X1 U349 ( .A(n1), .B(n273), .C(n272), .Y(n581) );
  INVX2 U350 ( .A(N244), .Y(n277) );
  XOR2X1 U351 ( .A(n278), .B(Gx[8]), .Y(n275) );
  AOI22X1 U352 ( .A(n275), .B(n408), .C(Gx[8]), .D(n24), .Y(n276) );
  OAI21X1 U353 ( .A(n1), .B(n277), .C(n276), .Y(n582) );
  INVX2 U354 ( .A(N245), .Y(n281) );
  XOR2X1 U355 ( .A(n282), .B(Gx[9]), .Y(n279) );
  AOI22X1 U356 ( .A(n279), .B(n408), .C(Gx[9]), .D(n24), .Y(n280) );
  OAI21X1 U357 ( .A(n1), .B(n281), .C(n280), .Y(n583) );
  NOR2X1 U358 ( .A(Gx[9]), .B(n282), .Y(n283) );
  XNOR2X1 U359 ( .A(n283), .B(Gx[10]), .Y(n284) );
  AOI22X1 U360 ( .A(n24), .B(Gx[10]), .C(n284), .D(n408), .Y(n286) );
  NAND2X1 U361 ( .A(N246), .B(n392), .Y(n285) );
  NAND2X1 U362 ( .A(n286), .B(n285), .Y(n584) );
  NAND2X1 U363 ( .A(n8), .B(n18), .Y(n619) );
  MUX2X1 U364 ( .B(N215), .A(N177), .S(n173), .Y(n287) );
  INVX2 U365 ( .A(n287), .Y(n441) );
  INVX2 U366 ( .A(C2[9]), .Y(n289) );
  INVX2 U367 ( .A(N215), .Y(n288) );
  MUX2X1 U368 ( .B(n289), .A(n288), .S(n169), .Y(n539) );
  MUX2X1 U369 ( .B(N214), .A(N176), .S(n173), .Y(n290) );
  INVX2 U370 ( .A(n290), .Y(n443) );
  INVX2 U371 ( .A(C2[8]), .Y(n292) );
  INVX2 U372 ( .A(N214), .Y(n291) );
  MUX2X1 U373 ( .B(n292), .A(n291), .S(n169), .Y(n540) );
  MUX2X1 U374 ( .B(N213), .A(N175), .S(n173), .Y(n293) );
  INVX2 U375 ( .A(n293), .Y(n444) );
  INVX2 U376 ( .A(C2[7]), .Y(n295) );
  INVX2 U377 ( .A(N213), .Y(n294) );
  MUX2X1 U378 ( .B(n295), .A(n294), .S(n169), .Y(n541) );
  MUX2X1 U379 ( .B(N212), .A(N174), .S(n173), .Y(n296) );
  INVX2 U380 ( .A(n296), .Y(n451) );
  INVX2 U381 ( .A(C2[6]), .Y(n298) );
  INVX2 U382 ( .A(N212), .Y(n297) );
  MUX2X1 U383 ( .B(n298), .A(n297), .S(n169), .Y(n542) );
  MUX2X1 U384 ( .B(N211), .A(N173), .S(n173), .Y(n299) );
  INVX2 U385 ( .A(n299), .Y(n452) );
  INVX2 U386 ( .A(C2[5]), .Y(n301) );
  INVX2 U387 ( .A(N211), .Y(n300) );
  MUX2X1 U388 ( .B(n301), .A(n300), .S(n169), .Y(n543) );
  MUX2X1 U389 ( .B(N210), .A(N172), .S(n173), .Y(n302) );
  INVX2 U390 ( .A(n302), .Y(n461) );
  INVX2 U391 ( .A(C2[4]), .Y(n305) );
  INVX2 U392 ( .A(N210), .Y(n304) );
  MUX2X1 U393 ( .B(n305), .A(n304), .S(n169), .Y(n544) );
  MUX2X1 U394 ( .B(N209), .A(N171), .S(n173), .Y(n306) );
  INVX2 U395 ( .A(n306), .Y(n466) );
  INVX2 U396 ( .A(C2[3]), .Y(n308) );
  INVX2 U397 ( .A(N209), .Y(n307) );
  MUX2X1 U398 ( .B(n308), .A(n307), .S(n169), .Y(n545) );
  MUX2X1 U399 ( .B(N208), .A(N170), .S(n173), .Y(n309) );
  INVX2 U400 ( .A(n309), .Y(n469) );
  INVX2 U401 ( .A(C2[2]), .Y(n311) );
  INVX2 U402 ( .A(N208), .Y(n310) );
  MUX2X1 U403 ( .B(n311), .A(n310), .S(n169), .Y(n546) );
  MUX2X1 U404 ( .B(N207), .A(N169), .S(n173), .Y(n312) );
  INVX2 U405 ( .A(n312), .Y(n477) );
  INVX2 U406 ( .A(C2[1]), .Y(n314) );
  INVX2 U407 ( .A(N207), .Y(n313) );
  MUX2X1 U408 ( .B(n314), .A(n313), .S(n169), .Y(n547) );
  MUX2X1 U409 ( .B(A2[8]), .A(N159), .S(n173), .Y(n316) );
  INVX2 U410 ( .A(n316), .Y(n423) );
  MUX2X1 U411 ( .B(A2[7]), .A(N158), .S(n173), .Y(n317) );
  INVX2 U412 ( .A(n317), .Y(n424) );
  MUX2X1 U413 ( .B(A2[6]), .A(N157), .S(n173), .Y(n318) );
  INVX2 U414 ( .A(n318), .Y(n425) );
  MUX2X1 U415 ( .B(A2[5]), .A(N156), .S(n174), .Y(n319) );
  INVX2 U416 ( .A(n319), .Y(n426) );
  MUX2X1 U417 ( .B(A2[4]), .A(N155), .S(n174), .Y(n320) );
  INVX2 U418 ( .A(n320), .Y(n427) );
  MUX2X1 U419 ( .B(A2[3]), .A(N154), .S(n174), .Y(n321) );
  INVX2 U420 ( .A(n321), .Y(n428) );
  MUX2X1 U421 ( .B(A2[2]), .A(N153), .S(n174), .Y(n322) );
  INVX2 U422 ( .A(n322), .Y(n429) );
  MUX2X1 U423 ( .B(A2[1]), .A(N152), .S(n174), .Y(n323) );
  INVX2 U424 ( .A(n323), .Y(n430) );
  MUX2X1 U425 ( .B(A2[0]), .A(N151), .S(n174), .Y(n324) );
  INVX2 U426 ( .A(n324), .Y(n431) );
  MUX2X1 U427 ( .B(D2[8]), .A(N195), .S(n174), .Y(n325) );
  INVX2 U428 ( .A(n325), .Y(n518) );
  MUX2X1 U429 ( .B(D2[7]), .A(N194), .S(n174), .Y(n326) );
  INVX2 U430 ( .A(n326), .Y(n520) );
  MUX2X1 U431 ( .B(D2[6]), .A(N193), .S(n174), .Y(n327) );
  INVX2 U432 ( .A(n327), .Y(n523) );
  MUX2X1 U433 ( .B(D2[5]), .A(N192), .S(n174), .Y(n328) );
  INVX2 U434 ( .A(n328), .Y(n524) );
  MUX2X1 U435 ( .B(D2[4]), .A(N191), .S(n174), .Y(n329) );
  INVX2 U436 ( .A(n329), .Y(n525) );
  MUX2X1 U437 ( .B(D2[3]), .A(N190), .S(n174), .Y(n330) );
  INVX2 U438 ( .A(n330), .Y(n526) );
  MUX2X1 U439 ( .B(D2[2]), .A(N189), .S(n174), .Y(n331) );
  INVX2 U440 ( .A(n331), .Y(n527) );
  MUX2X1 U441 ( .B(D2[1]), .A(N188), .S(n175), .Y(n332) );
  INVX2 U442 ( .A(n332), .Y(n528) );
  MUX2X1 U443 ( .B(D2[0]), .A(N187), .S(n175), .Y(n334) );
  INVX2 U444 ( .A(n334), .Y(n529) );
  MUX2X1 U445 ( .B(E2[9]), .A(N235), .S(n170), .Y(n335) );
  INVX2 U446 ( .A(n335), .Y(n558) );
  MUX2X1 U447 ( .B(E2[8]), .A(N234), .S(n170), .Y(n336) );
  INVX2 U448 ( .A(n336), .Y(n559) );
  MUX2X1 U449 ( .B(E2[7]), .A(N233), .S(n170), .Y(n337) );
  INVX2 U450 ( .A(n337), .Y(n560) );
  MUX2X1 U451 ( .B(E2[6]), .A(N232), .S(n170), .Y(n338) );
  INVX2 U452 ( .A(n338), .Y(n561) );
  MUX2X1 U453 ( .B(E2[5]), .A(N231), .S(n170), .Y(n339) );
  INVX2 U454 ( .A(n339), .Y(n562) );
  MUX2X1 U455 ( .B(E2[4]), .A(N230), .S(n170), .Y(n340) );
  INVX2 U456 ( .A(n340), .Y(n563) );
  MUX2X1 U457 ( .B(E2[3]), .A(N229), .S(n170), .Y(n342) );
  INVX2 U460 ( .A(n342), .Y(n564) );
  MUX2X1 U461 ( .B(E2[2]), .A(N228), .S(n170), .Y(n343) );
  INVX2 U463 ( .A(n343), .Y(n565) );
  MUX2X1 U466 ( .B(E2[1]), .A(N227), .S(n170), .Y(n344) );
  INVX2 U468 ( .A(n344), .Y(n566) );
  MUX2X1 U470 ( .B(E2[0]), .A(N226), .S(n170), .Y(n345) );
  INVX2 U471 ( .A(n345), .Y(n567) );
  INVX2 U473 ( .A(N247), .Y(n347) );
  NAND2X1 U474 ( .A(n1), .B(n619), .Y(n396) );
  INVX2 U480 ( .A(n396), .Y(n412) );
  OAI21X1 U481 ( .A(n393), .B(n412), .C(n26), .Y(n346) );
  OAI21X1 U483 ( .A(n1), .B(n347), .C(n346), .Y(n571) );
  INVX2 U485 ( .A(n27), .Y(n350) );
  XOR2X1 U486 ( .A(n27), .B(n26), .Y(n348) );
  AOI22X1 U489 ( .A(n348), .B(n393), .C(N248), .D(n392), .Y(n349) );
  OAI21X1 U494 ( .A(n396), .B(n350), .C(n349), .Y(n593) );
  INVX2 U495 ( .A(Gy[2]), .Y(n354) );
  NAND2X1 U496 ( .A(n25), .B(n350), .Y(n353) );
  XOR2X1 U497 ( .A(n353), .B(Gy[2]), .Y(n351) );
  AOI22X1 U498 ( .A(n351), .B(n393), .C(N249), .D(n392), .Y(n352) );
  OAI21X1 U499 ( .A(n396), .B(n354), .C(n352), .Y(n592) );
  INVX2 U500 ( .A(Gy[3]), .Y(n359) );
  INVX2 U501 ( .A(n353), .Y(n355) );
  NAND2X1 U502 ( .A(n355), .B(n354), .Y(n358) );
  XOR2X1 U503 ( .A(n358), .B(Gy[3]), .Y(n356) );
  AOI22X1 U504 ( .A(n356), .B(n393), .C(N250), .D(n392), .Y(n357) );
  OAI21X1 U505 ( .A(n396), .B(n359), .C(n357), .Y(n591) );
  INVX2 U506 ( .A(Gy[4]), .Y(n363) );
  XOR2X1 U507 ( .A(n362), .B(Gy[4]), .Y(n360) );
  AOI22X1 U508 ( .A(n360), .B(n393), .C(N251), .D(n392), .Y(n361) );
  OAI21X1 U509 ( .A(n396), .B(n363), .C(n361), .Y(n590) );
  INVX2 U510 ( .A(Gy[5]), .Y(n368) );
  NAND2X1 U511 ( .A(n23), .B(n363), .Y(n367) );
  XOR2X1 U512 ( .A(n367), .B(Gy[5]), .Y(n365) );
  AOI22X1 U513 ( .A(n365), .B(n393), .C(N252), .D(n392), .Y(n366) );
  OAI21X1 U514 ( .A(n396), .B(n368), .C(n366), .Y(n589) );
  INVX2 U515 ( .A(Gy[6]), .Y(n373) );
  INVX2 U516 ( .A(n367), .Y(n369) );
  NAND2X1 U517 ( .A(n369), .B(n368), .Y(n372) );
  XOR2X1 U518 ( .A(n372), .B(Gy[6]), .Y(n370) );
  AOI22X1 U519 ( .A(n370), .B(n393), .C(N253), .D(n392), .Y(n371) );
  OAI21X1 U520 ( .A(n396), .B(n373), .C(n371), .Y(n588) );
  INVX2 U521 ( .A(Gy[7]), .Y(n378) );
  INVX2 U522 ( .A(n372), .Y(n374) );
  NAND2X1 U523 ( .A(n374), .B(n373), .Y(n377) );
  XOR2X1 U524 ( .A(n377), .B(Gy[7]), .Y(n375) );
  AOI22X1 U525 ( .A(n375), .B(n393), .C(N254), .D(n392), .Y(n376) );
  OAI21X1 U526 ( .A(n396), .B(n378), .C(n376), .Y(n587) );
  INVX2 U527 ( .A(Gy[8]), .Y(n383) );
  INVX2 U528 ( .A(n377), .Y(n379) );
  NAND2X1 U529 ( .A(n379), .B(n378), .Y(n382) );
  XOR2X1 U530 ( .A(n382), .B(Gy[8]), .Y(n380) );
  AOI22X1 U531 ( .A(n380), .B(n393), .C(N255), .D(n392), .Y(n381) );
  OAI21X1 U532 ( .A(n396), .B(n383), .C(n381), .Y(n586) );
  INVX2 U533 ( .A(Gy[9]), .Y(n389) );
  INVX2 U534 ( .A(n382), .Y(n384) );
  NAND2X1 U535 ( .A(n384), .B(n383), .Y(n388) );
  XOR2X1 U536 ( .A(n388), .B(Gy[9]), .Y(n385) );
  AOI22X1 U537 ( .A(n385), .B(n393), .C(N256), .D(n392), .Y(n387) );
  OAI21X1 U538 ( .A(n396), .B(n389), .C(n387), .Y(n585) );
  INVX2 U539 ( .A(Gy[10]), .Y(n410) );
  INVX2 U540 ( .A(n388), .Y(n390) );
  NAND2X1 U541 ( .A(n390), .B(n389), .Y(n391) );
  XOR2X1 U542 ( .A(n391), .B(Gy[10]), .Y(n394) );
  AOI22X1 U543 ( .A(n394), .B(n393), .C(N257), .D(n392), .Y(n395) );
  OAI21X1 U544 ( .A(n410), .B(n396), .C(n395), .Y(n572) );
  MUX2X1 U545 ( .B(temp_sum[0]), .A(N280), .S(n404), .Y(n397) );
  NAND2X1 U546 ( .A(n406), .B(n397), .Y(n594) );
  MUX2X1 U547 ( .B(temp_sum[1]), .A(N281), .S(n404), .Y(n398) );
  NAND2X1 U548 ( .A(n406), .B(n398), .Y(n595) );
  MUX2X1 U549 ( .B(temp_sum[2]), .A(N282), .S(n404), .Y(n399) );
  NAND2X1 U550 ( .A(n406), .B(n399), .Y(n596) );
  MUX2X1 U551 ( .B(temp_sum[3]), .A(N283), .S(n404), .Y(n400) );
  NAND2X1 U552 ( .A(n406), .B(n400), .Y(n597) );
  MUX2X1 U553 ( .B(temp_sum[4]), .A(N284), .S(n404), .Y(n401) );
  NAND2X1 U554 ( .A(n406), .B(n401), .Y(n598) );
  MUX2X1 U555 ( .B(temp_sum[5]), .A(N285), .S(n404), .Y(n402) );
  NAND2X1 U556 ( .A(n406), .B(n402), .Y(n599) );
  MUX2X1 U557 ( .B(temp_sum[6]), .A(N286), .S(n404), .Y(n403) );
  NAND2X1 U558 ( .A(n406), .B(n403), .Y(n600) );
  MUX2X1 U559 ( .B(temp_sum[7]), .A(N287), .S(n404), .Y(n405) );
  NAND2X1 U560 ( .A(n406), .B(n405), .Y(n601) );
  NAND2X1 U561 ( .A(n22), .B(n8), .Y(n621) );
  NAND2X1 U562 ( .A(n9), .B(n18), .Y(n620) );
  NAND2X1 U563 ( .A(n2), .B(n8), .Y(n614) );
  OAI21X1 U564 ( .A(Gx[10]), .B(n614), .C(n636), .Y(n623) );
  INVX2 U565 ( .A(n611), .Y(n407) );
  NOR2X1 U566 ( .A(n408), .B(n407), .Y(n409) );
  OAI21X1 U567 ( .A(n621), .B(n410), .C(n409), .Y(n629) );
  INVX2 U568 ( .A(Gx[10]), .Y(n411) );
  OAI21X1 U569 ( .A(n614), .B(n411), .C(n620), .Y(n628) );
  INVX2 U570 ( .A(n628), .Y(n568) );
  OAI21X1 U571 ( .A(Gy[10]), .B(n621), .C(n620), .Y(n622) );
  INVX2 U572 ( .A(n637), .Y(n569) );
  INVX2 U573 ( .A(n609), .Y(n570) );
  NOR2X1 U574 ( .A(n616), .B(n615), .Y(n617) );
endmodule


module edge_detection_core ( clk, n_rst, i_m1, i_m2, i_m3, i_m4, i_m5, i_m6, 
        i_m7, i_m8, i_m9, i_m10, i_m11, i_m12, i_m13, i_m14, i_m15, i_m16, 
        i_m17, i_m18, i_m19, i_m20, i_m21, i_m22, i_m23, i_m24, i_m25, 
        i_gradient_start, o_gradient_ready, o_processed_sum_1, 
        o_processed_sum_2, o_processed_sum_3, o_processed_sum_4, 
        o_processed_sum_5, o_processed_sum_6, o_processed_sum_7, 
        o_processed_sum_8, o_processed_sum_9 );
  input [7:0] i_m1;
  input [7:0] i_m2;
  input [7:0] i_m3;
  input [7:0] i_m4;
  input [7:0] i_m5;
  input [7:0] i_m6;
  input [7:0] i_m7;
  input [7:0] i_m8;
  input [7:0] i_m9;
  input [7:0] i_m10;
  input [7:0] i_m11;
  input [7:0] i_m12;
  input [7:0] i_m13;
  input [7:0] i_m14;
  input [7:0] i_m15;
  input [7:0] i_m16;
  input [7:0] i_m17;
  input [7:0] i_m18;
  input [7:0] i_m19;
  input [7:0] i_m20;
  input [7:0] i_m21;
  input [7:0] i_m22;
  input [7:0] i_m23;
  input [7:0] i_m24;
  input [7:0] i_m25;
  output [7:0] o_processed_sum_1;
  output [7:0] o_processed_sum_2;
  output [7:0] o_processed_sum_3;
  output [7:0] o_processed_sum_4;
  output [7:0] o_processed_sum_5;
  output [7:0] o_processed_sum_6;
  output [7:0] o_processed_sum_7;
  output [7:0] o_processed_sum_8;
  output [7:0] o_processed_sum_9;
  input clk, n_rst, i_gradient_start;
  output o_gradient_ready;
  wire   temp_gradient_ready_1, temp_gradient_ready_2, temp_gradient_ready_3,
         temp_gradient_ready_4, temp_gradient_ready_5, temp_gradient_ready_6,
         temp_gradient_ready_7, temp_gradient_ready_8, temp_gradient_ready_9,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32;

  AND2X2 U1 ( .A(temp_gradient_ready_7), .B(temp_gradient_ready_6), .Y(n3) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(o_gradient_ready) );
  NAND3X1 U3 ( .A(temp_gradient_ready_9), .B(temp_gradient_ready_8), .C(n3), 
        .Y(n2) );
  OR2X1 U4 ( .A(n4), .B(n5), .Y(n1) );
  NAND2X1 U5 ( .A(temp_gradient_ready_5), .B(temp_gradient_ready_4), .Y(n5) );
  NAND3X1 U6 ( .A(temp_gradient_ready_2), .B(temp_gradient_ready_1), .C(
        temp_gradient_ready_3), .Y(n4) );
  edge_detection_8 E1 ( .clk(clk), .n_rst(n32), .i_gradient_start(
        i_gradient_start), .P0(i_m1), .P1(i_m2), .P2(i_m3), .P3(i_m6), .P4(
        i_m7), .P5({i_m8[7:5], n7, i_m8[3:0]}), .P6(i_m11), .P7(i_m12), .P8({
        n28, n26, n24, n22, i_m13[3], n16, n13, n11}), .o_gradient_data_ready(
        temp_gradient_ready_1), .o_processed_sum(o_processed_sum_1) );
  edge_detection_7 E2 ( .clk(clk), .n_rst(n29), .i_gradient_start(
        i_gradient_start), .P0(i_m2), .P1(i_m3), .P2(i_m4), .P3(i_m7), .P4({
        i_m8[7:5], n7, i_m8[3:0]}), .P5(i_m9), .P6(i_m12), .P7({n28, n26, n24, 
        n22, n19, n17, n14, n11}), .P8({i_m14[7:5], n8, i_m14[3:0]}), 
        .o_gradient_data_ready(temp_gradient_ready_2), .o_processed_sum(
        o_processed_sum_2) );
  edge_detection_6 E3 ( .clk(clk), .n_rst(n29), .i_gradient_start(
        i_gradient_start), .P0(i_m3), .P1(i_m4), .P2(i_m5), .P3(i_m8), .P4(
        i_m9), .P5(i_m10), .P6({n28, n26, n24, n22, n19, n17, n14, n11}), .P7(
        {i_m14[7:5], n8, i_m14[3:0]}), .P8({i_m15[7:1], n9}), 
        .o_gradient_data_ready(temp_gradient_ready_3), .o_processed_sum(
        o_processed_sum_3) );
  edge_detection_5 E4 ( .clk(clk), .n_rst(n30), .i_gradient_start(
        i_gradient_start), .P0(i_m6), .P1(i_m7), .P2({i_m8[7:5], n7, i_m8[3:0]}), .P3(i_m11), .P4(i_m12), .P5({n28, n26, n24, n22, n19, n17, n14, n11}), .P6(
        i_m16), .P7(i_m17), .P8(i_m18), .o_gradient_data_ready(
        temp_gradient_ready_4), .o_processed_sum(o_processed_sum_4) );
  edge_detection_4 E5 ( .clk(clk), .n_rst(n30), .i_gradient_start(
        i_gradient_start), .P0(i_m7), .P1({i_m8[7:5], n7, i_m8[3:0]}), .P2(
        i_m9), .P3(i_m12), .P4({n28, n26, n24, n22, n19, n17, n14, n11}), .P5(
        {i_m14[7:5], n8, i_m14[3:0]}), .P6(i_m17), .P7(i_m18), .P8(i_m19), 
        .o_gradient_data_ready(temp_gradient_ready_5), .o_processed_sum(
        o_processed_sum_5) );
  edge_detection_3 E6 ( .clk(clk), .n_rst(n31), .i_gradient_start(
        i_gradient_start), .P0({i_m8[7:5], n7, i_m8[3:0]}), .P1(i_m9), .P2(
        i_m10), .P3({n28, n26, n24, n22, n19, n17, n14, n11}), .P4({i_m14[7:5], 
        n8, i_m14[3:0]}), .P5({i_m15[7:1], n9}), .P6(i_m18), .P7(i_m19), .P8(
        i_m20), .o_gradient_data_ready(temp_gradient_ready_6), 
        .o_processed_sum(o_processed_sum_6) );
  edge_detection_2 E7 ( .clk(clk), .n_rst(n31), .i_gradient_start(
        i_gradient_start), .P0(i_m11), .P1(i_m12), .P2({n28, n26, n24, n21, 
        n19, n16, n13, n11}), .P3(i_m16), .P4(i_m17), .P5(i_m18), .P6(i_m21), 
        .P7(i_m22), .P8(i_m23), .o_gradient_data_ready(temp_gradient_ready_7), 
        .o_processed_sum(o_processed_sum_7) );
  edge_detection_1 E8 ( .clk(clk), .n_rst(n32), .i_gradient_start(
        i_gradient_start), .P0(i_m12), .P1({n28, n26, n24, n22, n19, n17, n14, 
        n11}), .P2({i_m14[7:5], n8, i_m14[3:0]}), .P3(i_m17), .P4(i_m18), .P5(
        i_m19), .P6(i_m22), .P7(i_m23), .P8(i_m24), .o_gradient_data_ready(
        temp_gradient_ready_8), .o_processed_sum(o_processed_sum_8) );
  edge_detection_0 E9 ( .clk(clk), .n_rst(n32), .i_gradient_start(
        i_gradient_start), .P0({n28, i_m13[6:5], n21, n19, n16, n13, n11}), 
        .P1({i_m14[7:5], n8, i_m14[3:0]}), .P2({i_m15[7:1], n9}), .P3(i_m18), 
        .P4(i_m19), .P5(i_m20), .P6(i_m23), .P7(i_m24), .P8(i_m25), 
        .o_gradient_data_ready(temp_gradient_ready_9), .o_processed_sum(
        o_processed_sum_9) );
  INVX2 U7 ( .A(i_m13[0]), .Y(n10) );
  BUFX4 U8 ( .A(i_m15[0]), .Y(n9) );
  INVX8 U9 ( .A(n10), .Y(n11) );
  INVX2 U10 ( .A(i_m13[1]), .Y(n12) );
  INVX2 U11 ( .A(n20), .Y(n22) );
  INVX2 U12 ( .A(n20), .Y(n21) );
  INVX2 U13 ( .A(n12), .Y(n13) );
  INVX2 U14 ( .A(n15), .Y(n16) );
  INVX2 U15 ( .A(n12), .Y(n14) );
  INVX2 U16 ( .A(n15), .Y(n17) );
  INVX2 U17 ( .A(n18), .Y(n19) );
  INVX2 U18 ( .A(n23), .Y(n24) );
  INVX2 U19 ( .A(n25), .Y(n26) );
  INVX2 U20 ( .A(n27), .Y(n28) );
  INVX2 U21 ( .A(i_m13[2]), .Y(n15) );
  INVX2 U22 ( .A(i_m13[3]), .Y(n18) );
  INVX2 U23 ( .A(i_m13[4]), .Y(n20) );
  INVX2 U24 ( .A(i_m13[5]), .Y(n23) );
  INVX2 U25 ( .A(i_m13[6]), .Y(n25) );
  INVX2 U26 ( .A(i_m13[7]), .Y(n27) );
  INVX2 U27 ( .A(i_m8[4]), .Y(n6) );
  INVX2 U28 ( .A(n6), .Y(n7) );
  BUFX2 U29 ( .A(i_m14[4]), .Y(n8) );
  BUFX2 U30 ( .A(n_rst), .Y(n29) );
  BUFX2 U31 ( .A(n_rst), .Y(n30) );
  BUFX2 U32 ( .A(n_rst), .Y(n31) );
  BUFX2 U33 ( .A(n_rst), .Y(n32) );
endmodule


module buffer_2 ( clk, n_rst, i_processed_sum_1, i_processed_sum_2, 
        i_processed_sum_3, i_processed_sum_4, i_processed_sum_5, 
        i_processed_sum_6, i_processed_sum_7, i_processed_sum_8, 
        i_processed_sum_9, i_save, i_write_complete, o_empty, o_full, 
        o_buffer2_data, o_write_enable );
  input [7:0] i_processed_sum_1;
  input [7:0] i_processed_sum_2;
  input [7:0] i_processed_sum_3;
  input [7:0] i_processed_sum_4;
  input [7:0] i_processed_sum_5;
  input [7:0] i_processed_sum_6;
  input [7:0] i_processed_sum_7;
  input [7:0] i_processed_sum_8;
  input [7:0] i_processed_sum_9;
  output [31:0] o_buffer2_data;
  input clk, n_rst, i_save, i_write_complete;
  output o_empty, o_full, o_write_enable;
  wire   next_empty, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n285, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n35, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n236, n284, n286,
         n321, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634;
  wire   [7:0] m1;
  wire   [7:0] m2;
  wire   [7:0] m3;
  wire   [7:0] m4;
  wire   [7:0] m5;
  wire   [7:0] m6;
  wire   [7:0] m7;
  wire   [7:0] m8;
  wire   [7:0] m9;
  wire   [5:0] curr;

  DFFSR \curr_reg[0]  ( .D(n114), .CLK(clk), .R(n146), .S(1'b1), .Q(curr[0])
         );
  DFFSR \curr_reg[4]  ( .D(n226), .CLK(clk), .R(n146), .S(1'b1), .Q(curr[4])
         );
  DFFSR \curr_reg[3]  ( .D(n157), .CLK(clk), .R(n146), .S(1'b1), .Q(curr[3])
         );
  DFFSR \curr_reg[1]  ( .D(n273), .CLK(clk), .R(n146), .S(1'b1), .Q(curr[1])
         );
  DFFSR \curr_reg[2]  ( .D(n260), .CLK(clk), .R(n146), .S(1'b1), .Q(curr[2])
         );
  DFFSR \m9_reg[7]  ( .D(n525), .CLK(clk), .R(n146), .S(1'b1), .Q(m9[7]) );
  DFFSR \m9_reg[6]  ( .D(n526), .CLK(clk), .R(n146), .S(1'b1), .Q(m9[6]) );
  DFFSR \m9_reg[5]  ( .D(n527), .CLK(clk), .R(n146), .S(1'b1), .Q(m9[5]) );
  DFFSR \m9_reg[4]  ( .D(n528), .CLK(clk), .R(n146), .S(1'b1), .Q(m9[4]) );
  DFFSR \m9_reg[3]  ( .D(n529), .CLK(clk), .R(n146), .S(1'b1), .Q(m9[3]) );
  DFFSR \m9_reg[2]  ( .D(n530), .CLK(clk), .R(n146), .S(1'b1), .Q(m9[2]) );
  DFFSR \m9_reg[1]  ( .D(n531), .CLK(clk), .R(n146), .S(1'b1), .Q(m9[1]) );
  DFFSR \m9_reg[0]  ( .D(n532), .CLK(clk), .R(n147), .S(1'b1), .Q(m9[0]) );
  DFFSR \m8_reg[7]  ( .D(n533), .CLK(clk), .R(n147), .S(1'b1), .Q(m8[7]) );
  DFFSR \m8_reg[6]  ( .D(n534), .CLK(clk), .R(n147), .S(1'b1), .Q(m8[6]) );
  DFFSR \m8_reg[5]  ( .D(n535), .CLK(clk), .R(n147), .S(1'b1), .Q(m8[5]) );
  DFFSR \m8_reg[4]  ( .D(n536), .CLK(clk), .R(n147), .S(1'b1), .Q(m8[4]) );
  DFFSR \m8_reg[3]  ( .D(n537), .CLK(clk), .R(n147), .S(1'b1), .Q(m8[3]) );
  DFFSR \m8_reg[2]  ( .D(n538), .CLK(clk), .R(n147), .S(1'b1), .Q(m8[2]) );
  DFFSR \m8_reg[1]  ( .D(n539), .CLK(clk), .R(n147), .S(1'b1), .Q(m8[1]) );
  DFFSR \m8_reg[0]  ( .D(n540), .CLK(clk), .R(n147), .S(1'b1), .Q(m8[0]) );
  DFFSR \m7_reg[7]  ( .D(n541), .CLK(clk), .R(n147), .S(1'b1), .Q(m7[7]) );
  DFFSR \m7_reg[6]  ( .D(n542), .CLK(clk), .R(n147), .S(1'b1), .Q(m7[6]) );
  DFFSR \m7_reg[5]  ( .D(n543), .CLK(clk), .R(n147), .S(1'b1), .Q(m7[5]) );
  DFFSR \m7_reg[4]  ( .D(n544), .CLK(clk), .R(n148), .S(1'b1), .Q(m7[4]) );
  DFFSR \m7_reg[3]  ( .D(n545), .CLK(clk), .R(n148), .S(1'b1), .Q(m7[3]) );
  DFFSR \m7_reg[2]  ( .D(n546), .CLK(clk), .R(n148), .S(1'b1), .Q(m7[2]) );
  DFFSR \m7_reg[1]  ( .D(n547), .CLK(clk), .R(n148), .S(1'b1), .Q(m7[1]) );
  DFFSR \m7_reg[0]  ( .D(n548), .CLK(clk), .R(n148), .S(1'b1), .Q(m7[0]) );
  DFFSR \m6_reg[7]  ( .D(n549), .CLK(clk), .R(n148), .S(1'b1), .Q(m6[7]) );
  DFFSR \m6_reg[6]  ( .D(n550), .CLK(clk), .R(n148), .S(1'b1), .Q(m6[6]) );
  DFFSR \m6_reg[5]  ( .D(n551), .CLK(clk), .R(n148), .S(1'b1), .Q(m6[5]) );
  DFFSR \m6_reg[4]  ( .D(n552), .CLK(clk), .R(n148), .S(1'b1), .Q(m6[4]) );
  DFFSR \m6_reg[3]  ( .D(n553), .CLK(clk), .R(n148), .S(1'b1), .Q(m6[3]) );
  DFFSR \m6_reg[2]  ( .D(n554), .CLK(clk), .R(n148), .S(1'b1), .Q(m6[2]) );
  DFFSR \m6_reg[1]  ( .D(n555), .CLK(clk), .R(n148), .S(1'b1), .Q(m6[1]) );
  DFFSR \m6_reg[0]  ( .D(n556), .CLK(clk), .R(n149), .S(1'b1), .Q(m6[0]) );
  DFFSR \m5_reg[7]  ( .D(n557), .CLK(clk), .R(n149), .S(1'b1), .Q(m5[7]) );
  DFFSR \m5_reg[6]  ( .D(n558), .CLK(clk), .R(n149), .S(1'b1), .Q(m5[6]) );
  DFFSR \m5_reg[5]  ( .D(n559), .CLK(clk), .R(n149), .S(1'b1), .Q(m5[5]) );
  DFFSR \m5_reg[4]  ( .D(n560), .CLK(clk), .R(n149), .S(1'b1), .Q(m5[4]) );
  DFFSR \m5_reg[3]  ( .D(n561), .CLK(clk), .R(n149), .S(1'b1), .Q(m5[3]) );
  DFFSR \m5_reg[2]  ( .D(n562), .CLK(clk), .R(n149), .S(1'b1), .Q(m5[2]) );
  DFFSR \m5_reg[1]  ( .D(n563), .CLK(clk), .R(n149), .S(1'b1), .Q(m5[1]) );
  DFFSR \m5_reg[0]  ( .D(n564), .CLK(clk), .R(n149), .S(1'b1), .Q(m5[0]) );
  DFFSR \m4_reg[7]  ( .D(n565), .CLK(clk), .R(n149), .S(1'b1), .Q(m4[7]) );
  DFFSR \m4_reg[6]  ( .D(n566), .CLK(clk), .R(n149), .S(1'b1), .Q(m4[6]) );
  DFFSR \m4_reg[5]  ( .D(n567), .CLK(clk), .R(n149), .S(1'b1), .Q(m4[5]) );
  DFFSR \m4_reg[4]  ( .D(n568), .CLK(clk), .R(n150), .S(1'b1), .Q(m4[4]) );
  DFFSR \m4_reg[3]  ( .D(n569), .CLK(clk), .R(n150), .S(1'b1), .Q(m4[3]) );
  DFFSR \m4_reg[2]  ( .D(n570), .CLK(clk), .R(n150), .S(1'b1), .Q(m4[2]) );
  DFFSR \m4_reg[1]  ( .D(n571), .CLK(clk), .R(n150), .S(1'b1), .Q(m4[1]) );
  DFFSR \m4_reg[0]  ( .D(n572), .CLK(clk), .R(n150), .S(1'b1), .Q(m4[0]) );
  DFFSR \m3_reg[7]  ( .D(n573), .CLK(clk), .R(n150), .S(1'b1), .Q(m3[7]) );
  DFFSR \m3_reg[6]  ( .D(n574), .CLK(clk), .R(n150), .S(1'b1), .Q(m3[6]) );
  DFFSR \m3_reg[5]  ( .D(n575), .CLK(clk), .R(n150), .S(1'b1), .Q(m3[5]) );
  DFFSR \m3_reg[4]  ( .D(n576), .CLK(clk), .R(n150), .S(1'b1), .Q(m3[4]) );
  DFFSR \m3_reg[3]  ( .D(n577), .CLK(clk), .R(n150), .S(1'b1), .Q(m3[3]) );
  DFFSR \m3_reg[2]  ( .D(n578), .CLK(clk), .R(n150), .S(1'b1), .Q(m3[2]) );
  DFFSR \m3_reg[1]  ( .D(n579), .CLK(clk), .R(n150), .S(1'b1), .Q(m3[1]) );
  DFFSR \m3_reg[0]  ( .D(n580), .CLK(clk), .R(n151), .S(1'b1), .Q(m3[0]) );
  DFFSR \m2_reg[7]  ( .D(n581), .CLK(clk), .R(n151), .S(1'b1), .Q(m2[7]) );
  DFFSR \m2_reg[6]  ( .D(n582), .CLK(clk), .R(n151), .S(1'b1), .Q(m2[6]) );
  DFFSR \m2_reg[5]  ( .D(n583), .CLK(clk), .R(n151), .S(1'b1), .Q(m2[5]) );
  DFFSR \m2_reg[4]  ( .D(n584), .CLK(clk), .R(n151), .S(1'b1), .Q(m2[4]) );
  DFFSR \m2_reg[3]  ( .D(n585), .CLK(clk), .R(n151), .S(1'b1), .Q(m2[3]) );
  DFFSR \m2_reg[2]  ( .D(n586), .CLK(clk), .R(n151), .S(1'b1), .Q(m2[2]) );
  DFFSR \m2_reg[1]  ( .D(n587), .CLK(clk), .R(n151), .S(1'b1), .Q(m2[1]) );
  DFFSR \m2_reg[0]  ( .D(n588), .CLK(clk), .R(n151), .S(1'b1), .Q(m2[0]) );
  DFFSR \m1_reg[7]  ( .D(n589), .CLK(clk), .R(n151), .S(1'b1), .Q(m1[7]) );
  DFFSR \m1_reg[6]  ( .D(n590), .CLK(clk), .R(n151), .S(1'b1), .Q(m1[6]) );
  DFFSR \m1_reg[5]  ( .D(n591), .CLK(clk), .R(n151), .S(1'b1), .Q(m1[5]) );
  DFFSR \m1_reg[4]  ( .D(n592), .CLK(clk), .R(n152), .S(1'b1), .Q(m1[4]) );
  DFFSR \m1_reg[3]  ( .D(n593), .CLK(clk), .R(n152), .S(1'b1), .Q(m1[3]) );
  DFFSR \m1_reg[2]  ( .D(n594), .CLK(clk), .R(n152), .S(1'b1), .Q(m1[2]) );
  DFFSR \m1_reg[1]  ( .D(n595), .CLK(clk), .R(n152), .S(1'b1), .Q(m1[1]) );
  DFFSR \m1_reg[0]  ( .D(n596), .CLK(clk), .R(n152), .S(1'b1), .Q(m1[0]) );
  DFFSR o_write_enable_reg ( .D(n174), .CLK(clk), .R(n152), .S(1'b1), .Q(
        o_write_enable) );
  DFFSR o_full_reg ( .D(n281), .CLK(clk), .R(n152), .S(1'b1), .Q(o_full) );
  DFFSR \o_buffer2_data_reg[0]  ( .D(n524), .CLK(clk), .R(n152), .S(1'b1), .Q(
        o_buffer2_data[0]) );
  DFFSR \o_buffer2_data_reg[8]  ( .D(n516), .CLK(clk), .R(n152), .S(1'b1), .Q(
        o_buffer2_data[8]) );
  DFFSR \o_buffer2_data_reg[16]  ( .D(n508), .CLK(clk), .R(n152), .S(1'b1), 
        .Q(o_buffer2_data[16]) );
  DFFSR \o_buffer2_data_reg[24]  ( .D(n500), .CLK(clk), .R(n152), .S(1'b1), 
        .Q(o_buffer2_data[24]) );
  DFFSR \o_buffer2_data_reg[1]  ( .D(n523), .CLK(clk), .R(n152), .S(1'b1), .Q(
        o_buffer2_data[1]) );
  DFFSR \o_buffer2_data_reg[9]  ( .D(n515), .CLK(clk), .R(n153), .S(1'b1), .Q(
        o_buffer2_data[9]) );
  DFFSR \o_buffer2_data_reg[17]  ( .D(n507), .CLK(clk), .R(n153), .S(1'b1), 
        .Q(o_buffer2_data[17]) );
  DFFSR \o_buffer2_data_reg[25]  ( .D(n499), .CLK(clk), .R(n153), .S(1'b1), 
        .Q(o_buffer2_data[25]) );
  DFFSR \o_buffer2_data_reg[2]  ( .D(n522), .CLK(clk), .R(n153), .S(1'b1), .Q(
        o_buffer2_data[2]) );
  DFFSR \o_buffer2_data_reg[10]  ( .D(n514), .CLK(clk), .R(n153), .S(1'b1), 
        .Q(o_buffer2_data[10]) );
  DFFSR \o_buffer2_data_reg[18]  ( .D(n506), .CLK(clk), .R(n153), .S(1'b1), 
        .Q(o_buffer2_data[18]) );
  DFFSR \o_buffer2_data_reg[26]  ( .D(n498), .CLK(clk), .R(n153), .S(1'b1), 
        .Q(o_buffer2_data[26]) );
  DFFSR \o_buffer2_data_reg[3]  ( .D(n521), .CLK(clk), .R(n153), .S(1'b1), .Q(
        o_buffer2_data[3]) );
  DFFSR \o_buffer2_data_reg[11]  ( .D(n513), .CLK(clk), .R(n153), .S(1'b1), 
        .Q(o_buffer2_data[11]) );
  DFFSR \o_buffer2_data_reg[19]  ( .D(n505), .CLK(clk), .R(n153), .S(1'b1), 
        .Q(o_buffer2_data[19]) );
  DFFSR \o_buffer2_data_reg[27]  ( .D(n497), .CLK(clk), .R(n153), .S(1'b1), 
        .Q(o_buffer2_data[27]) );
  DFFSR \o_buffer2_data_reg[4]  ( .D(n520), .CLK(clk), .R(n153), .S(1'b1), .Q(
        o_buffer2_data[4]) );
  DFFSR \o_buffer2_data_reg[12]  ( .D(n512), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[12]) );
  DFFSR \o_buffer2_data_reg[20]  ( .D(n504), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[20]) );
  DFFSR \o_buffer2_data_reg[28]  ( .D(n496), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[28]) );
  DFFSR \o_buffer2_data_reg[5]  ( .D(n519), .CLK(clk), .R(n154), .S(1'b1), .Q(
        o_buffer2_data[5]) );
  DFFSR \o_buffer2_data_reg[13]  ( .D(n511), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[13]) );
  DFFSR \o_buffer2_data_reg[21]  ( .D(n503), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[21]) );
  DFFSR \o_buffer2_data_reg[29]  ( .D(n495), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[29]) );
  DFFSR \o_buffer2_data_reg[6]  ( .D(n518), .CLK(clk), .R(n154), .S(1'b1), .Q(
        o_buffer2_data[6]) );
  DFFSR \o_buffer2_data_reg[14]  ( .D(n510), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[14]) );
  DFFSR \o_buffer2_data_reg[22]  ( .D(n502), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[22]) );
  DFFSR \o_buffer2_data_reg[30]  ( .D(n494), .CLK(clk), .R(n154), .S(1'b1), 
        .Q(o_buffer2_data[30]) );
  DFFSR \o_buffer2_data_reg[7]  ( .D(n517), .CLK(clk), .R(n154), .S(1'b1), .Q(
        o_buffer2_data[7]) );
  DFFSR \o_buffer2_data_reg[15]  ( .D(n509), .CLK(clk), .R(n155), .S(1'b1), 
        .Q(o_buffer2_data[15]) );
  DFFSR \o_buffer2_data_reg[23]  ( .D(n501), .CLK(clk), .R(n155), .S(1'b1), 
        .Q(o_buffer2_data[23]) );
  DFFSR \o_buffer2_data_reg[31]  ( .D(n493), .CLK(clk), .R(n155), .S(1'b1), 
        .Q(o_buffer2_data[31]) );
  DFFSR o_empty_reg ( .D(next_empty), .CLK(clk), .R(1'b1), .S(n155), .Q(
        o_empty) );
  AND2X2 U118 ( .A(n121), .B(n237), .Y(n228) );
  AND2X2 U119 ( .A(n240), .B(n241), .Y(n225) );
  AND2X2 U120 ( .A(n222), .B(n123), .Y(n293) );
  AND2X2 U121 ( .A(n247), .B(n285), .Y(n296) );
  AND2X2 U122 ( .A(n259), .B(n251), .Y(n315) );
  AND2X2 U123 ( .A(n304), .B(n303), .Y(n314) );
  AND2X2 U124 ( .A(n311), .B(n244), .Y(n319) );
  AND2X2 U125 ( .A(n316), .B(n120), .Y(n405) );
  AND2X2 U126 ( .A(n415), .B(n182), .Y(n301) );
  AND2X2 U127 ( .A(n417), .B(n182), .Y(n302) );
  AND2X2 U128 ( .A(n415), .B(n35), .Y(n308) );
  AND2X2 U129 ( .A(n35), .B(n417), .Y(n307) );
  AND2X2 U130 ( .A(n418), .B(n35), .Y(n305) );
  AND2X2 U131 ( .A(n418), .B(n116), .Y(n297) );
  AND2X2 U132 ( .A(n419), .B(n35), .Y(n304) );
  AND2X2 U133 ( .A(n419), .B(n116), .Y(n299) );
  NOR2X1 U241 ( .A(n223), .B(n224), .Y(next_empty) );
  NAND2X1 U242 ( .A(n161), .B(n225), .Y(n224) );
  NAND3X1 U245 ( .A(n227), .B(n228), .C(n229), .Y(n226) );
  NOR2X1 U246 ( .A(n230), .B(n231), .Y(n229) );
  NAND2X1 U247 ( .A(n232), .B(n233), .Y(n231) );
  NAND3X1 U248 ( .A(n234), .B(n163), .C(n235), .Y(n230) );
  NOR2X1 U249 ( .A(n238), .B(n239), .Y(n227) );
  NOR2X1 U251 ( .A(n242), .B(n243), .Y(n241) );
  NAND2X1 U252 ( .A(n244), .B(n245), .Y(n243) );
  NAND3X1 U253 ( .A(n246), .B(n163), .C(n247), .Y(n242) );
  NOR2X1 U254 ( .A(n248), .B(n249), .Y(n240) );
  OAI21X1 U255 ( .A(n250), .B(n158), .C(n160), .Y(n249) );
  NAND3X1 U256 ( .A(n162), .B(n251), .C(n252), .Y(n239) );
  NOR2X1 U257 ( .A(n187), .B(n253), .Y(n252) );
  NAND2X1 U258 ( .A(n254), .B(n255), .Y(n253) );
  NAND3X1 U259 ( .A(n257), .B(n258), .C(n259), .Y(n248) );
  NAND3X1 U261 ( .A(n261), .B(n262), .C(n263), .Y(n260) );
  NOR2X1 U262 ( .A(n264), .B(n265), .Y(n263) );
  NAND2X1 U263 ( .A(n266), .B(n121), .Y(n265) );
  NAND3X1 U264 ( .A(n267), .B(n163), .C(n247), .Y(n264) );
  AOI21X1 U265 ( .A(i_write_complete), .B(n268), .C(n256), .Y(n262) );
  OAI21X1 U266 ( .A(i_write_complete), .B(n269), .C(n270), .Y(n256) );
  NOR2X1 U267 ( .A(n271), .B(n272), .Y(n261) );
  NAND3X1 U269 ( .A(n274), .B(n275), .C(n276), .Y(n273) );
  NOR2X1 U270 ( .A(n277), .B(n278), .Y(n276) );
  NAND2X1 U271 ( .A(n254), .B(n244), .Y(n278) );
  NAND3X1 U272 ( .A(n246), .B(n163), .C(n233), .Y(n277) );
  AOI22X1 U273 ( .A(i_write_complete), .B(n280), .C(n268), .D(n158), .Y(n275)
         );
  NOR2X1 U274 ( .A(n281), .B(n272), .Y(n274) );
  OR2X1 U275 ( .A(n282), .B(n283), .Y(n272) );
  OAI21X1 U276 ( .A(i_write_complete), .B(n250), .C(n120), .Y(n283) );
  NAND3X1 U277 ( .A(n285), .B(n234), .C(n258), .Y(n282) );
  NAND3X1 U280 ( .A(n184), .B(n185), .C(n289), .Y(n288) );
  AOI21X1 U281 ( .A(n279), .B(n35), .C(n290), .Y(n289) );
  NOR2X1 U282 ( .A(n291), .B(n292), .Y(n279) );
  NAND3X1 U283 ( .A(n164), .B(n181), .C(n293), .Y(n292) );
  NOR2X1 U284 ( .A(n294), .B(n295), .Y(n222) );
  NAND3X1 U285 ( .A(n267), .B(n246), .C(n175), .Y(n295) );
  NAND3X1 U286 ( .A(n233), .B(n255), .C(n296), .Y(n290) );
  NAND2X1 U287 ( .A(n297), .B(n298), .Y(n285) );
  NAND2X1 U288 ( .A(n299), .B(n300), .Y(n247) );
  NAND2X1 U289 ( .A(n301), .B(n298), .Y(n255) );
  NAND2X1 U290 ( .A(n302), .B(n303), .Y(n233) );
  NAND2X1 U291 ( .A(n298), .B(n304), .Y(n246) );
  NAND2X1 U292 ( .A(n305), .B(n303), .Y(n267) );
  NAND3X1 U293 ( .A(n234), .B(n270), .C(n235), .Y(n294) );
  NAND2X1 U294 ( .A(n306), .B(n307), .Y(n235) );
  NAND2X1 U295 ( .A(n300), .B(n307), .Y(n270) );
  NAND2X1 U296 ( .A(n303), .B(n308), .Y(n234) );
  NAND2X1 U297 ( .A(n257), .B(n309), .Y(n268) );
  NAND2X1 U298 ( .A(n299), .B(n298), .Y(n257) );
  OAI21X1 U299 ( .A(n116), .B(n310), .C(n311), .Y(n281) );
  NAND3X1 U300 ( .A(n177), .B(n250), .C(n312), .Y(n291) );
  NOR2X1 U301 ( .A(n178), .B(n145), .Y(n312) );
  NAND2X1 U302 ( .A(n302), .B(n300), .Y(n269) );
  NOR2X1 U303 ( .A(n314), .B(n173), .Y(n250) );
  NAND2X1 U304 ( .A(n301), .B(n303), .Y(n237) );
  NAND3X1 U305 ( .A(n266), .B(n232), .C(n315), .Y(n280) );
  NAND2X1 U306 ( .A(n302), .B(n306), .Y(n232) );
  NAND2X1 U307 ( .A(n297), .B(n303), .Y(n266) );
  NAND3X1 U308 ( .A(n120), .B(n316), .C(n309), .Y(n238) );
  NAND2X1 U309 ( .A(n306), .B(n308), .Y(n309) );
  NAND3X1 U310 ( .A(n317), .B(n318), .C(n259), .Y(n271) );
  NAND2X1 U311 ( .A(n305), .B(n300), .Y(n259) );
  NAND3X1 U312 ( .A(n319), .B(n251), .C(n320), .Y(n287) );
  AOI21X1 U313 ( .A(i_save), .B(n145), .C(n314), .Y(n320) );
  NAND2X1 U314 ( .A(n298), .B(n307), .Y(n251) );
  NAND2X1 U315 ( .A(n299), .B(n306), .Y(n311) );
  OAI21X1 U316 ( .A(n172), .B(n140), .C(n322), .Y(n493) );
  OAI21X1 U317 ( .A(n123), .B(n145), .C(o_buffer2_data[31]), .Y(n322) );
  OAI21X1 U318 ( .A(n171), .B(n145), .C(n323), .Y(n494) );
  OAI21X1 U319 ( .A(n123), .B(n145), .C(o_buffer2_data[30]), .Y(n323) );
  OAI21X1 U320 ( .A(n170), .B(n145), .C(n324), .Y(n495) );
  OAI21X1 U321 ( .A(n123), .B(n144), .C(o_buffer2_data[29]), .Y(n324) );
  OAI21X1 U322 ( .A(n169), .B(n144), .C(n325), .Y(n496) );
  OAI21X1 U323 ( .A(n123), .B(n144), .C(o_buffer2_data[28]), .Y(n325) );
  OAI21X1 U324 ( .A(n168), .B(n144), .C(n326), .Y(n497) );
  OAI21X1 U325 ( .A(n123), .B(n144), .C(o_buffer2_data[27]), .Y(n326) );
  OAI21X1 U326 ( .A(n167), .B(n144), .C(n327), .Y(n498) );
  OAI21X1 U327 ( .A(n123), .B(n144), .C(o_buffer2_data[26]), .Y(n327) );
  OAI21X1 U328 ( .A(n166), .B(n144), .C(n328), .Y(n499) );
  OAI21X1 U329 ( .A(n122), .B(n144), .C(o_buffer2_data[25]), .Y(n328) );
  OAI21X1 U330 ( .A(n165), .B(n144), .C(n329), .Y(n500) );
  OAI21X1 U331 ( .A(n122), .B(n144), .C(o_buffer2_data[24]), .Y(n329) );
  OAI21X1 U332 ( .A(n172), .B(n144), .C(n330), .Y(n501) );
  OAI21X1 U333 ( .A(n122), .B(n143), .C(o_buffer2_data[23]), .Y(n330) );
  OAI21X1 U334 ( .A(n171), .B(n143), .C(n331), .Y(n502) );
  OAI21X1 U335 ( .A(n122), .B(n143), .C(o_buffer2_data[22]), .Y(n331) );
  OAI21X1 U336 ( .A(n170), .B(n143), .C(n332), .Y(n503) );
  OAI21X1 U337 ( .A(n122), .B(n143), .C(o_buffer2_data[21]), .Y(n332) );
  OAI21X1 U338 ( .A(n169), .B(n143), .C(n333), .Y(n504) );
  OAI21X1 U339 ( .A(n122), .B(n143), .C(o_buffer2_data[20]), .Y(n333) );
  OAI21X1 U340 ( .A(n168), .B(n143), .C(n334), .Y(n505) );
  OAI21X1 U341 ( .A(n122), .B(n143), .C(o_buffer2_data[19]), .Y(n334) );
  OAI21X1 U342 ( .A(n167), .B(n143), .C(n335), .Y(n506) );
  OAI21X1 U343 ( .A(n122), .B(n143), .C(o_buffer2_data[18]), .Y(n335) );
  OAI21X1 U344 ( .A(n166), .B(n143), .C(n336), .Y(n507) );
  OAI21X1 U345 ( .A(n122), .B(n142), .C(o_buffer2_data[17]), .Y(n336) );
  OAI21X1 U346 ( .A(n165), .B(n142), .C(n337), .Y(n508) );
  OAI21X1 U347 ( .A(n122), .B(n142), .C(o_buffer2_data[16]), .Y(n337) );
  OAI21X1 U348 ( .A(n172), .B(n142), .C(n338), .Y(n509) );
  OAI21X1 U349 ( .A(n122), .B(n142), .C(o_buffer2_data[15]), .Y(n338) );
  OAI21X1 U350 ( .A(n171), .B(n142), .C(n339), .Y(n510) );
  OAI21X1 U351 ( .A(n122), .B(n142), .C(o_buffer2_data[14]), .Y(n339) );
  OAI21X1 U352 ( .A(n170), .B(n142), .C(n340), .Y(n511) );
  OAI21X1 U353 ( .A(n122), .B(n142), .C(o_buffer2_data[13]), .Y(n340) );
  OAI21X1 U354 ( .A(n169), .B(n142), .C(n341), .Y(n512) );
  OAI21X1 U355 ( .A(n122), .B(n142), .C(o_buffer2_data[12]), .Y(n341) );
  OAI21X1 U356 ( .A(n168), .B(n141), .C(n342), .Y(n513) );
  OAI21X1 U357 ( .A(n122), .B(n141), .C(o_buffer2_data[11]), .Y(n342) );
  OAI21X1 U358 ( .A(n167), .B(n141), .C(n343), .Y(n514) );
  OAI21X1 U359 ( .A(n122), .B(n141), .C(o_buffer2_data[10]), .Y(n343) );
  OAI21X1 U360 ( .A(n166), .B(n141), .C(n344), .Y(n515) );
  OAI21X1 U361 ( .A(n122), .B(n141), .C(o_buffer2_data[9]), .Y(n344) );
  OAI21X1 U362 ( .A(n165), .B(n141), .C(n345), .Y(n516) );
  OAI21X1 U363 ( .A(n122), .B(n141), .C(o_buffer2_data[8]), .Y(n345) );
  OAI21X1 U364 ( .A(n172), .B(n141), .C(n346), .Y(n517) );
  OAI21X1 U365 ( .A(n122), .B(n141), .C(o_buffer2_data[7]), .Y(n346) );
  NAND3X1 U366 ( .A(n348), .B(n349), .C(n350), .Y(n347) );
  NOR2X1 U367 ( .A(n351), .B(n352), .Y(n350) );
  OAI22X1 U368 ( .A(n316), .B(n286), .C(n121), .D(n216), .Y(n352) );
  OAI21X1 U369 ( .A(n120), .B(n208), .C(n353), .Y(n351) );
  AOI22X1 U370 ( .A(m9[7]), .B(n187), .C(m8[7]), .D(n176), .Y(n353) );
  AOI22X1 U371 ( .A(m4[7]), .B(n179), .C(m3[7]), .D(n186), .Y(n349) );
  AOI22X1 U372 ( .A(m2[7]), .B(n180), .C(m1[7]), .D(n183), .Y(n348) );
  OAI21X1 U373 ( .A(n171), .B(n142), .C(n354), .Y(n518) );
  OAI21X1 U374 ( .A(n122), .B(n141), .C(o_buffer2_data[6]), .Y(n354) );
  NAND3X1 U375 ( .A(n356), .B(n357), .C(n358), .Y(n355) );
  NOR2X1 U376 ( .A(n359), .B(n360), .Y(n358) );
  OAI22X1 U377 ( .A(n316), .B(n321), .C(n121), .D(n217), .Y(n360) );
  OAI21X1 U378 ( .A(n120), .B(n209), .C(n361), .Y(n359) );
  AOI22X1 U379 ( .A(m9[6]), .B(n187), .C(m8[6]), .D(n176), .Y(n361) );
  AOI22X1 U380 ( .A(m4[6]), .B(n179), .C(m3[6]), .D(n186), .Y(n357) );
  AOI22X1 U381 ( .A(m2[6]), .B(n180), .C(m1[6]), .D(n183), .Y(n356) );
  OAI21X1 U382 ( .A(n170), .B(n141), .C(n362), .Y(n519) );
  OAI21X1 U383 ( .A(n122), .B(n140), .C(o_buffer2_data[5]), .Y(n362) );
  NAND3X1 U384 ( .A(n364), .B(n365), .C(n366), .Y(n363) );
  NOR2X1 U385 ( .A(n367), .B(n368), .Y(n366) );
  OAI22X1 U386 ( .A(n316), .B(n597), .C(n121), .D(n218), .Y(n368) );
  OAI21X1 U387 ( .A(n120), .B(n210), .C(n369), .Y(n367) );
  AOI22X1 U388 ( .A(m9[5]), .B(n187), .C(m8[5]), .D(n176), .Y(n369) );
  AOI22X1 U389 ( .A(m4[5]), .B(n179), .C(m3[5]), .D(n186), .Y(n365) );
  AOI22X1 U390 ( .A(m2[5]), .B(n180), .C(m1[5]), .D(n183), .Y(n364) );
  OAI21X1 U391 ( .A(n169), .B(n140), .C(n370), .Y(n520) );
  OAI21X1 U392 ( .A(n122), .B(n140), .C(o_buffer2_data[4]), .Y(n370) );
  NAND3X1 U393 ( .A(n372), .B(n373), .C(n374), .Y(n371) );
  NOR2X1 U394 ( .A(n375), .B(n376), .Y(n374) );
  OAI22X1 U395 ( .A(n316), .B(n598), .C(n121), .D(n219), .Y(n376) );
  OAI21X1 U396 ( .A(n120), .B(n211), .C(n377), .Y(n375) );
  AOI22X1 U397 ( .A(m9[4]), .B(n187), .C(m8[4]), .D(n176), .Y(n377) );
  AOI22X1 U398 ( .A(m4[4]), .B(n179), .C(m3[4]), .D(n186), .Y(n373) );
  AOI22X1 U399 ( .A(m2[4]), .B(n180), .C(m1[4]), .D(n183), .Y(n372) );
  OAI21X1 U400 ( .A(n168), .B(n140), .C(n378), .Y(n521) );
  OAI21X1 U401 ( .A(n122), .B(n140), .C(o_buffer2_data[3]), .Y(n378) );
  NAND3X1 U402 ( .A(n380), .B(n381), .C(n382), .Y(n379) );
  NOR2X1 U403 ( .A(n383), .B(n384), .Y(n382) );
  OAI22X1 U404 ( .A(n316), .B(n599), .C(n121), .D(n220), .Y(n384) );
  OAI21X1 U405 ( .A(n120), .B(n212), .C(n385), .Y(n383) );
  AOI22X1 U406 ( .A(m9[3]), .B(n187), .C(m8[3]), .D(n176), .Y(n385) );
  AOI22X1 U407 ( .A(m4[3]), .B(n179), .C(m3[3]), .D(n186), .Y(n381) );
  AOI22X1 U408 ( .A(m2[3]), .B(n180), .C(m1[3]), .D(n183), .Y(n380) );
  OAI21X1 U409 ( .A(n167), .B(n140), .C(n386), .Y(n522) );
  OAI21X1 U410 ( .A(n122), .B(n140), .C(o_buffer2_data[2]), .Y(n386) );
  NAND3X1 U411 ( .A(n388), .B(n389), .C(n390), .Y(n387) );
  NOR2X1 U412 ( .A(n391), .B(n392), .Y(n390) );
  OAI22X1 U413 ( .A(n316), .B(n600), .C(n121), .D(n221), .Y(n392) );
  OAI21X1 U414 ( .A(n120), .B(n213), .C(n393), .Y(n391) );
  AOI22X1 U415 ( .A(m9[2]), .B(n187), .C(m8[2]), .D(n176), .Y(n393) );
  AOI22X1 U416 ( .A(m4[2]), .B(n179), .C(m3[2]), .D(n186), .Y(n389) );
  AOI22X1 U417 ( .A(m2[2]), .B(n180), .C(m1[2]), .D(n183), .Y(n388) );
  OAI21X1 U418 ( .A(n166), .B(n140), .C(n394), .Y(n523) );
  OAI21X1 U419 ( .A(n122), .B(n140), .C(o_buffer2_data[1]), .Y(n394) );
  NAND3X1 U420 ( .A(n396), .B(n397), .C(n398), .Y(n395) );
  NOR2X1 U421 ( .A(n399), .B(n400), .Y(n398) );
  OAI22X1 U422 ( .A(n316), .B(n601), .C(n121), .D(n236), .Y(n400) );
  OAI21X1 U423 ( .A(n120), .B(n214), .C(n401), .Y(n399) );
  AOI22X1 U424 ( .A(m9[1]), .B(n187), .C(m8[1]), .D(n176), .Y(n401) );
  AOI22X1 U425 ( .A(m4[1]), .B(n179), .C(m3[1]), .D(n186), .Y(n397) );
  AOI22X1 U426 ( .A(m2[1]), .B(n180), .C(m1[1]), .D(n183), .Y(n396) );
  OAI21X1 U427 ( .A(n165), .B(n140), .C(n402), .Y(n524) );
  OAI21X1 U428 ( .A(n122), .B(n140), .C(o_buffer2_data[0]), .Y(n402) );
  NAND3X1 U429 ( .A(n404), .B(n405), .C(n406), .Y(n403) );
  NOR2X1 U430 ( .A(n407), .B(n408), .Y(n406) );
  NAND2X1 U431 ( .A(n258), .B(n244), .Y(n408) );
  NAND3X1 U432 ( .A(n318), .B(n121), .C(n245), .Y(n407) );
  NOR2X1 U433 ( .A(n117), .B(n187), .Y(n404) );
  NAND3X1 U434 ( .A(n410), .B(n411), .C(n412), .Y(n409) );
  NOR2X1 U435 ( .A(n413), .B(n414), .Y(n412) );
  OAI22X1 U436 ( .A(n316), .B(n602), .C(n121), .D(n284), .Y(n414) );
  NAND2X1 U438 ( .A(n304), .B(n300), .Y(n316) );
  OAI21X1 U439 ( .A(n120), .B(n215), .C(n416), .Y(n413) );
  AOI22X1 U440 ( .A(m9[0]), .B(n187), .C(m8[0]), .D(n176), .Y(n416) );
  NAND2X1 U441 ( .A(n302), .B(n298), .Y(n254) );
  NAND2X1 U442 ( .A(n298), .B(n308), .Y(n317) );
  NOR2X1 U443 ( .A(n190), .B(n188), .Y(n415) );
  NOR2X1 U445 ( .A(n188), .B(curr[1]), .Y(n417) );
  AOI22X1 U446 ( .A(m4[0]), .B(n179), .C(m3[0]), .D(n186), .Y(n411) );
  NAND2X1 U447 ( .A(n305), .B(n298), .Y(n244) );
  NOR2X1 U448 ( .A(n189), .B(curr[2]), .Y(n298) );
  NAND2X1 U449 ( .A(n297), .B(n300), .Y(n258) );
  NOR2X1 U450 ( .A(n189), .B(n191), .Y(n300) );
  AOI22X1 U451 ( .A(m2[0]), .B(n180), .C(m1[0]), .D(n183), .Y(n410) );
  NAND2X1 U452 ( .A(n304), .B(n306), .Y(n318) );
  NAND2X1 U453 ( .A(n299), .B(n303), .Y(n245) );
  NOR2X1 U454 ( .A(n191), .B(curr[3]), .Y(n303) );
  NOR2X1 U455 ( .A(n190), .B(curr[4]), .Y(n419) );
  OAI21X1 U456 ( .A(n130), .B(n192), .C(n421), .Y(n525) );
  NAND2X1 U457 ( .A(i_processed_sum_9[7]), .B(n137), .Y(n421) );
  OAI21X1 U458 ( .A(n128), .B(n193), .C(n422), .Y(n526) );
  NAND2X1 U459 ( .A(i_processed_sum_9[6]), .B(n137), .Y(n422) );
  OAI21X1 U460 ( .A(n128), .B(n194), .C(n423), .Y(n527) );
  NAND2X1 U461 ( .A(i_processed_sum_9[5]), .B(n137), .Y(n423) );
  OAI21X1 U462 ( .A(n128), .B(n195), .C(n424), .Y(n528) );
  NAND2X1 U463 ( .A(i_processed_sum_9[4]), .B(n137), .Y(n424) );
  OAI21X1 U464 ( .A(n128), .B(n196), .C(n425), .Y(n529) );
  NAND2X1 U465 ( .A(i_processed_sum_9[3]), .B(n137), .Y(n425) );
  OAI21X1 U466 ( .A(n128), .B(n197), .C(n426), .Y(n530) );
  NAND2X1 U467 ( .A(i_processed_sum_9[2]), .B(n137), .Y(n426) );
  OAI21X1 U468 ( .A(n128), .B(n198), .C(n427), .Y(n531) );
  NAND2X1 U469 ( .A(i_processed_sum_9[1]), .B(n136), .Y(n427) );
  OAI21X1 U470 ( .A(n128), .B(n199), .C(n428), .Y(n532) );
  NAND2X1 U471 ( .A(i_processed_sum_9[0]), .B(n136), .Y(n428) );
  OAI21X1 U472 ( .A(n128), .B(n200), .C(n429), .Y(n533) );
  NAND2X1 U473 ( .A(i_processed_sum_8[7]), .B(n136), .Y(n429) );
  OAI21X1 U474 ( .A(n128), .B(n201), .C(n430), .Y(n534) );
  NAND2X1 U475 ( .A(i_processed_sum_8[6]), .B(n136), .Y(n430) );
  OAI21X1 U476 ( .A(n128), .B(n202), .C(n431), .Y(n535) );
  NAND2X1 U477 ( .A(i_processed_sum_8[5]), .B(n136), .Y(n431) );
  OAI21X1 U478 ( .A(n128), .B(n203), .C(n432), .Y(n536) );
  NAND2X1 U479 ( .A(i_processed_sum_8[4]), .B(n136), .Y(n432) );
  OAI21X1 U480 ( .A(n128), .B(n204), .C(n433), .Y(n537) );
  NAND2X1 U481 ( .A(i_processed_sum_8[3]), .B(n136), .Y(n433) );
  OAI21X1 U482 ( .A(n128), .B(n205), .C(n434), .Y(n538) );
  NAND2X1 U483 ( .A(i_processed_sum_8[2]), .B(n136), .Y(n434) );
  OAI21X1 U484 ( .A(n129), .B(n206), .C(n435), .Y(n539) );
  NAND2X1 U485 ( .A(i_processed_sum_8[1]), .B(n136), .Y(n435) );
  OAI21X1 U486 ( .A(n129), .B(n207), .C(n436), .Y(n540) );
  NAND2X1 U487 ( .A(i_processed_sum_8[0]), .B(n136), .Y(n436) );
  OAI21X1 U488 ( .A(n129), .B(n208), .C(n437), .Y(n541) );
  NAND2X1 U489 ( .A(i_processed_sum_7[7]), .B(n136), .Y(n437) );
  OAI21X1 U490 ( .A(n129), .B(n209), .C(n438), .Y(n542) );
  NAND2X1 U491 ( .A(i_processed_sum_7[6]), .B(n135), .Y(n438) );
  OAI21X1 U492 ( .A(n129), .B(n210), .C(n439), .Y(n543) );
  NAND2X1 U493 ( .A(i_processed_sum_7[5]), .B(n135), .Y(n439) );
  OAI21X1 U494 ( .A(n129), .B(n211), .C(n440), .Y(n544) );
  NAND2X1 U495 ( .A(i_processed_sum_7[4]), .B(n136), .Y(n440) );
  OAI21X1 U496 ( .A(n129), .B(n212), .C(n441), .Y(n545) );
  NAND2X1 U497 ( .A(i_processed_sum_7[3]), .B(n135), .Y(n441) );
  OAI21X1 U498 ( .A(n129), .B(n213), .C(n442), .Y(n546) );
  NAND2X1 U499 ( .A(i_processed_sum_7[2]), .B(n135), .Y(n442) );
  OAI21X1 U500 ( .A(n129), .B(n214), .C(n443), .Y(n547) );
  NAND2X1 U501 ( .A(i_processed_sum_7[1]), .B(n135), .Y(n443) );
  OAI21X1 U502 ( .A(n129), .B(n215), .C(n444), .Y(n548) );
  NAND2X1 U503 ( .A(i_processed_sum_7[0]), .B(n135), .Y(n444) );
  OAI21X1 U504 ( .A(n129), .B(n216), .C(n445), .Y(n549) );
  NAND2X1 U505 ( .A(i_processed_sum_6[7]), .B(n135), .Y(n445) );
  OAI21X1 U506 ( .A(n129), .B(n217), .C(n446), .Y(n550) );
  NAND2X1 U507 ( .A(i_processed_sum_6[6]), .B(n135), .Y(n446) );
  OAI21X1 U508 ( .A(n129), .B(n218), .C(n447), .Y(n551) );
  NAND2X1 U509 ( .A(i_processed_sum_6[5]), .B(n135), .Y(n447) );
  OAI21X1 U510 ( .A(n130), .B(n219), .C(n448), .Y(n552) );
  NAND2X1 U511 ( .A(i_processed_sum_6[4]), .B(n134), .Y(n448) );
  OAI21X1 U512 ( .A(n130), .B(n220), .C(n449), .Y(n553) );
  NAND2X1 U513 ( .A(i_processed_sum_6[3]), .B(n135), .Y(n449) );
  OAI21X1 U514 ( .A(n130), .B(n221), .C(n450), .Y(n554) );
  NAND2X1 U515 ( .A(i_processed_sum_6[2]), .B(n134), .Y(n450) );
  OAI21X1 U516 ( .A(n130), .B(n236), .C(n451), .Y(n555) );
  NAND2X1 U517 ( .A(i_processed_sum_6[1]), .B(n134), .Y(n451) );
  OAI21X1 U518 ( .A(n130), .B(n284), .C(n452), .Y(n556) );
  NAND2X1 U519 ( .A(i_processed_sum_6[0]), .B(n135), .Y(n452) );
  OAI21X1 U520 ( .A(n130), .B(n286), .C(n453), .Y(n557) );
  NAND2X1 U521 ( .A(i_processed_sum_5[7]), .B(n134), .Y(n453) );
  OAI21X1 U522 ( .A(n130), .B(n321), .C(n454), .Y(n558) );
  NAND2X1 U523 ( .A(i_processed_sum_5[6]), .B(n134), .Y(n454) );
  OAI21X1 U524 ( .A(n130), .B(n597), .C(n455), .Y(n559) );
  NAND2X1 U525 ( .A(i_processed_sum_5[5]), .B(n135), .Y(n455) );
  OAI21X1 U526 ( .A(n130), .B(n598), .C(n456), .Y(n560) );
  NAND2X1 U527 ( .A(i_processed_sum_5[4]), .B(n134), .Y(n456) );
  OAI21X1 U528 ( .A(n131), .B(n599), .C(n457), .Y(n561) );
  NAND2X1 U529 ( .A(i_processed_sum_5[3]), .B(n134), .Y(n457) );
  OAI21X1 U530 ( .A(n130), .B(n600), .C(n458), .Y(n562) );
  NAND2X1 U531 ( .A(i_processed_sum_5[2]), .B(n134), .Y(n458) );
  OAI21X1 U532 ( .A(n130), .B(n601), .C(n459), .Y(n563) );
  NAND2X1 U533 ( .A(i_processed_sum_5[1]), .B(n134), .Y(n459) );
  OAI21X1 U534 ( .A(n130), .B(n602), .C(n460), .Y(n564) );
  NAND2X1 U535 ( .A(i_processed_sum_5[0]), .B(n133), .Y(n460) );
  OAI21X1 U536 ( .A(n131), .B(n603), .C(n461), .Y(n565) );
  NAND2X1 U537 ( .A(i_processed_sum_4[7]), .B(n134), .Y(n461) );
  OAI21X1 U538 ( .A(n131), .B(n604), .C(n462), .Y(n566) );
  NAND2X1 U539 ( .A(i_processed_sum_4[6]), .B(n133), .Y(n462) );
  OAI21X1 U540 ( .A(n131), .B(n605), .C(n463), .Y(n567) );
  NAND2X1 U541 ( .A(i_processed_sum_4[5]), .B(n133), .Y(n463) );
  OAI21X1 U542 ( .A(n131), .B(n606), .C(n464), .Y(n568) );
  NAND2X1 U543 ( .A(i_processed_sum_4[4]), .B(n134), .Y(n464) );
  OAI21X1 U544 ( .A(n131), .B(n607), .C(n465), .Y(n569) );
  NAND2X1 U545 ( .A(i_processed_sum_4[3]), .B(n133), .Y(n465) );
  OAI21X1 U546 ( .A(n131), .B(n608), .C(n466), .Y(n570) );
  NAND2X1 U547 ( .A(i_processed_sum_4[2]), .B(n133), .Y(n466) );
  OAI21X1 U548 ( .A(n131), .B(n609), .C(n467), .Y(n571) );
  NAND2X1 U549 ( .A(i_processed_sum_4[1]), .B(n134), .Y(n467) );
  OAI21X1 U550 ( .A(n131), .B(n610), .C(n468), .Y(n572) );
  NAND2X1 U551 ( .A(i_processed_sum_4[0]), .B(n134), .Y(n468) );
  OAI21X1 U552 ( .A(n131), .B(n611), .C(n469), .Y(n573) );
  NAND2X1 U553 ( .A(i_processed_sum_3[7]), .B(n133), .Y(n469) );
  OAI21X1 U554 ( .A(n131), .B(n612), .C(n470), .Y(n574) );
  NAND2X1 U555 ( .A(i_processed_sum_3[6]), .B(n133), .Y(n470) );
  OAI21X1 U556 ( .A(n132), .B(n613), .C(n471), .Y(n575) );
  NAND2X1 U557 ( .A(i_processed_sum_3[5]), .B(n134), .Y(n471) );
  OAI21X1 U558 ( .A(n132), .B(n614), .C(n472), .Y(n576) );
  NAND2X1 U559 ( .A(i_processed_sum_3[4]), .B(n133), .Y(n472) );
  OAI21X1 U560 ( .A(n131), .B(n615), .C(n473), .Y(n577) );
  NAND2X1 U561 ( .A(i_processed_sum_3[3]), .B(n135), .Y(n473) );
  OAI21X1 U562 ( .A(n132), .B(n616), .C(n474), .Y(n578) );
  NAND2X1 U563 ( .A(i_processed_sum_3[2]), .B(n134), .Y(n474) );
  OAI21X1 U564 ( .A(n132), .B(n617), .C(n475), .Y(n579) );
  NAND2X1 U565 ( .A(i_processed_sum_3[1]), .B(n134), .Y(n475) );
  OAI21X1 U566 ( .A(n132), .B(n618), .C(n476), .Y(n580) );
  NAND2X1 U567 ( .A(i_processed_sum_3[0]), .B(n134), .Y(n476) );
  OAI21X1 U568 ( .A(n132), .B(n619), .C(n477), .Y(n581) );
  NAND2X1 U569 ( .A(i_processed_sum_2[7]), .B(n135), .Y(n477) );
  OAI21X1 U570 ( .A(n132), .B(n620), .C(n478), .Y(n582) );
  NAND2X1 U571 ( .A(i_processed_sum_2[6]), .B(n134), .Y(n478) );
  OAI21X1 U572 ( .A(n132), .B(n621), .C(n479), .Y(n583) );
  NAND2X1 U573 ( .A(i_processed_sum_2[5]), .B(n135), .Y(n479) );
  OAI21X1 U574 ( .A(n132), .B(n622), .C(n480), .Y(n584) );
  NAND2X1 U575 ( .A(i_processed_sum_2[4]), .B(n135), .Y(n480) );
  OAI21X1 U576 ( .A(n133), .B(n623), .C(n481), .Y(n585) );
  NAND2X1 U577 ( .A(i_processed_sum_2[3]), .B(n135), .Y(n481) );
  OAI21X1 U578 ( .A(n132), .B(n624), .C(n482), .Y(n586) );
  NAND2X1 U579 ( .A(i_processed_sum_2[2]), .B(n135), .Y(n482) );
  OAI21X1 U580 ( .A(n131), .B(n625), .C(n483), .Y(n587) );
  NAND2X1 U581 ( .A(i_processed_sum_2[1]), .B(n136), .Y(n483) );
  OAI21X1 U582 ( .A(n133), .B(n626), .C(n484), .Y(n588) );
  NAND2X1 U583 ( .A(i_processed_sum_2[0]), .B(n136), .Y(n484) );
  OAI21X1 U584 ( .A(n132), .B(n627), .C(n485), .Y(n589) );
  NAND2X1 U585 ( .A(i_processed_sum_1[7]), .B(n136), .Y(n485) );
  OAI21X1 U586 ( .A(n133), .B(n628), .C(n486), .Y(n590) );
  NAND2X1 U587 ( .A(i_processed_sum_1[6]), .B(n136), .Y(n486) );
  OAI21X1 U588 ( .A(n133), .B(n629), .C(n487), .Y(n591) );
  NAND2X1 U589 ( .A(i_processed_sum_1[5]), .B(n136), .Y(n487) );
  OAI21X1 U590 ( .A(n132), .B(n630), .C(n488), .Y(n592) );
  NAND2X1 U591 ( .A(i_processed_sum_1[4]), .B(n136), .Y(n488) );
  OAI21X1 U592 ( .A(n133), .B(n631), .C(n489), .Y(n593) );
  NAND2X1 U593 ( .A(i_processed_sum_1[3]), .B(n137), .Y(n489) );
  OAI21X1 U594 ( .A(n133), .B(n632), .C(n490), .Y(n594) );
  NAND2X1 U595 ( .A(i_processed_sum_1[2]), .B(n137), .Y(n490) );
  OAI21X1 U596 ( .A(n132), .B(n633), .C(n491), .Y(n595) );
  NAND2X1 U597 ( .A(i_processed_sum_1[1]), .B(n137), .Y(n491) );
  OAI21X1 U598 ( .A(n133), .B(n634), .C(n492), .Y(n596) );
  NAND2X1 U599 ( .A(i_processed_sum_1[0]), .B(n137), .Y(n492) );
  NOR2X1 U600 ( .A(n145), .B(n310), .Y(n420) );
  NOR2X1 U602 ( .A(n310), .B(n35), .Y(n313) );
  NAND2X1 U603 ( .A(n418), .B(n306), .Y(n310) );
  NOR2X1 U604 ( .A(curr[3]), .B(curr[2]), .Y(n306) );
  NOR2X1 U605 ( .A(curr[4]), .B(curr[1]), .Y(n418) );
  BUFX2 U37 ( .A(curr[0]), .Y(n35) );
  INVX2 U116 ( .A(n317), .Y(n187) );
  INVX2 U117 ( .A(n118), .Y(n120) );
  INVX2 U134 ( .A(n403), .Y(n123) );
  INVX4 U135 ( .A(n119), .Y(n121) );
  OR2X2 U136 ( .A(n287), .B(n288), .Y(n114) );
  INVX2 U137 ( .A(n182), .Y(n115) );
  INVX2 U138 ( .A(n115), .Y(n116) );
  INVX2 U139 ( .A(n254), .Y(n117) );
  BUFX2 U140 ( .A(n125), .Y(n132) );
  BUFX2 U141 ( .A(n125), .Y(n131) );
  BUFX2 U142 ( .A(n124), .Y(n129) );
  BUFX2 U143 ( .A(n124), .Y(n128) );
  BUFX2 U144 ( .A(n124), .Y(n130) );
  BUFX2 U145 ( .A(n125), .Y(n133) );
  BUFX2 U146 ( .A(n126), .Y(n134) );
  BUFX2 U147 ( .A(n126), .Y(n135) );
  BUFX2 U148 ( .A(n126), .Y(n136) );
  INVX2 U149 ( .A(n403), .Y(n122) );
  BUFX2 U150 ( .A(n127), .Y(n137) );
  BUFX2 U151 ( .A(n420), .Y(n127) );
  BUFX2 U152 ( .A(n420), .Y(n126) );
  BUFX2 U153 ( .A(n420), .Y(n125) );
  BUFX2 U154 ( .A(n420), .Y(n124) );
  INVX2 U155 ( .A(n254), .Y(n176) );
  BUFX2 U156 ( .A(n139), .Y(n145) );
  BUFX2 U157 ( .A(n139), .Y(n143) );
  BUFX2 U158 ( .A(n138), .Y(n140) );
  BUFX2 U159 ( .A(n138), .Y(n142) );
  BUFX2 U160 ( .A(n139), .Y(n144) );
  BUFX2 U161 ( .A(n138), .Y(n141) );
  AND2X2 U162 ( .A(n303), .B(n307), .Y(n118) );
  AND2X2 U163 ( .A(n301), .B(n306), .Y(n119) );
  BUFX2 U164 ( .A(n313), .Y(n139) );
  BUFX2 U165 ( .A(n313), .Y(n138) );
  BUFX2 U166 ( .A(n_rst), .Y(n154) );
  BUFX2 U167 ( .A(n_rst), .Y(n153) );
  BUFX2 U168 ( .A(n_rst), .Y(n152) );
  BUFX2 U169 ( .A(n_rst), .Y(n151) );
  BUFX2 U170 ( .A(n_rst), .Y(n150) );
  BUFX2 U171 ( .A(n_rst), .Y(n149) );
  BUFX2 U172 ( .A(n_rst), .Y(n148) );
  BUFX2 U173 ( .A(n_rst), .Y(n147) );
  BUFX2 U174 ( .A(n_rst), .Y(n146) );
  BUFX2 U175 ( .A(n_rst), .Y(n155) );
  INVX2 U176 ( .A(n273), .Y(n156) );
  INVX2 U177 ( .A(n225), .Y(n157) );
  INVX2 U178 ( .A(i_write_complete), .Y(n158) );
  INVX2 U179 ( .A(n260), .Y(n159) );
  INVX2 U180 ( .A(n239), .Y(n160) );
  INVX2 U181 ( .A(n226), .Y(n161) );
  INVX2 U182 ( .A(n256), .Y(n162) );
  INVX2 U183 ( .A(n279), .Y(n163) );
  INVX2 U184 ( .A(n281), .Y(n164) );
  INVX2 U185 ( .A(n409), .Y(n165) );
  INVX2 U186 ( .A(n395), .Y(n166) );
  INVX2 U187 ( .A(n387), .Y(n167) );
  INVX2 U188 ( .A(n379), .Y(n168) );
  INVX2 U189 ( .A(n371), .Y(n169) );
  INVX2 U190 ( .A(n363), .Y(n170) );
  INVX2 U191 ( .A(n355), .Y(n171) );
  INVX2 U192 ( .A(n347), .Y(n172) );
  INVX2 U193 ( .A(n237), .Y(n173) );
  INVX2 U194 ( .A(n222), .Y(n174) );
  INVX2 U195 ( .A(n290), .Y(n175) );
  INVX2 U196 ( .A(n280), .Y(n177) );
  INVX2 U197 ( .A(n269), .Y(n178) );
  INVX2 U198 ( .A(n258), .Y(n179) );
  INVX2 U199 ( .A(n245), .Y(n180) );
  INVX2 U200 ( .A(n268), .Y(n181) );
  INVX2 U201 ( .A(n35), .Y(n182) );
  INVX2 U202 ( .A(n318), .Y(n183) );
  INVX2 U203 ( .A(n271), .Y(n184) );
  INVX2 U204 ( .A(n238), .Y(n185) );
  INVX2 U205 ( .A(n244), .Y(n186) );
  INVX2 U206 ( .A(curr[4]), .Y(n188) );
  INVX2 U207 ( .A(curr[3]), .Y(n189) );
  INVX2 U208 ( .A(curr[1]), .Y(n190) );
  INVX2 U209 ( .A(curr[2]), .Y(n191) );
  INVX2 U210 ( .A(m9[7]), .Y(n192) );
  INVX2 U211 ( .A(m9[6]), .Y(n193) );
  INVX2 U212 ( .A(m9[5]), .Y(n194) );
  INVX2 U213 ( .A(m9[4]), .Y(n195) );
  INVX2 U214 ( .A(m9[3]), .Y(n196) );
  INVX2 U215 ( .A(m9[2]), .Y(n197) );
  INVX2 U216 ( .A(m9[1]), .Y(n198) );
  INVX2 U217 ( .A(m9[0]), .Y(n199) );
  INVX2 U218 ( .A(m8[7]), .Y(n200) );
  INVX2 U219 ( .A(m8[6]), .Y(n201) );
  INVX2 U220 ( .A(m8[5]), .Y(n202) );
  INVX2 U221 ( .A(m8[4]), .Y(n203) );
  INVX2 U222 ( .A(m8[3]), .Y(n204) );
  INVX2 U223 ( .A(m8[2]), .Y(n205) );
  INVX2 U224 ( .A(m8[1]), .Y(n206) );
  INVX2 U225 ( .A(m8[0]), .Y(n207) );
  INVX2 U226 ( .A(m7[7]), .Y(n208) );
  INVX2 U227 ( .A(m7[6]), .Y(n209) );
  INVX2 U228 ( .A(m7[5]), .Y(n210) );
  INVX2 U229 ( .A(m7[4]), .Y(n211) );
  INVX2 U230 ( .A(m7[3]), .Y(n212) );
  INVX2 U231 ( .A(m7[2]), .Y(n213) );
  INVX2 U232 ( .A(m7[1]), .Y(n214) );
  INVX2 U233 ( .A(m7[0]), .Y(n215) );
  INVX2 U234 ( .A(m6[7]), .Y(n216) );
  INVX2 U235 ( .A(m6[6]), .Y(n217) );
  INVX2 U236 ( .A(m6[5]), .Y(n218) );
  INVX2 U237 ( .A(m6[4]), .Y(n219) );
  INVX2 U238 ( .A(m6[3]), .Y(n220) );
  INVX2 U239 ( .A(m6[2]), .Y(n221) );
  INVX2 U240 ( .A(m6[1]), .Y(n236) );
  INVX2 U243 ( .A(m6[0]), .Y(n284) );
  INVX2 U244 ( .A(m5[7]), .Y(n286) );
  INVX2 U250 ( .A(m5[6]), .Y(n321) );
  INVX2 U260 ( .A(m5[5]), .Y(n597) );
  INVX2 U268 ( .A(m5[4]), .Y(n598) );
  INVX2 U278 ( .A(m5[3]), .Y(n599) );
  INVX2 U279 ( .A(m5[2]), .Y(n600) );
  INVX2 U437 ( .A(m5[1]), .Y(n601) );
  INVX2 U444 ( .A(m5[0]), .Y(n602) );
  INVX2 U601 ( .A(m4[7]), .Y(n603) );
  INVX2 U606 ( .A(m4[6]), .Y(n604) );
  INVX2 U607 ( .A(m4[5]), .Y(n605) );
  INVX2 U608 ( .A(m4[4]), .Y(n606) );
  INVX2 U609 ( .A(m4[3]), .Y(n607) );
  INVX2 U610 ( .A(m4[2]), .Y(n608) );
  INVX2 U611 ( .A(m4[1]), .Y(n609) );
  INVX2 U612 ( .A(m4[0]), .Y(n610) );
  INVX2 U613 ( .A(m3[7]), .Y(n611) );
  INVX2 U614 ( .A(m3[6]), .Y(n612) );
  INVX2 U615 ( .A(m3[5]), .Y(n613) );
  INVX2 U616 ( .A(m3[4]), .Y(n614) );
  INVX2 U617 ( .A(m3[3]), .Y(n615) );
  INVX2 U618 ( .A(m3[2]), .Y(n616) );
  INVX2 U619 ( .A(m3[1]), .Y(n617) );
  INVX2 U620 ( .A(m3[0]), .Y(n618) );
  INVX2 U621 ( .A(m2[7]), .Y(n619) );
  INVX2 U622 ( .A(m2[6]), .Y(n620) );
  INVX2 U623 ( .A(m2[5]), .Y(n621) );
  INVX2 U624 ( .A(m2[4]), .Y(n622) );
  INVX2 U625 ( .A(m2[3]), .Y(n623) );
  INVX2 U626 ( .A(m2[2]), .Y(n624) );
  INVX2 U627 ( .A(m2[1]), .Y(n625) );
  INVX2 U628 ( .A(m2[0]), .Y(n626) );
  INVX2 U629 ( .A(m1[7]), .Y(n627) );
  INVX2 U630 ( .A(m1[6]), .Y(n628) );
  INVX2 U631 ( .A(m1[5]), .Y(n629) );
  INVX2 U632 ( .A(m1[4]), .Y(n630) );
  INVX2 U633 ( .A(m1[3]), .Y(n631) );
  INVX2 U634 ( .A(m1[2]), .Y(n632) );
  INVX2 U635 ( .A(m1[1]), .Y(n633) );
  INVX2 U636 ( .A(m1[0]), .Y(n634) );
  NAND2X1 U637 ( .A(n156), .B(n159), .Y(n223) );
endmodule


module mcu ( clk, n_rst, i_stop, i_done, i_read_complete, 
        i_grayscale_data_ready, i_b1_full, i_gradient_data_ready, 
        i_start_next_write, i_write_complete, i_b2_empty, o_re, 
        o_grayscale_start, o_b1_save, o_b1_clear, o_gradient_start, o_b2_save, 
        o_we );
  input clk, n_rst, i_stop, i_done, i_read_complete, i_grayscale_data_ready,
         i_b1_full, i_gradient_data_ready, i_start_next_write,
         i_write_complete, i_b2_empty;
  output o_re, o_grayscale_start, o_b1_save, o_b1_clear, o_gradient_start,
         o_b2_save, o_we;
  wire   n42, n43, n44, n45, n46, n48, n49, n50, n51, n52, n53, n54, n55, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n1, n3, n5, n7, n10, n12,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n47, n56, n68;
  wire   [5:0] curr;

  DFFSR \curr_reg[0]  ( .D(n3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(curr[0]) );
  DFFSR \curr_reg[2]  ( .D(n7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr[2]) );
  DFFSR \curr_reg[3]  ( .D(n1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr[3]) );
  DFFSR \curr_reg[1]  ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr[1]) );
  DFFSR \curr_reg[4]  ( .D(n10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr[4])
         );
  DFFSR o_gradient_start_reg ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        o_gradient_start) );
  DFFSR o_b2_save_reg ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o_b2_save)
         );
  DFFSR o_b1_clear_reg ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        o_b1_clear) );
  DFFSR o_b1_save_reg ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o_b1_save)
         );
  DFFSR o_grayscale_start_reg ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        o_grayscale_start) );
  DFFSR o_re_reg ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o_re) );
  DFFSR o_we_reg ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o_we) );
  OAI21X1 U45 ( .A(n56), .B(n44), .C(n20), .Y(n43) );
  NAND2X1 U46 ( .A(n45), .B(n46), .Y(n42) );
  NAND2X1 U49 ( .A(n50), .B(n51), .Y(n49) );
  AOI22X1 U50 ( .A(n24), .B(curr[3]), .C(i_grayscale_data_ready), .D(n32), .Y(
        n50) );
  NAND3X1 U51 ( .A(n53), .B(n54), .C(n55), .Y(n48) );
  OR2X1 U54 ( .A(n59), .B(n60), .Y(n58) );
  OAI21X1 U55 ( .A(i_stop), .B(n29), .C(n61), .Y(n60) );
  OAI21X1 U56 ( .A(i_b1_full), .B(n62), .C(n63), .Y(n59) );
  AOI22X1 U57 ( .A(i_done), .B(n34), .C(i_write_complete), .D(n35), .Y(n63) );
  OR2X1 U58 ( .A(n64), .B(n65), .Y(n57) );
  OAI21X1 U59 ( .A(n38), .B(n44), .C(n66), .Y(n65) );
  NAND3X1 U60 ( .A(n54), .B(n67), .C(n53), .Y(n64) );
  OR2X1 U63 ( .A(n71), .B(n72), .Y(n70) );
  OAI21X1 U64 ( .A(n67), .B(n21), .C(n20), .Y(n72) );
  NAND3X1 U65 ( .A(n28), .B(n74), .C(n75), .Y(n73) );
  AOI22X1 U66 ( .A(i_done), .B(n34), .C(i_b2_empty), .D(n26), .Y(n75) );
  OR2X1 U67 ( .A(n76), .B(n77), .Y(n69) );
  OAI22X1 U68 ( .A(n62), .B(n68), .C(i_write_complete), .D(n45), .Y(n77) );
  OAI21X1 U69 ( .A(n47), .B(n44), .C(n55), .Y(n76) );
  OR2X1 U70 ( .A(n78), .B(curr[0]), .Y(n55) );
  NAND3X1 U73 ( .A(n61), .B(n51), .C(n82), .Y(n81) );
  AOI22X1 U74 ( .A(n31), .B(n21), .C(i_stop), .D(n83), .Y(n82) );
  AOI21X1 U75 ( .A(n36), .B(i_b1_full), .C(n84), .Y(n51) );
  OAI21X1 U76 ( .A(n66), .B(i_b2_empty), .C(n85), .Y(n84) );
  NOR2X1 U77 ( .A(n71), .B(n86), .Y(n61) );
  OAI21X1 U78 ( .A(curr[0]), .B(n87), .C(n88), .Y(n86) );
  OAI21X1 U79 ( .A(i_grayscale_data_ready), .B(n52), .C(n89), .Y(n71) );
  NAND2X1 U80 ( .A(n12), .B(n90), .Y(n80) );
  AOI21X1 U81 ( .A(n24), .B(curr[0]), .C(n91), .Y(n90) );
  NAND2X1 U82 ( .A(n28), .B(n46), .Y(n91) );
  NAND3X1 U83 ( .A(n93), .B(n94), .C(n95), .Y(n44) );
  NOR2X1 U84 ( .A(n96), .B(n97), .Y(n95) );
  NAND3X1 U85 ( .A(n52), .B(n67), .C(n62), .Y(n97) );
  NAND3X1 U86 ( .A(n98), .B(n38), .C(n99), .Y(n62) );
  NAND3X1 U87 ( .A(curr[0]), .B(n47), .C(n39), .Y(n67) );
  NAND3X1 U88 ( .A(curr[1]), .B(curr[0]), .C(n39), .Y(n52) );
  NAND3X1 U89 ( .A(n45), .B(n100), .C(n29), .Y(n96) );
  NOR2X1 U90 ( .A(n78), .B(n30), .Y(n83) );
  NAND3X1 U91 ( .A(n41), .B(n56), .C(n101), .Y(n78) );
  NOR2X1 U92 ( .A(curr[2]), .B(curr[1]), .Y(n101) );
  NAND3X1 U93 ( .A(n99), .B(n38), .C(n102), .Y(n45) );
  NOR2X1 U94 ( .A(n92), .B(n103), .Y(n94) );
  NAND2X1 U95 ( .A(n74), .B(n54), .Y(n103) );
  NOR2X1 U96 ( .A(n87), .B(n30), .Y(n92) );
  NAND3X1 U97 ( .A(curr[2]), .B(n47), .C(n102), .Y(n87) );
  NOR2X1 U98 ( .A(n26), .B(n34), .Y(n93) );
  NAND3X1 U99 ( .A(n102), .B(curr[1]), .C(n105), .Y(n66) );
  OAI22X1 U100 ( .A(n104), .B(i_done), .C(n19), .D(n53), .Y(n106) );
  NAND3X1 U101 ( .A(n40), .B(n30), .C(curr[2]), .Y(n53) );
  NAND3X1 U102 ( .A(n99), .B(curr[2]), .C(n102), .Y(n104) );
  NAND3X1 U103 ( .A(n102), .B(n47), .C(n105), .Y(n74) );
  NOR2X1 U104 ( .A(n56), .B(curr[3]), .Y(n102) );
  NAND3X1 U105 ( .A(n30), .B(n47), .C(n39), .Y(n88) );
  NAND2X1 U106 ( .A(n39), .B(n99), .Y(n89) );
  NOR2X1 U107 ( .A(n47), .B(curr[0]), .Y(n99) );
  NAND3X1 U108 ( .A(n41), .B(n56), .C(curr[2]), .Y(n107) );
  NAND3X1 U109 ( .A(curr[1]), .B(n98), .C(n105), .Y(n54) );
  NOR2X1 U110 ( .A(n30), .B(curr[2]), .Y(n105) );
  NAND3X1 U111 ( .A(n30), .B(n38), .C(n40), .Y(n85) );
  NAND3X1 U112 ( .A(curr[0]), .B(n40), .C(curr[2]), .Y(n46) );
  NAND2X1 U113 ( .A(n98), .B(n47), .Y(n100) );
  NOR2X1 U114 ( .A(n41), .B(curr[4]), .Y(n98) );
  OR2X2 U3 ( .A(n48), .B(n49), .Y(n1) );
  OR2X2 U5 ( .A(n80), .B(n81), .Y(n3) );
  OR2X2 U7 ( .A(n69), .B(n70), .Y(n5) );
  OR2X2 U9 ( .A(n57), .B(n58), .Y(n7) );
  OR2X2 U12 ( .A(n42), .B(n43), .Y(n10) );
  INVX2 U14 ( .A(n106), .Y(n12) );
  INVX2 U21 ( .A(i_gradient_data_ready), .Y(n19) );
  INVX2 U22 ( .A(n73), .Y(n20) );
  INVX2 U23 ( .A(i_read_complete), .Y(n21) );
  INVX2 U24 ( .A(n85), .Y(n22) );
  INVX2 U25 ( .A(n54), .Y(n23) );
  INVX2 U26 ( .A(n44), .Y(n24) );
  INVX2 U27 ( .A(n74), .Y(n25) );
  INVX2 U28 ( .A(n66), .Y(n26) );
  INVX2 U29 ( .A(n88), .Y(n27) );
  INVX2 U30 ( .A(n92), .Y(n28) );
  INVX2 U31 ( .A(n83), .Y(n29) );
  INVX2 U32 ( .A(curr[0]), .Y(n30) );
  INVX2 U33 ( .A(n67), .Y(n31) );
  INVX2 U34 ( .A(n52), .Y(n32) );
  INVX2 U35 ( .A(n89), .Y(n33) );
  INVX2 U36 ( .A(n104), .Y(n34) );
  INVX2 U37 ( .A(n45), .Y(n35) );
  INVX2 U38 ( .A(n62), .Y(n36) );
  INVX2 U39 ( .A(n46), .Y(n37) );
  INVX2 U40 ( .A(curr[2]), .Y(n38) );
  INVX2 U41 ( .A(n107), .Y(n39) );
  INVX2 U42 ( .A(n100), .Y(n40) );
  INVX2 U43 ( .A(curr[3]), .Y(n41) );
  INVX2 U44 ( .A(curr[1]), .Y(n47) );
  INVX2 U47 ( .A(curr[4]), .Y(n56) );
  INVX2 U48 ( .A(i_b1_full), .Y(n68) );
endmodule


module Top_Level ( clk, n_rst, s_haddr, m_haddr, m_hrdata, s_hrdata, m_hwdata, 
        s_hwdata, s_hwrite, m_hwrite, s_hready, m_hready );
  input [31:0] s_haddr;
  output [31:0] m_haddr;
  input [31:0] m_hrdata;
  output [31:0] s_hrdata;
  output [31:0] m_hwdata;
  input [31:0] s_hwdata;
  input clk, n_rst, s_hwrite, m_hready;
  output m_hwrite, s_hready;
  wire   done, re, we, read_complete, write_complete, grayscale_start,
         grayscale_data_ready, b1_save, b1_clear, b1_full, gradient_start,
         gradient_ready, b2_save, b2_empty, start_next_write, n2;
  wire   [31:0] buffer2_data;
  wire   [31:0] rgb;
  wire   [7:0] gray;
  wire   [7:0] m1;
  wire   [7:0] m2;
  wire   [7:0] m3;
  wire   [7:0] m4;
  wire   [7:0] m5;
  wire   [7:0] m6;
  wire   [7:0] m7;
  wire   [7:0] m8;
  wire   [7:0] m9;
  wire   [7:0] m10;
  wire   [7:0] m11;
  wire   [7:0] m12;
  wire   [7:0] m13;
  wire   [7:0] m14;
  wire   [7:0] m15;
  wire   [7:0] m16;
  wire   [7:0] m17;
  wire   [7:0] m18;
  wire   [7:0] m19;
  wire   [7:0] m20;
  wire   [7:0] m21;
  wire   [7:0] m22;
  wire   [7:0] m23;
  wire   [7:0] m24;
  wire   [7:0] m25;
  wire   [7:0] processed_sum_1;
  wire   [7:0] processed_sum_2;
  wire   [7:0] processed_sum_3;
  wire   [7:0] processed_sum_4;
  wire   [7:0] processed_sum_5;
  wire   [7:0] processed_sum_6;
  wire   [7:0] processed_sum_7;
  wire   [7:0] processed_sum_8;
  wire   [7:0] processed_sum_9;

  AHB_wrapper AHB_DUT ( .clk(clk), .n_rst(n_rst), .done(done), .s_haddr(
        s_haddr), .m_haddr(m_haddr), .s_hrdata(s_hrdata), .m_hrdata(m_hrdata), 
        .m_hwdata(m_hwdata), .s_hwdata(s_hwdata), .s_hwrite(s_hwrite), 
        .m_hwrite(m_hwrite), .s_hready(s_hready), .m_hready(m_hready), .re(re), 
        .we(we), .buffer2_data(buffer2_data), .greyscale_data(rgb), 
        .read_complete(read_complete), .write_complete(write_complete) );
  grayscale GS_DUT ( .clk(clk), .n_rst(n_rst), .i_grayscale_start(
        grayscale_start), .i_RGB(rgb), .o_grayscale_data_ready(
        grayscale_data_ready), .o_gray(gray) );
  buffer_window B1_DUT ( .clk(clk), .n_rst(n_rst), .i_data_in(gray), .i_save(
        b1_save), .i_clear(b1_clear), .o_full(b1_full), .o_m1(m1), .o_m2(m2), 
        .o_m3(m3), .o_m4(m4), .o_m5(m5), .o_m6(m6), .o_m7(m7), .o_m8(m8), 
        .o_m9(m9), .o_m10(m10), .o_m11(m11), .o_m12(m12), .o_m13(m13), .o_m14(
        m14), .o_m15(m15), .o_m16(m16), .o_m17(m17), .o_m18(m18), .o_m19(m19), 
        .o_m20(m20), .o_m21(m21), .o_m22(m22), .o_m23(m23), .o_m24(m24), 
        .o_m25(m25) );
  edge_detection_core EDC_DUT ( .clk(clk), .n_rst(n_rst), .i_m1(m1), .i_m2(m2), 
        .i_m3(m3), .i_m4(m4), .i_m5(m5), .i_m6(m6), .i_m7(m7), .i_m8(m8), 
        .i_m9(m9), .i_m10(m10), .i_m11(m11), .i_m12(m12), .i_m13(m13), .i_m14(
        m14), .i_m15(m15), .i_m16(m16), .i_m17(m17), .i_m18(m18), .i_m19(m19), 
        .i_m20(m20), .i_m21(m21), .i_m22(m22), .i_m23(m23), .i_m24(m24), 
        .i_m25(m25), .i_gradient_start(gradient_start), .o_gradient_ready(
        gradient_ready), .o_processed_sum_1(processed_sum_1), 
        .o_processed_sum_2(processed_sum_2), .o_processed_sum_3(
        processed_sum_3), .o_processed_sum_4(processed_sum_4), 
        .o_processed_sum_5(processed_sum_5), .o_processed_sum_6(
        processed_sum_6), .o_processed_sum_7(processed_sum_7), 
        .o_processed_sum_8(processed_sum_8), .o_processed_sum_9(
        processed_sum_9) );
  buffer_2 B2_DUT ( .clk(clk), .n_rst(n_rst), .i_processed_sum_1(
        processed_sum_1), .i_processed_sum_2(processed_sum_2), 
        .i_processed_sum_3(processed_sum_3), .i_processed_sum_4(
        processed_sum_4), .i_processed_sum_5(processed_sum_5), 
        .i_processed_sum_6(processed_sum_6), .i_processed_sum_7(
        processed_sum_7), .i_processed_sum_8(processed_sum_8), 
        .i_processed_sum_9(processed_sum_9), .i_save(b2_save), 
        .i_write_complete(write_complete), .o_empty(b2_empty), 
        .o_buffer2_data(buffer2_data), .o_write_enable(start_next_write) );
  mcu MCU_DUT ( .clk(clk), .n_rst(n_rst), .i_stop(n2), .i_done(done), 
        .i_read_complete(read_complete), .i_grayscale_data_ready(
        grayscale_data_ready), .i_b1_full(b1_full), .i_gradient_data_ready(
        gradient_ready), .i_start_next_write(start_next_write), 
        .i_write_complete(write_complete), .i_b2_empty(b2_empty), .o_re(re), 
        .o_grayscale_start(grayscale_start), .o_b1_save(b1_save), .o_b1_clear(
        b1_clear), .o_gradient_start(gradient_start), .o_b2_save(b2_save), 
        .o_we(we) );
  INVX2 U2 ( .A(s_hrdata[0]), .Y(n2) );
endmodule

