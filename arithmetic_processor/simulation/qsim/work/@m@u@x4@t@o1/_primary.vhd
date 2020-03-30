library verilog;
use verilog.vl_types.all;
entity MUX4TO1 is
    port(
        IN0             : in     vl_logic_vector(7 downto 0);
        IN1             : in     vl_logic_vector(7 downto 0);
        IN2             : in     vl_logic_vector(7 downto 0);
        IN3             : in     vl_logic_vector(7 downto 0);
        \Select\        : in     vl_logic_vector(1 downto 0);
        Output          : out    vl_logic_vector(7 downto 0)
    );
end MUX4TO1;
