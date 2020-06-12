library verilog;
use verilog.vl_types.all;
entity divider is
    port(
        quotient        : out    vl_logic_vector(7 downto 0);
        remainder       : out    vl_logic_vector(7 downto 0);
        ready           : out    vl_logic;
        dividend        : in     vl_logic_vector(7 downto 0);
        divider         : in     vl_logic_vector(7 downto 0);
        start           : in     vl_logic;
        clk             : in     vl_logic;
        divider_copy    : out    vl_logic_vector(15 downto 0);
        dividend_copy   : out    vl_logic_vector(15 downto 0);
        sign_flag       : out    vl_logic;
        diff            : out    vl_logic_vector(15 downto 0)
    );
end divider;
