library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        uOP             : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end ControlUnit_vlg_sample_tst;
