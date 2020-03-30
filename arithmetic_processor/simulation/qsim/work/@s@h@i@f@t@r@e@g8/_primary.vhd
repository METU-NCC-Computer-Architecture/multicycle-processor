library verilog;
use verilog.vl_types.all;
entity SHIFTREG8 is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        Enable          : in     vl_logic;
        ShiftRL         : in     vl_logic_vector(1 downto 0);
        SIR             : in     vl_logic;
        SIL             : in     vl_logic;
        SOR             : out    vl_logic;
        SOL             : out    vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        Q               : out    vl_logic_vector(7 downto 0)
    );
end SHIFTREG8;
