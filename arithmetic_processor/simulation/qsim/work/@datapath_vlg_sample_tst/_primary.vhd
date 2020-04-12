library verilog;
use verilog.vl_types.all;
entity Datapath_vlg_sample_tst is
    port(
        A_SEL           : in     vl_logic_vector(1 downto 0);
        B_SEL           : in     vl_logic_vector(1 downto 0);
        Cin             : in     vl_logic;
        CLK             : in     vl_logic;
        D_SEL           : in     vl_logic_vector(1 downto 0);
        DATA_MEM_OUT    : in     vl_logic_vector(15 downto 0);
        INS_TYPE_MUX_SEL: in     vl_logic;
        INST_MEM_OUT    : in     vl_logic_vector(15 downto 0);
        LDA             : in     vl_logic;
        LDQ             : in     vl_logic;
        MULT_EN         : in     vl_logic;
        MULT_SEL        : in     vl_logic;
        PC_EN           : in     vl_logic;
        PC_MUX_SEL      : in     vl_logic_vector(1 downto 0);
        PLUS1_SEL       : in     vl_logic;
        RF_EN           : in     vl_logic;
        RST             : in     vl_logic;
        SL              : in     vl_logic;
        SR              : in     vl_logic;
        SR_SEL          : in     vl_logic;
        UL_SEL          : in     vl_logic;
        WB_SEL          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Datapath_vlg_sample_tst;
