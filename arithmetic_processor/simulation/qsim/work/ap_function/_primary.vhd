library verilog;
use verilog.vl_types.all;
entity ap_function is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        aop             : in     vl_logic_vector(2 downto 0);
        f               : out    vl_logic_vector(7 downto 0);
        ovf             : out    vl_logic;
        cin             : in     vl_logic;
        cout            : out    vl_logic;
        n               : out    vl_logic;
        z               : out    vl_logic
    );
end ap_function;
