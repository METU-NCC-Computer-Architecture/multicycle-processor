library verilog;
use verilog.vl_types.all;
entity RegisterFile8x8_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        Read_AddressA   : in     vl_logic_vector(2 downto 0);
        Read_AddressB   : in     vl_logic_vector(2 downto 0);
        WriteEN         : in     vl_logic;
        Write_Address   : in     vl_logic_vector(2 downto 0);
        Write_Data      : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end RegisterFile8x8_vlg_sample_tst;
