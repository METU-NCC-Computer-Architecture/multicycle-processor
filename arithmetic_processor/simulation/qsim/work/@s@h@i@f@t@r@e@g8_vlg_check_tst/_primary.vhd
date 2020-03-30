library verilog;
use verilog.vl_types.all;
entity SHIFTREG8_vlg_check_tst is
    port(
        Q               : in     vl_logic_vector(7 downto 0);
        SOL             : in     vl_logic;
        SOR             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end SHIFTREG8_vlg_check_tst;
