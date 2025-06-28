// Code your design here
module pipeline_processor (
    input clk,
    input rst
);

    reg [7:0] PC;
    reg [15:0] instr_mem[0:15];
    reg [7:0] reg_file[0:7];

    reg [15:0] IF_ID, ID_EX, EX_MEM;
    reg [7:0] WB_result;
    reg [2:0] WB_rd;

    wire [3:0] opcode = ID_EX[15:12];
    wire [2:0] rd = ID_EX[11:9];
    wire [2:0] rs1 = ID_EX[8:6];
    wire [2:0] rs2 = ID_EX[5:3];
    wire [7:0] imm = ID_EX[7:0];

    integer i;
    initial begin
        instr_mem[0] = 16'b0001_001_010_011_0000; // ADD R1 = R2 + R3
        instr_mem[1] = 16'b0010_001_010_011_0000; // SUB R1 = R2 - R3
        instr_mem[2] = 16'b0011_001_00000000_11110000; // LOAD R1 = 0xF0

        for (i = 0; i < 8; i = i + 1)
            reg_file[i] = i;

        PC = 0;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            PC <= 0;
            IF_ID <= 0;
            ID_EX <= 0;
            EX_MEM <= 0;
            WB_result <= 0;
            WB_rd <= 0;
        end else begin
            if (WB_rd != 0)
                reg_file[WB_rd] <= WB_result;

            WB_result <= EX_MEM[7:0];
            WB_rd <= EX_MEM[10:8];

            case (opcode)
                4'b0001: EX_MEM <= {5'b0, rd, reg_file[rs1] + reg_file[rs2]};
                4'b0010: EX_MEM <= {5'b0, rd, reg_file[rs1] - reg_file[rs2]};
                4'b0011: EX_MEM <= {5'b0, rd, imm};
                default: EX_MEM <= 16'd0;
            endcase

            ID_EX <= IF_ID;
            IF_ID <= instr_mem[PC];
            PC <= PC + 1;
        end
    end

endmodule

// Code your testbench here
// or browse Examples
module tb_pipeline_processor;

    reg clk;
    reg rst;

    // Instantiate the processor
    pipeline_processor uut (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Simulation sequence
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_pipeline_processor);
        $dumpvars(1, uut); // dump internal processor state

        rst = 1;
        #10;
        rst = 0;

        // Let it run
        #100;
        $finish;
    end

endmodule
