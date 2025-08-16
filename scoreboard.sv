class scoreboard;
    int compare_cnt;
    mailbox mon_to_sb;

    function new(mailbox mon_to_sb);
        this.mon_to_sb = mon_to_sb;
    endfunction

    task run;
        forever begin
            transaction tr;
            tr = new();
            mon_to_sb.get(tr);
          if (tr.ip1==tr.ip2)
            tr.out<=1;
            else
               tr.out<=0;
           
           
      begin
     $display("Matched: ip1 = %0d, ip2 = %0d, out = %0d", tr.ip1, tr.ip2, tr.out);
          end 
      
            
         
            compare_cnt++;
        end
    endtask
endclass
