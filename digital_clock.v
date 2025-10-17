// digital_clock.v
// 24-hour clock: hr:min:sec
// hr is 0..23 (5 bits), min/sec are 0..59 (6 bits)

module digital_clock #(
    parameter integer DIVIDER = 50_000_000  // for 50 MHz input clock -> 1 second ticks
)(
    input  wire clk,
    input  wire reset,       // active-high synchronous reset
    output reg [5:0] sec,    // 0..59
    output reg [5:0] min,    // 0..59
    output reg [4:0] hr      // 0..23
);

    // width must hold DIVIDER value
    localparam integer CW = $clog2(DIVIDER+1);
    reg [CW-1:0] clk_div;

    // 1 Hz pulse (or faster for simulation if DIVIDER small)
    wire tick = (clk_div == DIVIDER-1);

    // clock divider
    always @(posedge clk) begin
        if (reset) begin
            clk_div <= 0;
        end else begin
            if (tick)
                clk_div <= 0;
            else
                clk_div <= clk_div + 1;
        end
    end

    // time counters
    always @(posedge clk) begin
        if (reset) begin
            sec <= 0;
            min <= 0;
            hr  <= 0;
        end else if (tick) begin
            if (sec == 59) begin
                sec <= 0;
                if (min == 59) begin
                    min <= 0;
                    if (hr == 23)
                        hr <= 0;
                    else
                        hr <= hr + 1;
                end else begin
                    min <= min + 1;
                end
            end else begin
                sec <= sec + 1;
            end
        end
    end

endmodule
