module shift_register(
    input clk,
    input rst, 
    input data, 
    input wr_en,
    output reg [31:0] out
);

parameter DIRECTION = 1;

always @(posedge clk) begin 
    if (rst) begin
        out <= 32'b0;
    end else if (wr_en) begin 
        if (DIRECTION == 1)
            out <= {data, out [31:1]};
        else
            out <= {out[30:0], data};
    end
end
endmodule