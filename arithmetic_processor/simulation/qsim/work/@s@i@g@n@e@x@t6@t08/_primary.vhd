library verilog;
use verilog.vl_types.all;
entity SIGNEXT6T08 is
    port(
        Unextended      : in     vl_logic_vector(5 downto 0);
        Extended        : out    vl_logic_vector(7 downto 0)
    );
end SIGNEXT6T08;
