library verilog;
use verilog.vl_types.all;
entity divider is
    port(
        quotient        : out    vl_logic_vector(7 downto 0);
        remainder       : out    vl_logic_vector(7 downto 0);
        ready           : out    vl_logic;
        dividend        : in     vl_logic_vector(7 downto 0);
        divider         : in     vl_logic_vector(7 downto 0);
        start           : in     vl_logic;
        clk             : in     vl_logic
    );
end divider;
