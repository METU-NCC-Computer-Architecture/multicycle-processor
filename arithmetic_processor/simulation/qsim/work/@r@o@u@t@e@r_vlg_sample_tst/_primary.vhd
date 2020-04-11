library verilog;
use verilog.vl_types.all;
entity ROUTER_vlg_sample_tst is
    port(
        IN_8Bit         : in     vl_logic_vector(7 downto 0);
        IN_16Bit        : in     vl_logic_vector(15 downto 0);
        \Select\        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ROUTER_vlg_sample_tst;
