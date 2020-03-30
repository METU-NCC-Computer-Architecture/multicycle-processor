library verilog;
use verilog.vl_types.all;
entity DFF8_vlg_check_tst is
    port(
        Q               : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end DFF8_vlg_check_tst;
