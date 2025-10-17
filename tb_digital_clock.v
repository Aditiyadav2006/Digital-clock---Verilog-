// tb_digital_clock.v
`timescale 1ns/1ps

module tb_digital_clock;

    // Testbench clock freq (for simulation only)
    reg clk = 0;
    reg reset = 1;

    // Use small DIVIDER for fast sim
    localparam integer DIV = 10; // tick every 10 tb clock cycles (~fast)
    
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hr;

    // instantiate DUT
    digital_clock #(.DIVIDER(DIV)) dut (
        .clk(clk),
        .reset(reset),
        .sec(sec),
        .min(min),
        .hr(hr)
    );

    // generate clock: 10 ns period (100 MHz) - arbitrary for TB
    always #5 clk = ~clk;

    // VCD dump for GTKWave
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_digital_clock);
    end

    // reset sequence
    initial begin
        reset = 1;
        #20;
        reset = 0;
    end

    // print every second update (on tick boundary we expect change)
    reg [5:0] last_sec = 6'hFF;
    reg [5:0] last_min = 6'hFF;
    reg [4:0] last_hr  = 5'h1F;

    always @(posedge clk) begin
        // display when any of the outputs change
        if ({sec,min,hr} != {last_sec,last_min,last_hr}) begin
            $display("T=%0t ns -> %02d:%02d:%02d", $time, hr, min, sec);
            last_sec = sec;
            last_min = min;
            last_hr = hr;
        end
    end

    // end simulation after some time
    initial begin
        #2000; // adjust to run longer if you want
        $display("Testbench finished");
        $finish;
    end

endmodule
