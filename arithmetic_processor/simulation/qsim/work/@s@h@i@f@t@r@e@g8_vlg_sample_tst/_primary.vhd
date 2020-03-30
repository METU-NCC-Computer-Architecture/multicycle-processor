library verilog;
use verilog.vl_types.all;
entity SHIFTREG8_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        Enable          : in     vl_logic;
        Reset           : in     vl_logic;
        SIL             : in     vl_logic;
        SIR             : in     vl_logic;
        ShiftRL         : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end SHIFTREG8_vlg_sample_tst;
