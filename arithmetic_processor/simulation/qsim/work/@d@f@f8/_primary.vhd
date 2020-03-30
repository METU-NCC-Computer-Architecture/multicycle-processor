library verilog;
use verilog.vl_types.all;
entity DFF8 is
    port(
        Reset           : in     vl_logic;
        Enable          : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        CLK             : in     vl_logic;
        Q               : out    vl_logic_vector(7 downto 0)
    );
end DFF8;
