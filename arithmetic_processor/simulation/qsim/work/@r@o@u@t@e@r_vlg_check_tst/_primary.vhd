library verilog;
use verilog.vl_types.all;
entity ROUTER_vlg_check_tst is
    port(
        Output          : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end ROUTER_vlg_check_tst;
