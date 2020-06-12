library verilog;
use verilog.vl_types.all;
entity deneme_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end deneme_vlg_sample_tst;
