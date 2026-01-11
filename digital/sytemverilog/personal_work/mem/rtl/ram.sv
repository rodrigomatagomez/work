module ram #(parameter DATA_WIDTH = 32, parameter ADDR_WIDTH = 8, parameter DEPTH = 2**ADDR_WIDTH) (
    input logic     clk,
    input logic     we,
    input logic     re,
    input logic     [DATA_WIDTH-1:0] data_in,
    input logic     [ADDR_WIDTH-1:0] addr, 
    output logic    [DATA_WIDTH-1:0] data_out	
);

logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];

always_ff @(posedge clk) begin
    if (we && re) begin 
        mem[addr] <= data_in;
        data_out <= data_in;
    end else if (we == 1) begin
        mem[addr] <= data_in;
    end else if (re == 1) begin
        data_out <= mem[addr];
    end 
end
endmodule