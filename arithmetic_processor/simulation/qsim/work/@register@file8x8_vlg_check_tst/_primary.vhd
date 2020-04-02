library verilog;
use verilog.vl_types.all;
entity RegisterFile8x8_vlg_check_tst is
    port(
        Read_DataA      : in     vl_logic_vector(7 downto 0);
        Read_DataB      : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end RegisterFile8x8_vlg_check_tst;
