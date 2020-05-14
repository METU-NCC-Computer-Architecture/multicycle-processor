library verilog;
use verilog.vl_types.all;
entity CPU_vlg_sample_tst is
    port(
        AUTO            : in     vl_logic;
        CLK             : in     vl_logic;
        MAN_CLK         : in     vl_logic;
        RUN             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CPU_vlg_sample_tst;
