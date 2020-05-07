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
        CLK             : in     vl_logic;
        DATA_MEM_OUT    : in     vl_logic_vector(15 downto 0);
        INST_MEM_OUT    : in     vl_logic_vector(15 downto 0);
        ABC             : out    vl_logic_vector(15 downto 0);
        ALU_OUT         : out    vl_logic_vector(7 downto 0);
        B_REG           : out    vl_logic_vector(7 downto 0);
        RF_A_READ_PORT  : out    vl_logic_vector(7 downto 0);
        RF_B_READ_PORT  : out    vl_logic_vector(7 downto 0);
        RF_W_ADDR       : out    vl_logic_vector(2 downto 0);
        RF_W_DATA       : out    vl_logic_vector(7 downto 0)
    );
end CPU;
