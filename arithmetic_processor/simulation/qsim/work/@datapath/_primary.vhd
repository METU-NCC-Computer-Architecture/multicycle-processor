library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        Qm1             : out    vl_logic;
        CLK             : in     vl_logic;
        uOP             : in     vl_logic_vector(4 downto 0);
        A               : out    vl_logic_vector(7 downto 0);
        AOP             : in     vl_logic_vector(2 downto 0);
        DAT1            : in     vl_logic_vector(7 downto 0);
        DAT3            : in     vl_logic_vector(7 downto 0);
        Product         : out    vl_logic_vector(15 downto 0);
        Multiplicand    : in     vl_logic_vector(7 downto 0);
        Multplier       : in     vl_logic_vector(7 downto 0);
        DAT2            : in     vl_logic_vector(7 downto 0);
        CO              : out    vl_logic;
        OVF             : out    vl_logic;
        Z               : out    vl_logic;
        N               : out    vl_logic;
        ALUOUT          : out    vl_logic_vector(7 downto 0);
        Q               : out    vl_logic_vector(7 downto 0)
    );
end Datapath;
