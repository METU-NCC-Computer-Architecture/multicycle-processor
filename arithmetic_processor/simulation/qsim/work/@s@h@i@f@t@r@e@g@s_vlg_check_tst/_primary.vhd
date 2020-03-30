library verilog;
use verilog.vl_types.all;
entity SHIFTREGS_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        Q               : in     vl_logic_vector(7 downto 0);
        SOL             : in     vl_logic;
        SOR             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end SHIFTREGS_vlg_check_tst;
