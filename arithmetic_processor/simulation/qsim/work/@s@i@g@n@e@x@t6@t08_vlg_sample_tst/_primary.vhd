library verilog;
use verilog.vl_types.all;
entity SIGNEXT6T08_vlg_sample_tst is
    port(
        Unextended      : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end SIGNEXT6T08_vlg_sample_tst;
