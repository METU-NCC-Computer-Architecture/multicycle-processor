library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        instruction     : in     vl_logic_vector(15 downto 0);
        PC_RST          : in     vl_logic;
        RST             : out    vl_logic;
        CLK             : in     vl_logic;
        RF_EN           : out    vl_logic;
        MULT_EN         : out    vl_logic;
        LDA             : out    vl_logic;
        LDQ             : out    vl_logic;
        PC_MUX_SEL      : out    vl_logic_vector(1 downto 0);
        SR_SEL          : out    vl_logic;
        PLUS1_SEL       : out    vl_logic;
        SR              : out    vl_logic;
        SL              : out    vl_logic;
        A_SEL           : out    vl_logic_vector(1 downto 0);
        B_SEL           : out    vl_logic_vector(1 downto 0);
        PC_EN           : out    vl_logic;
        MUL_SEL         : out    vl_logic;
        INST_TYPE_MUX_SEL: out    vl_logic;
        D_SEL           : out    vl_logic_vector(1 downto 0);
        OAP             : out    vl_logic_vector(2 downto 0);
        DATA_MEM_SEL    : out    vl_logic;
        Cin             : out    vl_logic;
        WB_SEL          : out    vl_logic;
        UL_SEL          : out    vl_logic;
        WR_EN           : out    vl_logic;
        INST_REG_EN     : out    vl_logic;
        Z_FLAG          : in     vl_logic;
        N_FLAG          : in     vl_logic;
        counterchk      : out    vl_logic_vector(3 downto 0)
    );
end ControlUnit;
