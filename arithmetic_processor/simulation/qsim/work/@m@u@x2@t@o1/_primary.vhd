library verilog;
use verilog.vl_types.all;
entity MUX2TO1 is
    port(
        IN0             : in     vl_logic;
        IN1             : in     vl_logic;
        \Select\        : in     vl_logic;
        Output          : out    vl_logic
    );
end MUX2TO1;
