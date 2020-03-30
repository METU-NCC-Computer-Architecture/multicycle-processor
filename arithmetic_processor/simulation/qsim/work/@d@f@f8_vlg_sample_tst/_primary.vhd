library verilog;
use verilog.vl_types.all;
entity DFF8_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        D               : in     vl_logic_vector(7 downto 0);
        Enable          : in     vl_logic;
        Reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end DFF8_vlg_sample_tst;
