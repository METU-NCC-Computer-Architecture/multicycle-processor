library verilog;
use verilog.vl_types.all;
entity Datapath_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        ALUOUT          : in     vl_logic_vector(7 downto 0);
        CO              : in     vl_logic;
        N               : in     vl_logic;
        OPCODE          : in     vl_logic_vector(3 downto 0);
        OUT_Q           : in     vl_logic_vector(7 downto 0);
        OVF             : in     vl_logic;
        Qm1             : in     vl_logic;
        RF_OUT_A        : in     vl_logic_vector(7 downto 0);
        RF_OUT_B        : in     vl_logic_vector(7 downto 0);
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Datapath_vlg_check_tst;
