module comparator ( input clk , reset , input in1 , input in2 , output
logic eq ,gt ,lt);
always@ ( posedge clk or posedge reset )
begin
if( reset ) begin
eq= 0;
lt =0;
end
else if (in1 == in2)
begin
eq =1;
gt =0;
lt =0;
end
else if (in1 <in2)
begin
eq =0;
gt =0;
lt =1;
end
else
begin
eq =0;
gt =1;
lt =0;
end
end
endmodule
