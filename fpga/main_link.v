module main_link(
	input clk,
    input reset,
	
	 input      [31:0] avs_writedata,
    output reg [31:0] avs_readdata,
    input      [1:0]  avs_address,
    input             avs_read,
    input             avs_write,
	output            avs_readdatavalid
	
);

reg [31:0]dataout;
reg dataready;
assign readdatavalid = dataready;

initial 
begin 
	dataout = 1;
	dataready = 1;
end

always@ (posedge clk)
begin
	if (avs_read) begin
        case (avs_address)
            2'b00: avs_readdata <= dataout;
            2'b01: avs_readdata <= dataout + 1;
            2'b10: avs_readdata <= dataout + 2;
			2'b11: avs_readdata <= dataout + 3;
            default: avs_readdata <= 32'd0;
        endcase
    end
end


endmodule