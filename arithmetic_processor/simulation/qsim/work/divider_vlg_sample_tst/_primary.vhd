library verilog;
use verilog.vl_types.all;
entity divider_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        dividend        : in     vl_logic_vector(7 downto 0);
        divider         : in     vl_logic_vector(7 downto 0);
        start           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end divider_vlg_sample_tst;
