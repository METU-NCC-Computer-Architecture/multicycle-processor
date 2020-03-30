library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_check_tst is
    port(
        ASEL            : in     vl_logic_vector(1 downto 0);
        BSEL            : in     vl_logic_vector(1 downto 0);
        LDA             : in     vl_logic;
        LDM             : in     vl_logic;
        LDQ             : in     vl_logic;
        MULSEL          : in     vl_logic;
        MULST           : in     vl_logic;
        RST             : in     vl_logic;
        SL              : in     vl_logic;
        SR              : in     vl_logic;
        SRSEL           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ControlUnit_vlg_check_tst;
