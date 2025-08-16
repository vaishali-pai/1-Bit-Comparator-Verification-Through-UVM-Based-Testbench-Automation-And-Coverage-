class monitor;
  virtual comparator_if vif;
  mailbox mon_to_sb;
  
  function new(mailbox mon_to_sb, virtual comparator_if vif);
    this.vif = vif;
    this.mon_to_sb = mon_to_sb;
  endfunction
  
  task run;
    forever begin
      transaction mon_tr;
      wait(!vif.reset);
      @(posedge vif.clk);
      mon_tr = new();
      mon_tr.ip1 = vif.ip1;
      mon_tr.ip2 = vif.ip2;
      @(posedge vif.clk);
      mon_tr.gt = vif.gt;
       mon_tr.eq = vif.eq;
       mon_tr.lt = vif.lt;
      mon_to_sb.put(mon_tr);
    end
  endtask
endclass
