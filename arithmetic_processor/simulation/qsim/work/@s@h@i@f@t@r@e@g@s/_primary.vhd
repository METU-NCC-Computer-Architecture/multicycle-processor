library verilog;
use verilog.vl_types.all;
entity SHIFTREGS is
    port(
        SOR             : out    vl_logic;
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        Enable          : in     vl_logic;
        SIR             : in     vl_logic;
        DAT1            : in     vl_logic_vector(7 downto 0);
        ShiftRL         : in     vl_logic_vector(1 downto 0);
        SIL             : in     vl_logic;
        DAT2            : in     vl_logic_vector(7 downto 0);
        SOL             : out    vl_logic;
        A               : out    vl_logic_vector(7 downto 0);
        Q               : out    vl_logic_vector(7 downto 0)
    );
end SHIFTREGS;
