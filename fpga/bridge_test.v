module bridge_test(
	 input clk,
    input reset,
	 output [14:0] mem_a,
    output [2:0]  mem_ba,
    output        mem_ck,
    output        mem_ck_n,
    output        mem_cke,
    output        mem_cs_n,
    output        mem_ras_n,
    output        mem_cas_n,
    output        mem_we_n,
    output        mem_reset_n,
    inout  [39:0] mem_dq,
    inout  [4:0]  mem_dqs,
    inout  [4:0]  mem_dqs_n,
    output        mem_odt,
    output [4:0]  mem_dm,
    input         oct_rzqin
);


soc_system u0 (
        .clk_clk            (clk),            //    clk.clk
        .reset_reset_n      (reset),      //  reset.reset_n
        .memory_mem_a       (mem_a),       // memory.mem_a
        .memory_mem_ba      (mem_ba),      //       .mem_ba
        .memory_mem_ck      (mem_ck),      //       .mem_ck
        .memory_mem_ck_n    (mem_ck_n),    //       .mem_ck_n
        .memory_mem_cke     (mem_cke),     //       .mem_cke
        .memory_mem_cs_n    (mem_cs_n),    //       .mem_cs_n
        .memory_mem_ras_n   (mem_ras_n),   //       .mem_ras_n
        .memory_mem_cas_n   (mem_cas_n),   //       .mem_cas_n
        .memory_mem_we_n    (mem_we_n),    //       .mem_we_n
        .memory_mem_reset_n (mem_reset_n), //       .mem_reset_n
        .memory_mem_dq      (mem_dq),      //       .mem_dq
        .memory_mem_dqs     (mem_dqs),     //       .mem_dqs
        .memory_mem_dqs_n   (mem_dqs_n),   //       .mem_dqs_n
        .memory_mem_odt     (mem_odt),     //       .mem_odt
        .memory_mem_dm      (mem_dm),      //       .mem_dm
        .memory_oct_rzqin   (oct_rzqin)    //       .oct_rzqin
    );


endmodule