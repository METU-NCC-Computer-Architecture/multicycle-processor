library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        N_FLAG          : in     vl_logic;
        PC_RST          : in     vl_logic;
        Z_FLAG          : in     vl_logic;
        instruction     : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end ControlUnit_vlg_sample_tst;
