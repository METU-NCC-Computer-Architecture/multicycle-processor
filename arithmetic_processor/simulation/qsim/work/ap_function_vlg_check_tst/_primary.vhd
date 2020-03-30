library verilog;
use verilog.vl_types.all;
entity ap_function_vlg_check_tst is
    port(
        cout            : in     vl_logic;
        f               : in     vl_logic_vector(7 downto 0);
        n               : in     vl_logic;
        ovf             : in     vl_logic;
        z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ap_function_vlg_check_tst;
