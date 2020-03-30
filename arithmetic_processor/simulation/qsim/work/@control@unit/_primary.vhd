library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        LDM             : out    vl_logic;
        LDA             : out    vl_logic;
        LDQ             : out    vl_logic;
        ASEL            : out    vl_logic_vector(1 downto 0);
        BSEL            : out    vl_logic_vector(1 downto 0);
        SRSEL           : out    vl_logic;
        SR              : out    vl_logic;
        SL              : out    vl_logic;
        MULST           : out    vl_logic;
        MULSEL          : out    vl_logic;
        RST             : out    vl_logic;
        uOP             : in     vl_logic_vector(4 downto 0);
        CLK             : in     vl_logic
    );
end ControlUnit;
