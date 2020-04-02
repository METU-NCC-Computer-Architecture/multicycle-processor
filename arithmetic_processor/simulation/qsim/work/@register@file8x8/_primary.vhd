library verilog;
use verilog.vl_types.all;
entity RegisterFile8x8 is
    port(
        CLK             : in     vl_logic;
        WriteEN         : in     vl_logic;
        Write_Address   : in     vl_logic_vector(2 downto 0);
        Write_Data      : in     vl_logic_vector(7 downto 0);
        Read_AddressA   : in     vl_logic_vector(2 downto 0);
        Read_DataA      : out    vl_logic_vector(7 downto 0);
        Read_AddressB   : in     vl_logic_vector(2 downto 0);
        Read_DataB      : out    vl_logic_vector(7 downto 0)
    );
end RegisterFile8x8;
