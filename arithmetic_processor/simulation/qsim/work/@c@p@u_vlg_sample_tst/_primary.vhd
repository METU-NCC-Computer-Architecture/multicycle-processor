library verilog;
use verilog.vl_types.all;
entity CPU_vlg_sample_tst is
    port(
        AUTO            : in     vl_logic;
        CLK             : in     vl_logic;
        DATA_MEM_OUT    : in     vl_logic_vector(15 downto 0);
        INST_MEM_OUT    : in     vl_logic_vector(15 downto 0);
        RUN             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CPU_vlg_sample_tst;
