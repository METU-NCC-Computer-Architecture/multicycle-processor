library verilog;
use verilog.vl_types.all;
entity SHIFTREGS_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        DAT1            : in     vl_logic_vector(7 downto 0);
        DAT2            : in     vl_logic_vector(7 downto 0);
        Enable          : in     vl_logic;
        Reset           : in     vl_logic;
        ShiftRL         : in     vl_logic_vector(1 downto 0);
        SIL             : in     vl_logic;
        SIR             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end SHIFTREGS_vlg_sample_tst;
