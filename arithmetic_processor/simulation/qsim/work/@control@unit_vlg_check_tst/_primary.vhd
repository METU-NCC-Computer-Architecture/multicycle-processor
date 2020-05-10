library verilog;
use verilog.vl_types.all;
entity ControlUnit_vlg_check_tst is
    port(
        A_SEL           : in     vl_logic_vector(1 downto 0);
        B_SEL           : in     vl_logic_vector(1 downto 0);
        Cin             : in     vl_logic;
        DATA_MEM_SEL    : in     vl_logic;
        D_SEL           : in     vl_logic_vector(1 downto 0);
        INST_REG_EN     : in     vl_logic;
        INST_TYPE_MUX_SEL: in     vl_logic;
        LDA             : in     vl_logic;
        LDQ             : in     vl_logic;
        MULT_EN         : in     vl_logic;
        MUL_SEL         : in     vl_logic;
        OAP             : in     vl_logic_vector(2 downto 0);
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
        WR_EN           : in     vl_logic;
        counterchk      : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end ControlUnit_vlg_check_tst;
