library verilog;
use verilog.vl_types.all;
entity CPU_vlg_check_tst is
    port(
        A_REG           : in     vl_logic_vector(7 downto 0);
        ABC             : in     vl_logic_vector(15 downto 0);
        ALU_OUT         : in     vl_logic_vector(7 downto 0);
        B_REG           : in     vl_logic_vector(7 downto 0);
        counterchk      : in     vl_logic_vector(3 downto 0);
        inst_mem_addr   : in     vl_logic_vector(9 downto 0);
        RF_A_READ_PORT  : in     vl_logic_vector(7 downto 0);
        RF_B_READ_PORT  : in     vl_logic_vector(7 downto 0);
        RF_W_ADDR       : in     vl_logic_vector(2 downto 0);
        RF_W_DATA       : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end CPU_vlg_check_tst;
