library verilog;
use verilog.vl_types.all;
entity ap_function_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        aop             : in     vl_logic_vector(2 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        cin             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ap_function_vlg_sample_tst;
