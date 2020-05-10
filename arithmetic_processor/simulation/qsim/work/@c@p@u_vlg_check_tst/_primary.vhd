library verilog;
use verilog.vl_types.all;
entity CPU_vlg_check_tst is
    port(
        A_REG           : in     vl_logic_vector(7 downto 0);
        ALU_OUT         : in     vl_logic_vector(7 downto 0);
        CURRENT_INSTR   : in     vl_logic_vector(15 downto 0);
        DATA_MEM_ADDR_IN: in     vl_logic_vector(9 downto 0);
        DATA_MEM_DATA_IN: in     vl_logic_vector(15 downto 0);
        DATA_MEM_DATA_OUT: in     vl_logic_vector(15 downto 0);
        DEBUG           : in     vl_logic_vector(3 downto 0);
        IMMEDIATE       : in     vl_logic_vector(7 downto 0);
        INSTR_MEM_ADDRESS: in     vl_logic_vector(9 downto 0);
        Q_REG           : in     vl_logic_vector(7 downto 0);
        RF_A_READ_PORT  : in     vl_logic_vector(7 downto 0);
        RF_B_READ_PORT  : in     vl_logic_vector(7 downto 0);
        RF_W_ADDR       : in     vl_logic_vector(2 downto 0);
        RF_W_DATA       : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end CPU_vlg_check_tst;
