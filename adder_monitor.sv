`ifndef adder_monitor_sv
`define adder_monitor_sv
import uvm_pkg::*;  // Import UVM package
`include "uvm_macros.svh"
`include "adder_transaction.sv" 

class adder_monitor extends uvm_driver#(adder_transaction);
    `uvm_component_utils(adder_monitor)
    
         virtual adder_interface vif;
         uvm_analysis_port #(adder_transaction) send;
         adder_transaction req;

    function new(string name ="adder_monitor",uvm_component parent);
super.new(name,parent);
send=new("send",this);
req=new();
    endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual adder_interface)::get(this," ","vif",vif))
    `uvm_error(get_type_name(),"unable to access interface")
  endfunction

virtual task run_phase(uvm_phase phase);
forever begin
    #10;

    req.A=vif.A;
    req.B=vif.B;
    req.Y=vif.Y;
    `uvm_info(get_type_name(),$sformatf("signals sampled are : A= %d  B=%d Y=%d",req.A,req.B,req.Y),UVM_LOW);
send.write(req);
end

endtask


endclass
`endif // End of include guard
