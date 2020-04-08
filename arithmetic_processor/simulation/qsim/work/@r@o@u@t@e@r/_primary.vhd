library verilog;
use verilog.vl_types.all;
entity ROUTER is
    port(
        IN_16Bit        : in     vl_logic_vector(15 downto 0);
        IN_8Bit         : in     vl_logic_vector(7 downto 0);
        \Select\        : in     vl_logic;
        Output          : out    vl_logic_vector(15 downto 0)
    );
end ROUTER;
