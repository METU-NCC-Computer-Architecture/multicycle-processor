library verilog;
use verilog.vl_types.all;
entity divider_vlg_check_tst is
    port(
        diff            : in     vl_logic_vector(15 downto 0);
        dividend_copy   : in     vl_logic_vector(15 downto 0);
        divider_copy    : in     vl_logic_vector(15 downto 0);
        quotient        : in     vl_logic_vector(7 downto 0);
        ready           : in     vl_logic;
        remainder       : in     vl_logic_vector(7 downto 0);
        sign_flag       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end divider_vlg_check_tst;
