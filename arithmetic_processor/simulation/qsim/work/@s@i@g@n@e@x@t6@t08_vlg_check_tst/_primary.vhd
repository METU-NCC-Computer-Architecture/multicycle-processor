library verilog;
use verilog.vl_types.all;
entity SIGNEXT6T08_vlg_check_tst is
    port(
        Extended        : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end SIGNEXT6T08_vlg_check_tst;
