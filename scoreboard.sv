class scoreboard ;
int compare_cnt ;
mailbox mon_to_sb ;
function new( mailbox mon_to_sb );
this . mon_to_sb = mon_to_sb ;
endfunction
task run;
forever begin
logic temp_gt ;
logic temp_eq ;
logic temp_lt ;
transaction tr;
tr = new ();
mon_to_sb . get(tr);
if(tr.ip1 >tr.ip2) temp_gt =1’ b1;
else if(tr.ip1 < tr.ip2) begin temp_lt =1’ b1; end
else begin temp_eq =1’ b1;end
if( temp_gt == tr.gt) begin
$display (" Matched :␣ip1 ␣=␣%0d,␣ ip2␣=␣%0d,␣gt␣=␣%0d", tr.
ip1 , tr.ip2 , tr.gt);
end
else begin
$display (" NOT␣ matched :␣ip1␣=␣%0d,␣ip2 ␣=␣%0d,␣gt=␣%0d",
tr.ip1 , tr.ip2 , tr.gt); end
if( temp_eq == tr.eq) begin
$display (" Matched :␣ip1 ␣=␣%0d,␣ ip2␣=␣%0d,␣eq=␣%0d", tr.
ip1 , tr.ip2 , tr.eq);
end
else begin
$display (" NOT␣ matched :␣ip1␣=␣%0d,␣ip2 ␣=␣%0d,␣eq=␣%0d",
tr.ip1 , tr.ip2 , tr.eq); end
if( temp_lt == tr.lt) begin
$display (" Matched :␣ip1 ␣=␣%0d,␣ ip2␣=␣%0d,␣lt␣=␣%0d", tr
.ip1 , tr.ip2 , tr.lt);
end
else begin
$display (" NOT␣ matched :␣ip1␣=␣%0d,␣ip2 ␣=␣%0d,␣lt=␣%0d",
tr.ip1 , tr.ip2 , tr.lt);
end
$display ("/n");
compare_cnt ++;
end
endtask
endclass
