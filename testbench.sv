// Code your testbench here
‘include " interface .sv"
‘include " base_test .sv"
module tb_top ;
bit clk ;
bit reset ;
always #2 clk = ~ clk;
comparator_if vif(clk , reset );
comparator DUT (. clk(vif .clk) ,. reset ( vif. reset ) ,.in1(vif. ip1) ,.
in2( vif.ip2 ) ,.eq(vif.eq) ,.gt( vif.gt) ,.lt(vif.lt));
base_test t1(vif);
initial begin
clk = 0;
reset = 1;
#5;
reset = 0;
end
initial begin
// Dump waves
$dumpfile (" dump .vcd");
$dumpvars (0);
end
endmodule
