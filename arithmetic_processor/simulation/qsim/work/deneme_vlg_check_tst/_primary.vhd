library verilog;
use verilog.vl_types.all;
entity deneme_vlg_check_tst is
    port(
        c               : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end deneme_vlg_check_tst;
