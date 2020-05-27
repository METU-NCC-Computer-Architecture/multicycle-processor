library verilog;
use verilog.vl_types.all;
entity CPU is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        A_REG           : out    vl_logic_vector(7 downto 0);
        RUN             : in     vl_logic;
        AUTO            : in     vl_logic;
        MAN_CLK         : in     vl_logic;
        CLK             : in     vl_logic;
        ALU_OUT         : out    vl_logic_vector(7 downto 0);
        CURRENT_INSTR   : out    vl_logic_vector(15 downto 0);
        DATA_MEM_ADDR_IN: out    vl_logic_vector(9 downto 0);
        DATA_MEM_DATA_IN: out    vl_logic_vector(15 downto 0);
        DATA_MEM_DATA_OUT: out    vl_logic_vector(15 downto 0);
        DEBUG           : out    vl_logic_vector(3 downto 0);
        IMMEDIATE       : out    vl_logic_vector(7 downto 0);
        INSTR_MEM_ADDRESS: out    vl_logic_vector(9 downto 0);
        PRODUCT         : out    vl_logic_vector(15 downto 0);
        Q_REG           : out    vl_logic_vector(7 downto 0);
        quotient        : out    vl_logic_vector(7 downto 0);
        remainder       : out    vl_logic_vector(7 downto 0);
        RF_A_READ_PORT  : out    vl_logic_vector(7 downto 0);
        RF_B_READ_PORT  : out    vl_logic_vector(7 downto 0);
        RF_W_ADDR       : out    vl_logic_vector(2 downto 0);
        RF_W_DATA       : out    vl_logic_vector(7 downto 0)
    );
end CPU;
