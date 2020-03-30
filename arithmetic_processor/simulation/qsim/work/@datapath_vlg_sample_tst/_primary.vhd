library verilog;
use verilog.vl_types.all;
entity Datapath_vlg_sample_tst is
    port(
        AOP             : in     vl_logic_vector(2 downto 0);
        CLK             : in     vl_logic;
        DAT1            : in     vl_logic_vector(7 downto 0);
        DAT2            : in     vl_logic_vector(7 downto 0);
        DAT3            : in     vl_logic_vector(7 downto 0);
        Multiplicand    : in     vl_logic_vector(7 downto 0);
        Multplier       : in     vl_logic_vector(7 downto 0);
        uOP             : in     vl_logic_vector(4 downto 0);
        sampler_tx      : out    vl_logic
    );
end Datapath_vlg_sample_tst;
