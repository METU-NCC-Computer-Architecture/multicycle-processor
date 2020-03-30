library verilog;
use verilog.vl_types.all;
entity Datapath_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        ALUOUT          : in     vl_logic_vector(7 downto 0);
        CO              : in     vl_logic;
        N               : in     vl_logic;
        OVF             : in     vl_logic;
        Product         : in     vl_logic_vector(15 downto 0);
        Q               : in     vl_logic_vector(7 downto 0);
        Qm1             : in     vl_logic;
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Datapath_vlg_check_tst;
